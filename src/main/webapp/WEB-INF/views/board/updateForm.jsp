<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>


	<!-- Sweetalert Css -->
    <link href="/resources/plugins/sweetalert/sweetalert.css" rel="stylesheet" />

<section class="content">
        <div class="container-fluid">
        
        
            <div class="block-header">
                <h2>글 수정하기 </h2>
            </div>



            <!-- Vertical Layout -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                             	글 수정하기 
                            </h2>
                        </div>
                        <div class="body">
                            <form id="updateForm" action="/board/update" method="post">
                            	   <input type='hidden' name='bno' value="${boardVO.bno}">
                            	   <input type='hidden' name='page' value="${pageVO.page}">
                            	   <input type='hidden' name='perPageNum' value="${pageVO.perPageNum}">
							   <input type="hidden" name="searchType" value=${pageVO.searchType} >
							   <input type="hidden" name="keyword" value=${pageVO.keyword} >                             	   
                            	    
                                <label for="title">제목</label>
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="text" id="title" name="title" class="form-control" placeholder="글 제목을 입력하세요 " value=${boardVO.title}>
                                    </div>
                                </div> <br>
                                <div class="form-group">
                                    <div class="form-line">
                                        <textarea rows="10" id="content" name="content" class="form-control no-resize" placeholder="내용을 입력하세요 ">${boardVO.content}</textarea>
                                    </div>
                                </div>

                                <br>
                                <button type="button" class="btn btn-primary m-t-15 waves-effect" id="submitBtn" >수정 완료</button>
                                <button type="button" class="btn btn-default m-t-15 waves-effect" id="listBtn" >목록</button>
                                <!-- <button class="btn btn-primary m-t-15 waves-effect" id="submitBtn" >수정 완료</button> -->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Vertical Layout -->
            
            
            
        </div>
    </section>
  		
  		
  		
  
	<!-- SweetAlert Plugin Js -->
    <script src="/resources//plugins/sweetalert/sweetalert.min.js"></script>         
<%@include file="../include/footer.jsp"%>

 	<script>
 		$("#submitBtn").on("click", function(){
 			 
 			swal({
		        title: "글을 수정하시겠습니까?",
		        //text: "삭제 후 다시 복구할 수 없습니다.",
		        type: "warning",
		        showCancelButton: true,
		        confirmButtonColor: "skyblue",
		        confirmButtonText: "확인",
		        cancelButtonColor: 'white',
		        cancelButtonText: '취소',
		        closeOnConfirm: true
		    }, function () {
			    	$("#updateForm").submit();
 		    });
 		});
 		
 		$("#listBtn").on("click", function(){
 			self.location = "/board/list?page=${pageVO.page}&perPageNum=${pageVO.perPageNum}&searchType=${pageVO.searchType}&keyword=${pageVO.keyword}";
 		});
 	</script>





