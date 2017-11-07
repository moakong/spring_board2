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
            <div class="align-right p-r-30 m-b-10">
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
            
            
            
            
            <!-- Default Media -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <!-- <div class="header">
                            <h2>
                                DEFAULT MEDIA
                                <small>The default media displays a media object (images, video, audio) to the left or right of a content block.</small>
                            </h2>
                        </div> -->
                        <div class="body">
                        		<div>
								<div class="btn-group align-right m-l-10 m-b-30" role="group">
					                <button id="writeFormRp" type="button" class="btn btn-sm waves-effect" data-toggle="modal" data-target="#writeModal"><i class="material-icons">chat</i><span>댓글 쓰기</span></button>
					            </div>
				            </div> 
				            
				            <!-- 댓글 div시작 -->
				           <div id="rpListDiv">
	                            <!-- <div class="media">
	                                <div class="media-left">
	                                    <a href="javascript:void(0);">
	                                        <img class="media-object" src="http://placehold.it/64x64" width="64" height="64">
	                                    </a>
	                                </div>
	                                <div class="media-body">
	                                    <h6 class="media-heading">아이디 자리!</h6> Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque
	                                    ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra
	                                    turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis
	                                    in faucibus.
	                                    <div class="m-b-10 m-t-10">
	                                    		<span class="font-italic">2017.1.1 18:44:33</span>
											<div class="btn-group m-l-20" role="group">
								                <button type="button" class="btn bg-deep-orange btn-xs waves-effect">수정</button>
								                <button type="button" class="btn bg-deep-orange btn-xs waves-effect">삭제</button>
								            </div>
							            </div>
	                                </div>
	                            </div> -->
				            </div>
				            
				            <div class="align-center">
				            		<ul id="rpPaginationDiv" class="pagination "></ul>
				            </div>
				            
				            
				            
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Default Media -->
            
            
            <!-- Modal Dialogs ====================================================================================================================== -->
            <div class="modal fade" id="writeModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">댓글 쓰기</h4>
                        </div>
                        <div class="modal-body p-b-0">
                        		<div class="form-group">
                        			<div class="form-line">
                                     <input id="rpWriter" type="text" class="form-control" placeholder="작성자명 입력">
                                 </div>
                                 <div class="form-line m-t-30">
                                     <textarea id="rpContent" rows="3" class="form-control no-resize" placeholder="내용을 입력하세요."></textarea>
                                 </div>
                             </div>
                        </div>
                        <div class="modal-footer p-t-0">
                            <button id="writrRp" type="button" class="btn btn-link waves-effect">작성</button>
                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="updateModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">댓글 수정</h4>
                        </div>
                        <div class="modal-body p-b-0">
                        		<div class="form-group">
                                 <div class="form-line m-t-30">
                                     <textarea id="updateRpContent" rows="3" class="form-control no-resize" placeholder="내용을 입력하세요."></textarea>
                                 </div>
                             </div>
                        </div>
                        <div class="modal-footer p-t-0">
                            <button id="updateRpBtn" type="button" class="btn btn-link waves-effect" data-rno="">수정</button>
                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>
            
            
            
        </div>
    </section>






  
  
