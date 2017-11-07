package com.moakk.vo;

public class PageMaker {

  private int totalCount;
  private int startPage;
  private int endPage;
  private boolean prev;
  private boolean next;

  // 페이지네이션 개수는 보여지길 원하는 만큼 아래 변수에 넣으면 된다
  private int displayPageNum = 5;

  private PageVO page;

  
  
  
  
  
  
  //setters
  public void setPage(PageVO page) {
    this.page = page;
  }

  public void setTotalCount(int totalCount) {
    this.totalCount = totalCount;

    calcData();
  }
  
  // 아래도 사실상 setter역할(계산해서 채워 넣는다)
  private void calcData() {

    endPage = (int) (Math.ceil(page.getPage() / (double) displayPageNum) * displayPageNum);

    startPage = (endPage - displayPageNum) + 1;

    int tempEndPage = (int) (Math.ceil(totalCount / (double) page.getPerPageNum()));

    if (endPage > tempEndPage) {
      endPage = tempEndPage;
    }

    prev = startPage == 1 ? false : true;

    next = endPage * page.getPerPageNum() >= totalCount ? false : true;

  }

  
  
  
  
  
  //getters
  public int getTotalCount() {
    return totalCount;
  }

  public int getStartPage() {
    return startPage;
  }

  public int getEndPage() {
    return endPage;
  }

  public boolean isPrev() {
    return prev;
  }

  public boolean isNext() {
    return next;
  }

  public int getDisplayPageNum() {
    return displayPageNum;
  }

  public PageVO getPage() {
    return page;
  }
  

  
  
  
  
  
  
  
  
//  public String makeQuery(int page) {
//
//    UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
//        .queryParam("perPageNum", page.getPerPageNum()).build();
//
//    return uriComponents.toUriString();
//  }
//  
//  
//  public String makeSearch(int page){
//    
//    UriComponents uriComponents =
//              UriComponentsBuilder.newInstance()
//              .queryParam("page", page)
//              .queryParam("perPageNum", page.getPerPageNum())
//              .queryParam("searchType", ((SearchCriteria)cri).getSearchType())
//              .queryParam("keyword", ((SearchCriteria)cri).getKeyword())
//              .build();             
//    
//    return uriComponents.toUriString();
//  } 
//  
  
  
}