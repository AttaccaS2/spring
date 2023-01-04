package com.google.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.domain.MemberVO;
import com.google.domain.ReplyVO;
import com.google.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/memberAjax/*")
@Log4j
@AllArgsConstructor
public class MemberAjaxController {

	private PasswordEncoder pwencoder;	
	private MemberService service;
	/** 
	 * @param userid
	 * @return
	 */
	  @GetMapping(value="/idchkAct/{userid}") 
	  public ResponseEntity<String> count(@PathVariable("userid") String userid){ 
		
		  int Count = service.readByInt(userid); 
		  //System.out.println("[Count]"+ Count); 
		  return Count == 0? 
				  new ResponseEntity<String>("success",HttpStatus.OK) 
				  :new ResponseEntity<String>("fail",HttpStatus.OK); 
		  }
	  
		@PostMapping(value="/new", consumes="application/json",
				produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> create(@RequestBody MemberVO vo){
			String encodedPassword = pwencoder.encode(vo.getUserpw());
			vo.setUserpw(encodedPassword);
			int insertCount = service.insertMember(vo);
			
			return insertCount == 1?
					new ResponseEntity<String>("success",HttpStatus.OK)
					:new ResponseEntity<String>("success",HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		  @PreAuthorize("principal.username == #vo.userid")
		  @DeleteMapping(value="/out/{userid}") 
		  public ResponseEntity<String> remove(@RequestBody MemberVO vo, @PathVariable("userid") String userid){ 
			 
			  int deleteCount = service.delete(userid);
			  System.out.println(userid +"deleteCount"+ deleteCount);

			  return deleteCount == 1? 
				  new ResponseEntity<String>("success",HttpStatus.OK)
				  :new ResponseEntity<String>("success",HttpStatus.INTERNAL_SERVER_ERROR);
		 
		  }
		  
			@PreAuthorize("principal.username == #vo.userid")			  
			@PutMapping(value="/{userid}") 
			public ResponseEntity<String> modify(@RequestBody MemberVO vo, @PathVariable("userid") String userid){ 
				System.out.println(userid);
				vo.setUserid(userid); 
				//System.out.println("[vo]"+vo);
				int updateCount = service.update(vo);			
				//System.out.println("[updateCount]"+updateCount);
				
				return updateCount == 1? new ResponseEntity<String>("success",HttpStatus.OK)
				  :new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
				  
				  }
			
			@PutMapping(value="/{userid}/{userpw}") 
			public ResponseEntity<String> modifyPw(@RequestBody MemberVO vo, @PathVariable("userid") String userid,  
					@PathVariable("userpw") String userpw){ 
				
				System.out.println(userid+"[userpw]"+userpw);
				
				String encodedPassword = pwencoder.encode(userpw);
				
				vo.setUserpw(encodedPassword);
				System.out.println("[vo]"+vo);
				
				int updatePW = service.updatePw(vo);
				
				System.out.println("[updatePW]"+updatePW);
				
				return updatePW == 1? new ResponseEntity<String>("success",HttpStatus.OK)
				  :new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
				  
			}
}
