package com.moakk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moakk.mapper.BoardMapper;
import com.moakk.mapper.ReplyMapper;
import com.moakk.vo.PageVO;
import com.moakk.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyMapper replyMapper;

	@Inject
	private BoardMapper boardmapper;

	@Transactional
	@Override
	public void addReply(ReplyVO vo) throws Exception {

		replyMapper.create(vo);

		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("bno", vo.getBno());
		paramMap.put("amount", 1);

		boardmapper.updateReplyCnt(paramMap);
	}

	@Transactional
	@Override
	public void removeReply(Integer bno, Integer rno) throws Exception {

		replyMapper.delete(rno);

		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("bno", bno);
		paramMap.put("amount", -1);

		boardmapper.updateReplyCnt(paramMap);
	}

	@Override
	public void modifyReply(ReplyVO vo) throws Exception {

		replyMapper.update(vo);
	}

	@Override
	public List<ReplyVO> listReplyPage(Integer bno, PageVO page) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("page", page);

		return replyMapper.list(paramMap);
	}

	@Override
	public int count(Integer bno) throws Exception {

		return replyMapper.count(bno);
	}

}
