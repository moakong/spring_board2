package com.moakk.mapper;

import java.util.List;
import java.util.Map;

import com.moakk.vo.BoardVO;
import com.moakk.vo.PageVO;

public interface BoardMapper {

	public void create(BoardVO vo) throws Exception;

	public BoardVO read(Integer bno) throws Exception;

	public void update(BoardVO vo) throws Exception;

	public void delete(Integer bno) throws Exception;

	public List<BoardVO> list(PageVO page) throws Exception;

	public int totalBoardCnt(PageVO page) throws Exception;
	
	public void updateReplyCnt(Map<String, Object> param) throws Exception;

	public void updateViewCnt(Integer bno) throws Exception;

	public void addAttach(String fullName) throws Exception;
	
	public List<String> getAttach(Integer bno) throws Exception;
	
	public void deleteAttach(Integer bno) throws Exception;

	public void updateAttach(Map<String, Object> param) throws Exception;
}
