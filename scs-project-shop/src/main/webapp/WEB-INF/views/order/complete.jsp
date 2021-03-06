<!DOCTYPE html>
<html lang="utf-8">
    <head>
        <meta charset="utf-8" />
            <title>${ceoVo.siteName }</title>
			<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	
		    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        

	<script>
	
	$(function(){
		
		var Now = new Date();
		var NowTime = Now.getFullYear();
		NowTime += '년' + (Now.getMonth() + 1) ;
		NowTime += '월' + Now.getDate();
		NowTime += '일' + Now.getHours();
		NowTime += '시' + Now.getMinutes();
		NowTime += '분';			
		
		var orderNum = location.href.substr(location.href.lastIndexOf('=') + 1 );
	
		$('.order-complete-num').find('a').text(orderNum);
		$('.order-complete-date').find('p').text(NowTime);

	});

	</script>


    </head>
<body>
    <!-- Navigation Bar-->
    <c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import>


    <div class="wrapper">
        <div class="container-fluid">
            <div class="order-complete-form">
                <div class="order-title">
                    <span> Order / Payment </span>
                		    주문/결제
                </div>
                <div class="recipient-info">
                    <span style="Font-size:24px; font-weight:Bold; color:#323A46;">주문 완료</span> 
                </div>

                <div class="order-complete-box">
                    <div class="order-complete-title">
                   	     고객님의 주문이 완료 되었습니다.
                    </div>
                    </br>
                    <div class="order-complete-num">
                    	    주문번호 : <a href="${pageContext.request.contextPath}/${db }/order/orderlist"></a>
                    </div>
                    <div class="order-complete-date">
                     	   주문날짜 : <p style="display:inline-block; color:black"></p>
                    </div>

                    
                </div>
                <div class="order-complete-button">
                    <a href= "${ pageContext.request.contextPath }/${db }/member/mypage">
                    <button type="button" class="btn btn-dark waves-effect waves-light complete-mypage-btn">마이페이지로 가기</button></a>
                </div>
            </div>
        
        </div>
    </div>
    
     <c:import url="/WEB-INF/views/partials/footer.jsp"></c:import>
    <!-- Vendor js -->
   <script src="${pageContext.request.contextPath}/assets/js/vendor.min.js"></script>

   <!-- App js-->
   <script src="${pageContext.request.contextPath}/assets/js/app.min.js"></script>
</body>
</html>