package com.moakk.webboard;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moakk.mapper.MemberMapper;
import com.moakk.vo.BoardVO;
import com.moakk.vo.MemberVO;


@Controller
public class SampleController {

	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	
	@Inject
	private MemberMapper mapper;
	
	@RequestMapping("doA")
	public void doA(){
		
		logger.info("doA called....................");
		
		System.out.println(mapper.getTime());
	}
	
	@RequestMapping("doB")
	public void doB(){
		
		logger.info("doB called....................");
		
		MemberVO vo = new MemberVO();
		vo.setUserid("test");
		vo.setUserpw("pw");
		vo.setUsername("tester");
		vo.setEmail("email!");
		
		mapper.insertMember(vo);
	}

	
	@RequestMapping("c")
	public void c(){
		logger.info("c called....................");
		
		BoardVO vo = mapper.getBoard(3);
		
		System.out.println(vo);
	}
	
	
	
}