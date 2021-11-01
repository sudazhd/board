package org.iot.service;

import org.iot.domain.MemberVO;

public interface MemberService {

	public void insertMember(MemberVO member) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
}
