package test.com.estation.user.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import test.com.estation.user.model.UserVO;
import test.com.estation.user.service.UserService;

import java.util.HashMap;
import java.util.Map;

@Controller
@Slf4j
public class UserController {


	@Autowired
	UserService service;

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		log.info("loing.do....");
		
		return "login";
	}

	@RequestMapping(value = "/loginOK.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> loginOK(UserVO vo) {
		log.info("loginOK.do....{}", vo);

		UserVO vo2 = service.login(vo);
		log.info(vo2 != null ? vo2.toString() : "User not found");

		Map<String, String> result = new HashMap<String, String>();
		if(vo2 == null){
			result.put("status", "fail");
		} else {
			result.put("status", "success");
		}

		return result;
	}



	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public String register() {
		log.info("register.do....");

		return "register";
	}

	@RequestMapping(value = "/registerOK.do", method = RequestMethod.POST)
	public String registerOK(UserVO vo) {
		log.info("registerOK.do....{}",vo);

		int result = service.register(vo);

		return "register";
	}




	
}
