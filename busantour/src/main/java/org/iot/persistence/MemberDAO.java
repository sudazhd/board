package org.iot.persistence;

import org.iot.domain.MemberVO;

public interface MemberDAO {

	public String getTime();
	
	public void insertMember(MemberVO vo);
	
	public MemberVO readMember(String mem_id) throws Exception;
	
	public MemberVO readWithPW(String mem_id, String mem_pw) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
}
