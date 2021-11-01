package org.iot.busantour;

import java.util.List;

import javax.inject.Inject;

import org.iot.domain.Criteria;
import org.iot.domain.EpilogueVO;
import org.iot.domain.SearchCriteria;
import org.iot.persistence.EpilogueDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class EpilogueDAOTest {

	private static Logger logger = LoggerFactory.getLogger(EpilogueDAOTest.class);
	
	@Inject
	private EpilogueDAO dao;

	@Test
	public void testCreate() throws Exception {
		EpilogueVO epilogue = new EpilogueVO();
		epilogue.setEp_title("새글 작성");
		epilogue.setEp_content("새글 작성");
		epilogue.setEp_writer("새글 작성");
		dao.create(epilogue);
	}

	@Test
	public void testRead() throws Exception {
		logger.info(dao.read(1).toString());
	}
	
	@Test
	public void testUpdate() throws Exception {
		EpilogueVO epilogue = new EpilogueVO();
		epilogue.setEp_no(1);
		epilogue.setEp_title("수정된 글");
		epilogue.setEp_content("수정 테스트");
		dao.update(epilogue);
	}

	@Test
	public void testDelete() throws Exception{
		dao.delete(1);
	}
	
	@Test
	public void testListPage() throws Exception{
		int page = 3;
		List<EpilogueVO> list = dao.listPage(page);
		
		for(EpilogueVO epilogueVO : list) {
			logger.info(epilogueVO.getEp_no() + ":" + epilogueVO.getEp_title());
		}
	}
	
	@Test
	public void testListCriteria() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(20);
		
		List<EpilogueVO> list = dao.listCriteria(cri);
		
		for(EpilogueVO epilogueVO : list) {
			logger.info(epilogueVO.getEp_no() + ";" + epilogueVO.getEp_title());
		}
	}
	
	@Test
	public void testURI()throws Exception{
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.path("/board/read")
				.queryParam("ep_no",12)
				.queryParam("perPageNum", 20)
				.build();
		
		logger.info("/board/read?ep_no=12&perPageNum=20");
	}
	
	@Test
	public void testURI2()throws Exception{
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.path("/{module}/{page}")
				.queryParam("ep_no",12)
				.queryParam("perPageNum", 20)
				.build()
				.expand("board","read")
				.encode();
		
		logger.info("/board/read?ep_no=12&perPageNum=20");
		logger.info(uriComponents.toString());
	}
	
	@Test
	public void testDynamic1() throws Exception {
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setKeyword("asdf");
		cri.setSearchType("t");
		
		logger.info("===================================");
		
		List<EpilogueVO> list = dao.listSearch(cri);
		
		for(EpilogueVO epilogueVO : list) {
			logger.info(epilogueVO.getEp_no() + ":" + epilogueVO.getEp_title());
		}
		
		logger.info("===================================");
		logger.info("COUNT: "+ dao.listSearchCount(cri));
	}
	
}
