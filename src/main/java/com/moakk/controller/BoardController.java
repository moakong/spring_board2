package com.moakk.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.moakk.service.BoardService;
import com.moakk.vo.BoardVO;
import com.moakk.vo.PageMaker;
import com.moakk.vo.PageVO;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePOST(BoardVO board, PageVO page, RedirectAttributes rda) throws Exception {

		logger.info("update post ...........");
		logger.info(board.toString());
		

		service.update(board);

		System.out.println(page.toString());

//		rttr.addFlashAttribute("msg", "update");
		rda.addAttribute("page", page.getPage());
		rda.addAttribute("perPageNum", page.getPerPageNum());
		rda.addAttribute("searchType", page.getSearchType());
		rda.addAttribute("keyword", page.getKeyword());
		

		return "redirect:/board/list";
	}
	
	
	@RequestMapping(value = "/updateForm", method = RequestMethod.POST)
	public void updateForm(int bno, @ModelAttribute PageVO page, Model model) throws Exception {
		
		logger.info("updateForm...........");
		
		model.addAttribute(service.read(bno));
		
	}
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String read(int bno, PageVO page, RedirectAttributes rda) throws Exception {
		
		logger.info("delete ...........");
		
		service.delete(bno);
		
		rda.addAttribute("page", page.getPage());
		rda.addAttribute("perPageNum", page.getPerPageNum());
		rda.addAttribute("searchType", page.getSearchType());
		rda.addAttribute("keyword", page.getKeyword());
		
		return "redirect:/board/list";
	}
	
	
	@RequestMapping("/read")
	public void read(int bno, @ModelAttribute PageVO page, Model model) throws Exception {
//		System.out.println(bno);
//		System.out.println(page.toString());
		
		logger.info("read ...........");
		
		model.addAttribute(service.read(bno));
		
	}

	@RequestMapping("/list")
	public void list(PageVO page, Model model) throws Exception {
		
		logger.info("list ...........");
		logger.info(page.toString());
		
		model.addAttribute("list", service.list(page));
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPage(page);
		pageMaker.setTotalCount(service.totalBoardCnt(page));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(BoardVO board, Model model) throws Exception {
		// 향후에 뷰로 데이터를 전달할 가능성이 있으므로 Model 클래스의 객체를 받도록 설계

		logger.info("register get ...........");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception {

		logger.info("regist post ...........");
		logger.info(board.toString());

		service.register(board);

//		model.addAttribute("result", "success");
		rttr.addFlashAttribute("msg", "success");

//		return "/board/list";
		return "redirect:/board/list";
	}

}




