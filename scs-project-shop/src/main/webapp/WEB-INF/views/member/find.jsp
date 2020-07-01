
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <meta charset="utf-8" />
        <title>Pretty Girls~!</title>
		<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
		<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
		<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico">

        <!-- Plugins css -->
        <link href="${pageContext.request.contextPath}/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />

        <!-- App css -->
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/app.min.css" rel="stylesheet" type="text/css" />

     	<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
		<script type="text/JavaScript"
		src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		
		
<script type="text/javascript">
$(document).ready(function(){
	
})
	

$(function(){
	$.fn.checkPasswordInfo = function() {
		var check = false;
		var id = $('#inputId').val();
		var phone = $('#inputPhoneNumber').val();
		
		if(id != "" && phone != "") {
			check = true;
		}
		return check;
	}
	
	$("#inputId").change(function() {
		if($.fn.checkPasswordInfo()) {			
			$('#find-pwd-btn').attr('disabled', false);
		}else{
			$('#find-pwd-btn').attr('disabled', true);
		}	
	});
	$("#inputPhoneNumber").change(function() {
		if($.fn.checkPasswordInfo()) {
			$('#find-pwd-btn').attr('disabled', false);
		}else{
			$('#find-pwd-btn').attr('disabled', true);
		}
	});
	
	// id찾기 input값이 다 들어와야 버튼이 눌리도록
	$.fn.checkIdInfo = function() {
		var check = false;
		var phoneNum = $('#inputidPhoneNumber').val();
		
		if(phoneNum != "") {
			check = true;
		}
		return check;
	}
	$("#inputidPhoneNumber").focusout(function() {
		if($.fn.checkIdInfo()) {
			$('#find-id-btn').attr('disabled', false);
		}else{
			$('#find-id-btn').attr('disabled', true);
		}
	});
	
	$("#find-id-btn").click(function(e) {
				
		var phoneNum = $('#inputidPhoneNumber').val();

 	 	$.ajax({
			url: '${pageContext.request.contextPath }/api/member/find/id',
			async: true,
			type: 'post',
			data: {"phoneNum": phoneNum },
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
	
	$("#find-pwd-btn").click(function() {
			
			var id = $('#inputId').val();
			var phone = $('#inputPhoneNumber').val();
	
	 	 	$.ajax({
				url: '${pageContext.request.contextPath }/api/member/find/password',
				async: true,
				type: 'post',
				data: { 'id' : id,
						'phone' : phone },
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
    <!-- Navigation Bar-->
    <c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import>
     

    <div class="wrapper">
        <div class="container-fluid">
            <div class="join-group">
                <div class="join-contents">find</div>
                <div class="mobile-margin-box"></div>
                <div class="col-xl-12">
                        <div class="card-box">
                            <h4 class="header-title mb-4"></h4>

                            <ul class="nav nav-tabs nav-bordered nav-justified ">
                                <li class="nav-item">
                                    <a href="#find-id" id="a-find-id"data-toggle="tab" aria-expanded="false" class="nav-link ">
                                        아이디 찾기
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#find-pwd" id="a-find-pwd" data-toggle="tab" aria-expanded="true" class="nav-link  ">
                                        비밀번호 찾기
                                    </a>
                                </li>
                                
                            </ul>
                           
                            
                            <c:choose>
                            <c:when test="${isPwd=='n' }">
                            <div class="tab-content">
                                <div class="tab-pane active" id="find-id">
                                    <form>
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="inputidPhoneNumber" aria-describedby="emailHelp" placeholder="휴대전화 입력">
                                            
                                        </div>
                                        
                                       <div class="">
                                        <input type ="button" class="btn btn-light waves-effect complete-join" id="find-id-btn" disabled value="아이디 찾기"/>
                                       </div>
                                        	<br>
                                        <div>
                                    		<a href="${pageContext.servletContext.contextPath }/${db }/member/login">
                                    		<button type="button" class="btn btn-light waves-effect complete-join">로그인하러가기</button></a>
                                  	  </div>
                                    </form>
                                </div>
                                <div class="tab-pane" id="find-pwd">
                                    <form>
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="inputId" aria-describedby="emailHelp" placeholder="아이디 입력">
                                        </div>
                                        <div class="form-group">
                                            
                                            <input type="text" class="form-control" id="inputPhoneNumber" placeholder="휴대전화 입력">
                                        </div>
                                      
                                        <div class="">
                                             <input type="button" class="btn btn-light waves-effect complete-join" id="find-pwd-btn" disabled value="비밀번호 찾기"/>
                                        </div>
                                        	<br>
                                        <div>
                                    		<a href="${pageContext.servletContext.contextPath }/${db }/member/login">
                                    		<button type="button" class="btn btn-light waves-effect complete-join">로그인하러가기</button></a>
                                  	  </div>
                                    </form>
                                </div>
                                
                            </div>
                            </c:when>
                            <c:otherwise>
                            
                             <div class="tab-content">
                                <div class="tab-pane" id="find-id">
                                    <form>
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="inputidPhoneNumber" aria-describedby="emailHelp" placeholder="휴대전화 입력">
                                            
                                        </div>
                                        
                                       <div class="">
                                         <input type ="button" class="btn btn-light waves-effect complete-join" id="find-id-btn" disabled value="아이디 찾기"/>
                                       </div>
                                        	<br>
                                        <div>
                                    		<a href="${pageContext.servletContext.contextPath }/${db }/member/login">
                                    		<button type="button" class="btn btn-light waves-effect complete-join">로그인하러가기</button></a>
                                  	  </div>
                                    </form>
                                </div>
                                <div class="tab-pane active" id="find-pwd">
                                    <form>
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="inputId" aria-describedby="emailHelp" placeholder="아이디 입력">
                                        </div>
                                        <div class="form-group">
                                            
                                            <input type="text" class="form-control" id="inputPhoneNumber" placeholder="휴대전화 입력">
                                        </div>
                                      
                                        <div class="">
                                            <input type="button" class="btn btn-light waves-effect complete-join" id="find-pwd-btn" disabled value="비밀번호 찾기"/>
                                        </div>
                                        	<br>
                                        <div>
                                    		<a href="${pageContext.servletContext.contextPath }/${db }/member/login">
                                    		<button type="button" class="btn btn-light waves-effect complete-join">로그인하러가기</button></a>
                                  	  </div>
                                    </form>
                                </div>
                                
                            </div>
                            </c:otherwise>
                            </c:choose>
                        </div> <!-- end card-box-->
                    </div> <!-- end col -->
            </div>
        </div>
    </div>
   <c:import url="/WEB-INF/views/partials/footer.jsp"></c:import>

   <!-- Vendor js -->
   <script src="${pageContext.request.contextPath}/assets/js/vendor.min.js"></script>

   <!-- App js-->
   <script src="${pageContext.request.contextPath}/assets/js/app.min.js"></script>

</body>
</html>