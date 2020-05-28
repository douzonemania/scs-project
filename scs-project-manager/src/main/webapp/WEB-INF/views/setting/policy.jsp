<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
        <title>약관 및 정책 설정</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico">
       
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
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
</head>
<script type="text/javascript">

var fetchList = function(){

	$.ajax({
		url: '${pageContext.request.contextPath }/${authUser.id}/api/setting/policy',
		async: true,
		type: 'get',
		dataType: 'json',
		data: '',
		success: function(response){
			
			console.log(response.data);
			if(response.result != "success"){
				console.error(response.message);
				return;
			}
			
			$('#nav-item1').click(function(){
				quill.setContents([
				  { insert: response.data.firstAgree },
				  { insert: "\n" }
				], 'user');
				
			});
			
			$('#nav-item2').click(function(){
				quill.setContents([
				  { insert: response.data.secondAgree },
				  { insert: "\n" }
				], 'user');

			});
			
			$('#nav-item3').click(function(){
				quill.setContents([
				  { insert: response.data.thirdAgree },
				  { insert: "\n" }
				], 'user');
			});
		},
		error: function(xhr, status, e){
			console.error(status + " : " + e);
		}
	});
};

function submitPolicy(){
	
	event.preventDefault();
	
	var html = quill.getContents();
	console.log(html);
	$.ajax({
		url: '${pageContext.request.contextPath }/${authUser.id}/api/setting/policy/update',
		async: true,
		type: 'post',
		dataType: 'json',
		contentType: 'application/json',
		data: JSON.stringify(html),
		success: function(response){
			
			if(response.result != "success"){
				console.error(response.message);
				return;
			}
					
			
			console.log(response);
			
			
		},
		error: function(xhr, status, e){
			console.error(status + " : " + e);
		}
	});
}


fetchList();


</script>
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
            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box">
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/main">SCS</a></li>
                                <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/{id}/setting/basic">환경설정</a></li>
                                <li class="breadcrumb-item active">약관 및 정책 설정</li>
                            </ol>
                        </div>
                        <h4 class="page-title">약관 및 정책 설정</h4>
                    </div>
                </div>
            </div>     
            <!-- end page title -->
            <!-- start row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="card-box">
                        <ul class="nav nav-pills navtab-bg nav-justified">
                            <li class="nav-item" id="nav-item1">
                                <a href="#home1" data-toggle="tab" aria-expanded="true" class="nav-link active nav-title-color">
                                   	 이용 약관
                                </a>
                            </li>
                            <li class="nav-item" id="nav-item2">
                                <a href="#home2" data-toggle="tab" aria-expanded="false" class="nav-link nav-title-color">
                                   	개인정보처리방침
                                </a>
                            </li>
                            <li class="nav-item" id="nav-item3">
                                <a href="#home3" data-toggle="tab" aria-expanded="false" class="nav-link nav-title-color">
                                   	개인정보 수집 및 이용동의
                                </a>
                            </li>
                        </ul>
                        <form id="update-form" action="${pageContext.request.contextPath }/${authUser.id}/setting/policy/update" method="post">
	                        <div class="tab-content">
	                            <div class="tab-pane show active" id="home1">
	                                <div id="snow-editor" class="editor-class" style="height: 300px;" contentEditable="true">
	                                	Default
	                                </div> 
	                           </div>	
		                     
		                        <div class="col-lg-12 scs-submit">
		                            <div id="#test" class="p-4" style="float: right; margin-left:40px;">
		                                <input type= "button" id="save-btn" value="저장" class="btn btn-secondary waves-effect" onclick="submitPolicy()">
		                                <input type= "button" value="취소"class="btn btn-secondary waves-effect">
		                            </div>
		                        </div>
                    		</div>
                    	</form>
                    	<!-- end tab-content -->
                	</div>
                	<!-- end card-box-->
            	</div>
            	<!-- end col -->

            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
    <!-- end wrapper -->

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->
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