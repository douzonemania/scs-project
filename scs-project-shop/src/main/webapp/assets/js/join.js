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
							
							console.log(response.data);
//							
//							if(response.data == true) {
//								// 중복된 아이디일 경우
//								$("#id_check").text("이미 사용중인 아이디입니다.").show();
//								$("#user_id")
//									.val('')
//									.focus();
//								return;
//							}
//							else if(id.length < 4 || id.length > 10) {
//								$("#id_check").text("아이디는 4~10자 입니다").show();
//								$("#user_id")
//									.val('')
//									.focus();
//								return;
//							}
//							$('#btn-checkid').hide();
//							$('#img-checkid').show();
//							$("#id_check").hide();
//							
						} ,
						error: function(XHR, status, e) {
							console.error(status, ":" + e);
						}
					});
					
				}
			});
	
		
			$("#member_name").focusout(function() {
				var name = $("#member_name").val();
				
				if(name == '') {
					$("#name_check").text("이름을 입력하세요.").show();
					$("#member_name").focus();
					return;
				}
				
		 		for (var i = 0; i< name.length; i++)  { 
					var check = name.substring(i, i+1);
					if(check.match(/[0-9]|[a-z]|[A-Z]/)) {
						$("#name_check").text("형식에 맞게 입력하세요.").show();
						$("#member_name").val('').focus();
						return;
					}
				} 
				
				$("#name_check").hide();
			});
			
			// 비밀번호 체크
			$("#member_password").focusout(function() {
				var password = $("#user_password").val();
				if(password == '') {
					$("#password_check").text("비밀번호를 입력하세요.").show();
					$("#member_password").focus();
					return;
				}
				else if(password.length < 4 || password.length > 12) {
					$("#password_check").text("비밀번호는 4~12자 입니다.").show();
					$("#member_password").focus();
					return;
				}
				$("#password_check").hide();
			});
			
			// 이메일 체크
			$("#member_email").focusout(function() {
				var email = $("#user_email").val();
				var check = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				if(email == '') {
					$("#email_check").text("이메일을 입력하세요.").show();
					$("#member_email").focus();
					return;
				}
				else if(check.test(email) == false) {
					$("#email_check").text("이메일 형식이 올바르지 않습니다.").show();
					$("#member_email").focus();
					return;
				}
				$("#email_check").hide();
			});
			
			// 핸드폰번호 체크
			$("#member_phoneNumber").focusout(function() {
				var phone = $("#user_phone").val();
				var check =/(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
				if(phone == '') {
					$("#phone_check").text("핸드폰번호를 입력하세요.").show();
					$("#member_phoneNumber").focus();
					return;
				}
				if(check.test(phone) == false) {
					$("#phone_check").text("핸드폰번호 형식이 올바르지 않습니다.").show();
					$("#member_phoneNumber").focus();
					return;
				}
				$("#phone_check").hide();
			});
		});	