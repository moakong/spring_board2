package com.moakk.service;

import java.util.List;

import com.moakk.vo.PageVO;
import com.moakk.vo.ReplyVO;

public interface ReplyService {
	public void addReply(ReplyVO vo) throws Exception;

//	public List<ReplyVO> listReply(Integer bno) throws Exception;

	public void modifyReply(ReplyVO vo) throws Exception;

	public void removeReply(Integer bno, Integer rno) throws Exception;

	public List<ReplyVO> listReplyPage(Integer bno, PageVO cri) throws Exception;

	public int count(Integer bno) throws Exception;
}
