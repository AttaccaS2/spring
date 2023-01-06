package com.google.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.domain.AuthVO;
import com.google.domain.MemberVO;
import com.google.domain.ProfileImageVO;
import com.google.mapper.AuthMapper;
import com.google.mapper.MemberMapper;
import com.google.mapper.ProfileImageMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private AuthMapper authMapper;
	
	@Setter(onMethod_ = {@Autowired})
	private ProfileImageMapper profilemapper;
	
	
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

	@Override
	public List<ProfileImageVO> getProfileImg(String userid) {
		return profilemapper.findByUserid(userid);
	}

	@Transactional
	@Override
	public void registerImg(MemberVO vo) {
		if(vo.getProfileImg() == null || vo.getProfileImg().size()<=0) {
			return;
		}//null 일때도 존재하기에 무조건 앞에
		
		vo.getProfileImg().forEach(attach->{
			attach.setUserid(vo.getUserid());
			
			profilemapper.insert(attach);
			System.out.println("[attach]"+attach);
		});
		
		
	}


}
