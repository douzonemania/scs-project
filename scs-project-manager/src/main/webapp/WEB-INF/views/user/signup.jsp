<!doctype html>
<html lang="UTF-8">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>SCS</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

​
<!-- Sweet Alert-->
<link href="../assets/libs/sweetalert2/sweetalert2.min.css"
	rel="stylesheet" type="text/css" />

<!-- App css -->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="../assets/css/icons.min.css" rel="stylesheet"
	type="text/css" />
<link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" />

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script type="text/JavaScript"
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
​
<script type="text/javascript">

$(document).ready(function() {
	$('#search_address').click(function openPostCode() {
        new daum.Postcode({
            oncomplete:function(data) {
                jQuery("#postcode1").val(data.zonecode);
                jQuery("#postcode2").val(data.roadAddress);
                jQuery("#postcode3").val(data.jibunAddress);
        }}).open()
	});
	
	//Success Message
    $('#sa-success').click(function(e) {
    	e.preventdefault();
        Swal.fire(
            {
                title: '가입되었습니다!',
                text: '축하드립니다.',
                type: 'success',
                confirmButtonClass: 'btn btn-confirm mt-2'
            }
        )
    });
	
});


// 유효성 검사
$(function() {
		$("#join-form").submit(function() {
// 			e.preventDefault();
			
			if($("#user_name").val() == '') {
				alert('이름이 비어 있습니다.');
				$("#user_name").focus();
				return ;
			}
			
 			if($("#user_id").val() == '') {
				alert('아이디가 비어 있습니다.');
				$("#user_id").focus();
				
				return ;
			}
			
			if($("#user_password").val() == '') {
				alert('비밀번호가 비어 있습니다.');
				$("#user_password").focus();
				
				return ;
			}
			
			if($("#user_email").val() == '') {
				alert('이메일이 비어 있습니다.');
				$("#user_email").focus();
				
				return ;
			}
			
			if($("#img-checkid").is(":hidden")) {
				alert('아이디 중복 체크를 하지 않았습니다.');
				
				return ;
			}
			
			if($("#user_phone").val() == '') {
				alert('휴대폰번호가 비어 있습니다.');
				$("#user_phone").focus();
				
				return ;
			}
			
			if($("#user_company").val() == '') {
				alert('회사명이 비어 있습니다.');
				$("#user_company").focus();
				
				return ;
			}
			
			if($("#agree-prov").is(":checked") == false) {
				alert('약관 동의가 필요합니다.');
				$("#agree-prov").focus();
				
				return ;
			} 
			
			this.submit();
		});
		
		$('#id').change(function() {
			$("#btn-checkid").show();
			$("#img-checkid").hide();
		})
		
		$("#btn-checkid").click(function() {
			var id = $("#id").val();
			if(id == '') {
				return;
			}
				
			$.ajax({
				url: "${pageContext.request.contextPath }/api/user/checkid?id=" + id,
				type: 'get',
				// contextType : 'application/json'
				data:'',
				dataType: 'json',
				success: function(response) {
					if(response.result == 'fail') {
						console.error(response.message);
						return;
					}
					if(response.data == true) {
						alert('존재하는 이메일입니다.');
						$("#email")
							.val('')
							.focus();
						return;
					}
					
					$('#btn-checkid').hide();
					$('#img-checkid').show();
				},
				error: function(XHR, status, e) {
					console.error(status, ":" + e);
				}
			});
		});
});

