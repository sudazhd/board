package org.iot.persistence;

import java.util.HashMap;
import java.util.List;
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
				sqlSession.selectOne(namespace + ".selectMember", mem_id);
	}

	@Override
	public MemberVO readWithPW(String mem_id, String mem_pw) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("mem_id", mem_id);
		paramMap.put("mem_pw", mem_pw);
		
		return sqlSession.selectOne(namespace + ".readWithPW", paramMap);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return sqlSession.selectOne(namespace + ".login", vo);
	}

	@Override
	public int id_chk(MemberVO vo) throws Exception {
		int result = sqlSession.selectOne(namespace + ".id_chk", vo);
		return result;
	}

	@Override
	public int pw_chk(MemberVO vo) throws Exception {
		int result = sqlSession.selectOne(namespace + ".pw_chk", vo);
		return result;
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		sqlSession.update(namespace + ".memberUpdate", vo);
	}

	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		sqlSession.delete(namespace + ".memberDelete", vo);
	}
	
}
