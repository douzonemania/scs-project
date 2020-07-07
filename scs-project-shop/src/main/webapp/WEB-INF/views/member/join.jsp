<!DOCTYPE html>
<html lang="utf-8">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <meta charset="utf-8" />
        <title>Pretty Girls~!</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link rel="shortcut icon" href="/scs-manager${favicon }">

        <!-- Plugins css -->
        <link href="<%=request.getContextPath() %>/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />

        <!-- App css -->
        <link href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/css/app.min.css" rel="stylesheet" type="text/css" />

		<script src="https://code.jquery.com/jquery-3.5.1.js"
				integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
				crossorigin="anonymous"></script>
		
		<script>
		
		function firstAgreement(){
			window.open('${ pageContext.request.contextPath }/${db }/member/agree/first','이용약관','width=500,height:250,location=no,status=no');
		}
		
		function thirdAgreement(){
			window.open('${ pageContext.request.contextPath }/${db }/member/agree/third','이용약관','width=500,height:250,location=no,status=no');
		}
		
		$(document).ready(function(){
			$('.check-all').click(function(){
				$('.ab').prop('checked',this.checked);
				
				if($.fn.checkInfo()){
					$('#join-btn').attr('disabled', false);
				}else{
					$('#join-btn').attr('disabled', true);
				}
			});
			
			$('.ab').click(function(){
				if($('input:checkbox[name=all]').is(':checked')){
					 $("input:checkbox[name=all]").prop("checked", false);
				}
				
				if($('input:checkbox[name=cb1]').is(':checked')&&
				   $('input:checkbox[name=cb2]').is(':checked')){
					 $("input:checkbox[name=all]").prop("checked", true);
				}
				
				if($.fn.checkInfo()){
					$('#join-btn').attr('disabled', false);
				}else{
					$('#join-btn').attr('disabled', true);
				}
			});
			
			
			
			$.fn.checkInfo = function(){
				var check = false;
				var id = $("#member_id").val();
				var name = $("#member_name").val();
				var password = $("#member_password").val();
				var phone = $("#member_phoneNumber").val();
				var email = $("#member_email").val();
				if(id != ''&& name != ''&& password !=''&& email !=''&& phone &&
					 $("input:checkbox[name=all]").is(":checked")){
					check=true;
				}
				
				return check;
			}
		});
		
		$(function() {
			
			
			$("#member_id").focusout(function() {
				var id = $("#member_id").val();
				
				if(id == ''){
					$("#id_check").text("아이디를 입력하세요.").show();
					return;
				}else{
					$.ajax({
						url: "${pageContext.request.contextPath}/api/member/checkid?id=" + id,
						type: 'get',
						data:'',
						dataType: 'json',
						success: function(response) {
							if(response.data == true) {
								// 중복된 아이디일 경우
								$("#id_check").text("이미 사용중인 아이디입니다.").show();
								$("#member_id")
									.val('')
									.focus();
								return;
							}
							else if(id.length < 4 || id.length > 10) {
								$("#id_check").text("아이디는 4~10자 입니다").show();
								$("#member_id")
									.val('')
									.focus();
								return;
							} 
							
						} ,
						error: function(XHR, status, e) {
							console.error(status, ":" + e);
						}
					});
					
					if($.fn.checkInfo()){
						$('#join-btn').attr('disabled', false);
					}
				}
			});
	
		
			$("#member_name").focusout(function() {
				var name = $("#name").val();
				
				if(name == '') {
					$("#name_check").text("이름을 입력하세요.").show();
					
					return;
				}
				
		 		for (var i = 0; i< name.length; i++)  { 
					var check = name.substring(i, i+1);
					if(check.match(/[0-9]|[a-z]|[A-Z]/)) {
						$("#name_check").text("형식에 맞게 입력하세요.").show();
						return;
					}
				} 
				
				$("#name_check").hide();
				if($.fn.checkInfo()){
					$('#join-btn').attr('disabled', false);
				}else{
					$('#join-btn').attr('disabled', true);
				}
			});
			
			// 비밀번호 체크
			$("#member_password").focusout(function() {
				var password = $("#member_password").val();
				if(password == '') {
					$("#password_check").text("비밀번호를 입력하세요.").show();
					
					return;
				}
				else if(password.length < 4 || password.length > 12) {
					$("#password_check").text("비밀번호는 4~12자 입니다.").show();
					
					return;
				}
				$("#password_check").hide();
				if($.fn.checkInfo()){
					$('#join-btn').attr('disabled', false);
				}else{
					$('#join-btn').attr('disabled', true);
				}
			});
			
			// 이메일 체크
			$("#member_email").focusout(function() {
				var email = $("#member_email").val();
				var check = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				if(email == '') {
					$("#email_check").text("이메일을 입력하세요.").show();
					
					return;
				}
				else if(check.test(email) == false) {
					$("#email_check").text("이메일 형식이 올바르지 않습니다.").show();
					
					return;
				}
				$("#email_check").hide();
				if($.fn.checkInfo()){
					$('#join-btn').attr('disabled', false);
				}else{
					$('#join-btn').attr('disabled', true);
				}
			});
			
			// 핸드폰번호 체크
			$("#member_phoneNumber").focusout(function() {
				var phone = $("#member_phoneNumber").val();
				var check =/(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
				if(phone == '') {
					$("#phone_check").text("핸드폰번호를 입력하세요.").show();
					
					return;
				}
				if(check.test(phone) == false) {
					$("#phone_check").text("핸드폰번호 형식이 올바르지 않습니다.").show();
					
					return;
				}
				$("#phone_check").hide();
				if($.fn.checkInfo()){
					$('#join-btn').attr('disabled', false);
				}else{
					$('#join-btn').attr('disabled', true);
				}
			});
		});	
		</script>

</head>
<body>
   <c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import>


    <div class="wrapper">
        <div class="container-fluid">
            <div class="join-group">
                <div class="join-contents">join</div>

                <div class="col-lg-12">
                    <div class="p-sm-3">
                        <form:form 
								    modelAttribute="memberVo" 
								    class="join-form"
									id="join-form" 
									method="post"
									action="${ pageContext.request.contextPath }/${db }/member/join">
                            <div class="form-group mb-3">
                                <label for="fullname">아이디</label><span style="color: #ff0000;">*</span>
                               <form:input path="id" class="form-control" type="text"
														id="member_id" placeholder="아이디(4~10자)" />
                                <div class="check-font" id="id_check">
									<form:errors path="id" />
								</div>
                            </div>
                            <div class="form-group mb-3">
                                <label for="emailaddress2">이름</label><span style="color: #ff0000;">*</span>
                                <form:input path="name"  class="form-control" type="text" id="member_name" placeholder="이름 입력"/>
                            <div class="check-font" id="name_check">
									<form:errors path="name" />
							</div>
                            </div>
                            <div class="form-group mb-3">
                                <label for="password2">비밀번호</label><span style="color: #ff0000;">*</span>
                               <form:input path="password"  class="form-control" type="password" id="member_password" placeholder="비밀번호 (4자 이상 12자 이하)"/>
                            	<div class="check-font" id="password_check">
									<form:errors path="password" />
								</div>
                            </div>
                            <div class="form-group mb-3">
                                <label for="fullname">전화번호</label><span style="color: #ff0000;">*</span>
                               <form:input path="phoneNumber"  class="form-control" type="text" id="member_phoneNumber" placeholder="-를 제외하고 번호만 입력"/>
                            	<div class="check-font" id="phone_check">
									<form:errors path="phoneNumber" />
							</div>
                            </div>
                            
                            <div class="form-group mb-3">
                                <label for="fullname">이메일</label><span style="color: #ff0000;">*</span>
                               <form:input path="email"  class="form-control" type="text" id="member_email" placeholder="-를 제외하고 번호만 입력"/>
                            	<div class="check-font" id="email_check">
									<form:errors path="email" />
							</div>
                            </div>
                            
                            
                            <div style="margin-top: 40px;"></div>

                            <div class="checkbox checkbox-dark mb-2">
                                <input id="checkbox4c" type="checkbox" name="all" class="check-all">
                                <label for="checkbox4c" style="font-weight: bold;">
                       		             약관 전체동의
                                </label>
                            </div>

                            <div class="checkbox checkbox-dark mb-2">
                                <input id="checkbox5c" type="checkbox" name="cb1" class="ab">
                                <label for="checkbox5c" >
                          	         이용약관(필수)
                                </label>
                                
                                <a href="#" class="join-first-custom" onclick=firstAgreement()>약관보기</a>
                            </div>

                            <div class="checkbox checkbox-dark mb-2">
                                <input id="checkbox6c" type="checkbox" name="cb2" class="ab">
                                <label for="checkbox6c" >
                                	   개인정보 수집 이용동의(필수)
                                </label>

                                <a href="#" class="join-second-custom" onclick=thirdAgreement()>약관보기</a>
                            </div>

                            <button type="submit" class="btn btn-light waves-effect complete-join" id="join-btn" disabled="">회원가입</button>

                        </form:form>
                    </div>
                    
                </div> <!-- end col -->
            </div>
        </div>
    </div>
    <c:import url="/WEB-INF/views/partials/footer.jsp"></c:import>

	<!-- Vendor js -->
   <script src="<%=request.getContextPath() %>/assets/js/vendor.min.js"></script>

   <!-- App js-->
   <script src="<%=request.getContextPath() %>/assets/js/app.min.js"></script>
 	
</body>
</html>