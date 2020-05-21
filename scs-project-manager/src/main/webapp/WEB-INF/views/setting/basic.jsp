<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
        <title>SCS 쇼핑몰 기본 설정</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="<%=request.getContextPath() %>/assets/images/favicon.ico">
       
        <!-- Plugins css -->
        <link href="<%=request.getContextPath() %>/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
       
        <link href="<%=request.getContextPath() %>/assets/libs/dropzone/dropzone.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
        
        <link href="<%=request.getContextPath() %>/assets/libs/jquery-nice-select/nice-select.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/switchery/switchery.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/multiselect/multi-select.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/select2/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/quill/quill.core.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/quill/quill.bubble.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/quill/quill.snow.css" rel="stylesheet" type="text/css" />

        <!-- third party css -->
        <link href="<%=request.getContextPath() %>/assets/libs/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/datatables/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/datatables/buttons.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/datatables/select.bootstrap4.css" rel="stylesheet" type="text/css" />
        <!-- third party css end -->

        <!-- App css -->
        <link href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/css/app.min.css" rel="stylesheet" type="text/css" />
<!-- 배송사 추가/삭제 팝업 -->            
<script type="text/javascript">
function shipAdd(){
	console.log("shipAdd");
	window.open('shipAdd','카테고리 추가/삭제','width=430,height=500,location=no,status=no,scrollbars=no');
}
</script>

<!-- 파비콘 미리보기 -->
<script type="text/javascript">

function readURL(input) {
    if (input.files && input.files[0]) {
     var reader = new FileReader();
     
     reader.onload = function (e) {
      $('#preview-favicon').attr('src', e.target.result);  
     }
     
     	reader.readAsDataURL(input.files[0]);
     }
   }
     
   $("#favicon-img").change(function(){
      readURL(this);
   });
   
</script>
<!-- 로고 미리보기 -->
<script type="text/javascript"> 

