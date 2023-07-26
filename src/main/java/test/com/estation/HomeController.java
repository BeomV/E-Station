package test.com.estation;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class HomeController {

	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/","home.do"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("home.do....");
		
		return "home";
	}
	
}
