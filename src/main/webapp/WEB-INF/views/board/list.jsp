<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>

	<!-- Sweetalert Css -->
    <link href="/resources/plugins/sweetalert/sweetalert.css" rel="stylesheet" />

	<!-- Bootstrap Select Css -->
    <link href="/resources/plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />

<style>
	.bootstrap-select.btn-group[class*="col-"] .dropdown-toggle {
		    padding-right: 10px;
	}
</style>


<section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>NORMAL TABLES</h2>
            </div>
            <div class="align-right m-b-15">
                <a class="btn btn-info waves-effect m-r-30" href="/board/register">글 쓰기</a>
            </div>
            
            <!-- Hover Rows -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-b-50">
                    <div class="card">
                        <div class="header">
                            <h2>
                                HOVER ROWS
                                <small>Add <code>.table-hover</code> to enable a hover state on table rows within a <code>&lt;tbody&gt;</code>.</small>
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">Action</a></li>
                                        <li><a href="javascript:void(0);">Another action</a></li>
                                        <li><a href="javascript:void(0);">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body table-responsive">
                            <table class="table table-hover m-b--20">
                                <thead>
                                    <tr>
                                        <th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">#</th>
                                        <th class="col-lg-6 col-md-6 col-sm-6 col-xs-6">제목</th>
                                        <th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">작성자</th>
                                        <th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">작성일자</th>
                                        <th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">조회수</th>
                                    </tr>
                                </thead>
                                <tbody>
							   <c:forEach items="${list}" var="list">
							   		<tr>
							   			<td>${list.bno}</td>
							   			<td><a href="/board/read?bno=${list.bno}&page=${pageMaker.page.page}&perPageNum=${pageMaker.page.perPageNum}&searchType=${pageMaker.page.searchType}&keyword=${pageMaker.page.keyword} ">${list.title}</a></td>
							   			<td>${list.writer}</td>
							   			
							   			<jsp:useBean id="now" class="java.util.Date" />
							   			<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="today" />  
										<fmt:formatDate value="${list.regdate}" pattern="yyyyMMdd" var="regdate"/>
							   			<c:choose>
										    <c:when test="${today == regdate}">
   								   			   <td><fmt:formatDate pattern="HH:mm" value="${list.regdate}"/></td>
										    </c:when>
										    <c:otherwise>
   								   			   <td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.regdate}"/></td>
										    </c:otherwise>
										</c:choose>
										
							   			<td>${list.viewcnt}</td>
							   		</tr>
							   </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        		
                        	<div class="row clearfix">
                        		<div class="col-md-7 p-l-50">
                        			<form action="/board/list">
                        				<input type="hidden" name="page" value=1>
                            			<input type="hidden" name="perPageNum" value=${pageMaker.page.perPageNum} >
                            			
		                        		<div class="col-md-3 p-t-15">
			                        		<select name="searchType" class="col-md-3 form-control show-tick">
			                             	<option value="t" <c:out value="${pageVO.searchType eq 't' ? 'selected':''}"/> >제목</option>
			                                 <option value="c" <c:out value="${pageVO.searchType eq 'c' ? 'selected':''}"/> >내용</option>
			                                 <option value="w" <c:out value="${pageVO.searchType eq 'w' ? 'selected':''}"/> >작성자</option>
			                             </select>
		                        		</div>
		                        		<div class="col-md-4 p-t-15 p-l-0">
	                                     <div class="form-group">
	                                         <div class="form-line">
	                                             <input name="keyword" type="text" class="form-control" value="${pageVO.keyword}">
	                                         </div>
	                                     </div>
	                                 </div>
		                        		
	                        			<button class="btn btn-default m-t-20 waves-effect" >검색</button>
                        			</form>
                        		</div>
                           
                           <div class="col-md-5">         
                  		  <nav class="align-right m-r-60">
                                <ul class="pagination">
                                     
                                     <c:if test="${pageMaker.prev}">
									<li>
	                                     <a href="${pageMaker.startPage-1}">
	                                         <i class="material-icons">chevron_left</i>
	                                     </a>
	                                 </li>
	                                 </c:if>
		
									<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
										<li <c:out value="${pageMaker.page.page == idx?'class =active':''}"/> >
											<a href="${idx}">${idx}</a>
										</li>
									</c:forEach>
		
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li>
	                                     <a href="${pageMaker.endPage+1}">
	                                         <i class="material-icons">chevron_right</i>
	                                     </a>
	                                 </li>
	                                 </c:if>
                                </ul>
                            </nav>
                            </div>
                            
                        	</div>
                        	
                            <form id="pageForm" action="/board/list" >
                            		<input type="hidden" name="page" >
                            		<input type="hidden" name="perPageNum" value=${pageMaker.page.perPageNum} >
                            		<input type="hidden" name="searchType" value=${pageMaker.page.searchType} >
                            		<input type="hidden" name="keyword" value=${pageMaker.page.keyword} >
                            </form>
                            
                    </div>
                </div>
            </div>
            <!-- #END# Hover Rows -->
            
        </div>
    </section>
  

  
  
  <%@include file="../include/footer.jsp"%>
  
  
  
  
  
  <!-- SweetAlert Plugin Js -->
  <script src="/resources/plugins/sweetalert/sweetalert.min.js"></script>
  
  <!-- advanced-form-element Js -->
<!--   <script src="/resources/js/pages/forms/advanced-form-elements.js"></script>
 -->  
  <script>
 	if('${msg}' == 'success'){
 		console.log('${msg}');
 		
 		swal({
		        title: "글이 작성되었습니다",
		        //text: "게시판으로 돌아갑니다",
		        type: "success",
		        showCancelButton: false,
		        confirmButtonColor: "skyblue",
		        confirmButtonText: "확인",
		        closeOnConfirm: true
		    });
 	}
 	
 	/* $('.disabled').click(function(e){
 	     e.preventDefault();
 	  }); */
	
 	
 	
	$(".pagination li a").on("click", function(e) {
		e.preventDefault();
		
		var pageForm = $("#pageForm");
		
		pageForm.find("[name='page']").val( $(this).attr("href") );
		pageForm.submit();
		
	});
  </script>
  
  
  
  
  
  
  
  
  
  
  
  
   