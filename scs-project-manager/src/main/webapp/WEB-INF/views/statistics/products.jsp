<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ page import="java.util.*"%>
	<%@ page import="java.text.SimpleDateFormat"%>
        <title>상품 별 통계</title>
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
        <link href="<%=request.getContextPath() %>/assets/css/common.css" rel="stylesheet" type="text/css" /> 
        
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
			
		 <!--Morris Chart-->
	    <script src="<%=request.getContextPath() %>/assets/libs/morris-js/morris.min.js"></script> 
	    <script src="<%=request.getContextPath() %>/assets/libs/raphael/raphael.min.js"></script>
 		<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />      
       
</head>
<script type="text/javascript">



var fetchList = function(startDate, endDate){

	var page = $('#current-page').val();
	$.ajax({
		url: '<%=request.getContextPath() %>/${authUser.id}/api/statistics/products',
		async: true,
		type: 'get',
		dataType: 'json',
		contentType: 'application/json',
		data: { "startDate": startDate, "endDate": endDate },
		success: function(response){

			console.log(response.data);
			location.href="<%=request.getContextPath() %>/${authUser.id}/statistics/products?startDate="+startDate+"&endDate="+endDate;
		},
		error: function(xhr, status, e){
			console.error(status + " : " + e);
		}
	});	
}



</script>
<body>
<%

 Date now = new Date();
 SimpleDateFormat sf = new SimpleDateFormat("MM/dd/yyyy");
 
 String today = sf.format(now);
 Calendar week = Calendar.getInstance();
 week.add(Calendar.DATE , -7);
 String beforeWeek = new java.text.SimpleDateFormat("MM/dd/yyyy").format(week.getTime());
%>

	<header>
	<!-- horizontal-nav -->
	<c:import url='/WEB-INF/views/partials/horizontal-nav.jsp' />
	</header>
	<!-- footer -->
	<c:import url='/WEB-INF/views/partials/footer.jsp' />

	<!-- ============================================================== -->
	<!-- Start Page Content here -->
	<!-- ============================================================== -->



	<div class="wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="page-title-box">
						<div class="page-title-right">
							<ol class="breadcrumb m-0">
								<li class="breadcrumb-item"><a href="javascript: void(0);">SCS</a></li>
								<li class="breadcrumb-item"><a href="javascript: void(0);">통계</a></li>
								<li class="breadcrumb-item active">상품 별</li>
							</ol>
						<div class="page-title-right" style="width:220px; margin-bottom:10px;">
							<label>날짜 검색</label>
                            <span class="input-group-addon">
								<i class="fa fa-calendar bigger-110"></i>
							</span>
							<input type="text" id="date-range-picker" name="dates" value="<%=beforeWeek %> - <%=today %>" class="form-control" />
							<script>
							
							
							
							 $('input[id="date-range-picker"]').daterangepicker({
								 "showCustomRangeLabel": true,
									"drops": "auto"
								}, function(start, end) {
									console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
									startDate = start.format('YYYY-MM-DD');
									endDate = end.format('YYYY-MM-DD');
									
									$('#date-range-picker').attr( 'value', startDate+ ' ~ ' + endDate );
									fetchList(startDate, endDate);
							});
													
							</script>
						</div>
						</div>
						
						<h4 class="page-title">상품 별 통계</h4>
					</div>
				</div>
				  
					  
			</div>
			<div class="row">
                    <div class="col-lg-6">
                        <div class="card-box" dir="ltr">
                            <h4 class="header-title mb-3">Stacked Bar Chart</h4>
                            <div class="text-center">
                                <p class="text-muted font-15 font-family-secondary mb-0">
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-blue"></i> Bitcoin</span>
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-info"></i> Ethereum</span>
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-muted"></i> Litecoin</span>
                                </p>
                            </div>
                            <div id="morris-bar-stacked" style="height: 350px;" class="morris-chart"></div>
                        </div> <!-- end card-box-->
                    </div> <!-- end col-->

                    <div class="col-lg-6">
                        <div class="card-box" dir="ltr">
                            <h4 class="header-title mb-3">Area Chart</h4>
                            <div class="text-center">
                                <p class="text-muted font-15 font-family-secondary mb-0">
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-blue"></i> Bitcoin</span>
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-danger"></i> Ethereum</span>
                                </p>
                            </div>
                            <div id="morris-area-example" style="height: 350px;" class="morris-chart"></div>
                        </div> <!-- end card-box-->
                    </div> <!-- end col-->
                </div>
                <!-- end row -->


                <div class="row">
                    <div class="col-lg-6">
                        <div class="card-box" dir="ltr">
                            <h4 class="header-title mb-3">Line Chart</h4>
                            <div class="text-center">
                                <p class="text-muted font-15 font-family-secondary mb-0">
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-blue"></i> Bitcoin</span>
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-pink"></i> Ethereum</span>
                                </p>
                            </div>
                            <div id="morris-line-example" style="height: 350px;" class="morris-chart"></div>
                        </div> <!-- card-box -->
                    </div> <!-- end row -->

                    <div class="col-lg-6">
                        <div class="card-box" dir="ltr">
                            <h4 class="header-title mb-3">Bar Chart</h4>
                            <div class="text-center">
                                <p class="text-muted font-15 font-family-secondary mb-0">
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-info"></i> Bitcoin</span>
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-success"></i> Ethereum</span>
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-muted"></i> Litecoin</span>
                                </p>
                            </div>
                            <div id="morris-bar-example" style="height: 350px;" class="morris-chart"></div>
                        </div> <!-- end card-box-->
                    </div> <!-- end col-->
                </div>
                <!-- end row -->


                <div class="row">
                    <div class="col-lg-6">
                        <div class="card-box" dir="ltr">
                            <h4 class="header-title mb-3">Area Chart with Point</h4>
                            <div class="text-center">
                                <p class="text-muted font-15 font-family-secondary mb-0">
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-primary"></i> Bitcoin</span>
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-light"></i> Ethereum</span>
                                </p>
                            </div>
                            <div id="morris-area-with-dotted" style="height: 350px;" class="morris-chart"></div>
                        </div> <!-- end card-box-->
                    </div> <!-- end col-->

                    <div class="col-lg-6">
                        <div class="card-box" dir="ltr">
                            <h4 class="header-title mb-3">Donut Chart</h4>
                            <div id="morris-donut-example" style="height: 350px;" class="morris-chart"></div>
                            <div class="text-center">
                                <p class="text-muted font-15 font-family-secondary mb-0">
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-primary"></i> Bitcoin</span>
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-info"></i> Ethereum</span>
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-light"></i> Litecoin</span>
                                </p>
                            </div>
                        </div> <!-- end card-box-->
                    </div> <!-- end col-->
                </div>
                <!-- end row -->

            </div> <!-- end container -->
        </div>
        <!-- end wrapper -->


    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->
	<div class="rightbar-overlay"></div>

	  
	<c:import url ='/WEB-INF/views/partials/script.jsp'/>
</body>
</html>