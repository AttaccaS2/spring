package com.google.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.domain.Criteria;
import com.google.domain.ReplyPageDTO;
import com.google.domain.ReplyVO;
import com.google.mapper.BoardMapper;
import com.google.mapper.LibMapper;
import com.google.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = {@Autowired})
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper boardmapper;
	
	@Setter(onMethod_ = {@Autowired})
	private LibMapper libmapper;
	
	@Transactional
	@Override 
	public int insert(ReplyVO vo) {
		System.out.println("[DEG1]"+vo);
		System.out.println("[DEG2]"+vo.getTableID());
		
		if(vo.getTableID().equals("board")) {
			libmapper.updateReplyCnt((int) vo.getBno(), 1);		
			System.out.println("[vo.getBno()]"+vo.getBno());
		} else {
			boardmapper.updateReplyCnt(vo.getBno(), 1);	
			System.out.println("[DEG5]");
		}
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO read(Long rno) {
		return mapper.read(rno);
	}

	@Transactional
	@Override
	public int delete(Long rno) {
		ReplyVO vo = mapper.read(rno); //rno 가져와
		if(vo.getTableID().equals("board")) {
			System.out.println("[DEG6]");
			libmapper.updateReplyCnt((int) vo.getBno(), -1);	
		} else {
			boardmapper.updateReplyCnt(vo.getBno(), -1);	
		}
		return mapper.delete(rno);
	}

	@Override
	public int update(ReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public ReplyPageDTO getListWithPaging(Criteria cri, Long bno) {
		
		return new ReplyPageDTO(
				mapper.getCountByBno(bno)
				,mapper.getListWithPaging(cri, bno));
	}

	@Override
	public ReplyPageDTO getListWithPaging(Criteria cri, Long bno, String tableID) {
		
		return new ReplyPageDTO(
				mapper.getCountByBno(bno)
				,mapper.getListWithPaging2(cri, bno, tableID));
	}

	@Override
	public ArrayList<ReplyVO> readById(String replyer) {
		
		return mapper.readById(replyer);
	}
}