<%@include file="../include/footer.jsp"%>
  
  
  <!-- SweetAlert Plugin Js -->
  <script src="/resources/plugins/sweetalert/sweetalert.min.js"></script>
  <!-- handlebars Plugin Js -->
  <script src="/resources/plugins/handlebars-v4.0.11.js"></script>
  
  
  
	<script id="rpList" type="text/x-handlebars-template">
		<div class="m-l-10 font-bold font-15">총 {{pageMaker.totalCount}}개</div>
		{{#each list}}
        <div class="media">
            <div class="media-left">
                <a href="javascript:void(0);">
                    <img class="media-object" src="http://placehold.it/64x64" width="64" height="64">
                </a>
            </div>
            <div class="media-body">
                <h6 class="media-heading" >{{replyer}}</h6> <span id="replytext{{rno}}">{{replytext}}</span>
                <div class="m-b-10 m-t-10">
                    <span class="font-italic">{{printDate regdate}}</span>
                    <div class="btn-group m-l-20" role="group">
                        <button id="updateRpFormBtn" type="button" class="btn bg-deep-orange btn-xs waves-effect" data-rno={{rno}} data-toggle="modal" data-target="#updateModal">수정</button>
                        <button id="delRpBtn" type="button" class="btn bg-deep-orange btn-xs waves-effect" data-rno={{rno}}>삭제</button>
                    </div>
                </div>
            </div>
        </div>
		{{/each}}
	</script>

  
  <script>
  /* 댓글 (작성, 삭제, 수정) */
	$("#writrRp").on("click", function() {
		var rpWriterObj = $("#rpWriter");
		var rpContentObj = $("#rpContent");
		
		$.ajax({
			type:'post',
			url:'/replies/',
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "POST" },
			dataType:'text',
			data: JSON.stringify({bno:bno, replyer:rpWriterObj.val(), replytext:rpContentObj.val()}),
			success:function(result){
					//alert("등록 되었습니다.");
					swal({
				        title: "댓글이 작성되었습니다",
				        //text: "게시판으로 돌아갑니다",
				        type: "success",
				        showCancelButton: false,
				        confirmButtonColor: "skyblue",
				        confirmButtonText: "확인",
				        closeOnConfirm: true
				    });
					
					getRpPage("/replies/" + bno + "/1");
					
					rpWriterObj.val("");
					rpContentObj.val("");
					$("#writeModal").modal("toggle");
			}
		});
	});
  
 
	
	$("#rpListDiv").on("click", "#delRpBtn", function() {
 		var rno = $(this).data('rno');
 		var currPage = $("#rpPaginationDiv > li.active > a").attr('href');
		
		swal({
	        title: "댓글을 삭제하시겠습니까?",
	        text: "삭제 후 다시 복구할 수 없습니다.",
	        type: "warning",
	        showCancelButton: true,
	        confirmButtonColor: "#d33",
	        confirmButtonText: "확인",
	        cancelButtonColor: 'white',
	        cancelButtonText: '취소',
	        closeOnConfirm: true
	    }, function () {
	    		
	    		$.ajax({
					type:'delete',
					url:'/replies/' + bno + '/' + rno,
					headers: { 
					      "Content-Type": "application/json",
					      "X-HTTP-Method-Override": "DELETE" },
					dataType:'text', 
					success:function(result){
						// alert("삭제 되었습니다.");
						getRpPage("/replies/"+bno+"/"+currPage);
					}
			});
	    	
	    });
	});
	
	
	$("#rpListDiv").on("click", "#updateRpFormBtn", function() {
		var rno = $(this).data('rno');
		var content = $("#replytext" + rno).html();
		
		$("#updateRpContent").val(content);
		$("#updateRpBtn").data("rno", rno);
	});
  
	
	$("#updateRpBtn").on("click", function() {
		var rno = $(this).data("rno");
		var currPage = $("#rpPaginationDiv > li.active > a").attr('href');
		var replytext = $("#updateRpContent").val();
		
		$.ajax({
			type:'put',
			url:'/replies/' + rno,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "PUT" },
			data:JSON.stringify({replytext:replytext}),
			dataType:'text', 
			success:function(result){
				// alert("수정 되었습니다.");
				swal({
			        title: "댓글이 수정되었습니다",
			        //text: "게시판으로 돌아갑니다",
			        type: "success",
			        showCancelButton: false,
			        confirmButtonColor: "skyblue",
			        confirmButtonText: "확인",
			        closeOnConfirm: true
			    });
				
				$("#updateModal").modal("toggle");
				getRpPage("/replies/"+bno+"/"+currPage);
			}
		});
		
	});
	
  
  
  
  
  
  
  
  /* Pagenation */
 	var bno = ${boardVO.bno};
  	
	Handlebars.registerHelper("printDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		var hour = dateObj.getHours();
		var min = dateObj.getMinutes();
		var sec = dateObj.getSeconds();
		if(sec < 10) sec = '0' + sec;
		
		return year + "." + month + "." + date + " " + hour + ":" + min + ":" + sec;
	});
	
  	var printData = function(replyArr, target, templateObject) {
		var template = Handlebars.compile(templateObject.html());
		var html = template(replyArr);
		//target.remove();
		target.html(html);
	}
  	
  	var getRpPagination = function(pageMaker, target) {
  		var str = "";
  		
  		if (pageMaker.prev) {
  			str += '<li> <a href="' + (pageMaker.startPage-1) + '"><i class="material-icons">chevron_left</i></a></li>'
  		}
  		
  		for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
			var strClass = pageMaker.page.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

  		if (pageMaker.next) {
  			str += '<li> <a href="' + (pageMaker.endPage+1) + '"><i class="material-icons">chevron_right</i></a></li>'
  		}
  		
  		target.html(str);
	}
  	
  	var getRpPage = function(pageInfo) {
  		$.getJSON(pageInfo, function(data) {
			console.dir(data);
			printData(data, $("#rpListDiv"), $('#rpList') ); ///////////////////////////////////////
			//printData(data.list, $("#rpPaginationDiv"), $('#rpPagination') );
			getRpPagination(data.pageMaker, $("#rpPaginationDiv"));
		})
	}
  	
	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		getRpPage("/replies/" + bno + "/" + $(this).attr("href"));
		
	});
	
  	$(
  		getRpPage("/replies/" + bno + "/1")
	);
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	/* 게시글 삭제, 수정, 목록  */
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
  
  
  
  
  
  
  
  
  
  
  
  
   