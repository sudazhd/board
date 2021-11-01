package org.iot.service;

import java.util.List;

import org.iot.domain.Criteria;
import org.iot.domain.EpilogueVO;
import org.iot.domain.SearchCriteria;

public interface EpilogueService {

	public void regist(EpilogueVO epilogue) throws Exception;
	
	public EpilogueVO read(Integer ep_no) throws Exception;
	
	public void modify(EpilogueVO epilogue) throws Exception;
	
	public void remove(Integer ep_no) throws Exception;
	
	public List<EpilogueVO> listAll() throws Exception;
	
	public List<EpilogueVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri) throws Exception;
	
	public List<EpilogueVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
}
