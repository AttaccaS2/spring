package com.google.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.google.domain.LibVO;
import com.google.domain.Criteria;

public interface LibMapper {

	public List<LibVO> getList();
	
	public List<LibVO> getListWithPaging(Criteria cri);	

	public int getListTotal(Criteria cri);

	public void insert(LibVO vo); 
	
	public long insertLastId(LibVO vo);
	
	public LibVO read(int bno);
	
	public void updateHit(int bno);
	
	public int delete(int bno);
	
	public void update(LibVO vo);
	
	public void updateReplyCnt(@Param("bno") int bno,
			@Param("amount") int amount);

	public void updateAttachCnt(@Param("bno") int bno, @Param("amount") int amount);

}
