package com.google.controller;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.domain.MemberVO;
import com.google.domain.ReplyVO;
import com.google.service.MemberService;
import com.google.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("/member/*")
public class MemberController {
	
	private ReplyService replyservice;
	private MemberService service;
	
	@GetMapping("/join")
	public String signUp() {
		return "customSignup";		
	}

	@PostMapping("/signout")
	public String signOut() {
		return "customSignout";		
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/profile")
	public String profile(Principal prin, Model model) {
		//<sec:authentication property="principal.username"/>
		model.addAttribute("profile",service.read(prin.getName()));
		//System.out.println(prin.getName());
		
		ArrayList<ReplyVO> replyList= replyservice.readById(prin.getName());
		//System.out.println("[replyList]"+replyList); 
		model.addAttribute("replyList",replyList );
		
		int Point = service.countPoint(prin.getName());
		model.addAttribute("Point",Point );
		//System.out.println(Point);
		return "profile";		
	}

	@GetMapping("/forget")
	public String forget() {
		return "password-forget";
	}
	

//	@PostMapping("/profile")
//	public String profile(Principal prin, Model model, String userName) {
//		model.addAttribute("profile", service.read(prin.getName()));
//		System.out.println(userName);
//		ArrayList<ReplyVO> replyList= replyservice.readById(prin.getName());
//		model.addAttribute("replyList",replyList );
//		return "profile";
//	}
}
