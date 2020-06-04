<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
        <title>SCS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="<%=request.getContextPath() %>/assets/images/favicon.ico">

        <!-- App css -->
        <link href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/css/app.min.css" rel="stylesheet" type="text/css" />

    </head>
	
    <body class="authentication-bg authentication-bg-pattern" style="background-color: #ffffff;">

        <div class="account-pages mt-5 mb-5" >
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-10">
                        <div class="card bg-pattern">

                            <div class="card-body p-4">
                                
                                <div class="text-center mb-4">
                                    <a href="${ pageContext.request.contextPath }/main">
                                        <span><img src="${pageContext.request.contextPath}/assets/images/logo-scs.png" alt="" height="130"></span>
                                    </a>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="p-sm-3">
                                            <h4 class="mt-3 mt-lg-0">회사소개</h4>
                                            <p>저희 scs는 맞춤형 의류 쇼핑몰을 구축하는 회사입니다.</p>
                                        </div>
                                    </div> <!-- end col -->

                                    <div class="col-lg-6">
                                        <div class="p-sm-3">
                                            <!-- title-->
                                            <h4 class="mt-0">로그인</h4>
                                            <form id="login-form" name="loginform" method="post" action="${ pageContext.request.contextPath }/user/auth">
                                                <div class="form-group mb-3">
                                                    <label for="member-id">아이디</label>
                                                    <input class="form-control" type="text" id="member-id" name="id" required>
                                                </div>
            
                                                <div class="form-group mb-3">
                                                    <label for="password">비밀번호</label>
                                                    <input class="form-control" type="password" id="password" name="password" required>
                                                </div>
                                                <div class="col-12 text-center">
                                                    <p> 
                                                        <a href="user/recover" class="text-black-50 ml-1">아이디/비밀번호 찾기</a>&nbsp; 
                                                        <a href="user/join" class="text-black-50 ml-1">회원가입</a>
                                                    </p>
                                                </div>
                                                <div class="form-group mb-3" style=" display: inline-block; margin-left: 155px">
                                                    <button class="btn btn-secondary btn-sm float-sm-right" type="submit" style="position:absolute; z-index: 10;"> 로그인 </button>
                                                    <!-- <div class="custom-control custom-checkbox pt-1">
                                                        <input type="checkbox" class="custom-control-input" id="checkbox-signin" checked value="#ffffff">
                                                    </div> -->
                                               	</div>
                                            </form>
                                        </div>
                                        
                                    </div> <!-- end col -->
                                </div>
                                <!-- end row-->

                            </div> <!-- end card-body -->
                        </div>
                        <!-- end card -->

                    </div> <!-- end col -->
                </div> <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end page -->

        <footer class="footer footer-alt">
            2015 - 2019 &copy; UBold theme by <a href="" class="text-white-50">Coderthemes</a> 
        </footer>

        <!-- Vendor js -->
        <script src="<%=request.getContextPath() %>/assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="<%=request.getContextPath() %>/assets/js/app.min.js"></script>
        
        <!-- Footer Start -->
        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        since2020 &copy; Smart Custom Store by DouzoneMania
                    </div>           
                </div>
            </div>
        </footer>
        <!-- end Footer -->

		<c:import url ='/WEB-INF/views/partials/script.jsp'/>

    </body>
</html>