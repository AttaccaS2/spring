package com.google.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.google.domain.BoardAttachVO;

public interface BoardAttachMapper {

	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBno(long bno);
	
	public void deleteAll(@Param("bno") Long bno, @Param("tableID") String tableID);
	
	public List<BoardAttachVO> getOldFiles();
	
}
