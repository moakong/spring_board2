package com.moakk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moakk.mapper.BoardMapper;
import com.moakk.vo.BoardVO;
import com.moakk.vo.PageVO;



@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) throws Exception {
		mapper.create(board);
	}

	@Transactional
	@Override
	public BoardVO read(Integer bno) throws Exception {
		mapper.updateViewCnt(bno);
		
		return mapper.read(bno);
	}

	@Override
	public void update(BoardVO board) throws Exception {
		mapper.update(board);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		mapper.delete(bno);
	}

	@Override
	public List<BoardVO> list(PageVO page) throws Exception {
		return mapper.list(page);
	}

	@Override
	public int totalBoardCnt(PageVO page) throws Exception {
		return mapper.totalBoardCnt(page);
	}

	@Override
	public void updateReplyCnt(Integer bno, int amount) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("bno", bno);
		paramMap.put("amount", amount);
		
		mapper.updateReplyCnt(paramMap);
	}


}






