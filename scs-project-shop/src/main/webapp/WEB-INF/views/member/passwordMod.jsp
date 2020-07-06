<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="utf-8">
    <head>
        <meta charset="utf-8" />
            <title>Pretty Girls~!</title>
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
			<link href="${ pageContext.request.contextPath }/assets/css/common.css" rel="stylesheet" type="text/css" />
			<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script>
$(function(){
	$.fn.checkCurPassword = function() {
		var check = false;
		var inputPassword = $('#curPassword').val();
		var curPassword = ${vo.password};
		if(inputPassword == curPassword){
			check = true;
		}
		return check;
	}
	
	$.fn.checkNewPassword = function() {
		var check = false;
		var inputNewPassword = $('#newPassword').val();
		var inputNewPasswordCheck = $('#newPasswordCheck').val();
		var curPassword = ${vo.password};
		if(inputNewPassword == inputNewPasswordCheck && inputNewPassword!="" && inputNewPasswordCheck!=""){
			check = true;
		}else if(inputNewPassword==curPassword || inputNewPasswordCheck==curPassword){
			check = "same";	
		}
		return check;
	}
	
	$('#modify-btn').click(function(e){
		var inputNewPassword = $('#newPassword').val();
		var id = "${vo.id}";
		
		if(inputNewPassword==''){
			alert("비밀번호를 입력하세요.");
			return;
		}
		if(inputNewPassword.length < 4 || inputNewPassword.length > 12){
			alert("비밀번호는 4~12자 입니다.");
			return;
		}
		
		if(!$.fn.checkCurPassword()){
			alert("현재 비밀번호를 다시 입력하세요");
		}else if(!$.fn.checkNewPassword()){
			alert("신규 비밀번호를 다시 입력하세요")
		}else if($.fn.checkNewPassword()=="same" ){
			alert("현재 비밀번호와 다른 비밀번호를 입력하세요")	
		}else if(inputNewPassword=="${vo.password}"){
			alert("현재 비밀번호와 다른 비밀번호를 입력하세요");
		}else{
			
			$.ajax({
				url: '${pageContext.request.contextPath }/api/member/mod/password',
				async: true,
				type: 'post',
				data: { 'id' : id,
					'newPassword' : inputNewPassword },
				success: function(response){
					alert("비밀번호가 변경되었습니다.");
					self.close();
				},
				error: function(xhr, status, e){
					console.error(status + " : " + e);
				}
			}); 
		}
	});
	$('#cancle').click(function(e){
		self.close();
	});
});
	

</script> 
</head>
<body>

	<table class="password-mod">
		<colgrup>
			<col style="width:200px">
			<col style="width:300px">
		</colgrup>
		<tbody>
			<tr>
				<th colspan='2' style="font-size:30px; height:130px; padding-left:50px">비밀번호 변경하기</th>
			</tr>
			<tr>
				<th>현재 비밀번호</th>
				<td><input type="password" id="curPassword"></td>
			</tr>
			<tr>
				<th>신규 비밀번호</th>
				<td><input type="password" id="newPassword"></td>
			</tr>
			<tr>
				<th>신규 비밀번호 재입력</th>
				<td><input type="password" id="newPasswordCheck"></td>
			</tr>
			<tr style="height:130px">
				<td><input type="button" class="btn btn-dark waves-effect cart-delete-button" id="modify-btn" value="변경하기" style="width:160px"/></td>
				<td><input type="button" class="btn btn-dark waves-effect cart-delete-button" id="cancle" value="취소" style="width:160px"/></td>
			</tr>
			
		</tbody>
	</table>
	 
   <!-- Vendor js -->
   <script src="${ pageContext.request.contextPath }/assets/js/vendor.min.js"></script>

   <!-- App js-->
   <script src="${ pageContext.request.contextPath }/assets/js/app.min.js"></script>

</body>
</html>