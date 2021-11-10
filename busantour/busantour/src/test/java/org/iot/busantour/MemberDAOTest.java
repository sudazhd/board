package org.iot.busantour;

import javax.inject.Inject;

import org.iot.domain.MemberVO;
import org.iot.persistence.MemberDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MemberDAOTest {

	@Inject
	private MemberDAO dao;
	
	@Test
	public void testTime() throws Exception{
		System.out.println(dao.getTime());
	}
	
	@Test
	public void testInsertMember()throws Exception{
		
		MemberVO vo = new MemberVO();
		vo.setMem_id("user00");
		vo.setMem_pw("user00");
		vo.setMem_nick("user00");
		vo.setMem_email("user00@aaa.com");
		
		dao.insertMember(vo);
	}
	
}
