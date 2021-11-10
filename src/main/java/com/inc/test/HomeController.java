package com.inc.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.vo.CountryVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		
		CountryVO[] ar = new CountryVO[7];
		ar[0] = new CountryVO("Lithuania", 450);
		ar[1] = new CountryVO("Ireland", 330);
		ar[2] = new CountryVO("Germany", 139);
		ar[3] = new CountryVO("Autralia", 198);
		ar[4] = new CountryVO("Austria", 128);
		ar[5] = new CountryVO("South Korea", 50);
		ar[6] = new CountryVO("China", 750);
		
		model.addAttribute("ar",ar);
		
		
		
		
		
		
		return "home";
	}
	
}
