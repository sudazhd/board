package org.iot.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iot.domain.EpilogueVO;
import org.iot.domain.MemberVO;
import org.iot.domain.PageMaker;
import org.iot.domain.SearchCriteria;
import org.iot.service.EpilogueService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/sboard/*")
public class SearchEpilogueController {

	private static final Logger logger = LoggerFactory.getLogger(SearchEpilogueController.class);

	@Inject
	private EpilogueService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		logger.info(cri.toString());

		model.addAttribute("list", service.listSearchCriteria(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);

	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public String read(EpilogueVO epilogue, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		logger.info("read");
		model.addAttribute("epilogueVO", service.read(epilogue.getEp_no()));
		model.addAttribute("cri", cri);

		List<Map<String, Object>> fileList = service.selectFileList(epilogue.getEp_no());
		model.addAttribute("file", fileList);
		
		return "sboard/readPage";

	}

	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("ep_no") int ep_no, SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {

		service.remove(ep_no);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/sboard/list";
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(EpilogueVO epilogue, int ep_no, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {

		model.addAttribute("epilogueVO", service.read(epilogue.getEp_no()));
		model.addAttribute("cri", cri);

		List<Map<String, Object>> fileList = service.selectFileList(epilogue.getEp_no());
		model.addAttribute("file", fileList);
		
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(EpilogueVO epilogue, int ep_no,
								   @ModelAttribute("cri") SearchCriteria cri,
								   RedirectAttributes rttr,
								   @RequestParam(value = "fileNoDel[]") String[] files,
								   @RequestParam(value = "fileNameDel[]") String[] fileNames, 
								   MultipartHttpServletRequest mpRequest, Model model) throws Exception {

		logger.info(cri.toString());
		service.modify(epilogue, files, fileNames, mpRequest);
		
		model.addAttribute("epilogueVO", service.read(epilogue.getEp_no()));
		List<Map<String, Object>> fileList = service.selectFileList(epilogue.getEp_no());
		model.addAttribute("file", fileList);
		System.out.println("model : "+model);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		logger.info(rttr.toString());

		return "redirect:/sboard/list";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET(EpilogueVO epilogue, Model model) throws Exception {

		logger.info("regist Get....");

	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(EpilogueVO epilogue, MultipartHttpServletRequest mpRequest, RedirectAttributes rttr)
			throws Exception {

		logger.info("regist post ...........");
		logger.info(epilogue.toString());

		service.regist(epilogue, mpRequest);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/sboard/list";
	}

	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/member/memberDelete", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception {
		return "member/memberDelete";
	}

	@RequestMapping(value = "/member/memberDelete", method = RequestMethod.POST)
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

	@RequestMapping(value = "/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception {
		Map<String, Object> resultMap = service.selectFileInfo(map);
		String stored_file_name = (String) resultMap.get("stored_file_name");
		String org_file_name = (String) resultMap.get("org_file_name");

		byte[] fileByte = org.apache.commons.io.FileUtils.readFileToByteArray(
				new File("E:\\busan\\busantour\\src\\main\\webapp\\resources\\upload\\" + stored_file_name));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(org_file_name, "UTF-8") + "\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

}
