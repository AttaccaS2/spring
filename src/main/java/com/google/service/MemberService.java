package com.google.service;

import java.util.List;

import com.google.domain.MemberVO;
import com.google.domain.ProfileImageVO;

public interface MemberService {
	public MemberVO read(String userid);
	public int readByInt(String userid);
	public int countPoint(String userid);
	
	public int insertMember(MemberVO vo);
	public int delete(String userid);
	
	public int update(MemberVO vo);
	public int updatePw(MemberVO vo);

	public void registerImg(MemberVO vo);//프로필 이미지
	public List<ProfileImageVO> getProfileImg(String userid);

}
