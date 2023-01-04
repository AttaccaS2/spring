package com.google.mapper;

import com.google.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String userid);
	public int readByInt(String userid);
	public int insertMember(MemberVO vo);
	
	public int delete(String userid);
	public int update(MemberVO vo);
	public int updatePw(MemberVO vo);
	
	public int countPoint(String userid);
	
}
