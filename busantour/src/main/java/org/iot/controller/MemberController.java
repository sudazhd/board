package org.iot.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.iot.domain.MemberVO;
import org.iot.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private MemberService service;

	@RequestMapping(value = "membership", method = RequestMethod.GET)
	public void memberGET(MemberVO member) throws Exception {
		logger.info("membership Get..");
	}

	@RequestMapping(value = "/membership", method = RequestMethod.POST)
	public String memberPOST(MemberVO member, RedirectAttributes rttr) throws Exception {
		logger.info("member post.......");
		logger.info(member.toString());

		service.insertMember(member);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() throws Exception {
		logger.info("login Get...");
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		
		logger.info(vo.toString());
		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
		}
		
		return "redirect:/";

	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
}
