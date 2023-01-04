package com.google.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {

	@Setter(onMethod_= {@Autowired})
	private MemberMapper mapper;
	
	//@Test
	public void testRead() {
		MemberVO vo = mapper.read("admin90");
		log.info(vo);
		vo.getAuthList().forEach(authvo->log.info(authvo));
	}
	
	//@Test
	public void testInserMember() {
		MemberVO vo = new MemberVO();
		vo.setUserid("1212");
		vo.setUserpw("매퍼");
		vo.setUserName("테스트");
		mapper.insertMember(vo);
		log.info(vo);
	}
	
	
	//@Test
	public void testDelete() {
		mapper.delete("1212");
	}
	
	//@Test
	public void testUpdate() {
		MemberVO vo = new MemberVO();
		vo.setUserid("admin81");
		vo.setUserpw("매퍼");
		vo.setUserName("테스트");
		mapper.update(vo);
	}
	//@Test
	public void testReadByInt() {
		int total =  mapper.readByInt("admin99");
		System.out.println("[DEG]"+total);
	}
	@Test
	public void testCountPoint() {
		int point = mapper.countPoint("admin90");
		System.out.println("[point]"+(point));
	}
	
	
	
}
