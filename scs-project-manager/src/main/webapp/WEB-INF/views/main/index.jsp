<!DOCTYPE html>
<html lang="UTF-8">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

        <title>SCS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/images/favicon.ico">

        <!-- App css -->
        <link href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/css/app.min.css" rel="stylesheet" type="text/css" />

    </head>
	
    <body style="background-image:url('<%=request.getContextPath() %>/assets/images/back.jpg');">

	<div class="text-center" style="height: 150px; background-color: #ffffff;">
                                    <a href="${pageContext.request.contextPath }/main">
                                        <span><img src="${pageContext.request.contextPath }/assets/images/logo-scs.png" alt="" height="130" style="margin-top: 10px;"></span>
                                    </a>
	</div>

	<!-- footer -->
	<c:import url='/WEB-INF/views/partials/footer.jsp' />
        <!-- Vendor js -->
        <script src="<%=request.getContextPath() %>/assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="<%=request.getContextPath() %>/assets/js/app.min.js"></script>
   

                                    <div class="col-lg-6 card-body" style="margin: 0 auto; margin-top: 10%; width: 28%; background-color: rgba(211, 211, 211,0.6);">
                                            <!-- title-->
                                            <h4 class="mt-0" style="font-weight: bold; font-size: 25px;">로그인</h4>
                                            <form id="login-form" name="loginform" method="post" action="${ pageContext.request.contextPath }/user/login">
                                                <div class="form-group mb-3">
                                                    <label for="member-id" style="font-size: 17px; color: #343434">아이디</label>
                                                    <input class="form-control" type="text" id="member-id" name="id" required style="width: 100%;">
                                                </div>
            
                                                <div class="form-group mb-3">
                                                    <label for="password" style="font-size: 17px; color: #343434;">비밀번호</label>
                                                    <input class="form-control" type="password" id="password" name="password" required style="width: 100%;">
                                                </div>
                                                <div class="col-12 text-center">
                                                    <p> 
                                                        <a href="user/recover" class="ml-1" style="font-size: 17px; color: #242424;">아이디/비밀번호 찾기</a>&nbsp; 
                                                        <a href="user/join" class="ml-1" style="font-size: 17px; color: #242424;">회원가입</a>
                                                    </p>
                                                </div>
                                                <div class="form-group mb-3" style=" display: inline-block;">
                                                    <button class="btn btn-secondary btn-sm float-sm-right" type="submit" style="position:absolute; z-index: 10;  margin: 0 auto;"> 로그인 </button>
                                               	</div>
                                            </form>
										</div>                                        
    </body>
    <c:import url ='/WEB-INF/views/partials/script.jsp'/>
</html>