function preview(input, target) {
	if(input.files && input.files[0]){
  	var fileName= input.files[0].name;
  	var ext=fileName.substr(fileName.length-3, fileName.length);
  	var isCheck=false; 
  		if(ext.toLowerCase()=='jpg' || ext.toLowerCase()=='gif' || ext.toLowerCase()=='png'){
  		isCheck=true;               
  	}
  	if(isCheck==false){
  		alert("이미지 파일 아님");
  		jQuery(input).val("");
  		return;
  	}
  	var reader = new FileReader();
  	reader.readAsDataURL(input.files[0]);          
  	reader.onload = function(e) {
  	  jQuery(target).attr('src', e.target.result);
  	}
	}
}
</script>
</head>
<body>

  	<header>
  		<!-- horizontal-nav -->  	
        <c:import url ='/WEB-INF/views/partials/horizontal-nav.jsp'/>
    </header>
    	<!-- footer -->
    	<c:import url ='/WEB-INF/views/partials/footer.jsp'/>
    
     <!-- ============================================================== -->
     <!-- Start Page Content here -->
     <!-- ============================================================== -->


 <div class="wrapper">
        <div class="container-fluid">

            <div class="row">
                <div class="col-12">
                    <div class="page-title-box" id="search-form-text"> 
                        <h4 class="page-title">&nbsp</h4>
                    </div>
                </div>
            </div>     


            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body" id="search-form">
                            <h4 class="page-title">관리자 정보 설정</h4>
                            	
                            	<!--  id 잡기 -->
								<form:form
									action="${pageContext.request.contextPath}/{id}/setting/basic/update"
									modelAttribute="ceoVo"
									class="setting-form"
									id="setting-form"
									method="post"
									enctype="multipart/form-data">
        								<!-- 제출 form 종료 -->
                                    <!-- 관리자 정보 설정 시작-->
                                    <table class="table-form-exposure">
                                        <colgroup>
                                            <col width="180"><col width="*"><col width="180"><col width="*">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th>관리자아이디</th>
                                            <td colspan="2">
                                                ${ceoVo.id }
                                            </td>
                                            <th>관리자비밀번호 <span style="color:#FF4040">*</span></th>
                                            <td colspan="2">
                                                <form:input path="password" class="form-control product-info"/>  
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>대표번호</th>
                                            <td colspan="2">
                                                <form:input path="cpNumber" class="form-control product-info" />                                                          
                                            </td>
                                            <th>관리자휴대폰 <span style="color:#FF4040">*</span></th>
                                            <td colspan="2">
                                                <form:input path="phoneNumber" class="form-control product-info"/>  
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>대표이메일 <span style="color:#FF4040">*</span></th>
                                            <td colspan="2">
                                                <form:input path="email" class="form-control product-info"/>                                                       
                                            </td>
                            	            <th>팩스번호</th>
                                            <td colspan="2">
                                                <form:input path="faxNumber" class="form-control product-info"/>                                                       
                                            </td>
                                        </tr>                          
                                        </tbody>
                                    </table>
                                    <!-- 관리자 정보 설정 종료--> 
                                <div class="lspace"></div>
                            

                                <!-- 사이트 기본 설정 시작-->
                                <h4 class="page-title">상품 기본 정보</h4>
                                <table class="table-form-category">
                                    <colgroup>
                                        <col width="180"><col width="*">
                                    </colgroup>
                                        <tbody> 
                                            <tr>
                                                <th>회사명 <span style="color:#FF4040">*</span></th>
                                                <td colspan="2">
                                                    <form:input path="companyName" class="form-control product-info"/>                                                          
                                                </td>                                
                                                <th>대표자명 <span style="color:#FF4040">*</span></th>
                                                <td colspan="2">
                                                    <form:input path="name" class="form-control product-info"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>사이트명</th>
                                                <td colspan="2">
                                                    <form:input path="siteName" class="form-control product-info"/>                                                          
                                                </td>
                                                <th>사업자등록번호</th>
                                                <td colspan="2">
                                                    <form:input path="coNumber" class="form-control product-info"/>  
                                                </td>
                                            </tr> 
                                            <tr>
                                                <th>통신판매신고번호</th>
                                                <td colspan="2"> 
                                                    <form:input path="cmNumber" class="form-control product-info"/>  
                                                </td>
                                                <th>주소</th>
                                                <td colspan="2">
                                                    <form:input path="address" class="form-control product-info"/>                                                       
                                                </td>
                                            </tr>
                                        </tbody>
                                        
                                    </table>
                                    <!-- 사이트 기본 설정 종료-->
                                    <div class="lspace"></div>
                                        <!-- 이미지 관리 시작-->
                                        <h4 class="page-title">이미지 관리</h4>
                                        <table class="table-form-category">
                                            <colgroup>
                                                <col width="180"><col width="*">
                                            </colgroup>
                                            <tbody> 
                                                <tr>
                                                    <th>로고</th>
                                                        <td colspan="2">
	                                                        <div class="col-sm-2">
	                                                            <img id="preview-logo" src="${pageContext.request.contextPath}${ceoVo.logo }" alt="image"
	                                                                    class="img-fluid rounded img-scs-logo" style="width:250px; height:80px;"/>
	                                                        </div>
	                                                        <div class="box">
	                                                            <span class="filetype">
	                                                                <button type="button" class="btn btn-secondary waves-effect btn-no2" >찾아보기
		                                                                <span class="file-select">
		                                                                	<input type="file" name="logo-file" onchange="preview(this, $('#preview-logo'));" class="input-file" size="3"/>
		                                                               	</span>
	                                                                </button>
	                                                            </span>
	                                                    	</div>
                                                        </td>
                                                   <th>파비콘</th>
                                                    <td colspan="2">
                                                        <div class="col-sm-2">
                                                            <img id="preview-favicon" src="${pageContext.request.contextPath}${ceoVo.favicon}" alt="image"
                                                                class="img-fluid avatar-sm rounded mt-2"/>
                                                        </div>
                                                        <div class="box">
                                                            <span class="filetype">
                                                                <button type="button" class="btn btn-secondary waves-effect">찾아보기
                                                                    <span class="file-select">
                                                                    	<input type="file" name="favicon-file"onchange="preview(this, $('#preview-favicon'));" class="input-file" size="3"/>
                                                                    </span>
                                                                </button>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                    
                                            </tbody>
                                                
                                        </table>
                                        <!-- 이미지 관리 종료-->
        

                                        <div class="lspace"></div>
                                        <!-- 배송사 관리 시작-->
                                        <h4 class="page-title">배송 관리</h4>
                                        <table class="table-form-category">
                                            <colgroup>
                                                <col width="180"><col width="*">
                                            </colgroup>
                                                <tbody> 
                                                    <tr>
                                                        <th>배송사</th>
                                                        <td colspan="2" style="width:233px;">
                                                            <button type="button" class="btn btn-secondary waves-effect btn-no2" 
                                                            	onclick="shipAdd()" style="background-color:#CBCBCB; border-color:white">추가/삭제</button>
                                                        </td>
                                                        <th>배송비</th>
                                                        <td colspan="2" id="charge-change">
                                                            <form:input path="shipCharge" class="form-control product-info"/>
                                                        </td>
                                                    </tr>
                                                    
                                                </tbody>
                                                
                                         </table>
                                         <!-- 배송사 관리 종료-->
                                         
										 <!-- 수정 버튼 -->
                                         <div class="form-group mb-3 float-sm-right" style="margin-top: 10px;">
                                             <button class="btn btn-secondary btn-lg" type="submit" > 수정 </button>
                                         </div>
						</form:form>
           				<!-- 제출 form 종료 -->
                        </div><!-- end card-body -->
                    </div><!-- end card -->
                    
                </div><!-- end col -->
            </div><!-- end row -->
        </div> <!-- end container -->            
    </div> <!-- end wrapper -->

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->

	<c:import url ='/WEB-INF/views/partials/script.jsp'/>
</body>
</html>