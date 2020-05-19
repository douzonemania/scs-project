<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico">

        <!-- Plugins css -->
        <link href="../assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />

        <!-- App css -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" />

</head>
<body>
        <!-- Navigation Bar-->
        <header id="topnav" style="background-color:#ffffff">
            <c:import url ='/WEB-INF/views/partials/topbar.jsp'/>
        </header>

        <div class="wrapper" style="background-color: rgba(245, 246, 248);">
            <div class="container-fluid">
                <!-- START LOGIN FORM-->
                <div class="login-group">
                    <div class="login-contents">login</div>
                    <div style="margin-top:100px;"></div>
                    <div class="login-input">
                        <input class ="input--text" type="text" placeholder="아이디">
                        <div class="login-border"></div>
                        <input class ="input--text" type="password" placeholder="패스워드">
                        <div class="login-border"></div>
                    </div>
                    
                    <div style="margin-top: 50px;"></div>

                    <button type="button" class="btn btn-dark waves-effect waves-light custom-login">로그인</button>
                    

                    <div style="margin-top: 30px;"></div>

                    <div class="text-center">
                        <ul class="social-list list-inline mt-3 mb-0">
                            <li class="list-inline-item">
                                <a href="javascript: void(0);" class="social-list-item border-warning text-warning"><i class="fe-message-circle"></i></a>
                            </li>
                            
                            <li class="list-inline-item">
                                <a href="javascript: void(0);" class="social-list-item border-primary text-primary"><i class="mdi mdi-facebook"></i></a>
                            </li>
                            <li class="list-inline-item">
                                <a href="javascript: void(0);" class="social-list-item border-danger text-danger"><i class="mdi mdi-google"></i></a>
                            </li>        
                        </ul>
                    </div>

                    <div style="margin-top: 30px;"></div>

                    <div class="login-search">
                        <span>아이디 찾기</span>
                        <span>ㅣ</span>
                        <span>비밀번호 찾기</span>
                    </div>
                    <div style="margin-top: 30px;"></div>
                    <div>
                    	<a href = "${pageContext.request.contextPath }/member/join">
                        	<button type="button" class="btn btn-dark waves-effect waves-light custom-login">회원가입</button>
                        </a>
                    </div>
                </div><!-- END LOGIN FORM-->

            </div>
        </div>

            <!-- footer -->
    	<c:import url ='/WEB-INF/views/partials/footer.jsp'/>

</body>
</html>