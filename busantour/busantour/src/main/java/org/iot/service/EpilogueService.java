package org.iot.service;

import java.util.List;
import java.util.Map;

import org.iot.domain.Criteria;
import org.iot.domain.EpilogueVO;
import org.iot.domain.MemberVO;
import org.iot.domain.SearchCriteria;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface EpilogueService {

	public void regist(EpilogueVO epilogue, MultipartHttpServletRequest mpRequest) throws Exception;
	
	public EpilogueVO read(Integer ep_no) throws Exception;
	
	public void modify(EpilogueVO epilogue, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
	
	public void remove(Integer ep_no) throws Exception;
	
	public List<EpilogueVO> listAll() throws Exception;
	
	public List<EpilogueVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri) throws Exception;
	
	public List<EpilogueVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public void memberDelete(MemberVO vo) throws Exception;
	
	public List<Map<String, Object>> selectFileList(int ep_no) throws Exception;
	
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
		
}
