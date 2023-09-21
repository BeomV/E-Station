package test.com.estation.board.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class BoardController {


	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/E_selectAll.do", method = RequestMethod.GET)
	public String E_selectAll() {
		log.info("E_selectAll.do....");

		return "board/E_selectAll";
	}

	@RequestMapping(value = "/openApi.do", method = RequestMethod.GET)
	public ResponseEntity<String> openApi(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
										  @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
										  @RequestParam(value = "addrFilter", required = false) List<String> addrFilter) throws IOException {
		log.info(addrFilter.toString());

		String apiUrl = "https://api.odcloud.kr/api/EvInfoServiceV2/v1/getEvSearchList";
		String serviceKey = "5BJWs47UihpJPQBa6QDresHGIM5q4GlcfjoDac08xhH1kEkFDR49d%2FY5BqDlDYZqbXQ3QdVa3DvSSvDwzIcyXg%3D%3D";

		StringBuilder urlBuilder = new StringBuilder(apiUrl);
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + serviceKey);
		urlBuilder.append("&" + URLEncoder.encode("perPage", "UTF-8") + "=3106");

		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json; charset=UTF-8");

		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
		}

		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}

		rd.close();
		conn.disconnect();
		String result= sb.toString();

		ObjectMapper mapper = new ObjectMapper();
		JsonNode root = mapper.readTree(result);
		JsonNode data = root.get("data");
		ArrayNode filteredData = mapper.createArrayNode();

		if (data.isArray()) {
			for (JsonNode node : data) {
				boolean matchAllFilters = true;
				for (String filter : addrFilter) {
					if (!node.get("addr").asText().contains(filter)) {
						matchAllFilters = false;
						break;
					}
				}
				if (matchAllFilters) {
					filteredData.add(node);
				}
			}
		}

		int totalData = filteredData.size();
		int totalPages = (int) Math.ceil((double) totalData / pageSize);
		((ObjectNode) root).put("totalPages", totalPages);

		ArrayNode pagedData = mapper.createArrayNode();
		int start = (pageNum - 1) * pageSize;
		int end = Math.min(start + pageSize, filteredData.size());
		for (int i = start; i < end; i++) {
			pagedData.add(filteredData.get(i));
		}

		((ObjectNode) root).set("data", pagedData);
		result = mapper.writeValueAsString(root);

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.set("Content-Type", "application/json; charset=UTF-8");

		return new ResponseEntity<String>(result, responseHeaders, HttpStatus.OK);
	}



}


