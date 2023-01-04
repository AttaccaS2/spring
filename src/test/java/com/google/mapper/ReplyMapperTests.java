package com.google.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.domain.Criteria;
import com.google.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	@Setter(onMethod_ = {@Autowired})
	private ReplyMapper mapper;
	
	//@Test
	public void testGet() {
		log.info("replyMapper.......");
	}

	@Test
	public void testInsert() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(3L);
		vo.setReply("댓글내용");
		vo.setReplyer("댓글작성자");
		
		mapper.insert(vo);
	}
	
	//@Test
	public void testRead() {
		mapper.read(1);
	}
	
	//@Test
	public void testRemove() {
		//mapper.delete(2);
	}

	//@Test
	public void testModify() {
		ReplyVO vo = new ReplyVO();
		vo.setRno(1L);
		vo.setReply("댓글내용수정");		
		mapper.update(vo);
	}

	//@Test
	public void testList() {
		Criteria cri = new Criteria(1,10);
		List<ReplyVO> replies = mapper.getListWithPaging(cri,427L);
		replies.forEach(reply->log.info(reply));
	}
	
	@Test
	public void testgetCountByBno() {
		int res=mapper.getCountByBno(427L);
		log.info(""+res);
	}
}





