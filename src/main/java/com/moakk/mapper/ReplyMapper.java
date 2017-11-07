package com.moakk.mapper;

import java.util.List;
import java.util.Map;

import com.moakk.vo.ReplyVO;

public interface ReplyMapper {
//	public List<ReplyVO> list(Integer bno) throws Exception;

	public void create(ReplyVO vo) throws Exception;

	public void update(ReplyVO vo) throws Exception;

	public void delete(Integer rno) throws Exception;

	public List<ReplyVO> list(Map<String, Object> paramMap) throws Exception;

	public int count(Integer bno) throws Exception;
}
