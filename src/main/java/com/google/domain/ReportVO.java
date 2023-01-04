package com.google.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReportVO {

	private Long bno;
	private String content;
	private String note;
	private String suggestion;
	private String writer;
	private Date regdate;
	private Date updateDate;	
	private int hit;
	
}
