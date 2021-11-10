package org.iot.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.iot.domain.Criteria;
import org.iot.domain.EpilogueVO;
import org.iot.domain.MemberVO;
import org.iot.domain.SearchCriteria;
import org.iot.persistence.EpilogueDAO;
import org.iot.util.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class EpilogueServiceImpl implements EpilogueService {

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Inject
	private EpilogueDAO dao;

	@Override
	public void regist(EpilogueVO epilogue, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.create(epilogue);

		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(epilogue, mpRequest);
		int size = list.size();
		for (int i = 0; i < size; i++) {
			dao.insertFile(list.get(i));
		}
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public EpilogueVO read(Integer ep_no) throws Exception {
		dao.updateViewcnt(ep_no);
		return dao.read(ep_no);
	}

	@Override
	public void modify(EpilogueVO epilogue, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {

		dao.update(epilogue);

		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(epilogue, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for (int i = 0; i < size; i++) {
			tempMap = list.get(i);
			System.out.println("tempMap : "+tempMap);
			if (tempMap.get("IS_NEW").equals("Y")) {
				dao.insertFile(tempMap);
			} else {
				dao.updateFile(tempMap);
			}
		}
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

	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		dao.memberDelete(vo);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int ep_no) throws Exception {
		return dao.selectFileList(ep_no);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return dao.selectFileInfo(map);
	}

	
	

}
