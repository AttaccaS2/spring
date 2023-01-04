package com.google.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.domain.Criteria;
import com.google.domain.PageDTO;
import com.google.domain.ReportVO;
import com.google.service.ReportService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/report/*")
public class ReportController {

	private ReportService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));	
		int total = service.getListTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(ReportVO report, RedirectAttributes rttr) {
		service.register(report);
		// report/list로 이동하면서 result값(글번호)을 전달
		rttr.addFlashAttribute("result", report.getBno());
		return "redirect:/report/list";
	}
	
	@GetMapping({"/get","/modify","/print"})
	public void get(@RequestParam("bno") long bno, Model model) {
		model.addAttribute("report", service.get(bno));
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") long bno) {
		service.remove(bno);
		return "redirect:/report/list";
	}
	
	@PostMapping("/modify")
	public String modify(ReportVO report, RedirectAttributes rttr) {
		service.modify(report);
		// report/list로 이동하면서 result값(글번호)을 전달
		rttr.addFlashAttribute("result", report.getBno());
		return "redirect:/report/list";
	}
}
