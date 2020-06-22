<!DOCTYPE html>
<html lang="UTF-8">
<head>
   <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        <title>SCS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- App css -->
        <link href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/css/app.min.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/ejs/ejs.js"></script>
     
     	<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
		<script type="text/JavaScript"
		src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
$(function(){
	
	// id찾기 input값이 다 들어와야 버튼이 눌리도록
/* 	$.fn.checkIdInfo = function() {
		var check = false;
		var name = $('#inputName').val();
		var phoneNum = $('#inputPhoneNum').val();
		
		if(name != "" && phoneNum != "") {
			check = true;
		}
		return check;
	}
	$("#inputName").focusout(function() {
		if($.fn.checkIdInfo()) {
			$('#find-id-btn').attr('disabled', false);
		}
	});
	$("#inputPhoneNum").focusout(function() {
		if($.fn.checkIdInfo()) {
			$('#find-id-btn').attr('disabled', false);
		}
	});
	
	
	// password찾기 input값이 다 들어와야 버튼이 눌리도록
	$.fn.checkPasswordInfo = function() {
		var check = false;
		var id = $('#inputId').val();
		var email = $('#inputEmail').val();
		
		if(id != "" && email != "") {
			check = true;
		}
		return check;
	}
	$("#inputId").change(function() {
		if($.fn.checkPasswordInfo()) {
			$('#find-password-btn').attr('disabled', false);
		}
	});
	$("#inputEmail").change(function() {
		if($.fn.checkPasswordInfo()) {
			$('#find-password-btn').attr('disabled', false);
		}
	}); */
	
	
	$("#find-id-btn").click(function(e) {
	
		var name = $('#inputName').val();
		var phoneNum = $('#inputPhoneNum').val();

 	 	$.ajax({
			url: '${pageContext.request.contextPath }/user/find/id',
			async: true,
			type: 'post',
			data: { "name": name, "phoneNum": phoneNum },
			success: function(response){
				if(response.data == null) {
					alert("일치하는 회원 정보가 없습니다.");
					return;
				}
				alert(response.data);
				/* location.href= "${pageContext.request.contextPath }/user/find/id"; */
			},
			error: function(xhr, status, e){

				console.error(status + " : " + e);

			}
		}); 
	});
	
$("#find-password-btn").click(function() {
		
		var id = $('#inputId').val();
		var email = $('#inputEmail').val();

 	 	$.ajax({
			url: '${pageContext.request.contextPath }/user/find/password',
			async: true,
			type: 'post',
			data: { 'id' : id,
					'email' : email },
			success: function(response){
				if(response.data == null) {
					alert("일치하는 회원 정보가 없습니다.");
					return;
				}
				alert("회원님의 이메일로 임시 비밀번호를 전송했습니다.\n 변경된 임시 비밀번호로 로그인해주세요.")
			},
			error: function(xhr, status, e){

				console.error(status + " : " + e);

			}
		}); 
	});
});


</script>

 </head>
	<body>
	<c:import url ='/WEB-INF/views/partials/footer.jsp'/>
        <div class="wrapper recover-wrapper">
            <div class="container-fluid">
                <div class="join-group">
                    <div class="text-center w-75 m-auto" style="padding-bottom: 30px;">
                        <a href="<%=request.getContextPath() %>/main">
                            <span><img src="<%=request.getContextPath() %>/assets/images/logo-scs.png" alt="" height="130"></span>
                        </a>
                    </div>
                    <div class="col-xl-12">
                            <div class="card-box">
                                <h4 class="header-title mb-4"></h4>
                                <ul class="nav nav-tabs nav-bordered nav-justified nav-scs-border">
                                    <li class="nav-item">
                                        <a href="#find-id" id="a-find-id"data-toggle="tab" aria-expanded="true" class="nav-link active">
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
                                    <div class="tab-pane active" id="find-id">
                                       
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="inputName" aria-describedby="emailHelp" placeholder="이름 입력">
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="inputPhoneNum" aria-describedby="emailHelp" placeholder="휴대폰번호  입력">
                                            </div>
                                            <button type="button" id="find-id-btn" class="btn btn-light waves-effect complete-join">아이디 찾기</button>
                                        
                                    </div>
                                    <div class="tab-pane " id="find-pwd">
                                      
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="inputId" aria-describedby="emailHelp" placeholder="아이디 입력">
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="inputEmail" placeholder="이메일 입력">
                                            </div>
                                            <button type="button" id="find-password-btn" class="btn btn-light waves-effect complete-join">비밀번호 찾기</button>
                                        
                                    </div>
                                    <br/>
                                    <div>
                                    	<a href="${pageContext.servletContext.contextPath }/main">
                                    	<button type="button" class="btn btn-light waves-effect complete-join">로그인하러가기</button></a>
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