package com.kh.WDWD;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.WDWD.board.model.service.BoardService;
import com.kh.WDWD.board.model.vo.Board;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private BoardService bService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.ho", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "index.home")
	public String index(Model model) {
		ArrayList<Board> boardList = bService.getTopBoard(0);
		model.addAttribute("boardList", boardList);
		
		return "index";
	}
	
	@RequestMapping(value = "topList.home")
	public void topList(Model model, @RequestParam("number") int number, HttpServletResponse response) {
		ArrayList<Board> boardList = bService.getTopBoard(number);
		
		try {
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(boardList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
		
		/* model.addAttribute("boardList", boardList); */
	}
	
}
