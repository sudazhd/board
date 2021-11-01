package org.iot.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.iot.domain.MemberVO;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "org.iot.mapper.MemberMapper";

	@Override
	public String getTime() {
		return sqlSession.selectOne(namespace + ".getTime");
	}

	@Override
	public void insertMember(MemberVO vo) {
		sqlSession.insert(namespace + ".insertMember", vo);
	}

	@Override
	public MemberVO readMember(String mem_id) throws Exception {
		return (MemberVO)
				sqlSession.selectOne(namespace+".selectMember", mem_id);
	}

	@Override
	public MemberVO readWithPW(String mem_id, String mem_pw) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("mem_id", mem_id);
		paramMap.put("mem_pw", mem_pw);
		
		return sqlSession.selectOne(namespace+".readWithPW", paramMap);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return sqlSession.selectOne(namespace + ".login", vo);
	}
	
	
}
