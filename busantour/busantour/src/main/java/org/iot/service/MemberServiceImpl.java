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
	public void insertMember(MemberVO vo) throws Exception {
		dao.insertMember(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {

		return dao.login(vo);
	}

	@Override
	public int id_chk(MemberVO vo) throws Exception {
		int result = dao.id_chk(vo);
		return result;
	}

	@Override
	public int pw_chk(MemberVO vo) throws Exception {
		int result = dao.pw_chk(vo);
		return result;
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		dao.memberUpdate(vo);
	}

	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		dao.memberDelete(vo);
	}

	@Override
	public MemberVO readWithPW(String mem_id, String mem_pw) throws Exception {
		return dao.readWithPW(mem_id, mem_pw);
	}



	
	
	
	
	

}
