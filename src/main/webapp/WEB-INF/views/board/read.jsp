<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>

	<!-- Sweetalert Css -->
    <link href="/resources/plugins/sweetalert/sweetalert.css" rel="stylesheet" />

<section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>TYPOGRAPHY</h2>
            </div>
            <div class="align-right p-r-30">
				<div class="btn-group align-right" role="group">
	                <button id="update" type="button" class="btn  bg-cyan waves-effect">수정</button>
	                <button id="delete" type="button" class="btn  bg-cyan waves-effect">삭제</button>
	                <button id="list" type="button" class="btn  bg-cyan waves-effect">목록</button>
	            </div>
            </div>


		<form id="hForm" method="post">
			<input type='hidden' name='bno' value="${boardVO.bno}"> 
			<input type='hidden' name='page' value="${pageVO.page}"> 
			<input type='hidden' name='perPageNum' value="${pageVO.perPageNum}">
			<input type="hidden" name="searchType" value=${pageVO.searchType} >
			<input type="hidden" name="keyword" value=${pageVO.keyword} > 
		</form>


		<!-- Body Copy -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2 class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                ${boardVO.title} <br>
                                <%-- <h6 class="font-italic col-teal">${boardVO.writer}</h6> --%>
                            </h2>
                            <span class="align-right col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            		<fmt:formatDate pattern="yyyy-MM-dd  HH:mm" value="${boardVO.regdate}"/> <br> 조회수 : ${boardVO.viewcnt}&nbsp;
                            </span>
                            <div class="font-italic col-teal p-l-15 p-r-15 ">${boardVO.writer}</div>
                        </div>
                        
                        <div class="body">
                            <p>${boardVO.content}</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Body Copy -->
            
        </div>
    </section>




  
  
<%@include file="../include/footer.jsp"%>
  
  
  <!-- SweetAlert Plugin Js -->
  <script src="/resources//plugins/sweetalert/sweetalert.min.js"></script>
  
  
  <script>
    var hForm = $("#hForm");
    
 	$("#delete").on("click", function() {
 		swal({
		        title: "글을 삭제하시겠습니까?",
		        text: "삭제 후 다시 복구할 수 없습니다.",
		        type: "warning",
		        showCancelButton: true,
		        confirmButtonColor: "#d33",
		        confirmButtonText: "확인",
		        cancelButtonColor: 'white',
		        cancelButtonText: '취소',
		        closeOnConfirm: true
		    }, function () {
		  	  	//self.location = "/board/delete?bno=" + ${boardVO.bno};
		  	  	hForm.attr("action","/board/delete");
		  	  	hForm.submit();
		    });
	});

 	
 	$("#update").on("click", function() {
 		//self.location = "/board/update?bno=" + ${boardVO.bno};
 		hForm.attr("action","/board/updateForm");
  	  	hForm.submit();
	});

 	
 	$("#list").on("click", function() {
 		//self.location = "/board/list";
 		
 		hForm.find('input[name="bno"]').remove();
 		hForm.attr("method", "get");
 		hForm.attr("action","/board/list");
  	  	hForm.submit();
	});
  </script>
  
  
  
  
  
  
  
  
  
  
  
  
   