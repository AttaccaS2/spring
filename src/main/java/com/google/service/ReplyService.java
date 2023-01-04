package com.google.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.google.domain.Criteria;
import com.google.domain.ReplyPageDTO;
import com.google.domain.ReplyVO;

public interface ReplyService {

	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long rno); 
	
	public ArrayList<ReplyVO> readById(String replyer);
	
	public int delete(Long rno);
	
	public int update(ReplyVO vo);
	
	public ReplyPageDTO getListWithPaging(Criteria cri,
			@Param("bno") Long bno);
	
	public ReplyPageDTO getListWithPaging(Criteria cri,
			@Param("bno") Long bno, @Param("tableID") String tableID);

}