</script>
</head>
​
<body class="" style="background-color: #ffffff; padding: 0; margin: 0">
	​
	<c:import url='/WEB-INF/views/partials/footer.jsp' />

	<div class="account-pages mt-5 mb-5">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-10">
					<div class="">
						​
						<div class="card-body p-4">
							<div class="text-center mb-4">
								<a href="index.html"> <span><img
										src="../assets/images/logo-scs.png" alt="" height="130"></span>
								</a>
							</div>
							<div class="signin-body">
								<form:form 
								    modelAttribute="ceoVo" 
								    class="join-form"
									id="join-form" 
									method="post"
									action="${ pageContext.request.contextPath }/user/join">
									<div class="row">
										<div class="col-lg-6">
											<div class="p-sm-3 signup-left">
												<h4 class="mt-3 mt-lg-0 signup-title">회원가입</h4>

												<div class="form-group mb-3">
													<label for="fullname">이름</label><a id="red-star">*</a>
													<form:input path="name" class="form-control" type="text"
														id="user_name" />
													<form:errors path="name" />
													<div class="check_font" id="id_check"></div>
												</div>
												<div class="form-group mb-3">
													<label for="id2">아이디</label><a id="red-star">*</a>
													<form:input path="id" class="form-control" type="text"
														id="user_id" placeholder="아이디(6~10자)" />
													<input type="button" class="btn btn-secondary btn-sm float-right" value="중복확인" style="margin-top: 5px;">
													<img id='img-checkid' style='width: 30px; display: none;' src = '${ pageContext.request.contextPath }/assets/images/check.png' />
													<p style="font-weight:bold; color:#f00; text-align:left; padding-left:0">
														<form:errors path="id" />
													</p>
												</div>
												<div class="form-group mb-3">
													<label for="password2">비밀번호</label><a id="red-star">*</a>
													<form:input path="password" class="form-control"
														type="password" id="user_password"
														placeholder="비밀번호(4~12자)" />
													<p style="font-weight:bold; color:#f00; text-align:left; padding-left:0">
														<form:errors path="password" />
													</p>
												</div>
												<div class="form-group mb-3">
													<label for="emailaddress2">이메일</label><a id="red-star">*</a>
													<form:input path="email" class="form-control" type="email"
														id="user_email" />
													<p style="font-weight:bold; color:#f00; text-align:left; padding-left:0">
														<form:errors path="email" />
													</p>
												</div>
												<div class="form-group mb-3">
													<label for="phonenum">휴대폰번호</label><a id="red-star">*</a>
													<form:input path="phoneNumber" class="form-control"
														type="text" id="user_phone" placeholder="-는 제외하고 입력하세요" />
													<p style="font-weight:bold; color:#f00; text-align:left; padding-left:0">
														<form:errors path="phoneNumber" />
													</p>
												</div>
												<div class="form-group mb-3">
													<label for="company">회사명</label><a id="red-star">*</a>
													<form:input path="companyName" class="form-control"
														type="text" id="user_company" />
													<p style="font-weight:bold; color:#f00; text-align:left; padding-left:0">
														<form:errors path="companyName" />
													</p>
												</div>
											</div>
										</div>
										<!-- end col -->
										​
										<div class="col-lg-6" style="margin-top: 15px">
											<div class="p-sm-3 signup-right">
												<div class="form-group mb-3">
													<label for="company-number">대표전화</label>
													<form:input path="cpNumber" class="form-control"
														type="text" id="company-number" />
												</div>
												<div class="form-group mb-3">
													<label for="company-fax">팩스번호</label>
													<form:input path="faxNumber" class="form-control"
														type="text" id="company-fax" />
												</div>

												<div class="form-group mb-3">
													<label for="site-name">사이트명</label>
													<form:input path="siteName" class="form-control"
														type="text" id="site-name" />
												</div>
												<div class="form-group mb-3">
													<label for="company-no1">사업자등록번호</label>
													<form:input path="coNumber" class="form-control"
														type="text" id="company-no1" />
												</div>
												<div class="form-group mb-3">
													<label for="company-no2">통신판매신고번호</label>
													<form:input path="cmNumber" class="form-control"
														type="text" id="company-no2" />
												</div>
												<div>
													<label for="company-address" style="display: block;">사업장주소</label>

													<input class="form-control" type="text" id="postcode1" />
													<button type="button" id="search_address"
														class="btn btn-dark waves-effect waves-light ceo-join-btn-custom">우편
														번호 찾기</button>
													<div style="margin-top: 5px;"></div>
													<form:input path="address1" class="form-control" type="text" id="postcode2" />
													<div style="margin-top: 5px;"></div>
													<form:input path="address2" class="form-control" type="text"
														id="company-address" />
												</div>
												<div style="margin-top: 10px;"></div>
												<div class="form-group mb-0">
													<div class="custom-control custom-checkbox pt-1"
														style="z-index: 0;">
														<button type="submit"
															class="btn btn-secondary btn-sm float-right btn-signup"
															style="position: absolute; right: 0; bottom: 0; z-index: 10;">가입하기</button>
														<input type="checkbox" class="custom-control-input"
															id="checkbox-signup"> <label
															class="custom-control-label" for="checkbox-signup">약관에
															동의합니다. <a href="javascript: void(0);" class="text-dark">
														</a>
														</label>
														<button type="button"
															class="btn btn-link btn-xs text-black-50 ml-1"
															id="sa-long-content">약관보기</button>
													</div>
												</div>

											</div>
											<!-- end p-sm-3 -->

										</div>
										<!-- end col -->

									</div>
								</form:form>
								<!-- end row-->
							</div>

						</div>
						<!-- end card-body -->
					</div>
					<!-- end card -->
					​
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</div>
	<div style="margin-bottom: 200px"></div>
	<!-- end page -->
	​
	<c:import url='/WEB-INF/views/partials/script.jsp' />
	​
</body>
</html>