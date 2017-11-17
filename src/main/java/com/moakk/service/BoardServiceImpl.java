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
	
	@Transactional
	@Override
	public void register(BoardVO board) throws Exception {
		mapper.create(board);
		
		String[] files = board.getFiles();
		if(files == null) return;
		
		for(String fileName: files) {
			mapper.addAttach(fileName);
		}
	}

	@Transactional
	@Override
	public BoardVO read(Integer bno) throws Exception {
		mapper.updateViewCnt(bno);
		
		return mapper.read(bno);
	}
	
	@Transactional
	@Override
	public void update(BoardVO board) throws Exception {
		// 게시글 처리 
		mapper.update(board);
		
		
		// 첨부파일 처리 
		Integer bno = board.getBno();
		mapper.deleteAttach(bno);
		
		String[] files = board.getFiles();
		
		if(files == null) return;
		
		
		Map<String, Object> paramMap = new HashMap<>();
		
		for(String fileName : files) {
			paramMap.put("bno", bno);
			paramMap.put("fullName", fileName);
			
			mapper.updateAttach(paramMap);
		}
		
	}

	@Transactional
	@Override
	public void delete(Integer bno) throws Exception {
		mapper.deleteAttach(bno);
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

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
			
		return mapper.getAttach(bno);
	}

	
	
	
}






