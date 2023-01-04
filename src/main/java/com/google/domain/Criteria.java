package com.google.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
//@data 하면 생성자가 자동으로 만들어져서 그렇게 안하고 생성자 직접 만들었다. 
public class Criteria {

	private int pageNum;//현재 페이지
	private int amount;//보여줄 페이지 수
	
	private String type;//검색조건
	private String keyword;
	
	public Criteria() {
		this(1,10);
		/*
		 * this.pageNum = 1; this.amount = 10;
		 * ${pageMaker.cri.amount }=10
		 */
	}
	
	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;

	}
	
	public int getSkip() {
		return (this.pageNum-1) * this.amount;
	}
	
	public String[] getTypeArr() {
		return type == null?new String[] {}:type.split("");
	}
	

	/**
	 * 삭제 시 현재 페이지 및 검색어 유지
	 * http://localhost/board/list?pageNum=7&amount=10&type=&keyword=
	 * @return
	 */
	public String getListLink() {
		UriComponentsBuilder builer = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.getPageNum())
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builer.toUriString();
		
	}
	
}
