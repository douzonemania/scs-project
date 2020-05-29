<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
        <title>정산관리</title>
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
        
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/3.0.5/daterangepicker.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
		<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

		<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
		
</head>
<script type="text/javascript">



var fetchList = function(startDate, endDate){

	var page = $('#current-page').val();
	$.ajax({
		url: '<%=request.getContextPath() %>/${authUser.id}/api/order/settle',
		async: true,
		type: 'get',
		dataType: 'json',
		contentType: 'application/json',
		data: { "startDate": startDate, "endDate": endDate },
		success: function(response){
			
<<<<<<< HEAD
			console.log(response);
			
=======
			console.log(response.data);
			location.href="<%=request.getContextPath() %>/${authUser.id}/order/settle?p="+page+"&startDate="+startDate+"&endDate="+endDate;
>>>>>>> branch 'master' of https://github.com/douzonemania/scs-project.git
		},
		error: function(xhr, status, e){
			console.error(status + " : " + e);
		}
	});	
}



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
                                <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/{id}/order/delivery">주문관리</a></li>
                                <li class="breadcrumb-item active">정산 관리</li>
                            </ol>
                        </div>
                        <h4 class="page-title">정산 관리</h4>
                    </div>
                </div>
            </div>     
            <!-- end page title --> 
            <!-- start 검색 부분 -->
            <div class="row">
                <div class="col-lg-4">
                    <div class="card-box" >                       
                     
                        <h4 class="header-title">정산 현황</h4>
                        <p class="sub-header">찾고자 하는 날짜를 고르시오.</p>


                        <div class="search-form">
                            <div class="form-group mb-3 scs-search"> 
                                <label>날짜 검색</label>
                                <span class="input-group-addon">
									<i class="fa fa-calendar bigger-110"></i>
								</span>
								<input type="text" id="date-range-picker"name="dates" value="06/01/2020 - 06/18/2020" class="form-control" />
								<script>
									
								$('input[id="date-range-picker"]').daterangepicker({
									    "showCustomRangeLabel": false,
									    "startDate": "07/06/2020",
									    "endDate": "07/13/2020",
									    "drops": "auto"
									}, function(start, end) {
									  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
									  	var startDate = start.format('YYYY-MM-DD');
										var endDate = end.format('YYYY-MM-DD');
										location.href="<%=request.getContextPath() %>/{id}/order/settle?startDate="+startDate+"&endDate="+endDate;
									});
								
								</script>
                            </div>
                            
                            <div class="col-sm-6 col-xl-3 scs-submit">
                                <div class="p-3">
                                    <button type= "button" class="btn btn-secondary waves-effect">Search</button>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end card-box-->
                </div> <!-- end col -->
            </div>
            <!-- end 검색 부분 -->
        </div> 
        <!-- end container -->

        <div class="row">
            <div class="col-lg-11">
                <div class="card-box" style="margin-top:0; padding-top:0;">
                    <div class="card-body" style="display: inline-flex; height:110px; margin-top:0">
                        
                        <!-- div hello start-->
                        <div id="hello"  style="display: inline-flex; width: 1200px; margin-left:10%; " >
                        
                            <div class="col-md-6 col-xl-3" >
                            <div class="widget-rounded-circle card-box" style="max-height: 50px;" >
                                <div class="row">
                                    <div class="col-6">
                                        <div class="avatar-lg rounded-circle bg-soft-success border-success border">
                                            <i class="fe-shopping-cart font-22 avatar-title text-success"></i>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="text-right">
                                            <h3 class="text-dark mt-1"><span data-plugin="counterup">127</span>건</h3>
                                            <p class="text-muted mb-1 text-truncate">건수</p>
                                        </div>
                                    </div>
                                </div> <!-- end row-->
                            </div> <!-- end widget-rounded-circle-->
                        </div> <!-- end col-->
                        

                        <div class="col-md-6 col-xl-3" style="margin-left:150px">
                            <div class="widget-rounded-circle card-box" style="max-height: 50px;">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="avatar-lg rounded-circle bg-soft-primary border-primary border">
                                            <i class="fe-dollar-sign font-22 avatar-title text-primary"></i>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="text-right">
                                            <h3 class="text-dark mt-1"><span data-plugin="counterup">58,947</span>원</h3>
                                            <p class="text-muted mb-1 text-truncate">매출</p>
                                        </div>
                                    </div>
                                </div> <!-- end row-->
                            </div> <!-- end widget-rounded-circle-->
                        </div> <!-- end col-->
                        

                        <div class="col-md-6 col-xl-3" style="margin-left:150px">
                            <div class="widget-rounded-circle card-box" style="max-height: 50px;">
                                <div class="row">
            
                                    <div class="col-6">
                                        <div class="avatar-lg rounded-circle bg-soft-info border-info border">
                                            <i class="fe-thumbs-up font-22 avatar-title text-info"></i>
                                        </div>
                                    </div>
            
                                    <div class="col-6">
                                        <div class="text-right">
                                            <h3 class="text-dark mt-1"><span data-plugin="counterup">32,481</span>원</h3>
                                            <p class="text-muted mb-1 text-truncate">순수익</p>
                                        </div>
                                    </div>
            
                                </div> <!-- end row-->
                            </div> <!-- end widget-rounded-circle-->
                        </div> <!-- end col-->
                        </div><!-- end hello-->
                    </div>
                </div>
            </div>
        </div>

        <!-- start row -->
        <div class="row" style="margin-top: -30px;">
            <!-- start 정산 결과 리스트 -->
            <div class="col-lg-11">
                <div class="card-box">
