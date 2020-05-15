<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <title>SCS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- App css -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" />

 </head>
	<body>
	<c:import url ='/WEB-INF/views/partials/footer.jsp'/>
        <div class="wrapper recover-wrapper">
            <div class="container-fluid">
                <div class="join-group">
                    <div class="text-center w-75 m-auto" style="padding-bottom: 30px;">
                        <a href="index.html">
                            <span><img src="../assets/images/logo-scs.png" alt="" height="130"></span>
                        </a>
                    </div>
                    <div class="col-xl-12">
                            <div class="card-box">
                                <h4 class="header-title mb-4"></h4>
                                <ul class="nav nav-tabs nav-bordered nav-justified nav-scs-border">
                                    <li class="nav-item">
                                        <a href="#find-id" id="a-find-id"data-toggle="tab" aria-expanded="true" class="nav-link ">
                                            아이디 찾기
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#find-pwd" id="a-find-pwd" data-toggle="tab" aria-expanded="false" class="nav-link  ">
                                            비밀번호 찾기
                                        </a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane" id="find-id">
                                        <form>
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="이메일 입력">
                                            </div>
                                            <button type="submit" class="btn btn-light waves-effect complete-join">아이디 찾기</button>
                                        </form>
                                    </div>
                                    <div class="tab-pane active" id="find-pwd">
                                        <form>
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="아이디 입력">
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="exampleInputPassword1" placeholder="이메일 입력">
                                            </div>
                                            <button type="submit" class="btn btn-light waves-effect complete-join">비밀번호 찾기</button>
                                        </form>
                                    </div>
                                </div>
                            </div> <!-- end card-box-->
                        </div> <!-- end col -->
                </div>
            </div>
        </div>

        <c:import url ='/WEB-INF/views/partials/script.jsp'/>
        


    </body>
</html>