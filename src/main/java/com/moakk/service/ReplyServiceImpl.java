package com.moakk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.moakk.mapper.ReplyMapper;
import com.moakk.vo.PageVO;
import com.moakk.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	  @Inject
	  private ReplyMapper mapper;

	  @Override
	  public void addReply(ReplyVO vo) throws Exception {

	    mapper.create(vo);
	  }

//	  @Override
//	  public List<ReplyVO> listReply(Integer bno) throws Exception {
//
//	    return mapper.list(bno);
//	  }

	  @Override
	  public void modifyReply(ReplyVO vo) throws Exception {

	    mapper.update(vo);
	  }

	  @Override
	  public void removeReply(Integer rno) throws Exception {

	    mapper.delete(rno);
	  }

	  @Override
	  public List<ReplyVO> listReplyPage(Integer bno, PageVO page) throws Exception {
		  
		  Map<String, Object> paramMap = new HashMap<>();
		  paramMap.put("bno", bno);
		  paramMap.put("page", page);
		  
		  return mapper.list(paramMap);
	  }

	  @Override
	  public int count(Integer bno) throws Exception {

	    return mapper.count(bno);
	  }

}
