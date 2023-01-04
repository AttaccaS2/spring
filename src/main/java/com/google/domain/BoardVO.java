package com.google.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private final String TABLE_ID="news";
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;	
	private int hit;

	private int replyCnt;
	private int attachCnt;
	
	private List<BoardAttachVO> attachList;
}
