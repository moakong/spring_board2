package com.moakk.service;

import java.util.List;

import com.moakk.vo.BoardVO;
import com.moakk.vo.PageVO;


public interface BoardService {

  public void register(BoardVO board) throws Exception;

  public BoardVO read(Integer bno) throws Exception;

  public void update(BoardVO board) throws Exception;

  public void delete(Integer bno) throws Exception;

  public List<BoardVO> list(PageVO page) throws Exception;

  public int totalBoardCnt(PageVO page) throws Exception;

  public void updateReplyCnt(Integer bno, int amount) throws Exception;
  
  public List<String> getAttach(Integer bno) throws Exception;

  
}