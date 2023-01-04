package com.google.service;

import java.util.List;

import com.google.domain.BoardAttachVO;
import com.google.domain.BoardVO;
import com.google.domain.Criteria;

public interface BoardService {
	
	public List<BoardVO> getList(Criteria cri);
	
	public int getListTotal(Criteria cri);
	
	public void register(BoardVO vo);//insert
	
	//public long insertLastId(BoardVO vo);
	
	public BoardVO get(long bno);//read	
	
	public boolean remove(long bno); //delete
	
	public void modify(BoardVO vo); //update
	
	public List<BoardAttachVO> getAttachList(long bno);//첨부파일목록
	

}
