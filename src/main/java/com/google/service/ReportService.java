package com.google.service;

import java.util.List;

import com.google.domain.ReportVO;
import com.google.domain.Criteria;

public interface ReportService {
	
	public List<ReportVO> getList(Criteria cri);
	
	public int getListTotal(Criteria cri);
	
	public void register(ReportVO vo);//insert
	
	//public long insertLastId(ReportVO vo);
	
	public ReportVO get(long bno);//read	
	
	public void remove(long bno); //delete
	
	public void modify(ReportVO vo); //update
	

}
