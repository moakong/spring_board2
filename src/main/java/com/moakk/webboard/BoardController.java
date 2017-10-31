package com.moakk.webboard;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.moakk.service.BoardService;
import com.moakk.vo.BoardVO;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	
	
	
	@RequestMapping("/list")
	public void list() throws Exception {
		
		logger.info("list ...........");
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




