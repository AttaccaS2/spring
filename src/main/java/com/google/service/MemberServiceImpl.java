package com.google.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.domain.AuthVO;
import com.google.domain.MemberVO;
import com.google.mapper.AuthMapper;
import com.google.mapper.MemberMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private AuthMapper authMapper;
	
	@Override
	public MemberVO read(String userid) {
		return mapper.read(userid);
	}
	
	@Override
	public int countPoint(String userid) {
		return mapper.countPoint(userid);
	}	

	@Transactional
	@Override
	public int insertMember(MemberVO vo) {
		mapper.insertMember(vo);
		
		AuthVO authvo = new AuthVO();
		authvo.setUserid(vo.getUserid());
		authvo.setAuth("ROLE_MEMBER");
		return authMapper.insertAuth(authvo);	
	}

	@Override
	public int delete(String userid) {
		return mapper.delete(userid);
	}

	@Override
	public int update(MemberVO vo) {
		return mapper.update(vo);
	}	

	@Override
	public int readByInt(String userid) {
		return mapper.readByInt(userid);
	}

	@Override
	public int updatePw(MemberVO vo) {
		return mapper.updatePw(vo);
	}

}
