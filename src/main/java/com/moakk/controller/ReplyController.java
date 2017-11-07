package com.moakk.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.moakk.service.ReplyService;
import com.moakk.vo.PageMaker;
import com.moakk.vo.PageVO;
import com.moakk.vo.ReplyVO;

@RestController
@RequestMapping("/replies")
public class ReplyController {

  @Inject
  private ReplyService service;

  

  @RequestMapping(value = "", method = RequestMethod.POST)
  public ResponseEntity<String> register(@RequestBody ReplyVO vo) {

	System.out.println(vo.toString());
	  
    ResponseEntity<String> entity = null;
    
    try {
      service.addReply(vo);
      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

  
  
//  @RequestMapping(value = "/{bno}", method = RequestMethod.GET)
//  public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") Integer bno) {
//
//    ResponseEntity<List<ReplyVO>> entity = null;
//    
//    try {
//      entity = new ResponseEntity<>(service.listReplyPage(bno), HttpStatus.OK);
//
//    } catch (Exception e) {
//      e.printStackTrace();
//      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); // 이렇게 처음 파라미터 안줘도 됨 
//    }
//
//    return entity;
//  }


  // method에 이렇게 배열로 여러개 쓸 수 있음  
  // 관습적으로 전체 수정은 put, 일부 수정은 patch 사용  
  @RequestMapping(value = "/{rno}", method = { RequestMethod.PUT, RequestMethod.PATCH }) 
  public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo) {

    ResponseEntity<String> entity = null;
    try {
      vo.setRno(rno);
      service.modifyReply(vo);

      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }


  
  
  @RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
  public ResponseEntity<String> remove(@PathVariable("rno") Integer rno) {

    ResponseEntity<String> entity = null;
    
    try {
      service.removeReply(rno);
      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    
    return entity;
  }

  
  
  
  @RequestMapping(value = "/{bno}/{page}", method = RequestMethod.GET)
  public ResponseEntity<Map<String, Object>> listPage(
      @PathVariable("bno") Integer bno,
      @PathVariable("page") Integer page) {
	  
    ResponseEntity<Map<String, Object>> entity = null;
    
    try {
      PageVO pageVO = new PageVO();
      pageVO.setPage(page);
//      pageVO.setPerPageNum(15); // 페이지당 댓글 표시 개수 조절하기 (디폴트 10개)
      

      PageMaker pageMaker = new PageMaker();
      pageMaker.setPage(pageVO); // 몇 페이지인지만 담고, perPageNum는 그냥 기본으로(10개)

      Map<String, Object> map = new HashMap<String, Object>();
      List<ReplyVO> list = service.listReplyPage(bno, pageVO); 
      // 게시물 번호 + 페이징 정보(몇 페이지를 표시할 것인지)를 보내서 디스플레이 할 댓글들을 가져옴 

      map.put("list", list); // 표시할 댓글들을 리스트에 담아서 map에 담기  

      int replyCount = service.count(bno);
      pageMaker.setTotalCount(replyCount);

      map.put("pageMaker", pageMaker); // 페이지네이션 정보를 map에 담기 
      
      // 댓글들과 페이지네이션 정보를 뷰로 넘긴다 
      entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

}