<<<<<<< HEAD
                    <div class="card-body">
                        <h4 class="header-title">정산 결과</h4>

                        <table style="width:100%;" class="table table-striped mb-0">
=======
                    <div class="card-body"> 
						<div class="form-group mb-3 scs-search"> 
                                <label>날짜 검색</label>
                                <span class="input-group-addon">
									<i class="fa fa-calendar bigger-110"></i>
									<h6>날짜검색해야 나옴.</h6>
									
								</span>
								<input type="text" id="date-range-picker"name="dates" class="form-control" />
								<script>
								var startDate;
								var endDate;
								$('input[id="date-range-picker"]').daterangepicker({
									    "showCustomRangeLabel": true,
									    
									    "drops": "auto"
									}, function(start, end) {
									  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
									  	startDate = start.format('YYYY-MM-DD');
										endDate = end.format('YYYY-MM-DD');
											
										fetchList(startDate, endDate);
									});
								
								</script>
                            </div>
                            <!-- 
                            <div class="col-sm-6 col-xl-3 scs-submit">
                                <div class="p-3">
                                    <button type= "button" class="btn btn-secondary waves-effect">검색</button>
                                </div>
                            </div>
                             -->
                       
                        <table style="width:100%; " class="table table-striped mb-0">
>>>>>>> branch 'master' of https://github.com/douzonemania/scs-project.git
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>회원아이디</th>
                                    <th>주문날짜</th>
                                    <th>구매금액</th>
                                    <th>마진</th>
                                </tr>
                            </thead>
                        	 <c:forEach var="vo" varStatus="status" items="${map.list }">
                            <tbody>
                                <tr>
                                    <td>${vo.no }</td>
                                    <td>${vo.id }</td>
                                    <td>${vo.regDate }</td>
                                    <td>${vo.purchasePrice }</td>
                                    <td>${vo.marginPrice }</td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
						
                        <!-- start paging -->
                            <nav>
                            <input type="hidden" value="${map.page }" id="current-page" />
	                            <ul class="pagination pagination-rounded justify-content-center mb-3">
	                            <li class="page-item">
	                                <a class="page-link" href="${pageContext.servletContext.contextPath }/${authUser.id}/order/settle?p=${map.prevPage}&startDate=${map.startDate }&endDate=${map.endDate}" aria-label="Previous">
	                                    <span aria-hidden="true">«</span>
	                                    <span class="sr-only">Previous</span>
	                                </a>
	                            </li>
	                            <c:forEach var="i" begin="1" end="${map.listsize }">
									<c:choose>
										<c:when test="${map.page == (map.beginPage+(i-1)) }">
											<li class ="page-item active">
												<a class="page-link" href="${pageContext.servletContext.contextPath }/${authUser.id}/order/settle?p=${map.beginPage+(i-1) }&startDate=${map.startDate }&endDate=${map.endDate}">${map.beginPage+(i-1) }</a>
											</li>
										</c:when>
										<c:otherwise>
											<li><a class="page-link" href="${pageContext.servletContext.contextPath }/${authUser.id}/order/settle?p=${map.beginPage+(i-1) }&startDate=${map.startDate }&endDate=${map.endDate}">${map.beginPage+(i-1) }</a></li>
										</c:otherwise>
									
									</c:choose>
								</c:forEach>
	                            <li>
	                                <a class="page-link" href="${pageContext.servletContext.contextPath }/${authUser.id}/order/settle?p=${map.nextPage }&startDate=${map.startDate }&endDate=${map.endDate}" aria-label="Next">  
	                                 	<span aria-hidden="true">»</span>
	                                    <span class="sr-only">Next</span>
	                                </a>
	                            </li>
	                        </ul>
                        </nav>
                        <!-- end paging -->

                    </div> <!-- end card body-->
                </div> <!-- end card -->

            </div>
            <!-- end 정산 결과 리스트 -->
        </div>
        <!-- end row-->
    </div>
    <!-- end wrapper -->
	<c:import url ='/WEB-INF/views/partials/script.jsp'/>
	
</body>
</html>