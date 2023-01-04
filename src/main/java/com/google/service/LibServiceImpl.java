package com.google.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.domain.BoardAttachVO;
import com.google.domain.Criteria;
import com.google.domain.LibVO;
import com.google.mapper.BoardAttachMapper;
import com.google.mapper.LibMapper;
import com.google.mapper.ReplyMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class LibServiceImpl implements LibService{
	
	private LibMapper mapper;
	private BoardAttachMapper attachMapper;
	private ReplyMapper replyMapper;
	
	@Transactional	
	@Override
	public void register(LibVO vo) {
		mapper.insertLastId(vo);
		
		if(vo.getAttachList() == null || vo.getAttachList().size()<=0) {
			return;
		}
		
		vo.getAttachList().forEach(attach->{
			attach.setBno(vo.getBno());
			attach.setTableID(vo.getTABLE_ID());
			//System.out.println("[DEG1]"+vo.getTABLE_ID());
			//System.out.println("[DEG2]"+attach);
			attachMapper.insert(attach);
		});
	}

	@Transactional
	@Override
	public LibVO get(int bno) {
		mapper.updateHit(bno); //조회수 증가
		return mapper.read(bno);
	}
	@Transactional
	@Override
	public boolean remove(int bno) {

		String str="board";
		attachMapper.deleteAll((long) bno,str);
		replyMapper.deleteAll((long) bno, str);
		
		return mapper.delete(bno) == 1;
	}

	@Override
	public void modify(LibVO vo) {
		mapper.update(vo);			
		
		//첨부파일 테이블 삭제
		attachMapper.deleteAll((long) vo.getBno(),vo.getTABLE_ID());
		
		//청부파일 있으면 등록	없거나 조건에 안맞으면 리턴
		if(vo.getAttachList() == null || vo.getAttachList().size()<=0) {
			mapper.updateAttachCnt(vo.getBno(), -1);
			return;
		}
	
		vo.getAttachList().forEach(attach->{
			attach.setBno(vo.getBno());
			attach.setTableID(vo.getTABLE_ID());
			attachMapper.insert(attach);
			//System.out.println(attach);
		});

		
	}

	@Override
	public List<LibVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);	}

	@Override
	public int getListTotal(Criteria cri) {
		return mapper.getListTotal(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(long bno) {
		return attachMapper.findByBno(bno);
	}

}
