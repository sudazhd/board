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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller

@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private MemberService service;

	@ResponseBody
	@RequestMapping(value = "/id_chk", method = RequestMethod.POST)
	public int id_chk(MemberVO vo) throws Exception {
		int result = service.id_chk(vo);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/pw_chk", method = RequestMethod.POST)
	public int pw_chk(MemberVO vo) throws Exception {
		int result = service.pw_chk(vo);
		return result;
	}

	@RequestMapping(value = "membership", method = RequestMethod.GET)
	public void memberGET(MemberVO vo) throws Exception {
		logger.info("membership Get..");
	}

	@RequestMapping(value = "/membership", method = RequestMethod.POST)
	public String memberPOST(MemberVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("member post.......");
		logger.info(vo.toString());
		int result = service.id_chk(vo);
		try {
			if (result == 1) {
				return "/member/register";
			} else if (result == 0) {
				service.insertMember(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() throws Exception {
		logger.info("login Get...");
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String test(String mem_id, String mem_pw, HttpServletRequest req) throws Exception {
		MemberVO user = service.readWithPW(mem_id, mem_pw);

		HttpSession session = req.getSession();
		session.setAttribute("member", user);

		return "redirect:/sboard/list";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/memberUpdate", method = RequestMethod.GET)
	public String memberUpdateView() throws Exception {
		return "member/memberUpdate";
	}

	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(MemberVO vo, HttpSession session) throws Exception {

		service.memberUpdate(vo);

		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception {
		return "member/memberDelete";
	}

	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");
		String sessionPass = member.getMem_pw();
		String voPass = vo.getMem_pw();

		if (!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/memberDeleteView";
		}
		service.memberDelete(vo);
		session.invalidate();

		return "redirect:/";
	}

	

}
