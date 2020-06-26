<!DOCTYPE html>
<html lang="utf-8">
    <head>
        <meta charset="utf-8" />
            <title></title>
			<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
		    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
			<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
            <meta content="Coderthemes" name="author" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <!-- App favicon -->
            <link rel="shortcut icon" href="../assets/images/favicon.ico">
    
            <!-- Plugins css -->
            <link href="${pageContext.request.contextPath}/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
    
            <!-- App css -->
            <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
            <link href="${pageContext.request.contextPath}/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
            <link href="${pageContext.request.contextPath}/assets/css/app.min.css" rel="stylesheet" type="text/css" />
			<link href="${pageContext.request.contextPath}/assets/css/review.css" rel="stylesheet" type="text/css" />
		    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        

<script>
$( document ).ready(function() {
	
	$( ".star_rating a" ).click(function() {
	    $(this).parent().children("a").removeClass("on");
	    $(this).addClass("on").prevAll("a").addClass("on");
	    return false;
	});
	$("#pd").css("padding-top","0px"); 
	
	$("#reg-review-btn").click(function(){
		var vo={};
		vo.no = null;
		vo.rate = $('.on').length
		vo.title = $("#title").val();
		vo.content = $("#review-textarea").val();
		vo.itemNo = ${itemNo}
		vo.orderNo = "${orderNo}"
		vo.stockNo = ${stockNo}
		vo.memberNo = ${memberNo}
		vo.regDate= null;
		vo.color= "${itemColor}";
		vo.size= "${itemSize}";
		vo.image=$("#imgSource").val();
	
		 
		$.ajax({
			url: '${pageContext.request.contextPath }/api/order/regReview',
			contentType: 'application/json',
			data: JSON.stringify(vo),
			type: "POST",
			dataType: 'json',
			success : function(response){
				alert("상품리뷰가 등록되었습니다");
				window.close();
			},
			error: function(xhr, status, e){
				console.error(status + " : " + e);
				alert("정보를 모두 입력하세요.")
			}
		}); 
	});
	
	$("#cancle-btn").click(function(){
		window.close();
	})

});

function preview(input, target) {
	if(input.files && input.files[0]){
	  	var fileName= input.files[0].name;
	  	var ext=fileName.substr(fileName.length-3, fileName.length);
	  	var isCheck=false; 
	  		if(ext.toLowerCase()=='jpg' || ext.toLowerCase()=='gif' || ext.toLowerCase()=='png'){
	  			isCheck=true;               
  			}
  	if(isCheck==false){
  		alert("이미지 파일 아닙니다.");
  		jQuery(input).val("");
  		return;
  	}
  	
  	var form=new FormData($('#fileForm')[0]);

  	$.ajax({
  		type:"POST",
  		enctype : 'multipart/form-data',
  		url : '${pageContext.request.contextPath}/api/order/regreviewimg',
  		data: form,
  		processData:false,
  		contentType:false,
  		cache:false,
  		success: function(result){
  			$("#imgSource").val(result.data)
  		},
  		error: function(e){
  			
  		}	
  	})
  	
  	var reader = new FileReader();
  	reader.readAsDataURL(input.files[0]);    
  	reader.onload = function(e) {
  	  $("#"+target[0].id).show();
  	  $("#"+target[0].id+"-upload").hide();
  	  $("#"+target[0].id+"-delete").show();
  	  jQuery(target).attr('src', e.target.result);
  	}
	}
}

function deleteImg(test,target){
	$("#"+target[0].id).hide();
	$("#"+target[0].id+"-upload").show();
	$("#"+target[0].id+"-delete").hide();
	$("#"+target[0].id+"-btn").val('');
}

$(document).on("click","#main-image-upload",function(){
	$("#main-image-btn").click();
});





</script>
</head>
<body>	
	<div class="review-top"> 후기작성</div>
	<div class="review-item-info">
		<div class="review-image"> <img src="/scs-manager${image}" style="width:90px; height:90px;" /></div>
			<div class="review-itemName">${itemName }</div>
			<div class="review-option">${itemSize } / ${itemColor }</div>
	</div>
	<div class="review-rate">
	별점을 매겨주세요. <label class="review-space"></label>
		<p class="star_rating">
		    <a href="#">★</a>
		    <a href="#">★</a>
		    <a href="#">★</a>
		    <a href="#">★</a>
		    <a href="#">★</a>
		</p>
	</div>
	<div class="review-title">
		제목<label class="review-space"></label>
		<input type="text" id="title" class="form-control" style="margin-left:5px;width:80%; display:inline-block" placeholder="제목을 입력하세요"/> 
	</div>
	<div class="review-content">		
		<div style="position:absolute">내용</div>
		<textarea id="review-textarea" class="form-control" placeholder="내용을 입력하세요"></textarea>
	</div>

	<div class="review-fileupload">
		<div style="position:absolute">이미지</div>
		<div class="review-upload-group">
			<div class="main-section form-control" style="width:100%; height:200px;" >
				<img id="main-image-delete" class="delete-hover"src="/scs-shop/assets/images/del2.png" onclick="deleteImg(this,$('#main-image'));" height=20 style="position:absolute; margin:5px; display:none"   />
				<img id="main-image" src="/scs-shop/assets/images/del2.png" alt="d" class="previewSection"  style="width:160px; height:160px; margin:10px;margin-left:110px;postion:relative; display:none;" >
				
				<form id="fileForm" method="post" enctype="multipart/form-data">
					<input id="main-image-btn" type="file" name="excelFile" onchange="preview(this, $('#main-image'));" class="fileInput" style="display:none"/>
				</form >
				<input type="hidden" id="imgSource">
				<div id="main-image-upload"class="img-upload-group"style="width:250px; height:120px; margin:5px; margin-top:20px;">
				<img src="/scs-shop/assets/images/server.png" height="100" style="display:block; margin-left:130px;"/>
				<span style="margin-left: 110px;">이미지를 업로드 해주세요.</span>
			</div>
		</div>
	</div>
	<div class="review-button-section">
		<label class="space2"></label>
		<input type="button" id="reg-review-btn" class="btn btn-secondary waves-effect" value="리뷰 등록"/>
		<input type="button" id="cancle-btn" class="form-control" value="취소"/>
	</div>
  
    <!-- Vendor js -->
   <script src="${pageContext.request.contextPath}/assets/js/vendor.min.js"></script>

   <!-- App js-->
   <script src="${pageContext.request.contextPath}/assets/js/app.min.js"></script>
</body>
</html>