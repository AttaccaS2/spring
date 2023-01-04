package com.google.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.google.domain.Criteria;
import com.google.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	
	public ReplyVO read(long rno); 
	
	public ArrayList<ReplyVO> readById(String replyer); 
	
	public int delete(Long rno);
	
	public void deleteAll(@Param("bno") Long bno,  @Param("tableID") String tableID);
	
	public int update(ReplyVO vo);
	
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri,
			@Param("bno") Long bno);
	
	public List<ReplyVO> getListWithPaging2(@Param("cri") Criteria cri,
			@Param("bno") Long bno, @Param("tableID") String tableID);
	
	
	public int getCountByBno(Long bno);
}
