package com.google.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private long rno;
	private long bno;
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
	private String tableID;
}
