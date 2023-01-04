package com.google.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.google.domain.MemberVO;
import com.google.mapper.MemberMapper;
import com.google.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_= {@Autowired})
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn(username);	
		
		MemberVO vo = mapper.read(username);
		
		return vo == null? null : new CustomUser(vo);
	}

}
