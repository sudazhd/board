package org.iot.controller;

import javax.inject.Inject;

import org.iot.domain.Criteria;
import org.iot.domain.EpilogueVO;
import org.iot.domain.PageMaker;
import org.iot.service.EpilogueService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/board/*")
public class EpilogueController {

	private static final Logger logger = LoggerFactory.getLogger(EpilogueController.class);

	@Inject
	private EpilogueService service;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET(EpilogueVO epilogue, Model model) throws Exception {

		logger.info("register Get....");

	}

	@RequestMapping(value = "/register", method =  RequestMethod.POST)
	public String registPOST(EpilogueVO epilogue, RedirectAttributes rttr) throws Exception {

		logger.info("regist post ...........");
		logger.info(epilogue.toString());

		service.regist(epilogue);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/listAll";
	}

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		
		logger.info("show all list................");
		model.addAttribute("list", service.listAll());
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("ep_no") int ep_no, Model model) throws Exception {
		
		model.addAttribute(service.read(ep_no));
		
	}
	
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("ep_no") int ep_no, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		model.addAttribute(service.read(ep_no));
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("ep_no") int ep_no, RedirectAttributes rttr) throws Exception {
		
		service.remove(ep_no);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/listAll";
	}
	
	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("ep_no") int ep_no, Criteria cri, RedirectAttributes rttr) throws Exception {
		service.remove(ep_no);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/listPage";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(int ep_no, Model model) throws Exception {
		
		model.addAttribute(service.read(ep_no));
		
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(EpilogueVO epilogue, RedirectAttributes rttr) throws Exception {

		logger.info("mod post ...........");
		
		service.modify(epilogue);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/listAll";
	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(@RequestParam("ep_no") int ep_no, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		model.addAttribute(service.read(ep_no));
	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(EpilogueVO epilogue, Criteria cri, RedirectAttributes rttr) throws Exception {
		
		service.modify(epilogue);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/listPage";
	}
	
	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public void listAll(Criteria cri, Model model) throws Exception {
		
		logger.info("show list Page with Criteria...........");
		
		model.addAttribute("list", service.listCriteria(cri));
	}
	
	@RequestMapping(value = "listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
	}
	

}
