package org.iot.service;

import java.util.List;

import javax.inject.Inject;

import org.iot.domain.Criteria;
import org.iot.domain.EpilogueVO;
import org.iot.domain.SearchCriteria;
import org.iot.persistence.EpilogueDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EpilogueServiceImpl implements EpilogueService {
	
	@Inject
	private EpilogueDAO dao;

	@Override
	public void regist(EpilogueVO epilogue) throws Exception {
		dao.create(epilogue);
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public EpilogueVO read(Integer ep_no) throws Exception {
		dao.updateViewcnt(ep_no);
		return dao.read(ep_no);
	}

	@Override
	public void modify(EpilogueVO epilogue) throws Exception {
		dao.update(epilogue);
	}

	@Override
	public void remove(Integer ep_no) throws Exception {
		dao.delete(ep_no);
	}

	@Override
	public List<EpilogueVO> listAll() throws Exception {
		return dao.ListAll();
	}

	@Override
	public List<EpilogueVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<EpilogueVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}
	
	
	
}
