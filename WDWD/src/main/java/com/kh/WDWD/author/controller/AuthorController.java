package com.kh.WDWD.author.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AuthorController {
	
	@RequestMapping("ban.au")
	public String authorBan() {
		return "author/Ban";
	}
	
	@RequestMapping("trade.au")
	public String authorTrade() {
		return "author/TradeCare";
	}
	
	@RequestMapping("unban.au")
	public String authorUnban() {
		return "author/Unban";
	}
	
}
