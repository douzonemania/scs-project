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


    <div class="wrapper">
        <div class="container-fluid">
            <div class="join-group">
                <div class="join-contents">join</div>

                <div class="col-lg-12">
                    <div class="p-sm-3">
                        <form action="#">
                            <div class="form-group mb-3">
                                <label for="fullname">아이디</label><span style="color: #ff0000;">*</span>
                                <input class="form-control" type="text" id="fullname" placeholder="아이디 입력(5~11자)" required>
                            </div>
                            <div class="form-group mb-3">
                                <label for="emailaddress2">이름</label><span style="color: #ff0000;">*</span>
                                <input class="form-control" type="email" id="emailaddress2" required placeholder="이름 입력">
                            </div>
                            <div class="form-group mb-3">
                                <label for="password2">비밀번호</label><span style="color: #ff0000;">*</span>
                                <input class="form-control" type="password" required id="password2" placeholder="비밀번호 (숫자,영문,특수문자 조합 8자 이상)">
                            </div>
                            <div class="form-group mb-3">
                                <label for="fullname">전화번호</label><span style="color: #ff0000;">*</span>
                                <input class="form-control" type="text" id="fullname" placeholder="-를 제외하고 번호만 입력" required>
                            </div>
                            
                            <div style="margin-top: 40px;"></div>

                            <div class="checkbox checkbox-dark mb-2">
                                <input id="checkbox4c" type="checkbox">
                                <label for="checkbox4c" style="font-weight: bold;">
                                    약관 전체동의
                                </label>
                            </div>

                            <div class="checkbox checkbox-dark mb-2">
                                <input id="checkbox5c" type="checkbox">
                                <label for="checkbox5c" >
                                   이용약관(필수)
                                </label>
                                
                                <a href="#" style="margin-left: 150px; font-size: 13px;">약관보기</a>
                            </div>

                            <div class="checkbox checkbox-dark mb-2">
                                <input id="checkbox6c" type="checkbox">
                                <label for="checkbox6c" >
                                   개인정보 수집 이용동의(필수)
                                </label>

                                <a href="#" style="margin-left: 59px; font-size: 13px;">약관보기</a>
                            </div>

                            <button type="button" class="btn btn-light waves-effect complete-join">회원가입</button>

                        </form>
                    </div>
                    
                </div> <!-- end col -->
            </div>
        </div>
    </div>
    
    <!-- footer -->
    	<c:import url ='/WEB-INF/views/partials/footer.jsp'/>

 


</body>
</html>