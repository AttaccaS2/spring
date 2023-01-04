package com.google.mapper;

import java.util.List;

import com.google.domain.ReportVO;
import com.google.domain.Criteria;

public interface ReportMapper {

	public List<ReportVO> getList();
	
	public List<ReportVO> getListWithPaging(Criteria cri);	

	public int getListTotal(Criteria cri);

	public void insert(ReportVO vo);
	
	public long insertLastId(ReportVO vo);
	
	public ReportVO read(long bno);
	
	public void updateHit(long bno);
	
	public void delete(long bno);
	
	public void update(ReportVO vo);

}
