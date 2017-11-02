package com.moakk.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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

	@Override
	public BoardVO read(Integer bno) throws Exception {
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

//  @Override
//  public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
//
//    return dao.listSearch(cri);
//  }
//
//  @Override
//  public int listSearchCount(SearchCriteria cri) throws Exception {
//
//    return dao.listSearchCount(cri);
//  }

}