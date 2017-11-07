package com.moakk.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moakk.mapper.MemberMapper;
import com.moakk.vo.BoardVO;
import com.moakk.vo.MemberVO;


@RestController
public class SampleController {

	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	
	@Inject
	private MemberMapper mapper;
	
	@RequestMapping("a")
	public String doA(){
		
		logger.info("doA called....................");
		
		return "a called";
	}
	
	@RequestMapping("b")
	public MemberVO doB(){
		
		logger.info("doB called....................");
		
		MemberVO vo = new MemberVO();
		vo.setUserid("test");
		vo.setUserpw("pw");
		vo.setUsername("tester");
		vo.setEmail("email!");
		
		return vo;
	}

	
	@RequestMapping("c")
	public List<MemberVO> c(){
		logger.info("c called....................");
		
		List<MemberVO> list = new ArrayList<>();
		
		for(int i = 0; i < 10; i++) {
			MemberVO vo = new MemberVO();
			vo.setUserid(i+"번");
			vo.setUserpw("pw");
			vo.setUsername("tester");
			vo.setEmail("email!");
			
			list.add(vo);
		}
		
		return list;
	}
	
	@RequestMapping("d")
	public Map<Integer, MemberVO> d(){
		logger.info("c called....................");
		
		Map<Integer, MemberVO> map = new HashMap<>();
		
		for(int i = 0; i < 10; i++) {
			MemberVO vo = new MemberVO();
			vo.setUserid(i+"번");
			vo.setUserpw("pw");
			vo.setUsername("tester");
			vo.setEmail("email!");
			
			map.put(i, vo);
		}
		
		return map;
	}
	
	
	
}