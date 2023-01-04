package com.google.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.google.domain.BoardVO;
import com.google.domain.Criteria;

public interface BoardMapper {

	//@Select("SELECT * FROM tbl_board ORDER BY bno DESC")
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);	

	public int getListTotal(Criteria cri);

	public void insert(BoardVO vo);
	
	public long insertLastId(BoardVO vo);
	
	public BoardVO read(long bno);
	
	public void updateHit(long bno);
	
	public int delete(long bno);
	
	public void update(BoardVO vo);
	
	public void updateReplyCnt(@Param("bno") long bno,
			@Param("amount") int amount);

	public void updateAttachCnt(@Param("bno") long bno,
			@Param("amount") int amount);
}
