package com.google.domain;

import java.util.List;

import lombok.Data;

@Data
public class LibVO {
	private final String TABLE_ID="board";

	private int bno;
	private String name;
	private String city;
	private String fullCity;
	private int books;
	private int man;
	private int visitPeople;
	private int money;
	private String writer;
	
	private int hit;

	private int replyCnt;
	private int attachCnt;
	
	private List<BoardAttachVO> attachList;
}
