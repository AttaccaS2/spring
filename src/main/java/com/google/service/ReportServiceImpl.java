package com.google.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.google.domain.ReportVO;
import com.google.domain.Criteria;
import com.google.mapper.ReportMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class ReportServiceImpl implements ReportService {
	
	private ReportMapper mapper;

	@Override
	public List<ReportVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getListTotal(Criteria cri) {
		return mapper.getListTotal(cri);
	}

	@Override
	public void register(ReportVO vo) {
		mapper.insert(vo);		
	}

	@Override
	public ReportVO get(long bno) {
		mapper.updateHit(bno); //조회수 증가
		return mapper.read(bno);
	}

	@Override
	public void remove(long bno) {
		mapper.delete(bno);
		
	}

	@Override
	public void modify(ReportVO vo) {
		mapper.update(vo);
		
	}

}
