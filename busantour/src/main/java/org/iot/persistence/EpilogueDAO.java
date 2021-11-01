package org.iot.persistence;

import java.util.List;

import org.iot.domain.Criteria;
import org.iot.domain.EpilogueVO;
import org.iot.domain.SearchCriteria;

public interface EpilogueDAO {

	public void create(EpilogueVO vo) throws Exception;

	public EpilogueVO read(Integer ep_no) throws Exception;

	public void update(EpilogueVO vo) throws Exception;

	public void delete(Integer ep_no) throws Exception;

	public List<EpilogueVO> ListAll() throws Exception;
	
	public List<EpilogueVO> listPage(int page) throws Exception;
	
	public List<EpilogueVO> listCriteria(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri) throws Exception;
	
	public List<EpilogueVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public void updateViewcnt(Integer ep_no) throws Exception;
 }
