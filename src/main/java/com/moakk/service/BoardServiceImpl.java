package com.moakk.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.moakk.mapper.BoardMapper;
import com.moakk.vo.BoardVO;



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
	public void modify(BoardVO board) throws Exception {
		mapper.update(board);
	}

	@Override
	public void remove(Integer bno) throws Exception {
		mapper.delete(bno);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return mapper.listAll();
	}

  
//  
//  @Override
//  public List<BoardVO> listCriteria(Criteria cri) throws Exception {
//
//    return dao.listCriteria(cri);
//  }
//
//  @Override
//  public int listCountCriteria(Criteria cri) throws Exception {
//
//    return dao.countPaging(cri);
//  }
//
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