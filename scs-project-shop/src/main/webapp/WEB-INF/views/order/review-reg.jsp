<!DOCTYPE html>
<html lang="utf-8">
    <head>
        <meta charset="utf-8" />
            <title></title>
			<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		vo.contents = $("#review-textarea").val();
		vo.image = null;
		vo.itemNo = ${itemNo}
		vo.memberNo = ${memberNo}
		vo.regDate= null;
		vo.color= "${itemColor}";
		vo.size= "${itemSize}";
		
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




</script>
	



</head>
<body>	
	<div class="review-top"> 후기작성</div>
	<div class="review-item-info">
		<div class="review-image"> <img src="${pageContext.request.contextPath}${image}"></div>
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
		제목:<label class="review-space"></label>
		<input type="text" id="title" class="form-control" style="width:80%; display:inline-block" placeholder="제목을 입력하세요"/> 
	</div>
	<div class="review-content">		
		<textarea id="review-textarea" class="form-control" placeholder="내용을 입력하세요"></textarea>
	</div>

	<div class="review-fileupload">
		파일업로드
	</div>
	<div class="review-button-section">
		<label class="space2"></label>
		<input type="button" id="reg-review-btn" class="btn btn-secondary waves-effect" value="리뷰 등록"/>
		<input type="button" id="cancle-btn" class="form-control" value="취소"/>
	</div>
		
	     
     <c:import url="/WEB-INF/views/partials/footer.jsp"></c:import>
  
    <!-- Vendor js -->
   <script src="${pageContext.request.contextPath}/assets/js/vendor.min.js"></script>

   <!-- App js-->
   <script src="${pageContext.request.contextPath}/assets/js/app.min.js"></script>
</body>
</html>