<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>


	<!-- Sweetalert Css -->
    <link href="/resources/plugins/sweetalert/sweetalert.css" rel="stylesheet" />

    <!-- Dropzone Css -->
<!--     <link href="/resources/plugins/dropzone/dropzone.css" rel="stylesheet">	
 -->	
 	<!-- Lightbox2 Css -->
 	<link href="/resources/plugins/lightbox2/css/lightbox.css" rel="stylesheet">

	<style>
	.fileName {
		overflow: hidden;
		text-overflow: ellipsis;
	}
	</style>
	
	
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
                                <!-- <button class="btn btn-primary m-t-15 waves-effect" id="submitBtn" >작성 완료</button> -->
                            </form>
                            
                            <div id="dropzone" class="dropzone m-b-20" style="height: 200px;" ondragover="">
                            		<div class="align-center m-t-40">
	                            		<i class="material-icons md-48">touch_app</i>
	                            		<h3>첨부할 파일을 이곳에 드랍하세요!</h3>
	                            		<em>(사진파일은 jpg, png, gif형식만 업로드 가능합니다.)</em>
                            		</div>
                            </div>
                           
                            <div id="displayFile" class="row">
                         	</div>
                         	
                         	
                            <button type="button" class="btn btn-primary m-t-15 waves-effect" id="submitBtn" >작성 완료</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Vertical Layout -->
            
            
            
        </div>
    </section>
  		
  		
  		
<%@include file="../include/footer.jsp"%>
  
	<!-- SweetAlert Plugin Js -->
    <script src="/resources//plugins/sweetalert/sweetalert.min.js"></script> 

    <!-- Dropzone Plugin Js -->
<!--     <script src="/resources/plugins/dropzone/dropzone.js"></script>	
 -->      
	
	<!-- handlebars Plugin Js -->
    <script src="/resources/plugins/handlebars-v4.0.11.js"></script>
    
    <!-- lightbox2 Js -->
    <script src="/resources/plugins/lightbox2/js/lightbox.js"></script>
    
    <!-- upload.js -->
    <script type="text/javascript" src="/resources/js/upload.js"></script>
  

	<!-- 
	<script id="displayAddedFiles" type="text/x-handlebars-template">
        <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="{{imgsrc}}">
                <div class="caption">
                    <h5><a href="{{getLink}}">{{fileName}}</h5>
                    <p class="m-b-0 align-right">
                        <a href="{{fullName}}" class="delAttachBtn btn bg-red btn-xs waves-effect" role="button">삭제</a>
                    </p>
                </div>
            </div>
        </div>
	</script>
	 -->
	 
 	<script id="displayAddedFiles" type="text/x-handlebars-template">
	{{#if isImg}}
        <div class="col-sm-6 col-md-3 singleFile">
            <div class="thumbnail">
                <a class="example-image-link" href="{{getLink}}" data-lightbox="example-1">
                    <img class="example-image" src="{{imgsrc}}" alt="image-1">
                </a>
                <div class="caption">
                    <h5 class="fileName">{{fileName}}</h5>
                    <p class="m-b-0 align-right">
                        <a href="javascript:void(0)" data-fullname="{{fullName}}" class="delAttachBtn btn bg-red btn-xs waves-effect" role="button">삭제</a>
                    </p>
                </div>
            </div>
        </div>
	{{else}}
        <div class="col-sm-6 col-md-3 singleFile">
            <div class="thumbnail">
                <img src="{{imgsrc}}">
                <div class="caption">
                    <h5 class="fileName"><a href="{{getLink}}">{{fileName}}</h5>
                    <p class="m-b-0 align-right">
                        <a href="javascript:void(0)" data-fullname="{{fullName}}" class="delAttachBtn btn bg-red btn-xs waves-effect" role="button">삭제</a>
                    </p>
                </div>
            </div>
        </div>
	{{/if}}
	</script>
<!-- 
 	<script id="displayAddedFiles" type="text/x-handlebars-template">
        <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <a class="example-image-link" href="{{getLink}}" data-lightbox="example-1">
                    <img class="example-image" src="{{imgsrc}}" alt="image-1">
                </a>
                <div class="caption">
                    <h5><a href="{{getLink}}">{{fileName}}</h5>
                    <p class="m-b-0 align-right">
                        <a href="{{fullName}}" class="delAttachBtn btn bg-red btn-xs waves-effect" role="button">삭제</a>
                    </p>
                </div>
            </div>
        </div>
	</script>
-->
	 
	
	
	
 	<script>
 	$("#dropzone").on("dragenter dragover", function(e) {
		e.preventDefault();
		//$(this).addClass("highlight");
	});
 	
 	
 	$("#dropzone").on("drop", function(e) {
		e.preventDefault();
		//$(this).removeClass("highlight");
		
		var files = e.originalEvent.dataTransfer.files;
		//console.dir(files);
		
		for(var i = 0; i < files.length; i++){
			console.dir(files[i]);
			var file = files[i];
			
			if(file.size > 3000000){
				alert("3MB이하의 파일만 첨부가능합니다.");
				continue;
			}
			
			var formData = new FormData();
			
			formData.append("file", file);
			
			$.ajax({
				url: '/upload',
				data: formData,
				dataType: 'text',
				processData: false,
				contentType: false,
				type: 'POST',
				success: function(data) {
					console.log(data);
					  
					var template = Handlebars.compile($('#displayAddedFiles').html());
					
					var fileInfo = getFileInfo(data);
					  
					console.dir(fileInfo);
					
					var html = template(fileInfo);
					  
					$("#displayFile").append(html);
					  
				}
			});
		}

 	});
 	

 	
	$("#displayFile").on("click", ".delAttachBtn", function (event) {
	    var that = $(this);

	    $.ajax({
	        url: "/deleteFile",
	        type: "post",
	        data: {
	            fileName: $(this).data("fullname")
	        },
	        dataType: "text",
	        success: function (result) {
	            if (result == 'deleted') {
	                that.parents("div.singleFile").remove();
	            }
	        }
	    });
	});	

	
	
 	$("#submitBtn").on("click", function(){
		swal({
	        title: "글을 작성하시겠습니까?",
	        //text: "삭제 후 다시 복구할 수 없습니다.",
	        type: "success",
	        showCancelButton: true,
	        confirmButtonColor: "skyblue",
	        confirmButtonText: "확인",
	        cancelButtonColor: 'white',
	        cancelButtonText: '취소',
	        closeOnConfirm: true
	    }, function () {
		    	//var that = $(this);
		    var submitForm = $("#writeForm");
		    	
		    var str ="";
		    	$("#displayFile .delAttachBtn").each(function(index){
		    		 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).data("fullname") +"'> ";
		    	});
		    	
		    	submitForm.append(str);
		    	//that.get(0).submit();
		    	submitForm.submit();

	    });
		
	});
 		
 	</script>





