package com.moakk.mapper;

import com.moakk.vo.BoardVO;
import com.moakk.vo.MemberVO;

public interface MemberMapper {
	
	public String getTime();
	
	public void insertMember(MemberVO vo);

	public MemberVO readMember(String userid) throws Exception;
  
	public MemberVO readWithPW(String userid, String userpw) throws Exception;

	//temp
	public BoardVO getBoard(int i);
	
}
