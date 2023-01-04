package com.google.service;

import com.google.domain.MemberVO;

public interface MemberService {
	public MemberVO read(String userid);
	public int readByInt(String userid);
	public int countPoint(String userid);
	
	public int insertMember(MemberVO vo);
	
	public int delete(String userid);
	public int update(MemberVO vo);

	public int updatePw(MemberVO vo);

}
