package org.iot.service;

import javax.inject.Inject;

import org.iot.domain.MemberVO;
import org.iot.persistence.MemberDAO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	@Override
	public void insertMember(MemberVO member) throws Exception {
		dao.insertMember(member);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return dao.login(vo);
	}


	
	
	
}
