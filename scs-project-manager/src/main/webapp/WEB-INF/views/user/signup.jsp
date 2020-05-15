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
        
​		<!-- Sweet Alert-->
        <link href="../assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />

        <!-- App css -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" />

        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
​
<script type="text/javascript">
​
    function openPostCode() {
​
        new daum.Postcode({
​
            oncomplete:function(data) {
​
                jQuery("#postcode1").val(data.zonecode);
​
                jQuery("#postcode2").val(data.roadAddress);
​
                jQuery("#postcode3").val(data.jibunAddress);
​
            
​
            }
​
        }).open();
​
    }
​
</script>
<script type="text/javascript">
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#user_id").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $('#user_id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/user/idCheck?userId='+ user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(idJ.test(user_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#reg_submit").attr("disabled", false);
				
						} else if(user_id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
</script>
    </head>
​
    <body class="" style="background-color: #ffffff; padding:0; margin:0">
​
	<c:import url ='/WEB-INF/views/partials/footer.jsp'/>
	
        <div class="account-pages mt-5 mb-5" >
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-10">
                        <div class="">
​
                            <div class="card-body p-4">
                                <div class="text-center mb-4">
                                    <a href="index.html">
                                        <span><img src="../assets/images/logo-scs.png" alt="" height="130"></span>
                                    </a>
                                </div>
                                <div class="signin-body">
                                <form action="#">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="p-sm-3 signup-left">
                                                <h4 class="mt-3 mt-lg-0 signup-title">회원가입</h4>
                                            
                                                    <div class="form-group mb-3">
                                                        <label for="fullname">이름</label><a id="red-star">*</a>
                                                        <input class="form-control" type="text" id="user_id" required>
                                                        <div class="check_font" id="id_check"></div>
                                                    </div>
                                                    <div class="form-group mb-3">
                                                        <label for="id2">아이디</label><a id="red-star">*</a>
                                                        <input class="form-control" type="text" id="id2" placeholder="아이디(6~12자)" required>
                                                    </div>
                                                    <div class="form-group mb-3">
                                                        <label for="password2">비밀번호</label><a id="red-star">*</a>
                                                        <input class="form-control" type="password" required id="password2" placeholder="비밀번호(4~18자 이상)">
                                                    </div>
                                                    <div class="form-group mb-3">
                                                        <label for="emailaddress2">이메일</label><a id="red-star">*</a>
                                                        <input class="form-control" type="email" id="emailaddress2" required>
                                                    </div>
                                                    <div class="form-group mb-3">
                                                        <label for="phonenum">휴대폰번호</label><a id="red-star">*</a>
                                                        <input class="form-control" type="text" id="phonenum" required placeholder="-는 제외하고 입력하세요">
                                                    </div>
                                                    <div class="form-group mb-3">
                                                        <label for="company">회사명</label><a id="red-star">*</a>
                                                        <input class="form-control" type="text" id="company" required>
                                                    </div>
                                           		</div>
                                        	</div> <!-- end col -->
​
                                        <div class="col-lg-6" style="margin-top: 15px">
                                            <div class="p-sm-3 signup-right">
                                                    <div class="form-group mb-3">
                                                        <label for="company-number">대표전화</label>
                                                        <input class="form-control" type="text" id="company-number">
                                                    </div>
                                                    <div class="form-group mb-3">
                                                        <label for="company-fax">팩스번호</label>
                                                        <input class="form-control" type="text" id="company-fax">
                                                    </div>
                                                    
                                                    <div class="form-group mb-3">
                                                        <label for="site-name">사이트명</label>
                                                        <input class="form-control" type="text" id="site-name">
                                                    </div>
                                                    <div class="form-group mb-3">
                                                        <label for="company-no1">사업자등록번호</label>
                                                        <input class="form-control" type="text" id="company-no1">
                                                    </div>
                                                    <div class="form-group mb-3">
                                                        <label for="company-no2">통신판매신고번호</label>
                                                        <input class="form-control" type="text" id="company-no2">
                                                    </div>
                                                    <div >
                                                        <label for="company-address" style="display: block;">사업장주소</label>
                                                        
                                                        <input class="form-control" type="text" id="postcode1">
                                                        <button class="btn btn-dark waves-effect waves-light ceo-join-btn-custom" onClick="openPostCode()">우편 번호 찾기</button>  
                                                        <div style="margin-top: 5px;"></div>
                                                        <input class="form-control" type="text" id="postcode2">
                                                        <div style="margin-top: 5px;"></div>
                                                        <input class="form-control" type="text" id="company-address">
                                                    </div>
                                                    <div style="margin-top: 10px;"></div>
                                                    <div class="form-group mb-0">
                                                        <div class="custom-control custom-checkbox pt-1" style="z-index: 0;">
                                                            <button class="btn btn-secondary btn-sm float-right btn-signup" type="submit" id="sa-success" style="position:absolute; right:0; bottom:0; z-index: 10;">가입하기</button>
                                                            <input type="checkbox" class="custom-control-input" id="checkbox-signup">
                                                            <label class="custom-control-label" for="checkbox-signup">약관에 동의합니다. <a href="javascript: void(0);" class="text-dark">
                                                            </a></label>
                                                             <!-- button : src\js\pages\sweet-alerts.init.js 66번째 줄 url-->
                                                             <button type="button" class="btn btn-link btn-xs text-black-50 ml-1" id="sa-long-content">약관보기</button>
                                                        </div>
                                                    </div>
                                                
                                            </div>
                                            <!-- end p-sm-3 -->
                                           
                                        </div> <!-- end col -->
                                        
                                    </div>
                                    </form>
                                <!-- end row-->
                                </div>
                                 
                            </div> <!-- end card-body -->
                        </div>
                        <!-- end card -->
​
                    </div> <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->        
        </div>
        <div style="margin-bottom:200px"> </div>
        <!-- end page --> 
​
        <c:import url ='/WEB-INF/views/partials/script.jsp'/>
​
    </body>
</html>