package org.iot.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.iot.domain.Criteria;
import org.iot.domain.EpilogueVO;
import org.iot.domain.SearchCriteria;
import org.springframework.stereotype.Repository;

@Repository
public class EpilogueDAOImpl implements EpilogueDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "org.iot.mapper.EpilogueMapper";

	@Override
	public void create(EpilogueVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public EpilogueVO read(Integer ep_no) throws Exception {
		return session.selectOne(namespace + ".read", ep_no);
	}

	@Override
	public void update(EpilogueVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer ep_no) throws Exception {
		session.delete(namespace + ".delete", ep_no);
	}

	@Override 
	public List<EpilogueVO> ListAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public List<EpilogueVO> listPage(int page) throws Exception {
		
		if (page <= 0) {
			page = 1;
		}
		
		page = (page - 1) * 10;
		
		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<EpilogueVO> listCriteria(Criteria cri) throws Exception {
		
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace+".countPaging", cri);
	}

	@Override
	public List<EpilogueVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public void updateViewcnt(Integer ep_no) throws Exception {
		session.update(namespace+".updateViewcnt",ep_no);
	}
	
	

}
