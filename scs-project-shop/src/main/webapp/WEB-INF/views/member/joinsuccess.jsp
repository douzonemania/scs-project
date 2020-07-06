<!DOCTYPE html>
<html lang="utf-8">
    <head>
        <meta charset="utf-8" />
            <title>Pretty Girls~!</title>
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
            <link href="${ pageContext.request.contextPath }/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
    
            <!-- App css -->
            <link href="${ pageContext.request.contextPath }/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
            <link href="${ pageContext.request.contextPath }/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
            <link href="${ pageContext.request.contextPath }/assets/css/app.min.css" rel="stylesheet" type="text/css" />
			<script src="https://code.jquery.com/jquery-3.5.1.js"integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
			<script>
			$(document).ready(function(){
				$('#goto-main').click(function(){
					$(location).attr('href','../');
				});
				
			});
			</script>

    </head>
<body>
    <!-- Navigation Bar-->
    <c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import>


    <div class="wrapper">
        <div class="container-fluid">
            <div class="order-complete-form">
               
                <div class="recipient-info">
                    <span style="Font-size:24px; font-weight:Bold; color:#323A46;">가입 완료</span> 
                </div>

                <div class="order-complete-box">
                    <div class="order-complete-title">
                        고객님의 가입이 완료 되었습니다.
                    </div>
                    
                </div>
                <div class="order-complete-button">
                    <button type="button" class="btn btn-dark waves-effect waves-light complete-mypage-btn" id="goto-main">메인페이지로 가기</button>
                </div>
            </div>
        
        </div>
    </div>
    
     <c:import url="/WEB-INF/views/partials/footer.jsp"></c:import>
    <!-- Vendor js -->
   <script src="${ pageContext.request.contextPath }/assets/js/vendor.min.js"></script>

   <!-- App js-->
   <script src="${ pageContext.request.contextPath }/assets/js/app.min.js"></script>
</body>
</html>