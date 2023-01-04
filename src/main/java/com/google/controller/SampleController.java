package com.google.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/sample/*")
public class SampleController {

	//로그인 안해도 접근 가능
	@GetMapping("/all")
	public void doAll() {
		log.info("all");
	}
	
	@GetMapping("/member")
	public void doMember() {
		log.info("member");
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		log.info("admin");
	}	
}
