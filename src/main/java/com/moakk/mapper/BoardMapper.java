package com.moakk.mapper;

import java.util.List;

import com.moakk.vo.BoardVO;
import com.moakk.vo.PageVO;

public interface BoardMapper {

	public void create(BoardVO vo) throws Exception;

	public BoardVO read(Integer bno) throws Exception;

	public void update(BoardVO vo) throws Exception;

	public void delete(Integer bno) throws Exception;

	public List<BoardVO> list(PageVO page) throws Exception;

	public int totalBoardCnt(PageVO page) throws Exception;

}
