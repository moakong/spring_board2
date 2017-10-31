<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>


	<!-- Sweetalert Css -->
<!--     <link href="/resources/plugins/sweetalert/sweetalert.css" rel="stylesheet" />
 -->    
<section class="content">
        <div class="container-fluid">
        
        
            <div class="block-header">
                <h2>글 쓰기 </h2>
            </div>



            <!-- Vertical Layout -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                             	글 쓰기
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
                        <div class="body">
                            <form id="writeForm" action="/board/register" method="post">
                                <label for="title">제목</label>
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="text" id="title" name="title" class="form-control" placeholder="글 제목을 입력하세요 ">
                                    </div>
                                </div> <br>
                                <label for="writer">작성자</label>
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="text" id="writer" name="writer" class="form-control" placeholder="작성자명을 입력하세요 ">
                                    </div>
                                </div> <br><br>
                                <div class="form-group">
                                    <div class="form-line">
                                        <textarea rows="10" id="content" name="content" class="form-control no-resize" placeholder="내용을 입력하세요 "></textarea>
                                    </div>
                                </div>

                                <br>
<!--                                 <button type="button" class="btn btn-primary m-t-15 waves-effect" id="submitBtn" >작성 완료</button> -->
                                <button class="btn btn-primary m-t-15 waves-effect" id="submitBtn" >작성 완료</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Vertical Layout -->
            
            
            
        </div>
    </section>
  		
  		
  		
  
	<!-- SweetAlert Plugin Js -->
<!--     <script src="/resources//plugins/sweetalert/sweetalert.min.js"></script>    -->      
<%@include file="../include/footer.jsp"%>

 	<script>
 	/* 
 		$("#submitBtn").on("click", function(){

 			swal({
 		        title: "글이 작성되었습니다",
 		        text: "게시판으로 돌아갑니다",
 		        type: "success",
 		        showCancelButton: false,
 		        confirmButtonColor: "skyblue",
 		        confirmButtonText: "확인",
 		        closeOnConfirm: true
 		    }, function () {
 		       	$("#writeForm").submit();
 		    });
 			
 		});
 */ 		
 	</script>





