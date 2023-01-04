package com.google.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.domain.BoardAttachVO;
import com.google.domain.BoardVO;
import com.google.domain.Criteria;
import com.google.domain.PageDTO;
import com.google.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/board/*")
public class BoardController {
 
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		System.out.println(cri);
		model.addAttribute("list", service.getList(cri));	
		
		int total = service.getListTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void register() {
		
	}
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		service.register(board);
		// board/list로 이동하면서 result값(글번호)을 전달
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") long bno, Model model, Criteria cri) {
		model.addAttribute("board", service.get(bno));
		model.addAttribute("pageMaker", new PageDTO(cri));
		
	}
	
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_PROBLEM_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(long bno){
		return new ResponseEntity<List<BoardAttachVO>>(service.getAttachList(bno), HttpStatus.OK);
	}

	 /**
	  * 
	  * @param board
	  * @param bno
	  * @param cri
	  * @param rttr
	  * @param writer
	  * @return
	  */
	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/remove")
	//삭제후 원하는 페이지
	public String remove(BoardVO board, @RequestParam("bno") long bno, Criteria cri, RedirectAttributes rttr, String writer ) {
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		if(service.remove(bno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
			
		}
		return "redirect:/board/list"+cri.getListLink();
	}
	
	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		service.modify(board);
		// board/list로 이동하면서 result값(글번호)을 전달
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	/**
	 * 파일삭제처리
	 * @param attachList
	 */
	public void deleteFiles(List<BoardAttachVO> attachList) {
		if(attachList == null|| attachList.size()==0) {
		//반드시 이 순서를 지켜야 한다. 안그러면 널 포인트 예외 발생해서 더이상 수행 ㄴㄴ
			return;
		}
		
		attachList.forEach(attach->{
				
			try {
				Path file = 
						Paths.get("D/upload/"+attach.getUploadPath()+"/"+attach.getUuid()+"_"+attach.getFileName());

				Files.deleteIfExists(file);
				
				//이미지 일 경우 썸네일 삭제
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumNail= 
							Paths.get("D/upload/"+attach.getUploadPath()+"/s_"+attach.getUuid()+"_"+attach.getFileName());
	
					Files.delete(thumNail);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		});
	}
	
}
