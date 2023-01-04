package com.google.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		model.addAttribute("msg","Acess Denied");
	}
	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		if(error!=null) {
			model.addAttribute("error", "Login Error! ");
		}
	
		if(logout!=null) {
			model.addAttribute("logout","Logout!!");
		}
	}
	@GetMapping("/customLogout")
	public void logoutGET() {
		
	}
}
