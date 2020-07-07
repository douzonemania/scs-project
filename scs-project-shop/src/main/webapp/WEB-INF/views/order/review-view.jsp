
<!DOCTYPE html>
<html lang="utf-8">
    <head>
        <meta charset="utf-8" />
            <title>Pretty Girls~!</title>
            <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ page import="java.util.*"%>
			<%@ page import="java.text.SimpleDateFormat"%>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
            <meta content="Coderthemes" name="author" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <link rel="shortcut icon" href="/scs-manager${favicon }">
    
            <!-- Plugins css -->
            <link href="${pageContext.request.contextPath}/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
    
            <!-- App css -->
            <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
            <link href="${pageContext.request.contextPath}/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
            <link href="${pageContext.request.contextPath}/assets/css/app.min.css" rel="stylesheet" type="text/css" />
            <link href="${pageContext.request.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css" />
            <link href="${pageContext.request.contextPath}/assets/css/orderList.css" rel="stylesheet" type="text/css" />
            
            <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
            <script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
            <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
			<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
			<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
			<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
			<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/3.0.5/daterangepicker.css" />
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
	
<style>

.review-title {
	width: 100%;
}

.review-title .review-name {
	border: 1px solid #3C3C3C;
	background-color: #CECECE;
	width: 30%;
	height: 30px;
	font-size: 1.3em;
	font-weight: bold;
}

.review-title .review-value {
	border:1px solid #3C3C3C;
	width: 70%;
}

</style>

</head>

<body>	
	<table class="review-title">
		<tr><td class="review-name">상품이름</td>
			<td class="review-value">&nbsp; ${vo.itemName }</td>
		</tr>
		<tr>
			<td class="review-name">옵션</td>
			<td class="review-value">&nbsp; ${vo.size }&nbsp;/&nbsp;${vo.color }</td>
		</tr>
		<tr>
			<td class="review-name">별점</td>
			<td class="review-value">
				&nbsp;
				<c:forEach begin="1" end="${vo.rate }">
					<span class="mdi mdi-star text-warning"></span>
				</c:forEach>
				<c:set var="emptyStar" value="${5-vo.rate }"/>
				<c:forEach begin='1' end='${emptyStar }'>
					<span class="mdi mdi-star-outline"></span>
				</c:forEach>			
			</td>
		</tr>
		<tr>
			<td class="review-name">제목</td>
			<td class="review-value">&nbsp; ${vo.title }</td>
		</tr>
		<tr>
			<td class="review-name">작성자</td>
			<td class="review-value">&nbsp; ${vo.id }</td>
		</tr>
		<tr>
			<td class="review-name">작성일</td>
			<td class="review-value">&nbsp; ${vo.regDate }</td>
		</tr>
	</table>
	
	<!--  review image  -->
	<c:if test="${vo.image != ''}">
		<div class="review-image" style="max-width:500px"><img src="/scs-manager${vo.image}" style="max-width:500px"></div>			
	</c:if>
	<c:choose>
		<c:when test="${vo.image != '' }">
		
		</c:when>
		<c:otherwise>
		
		</c:otherwise>
	</c:choose>
	<div style="border-top: 1px solid #CECECE; width: 480px; word-break:break-all"><br />
	${vo.content }</div>
	     
    <!-- Vendor js -->
   <script src="${pageContext.request.contextPath}/assets/js/vendor.min.js"></script>

   <!-- App js-->
   <script src="${pageContext.request.contextPath}/assets/js/app.min.js"></script>
</body>
</html>