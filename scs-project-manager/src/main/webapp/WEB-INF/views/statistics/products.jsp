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



var fetchGraph = function(startDate, endDate){

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
									fetchGraph(startDate, endDate);
							});
													
							</script>
						</div>
						</div>
						
						<h4 class="page-title">상품 별 통계</h4>
					</div>
				</div>
				  
					  
			</div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card-box" dir="ltr">
                        <h4 class="header-title mb-3">날짜별 매출</h4>
                        <div class="text-center">
                            <p class="text-muted font-15 font-family-secondary mb-0">
                            </p>
                        </div>
                        <div id="morris-bar-example1" style="height: 350px;" class="morris-chart"></div>
                    </div> <!-- end card-box-->
                </div> <!-- end col-->
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="card-box" dir="ltr">
                        <h4 class="header-title mb-3">1인당 평균 결제금액</h4>
                        <div class="text-center">
                            <p class="text-muted font-15 font-family-secondary mb-0">
                            </p>
                        </div>
                        <div id="morris-bar-example2" style="height: 350px;" class="morris-chart"></div>
                    </div> <!-- end card-box-->
                </div> <!-- end col-->
                <div class="col-lg-6">
                    <div class="card-box" dir="ltr">
                        <h4 class="header-title mb-3">날짜별 순 이익</h4>
                        <div class="text-center">
                            <p class="text-muted font-15 font-family-secondary mb-0">
                            </p>
                        </div>
                        <div id="morris-bar-example3" style="height: 350px;" class="morris-chart"></div>
                    </div> <!-- end card-box-->
                </div> <!-- end col-->
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="card-box" dir="ltr">
                        <h4 class="header-title mb-3">한번에 결제되는 개수</h4>
                        <div class="text-center">
                            <p class="text-muted font-15 font-family-secondary mb-0">
                            	<span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-primary"></i> 1</span>
                                <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-pink"></i> 2</span>
                                <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-success"></i> 3</span>
                                <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-danger"></i> 4</span>
                                <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-info"></i> 5</span>
                            </p>
                        </div>
                        <div id="morris-bar-example4" style="height: 350px;" class="morris-chart"></div>
                    </div> <!-- end card-box-->
                </div> <!-- end col-->
                <div class="col-lg-6">
                    <div class="card-box" dir="ltr">
                        <h4 class="header-title mb-3">한번에 결제되는 금액</h4>
                        <div class="text-center">
                            <p class="text-muted font-15 font-family-secondary mb-0">
                                <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-info"></i> Bitcoin</span>
                                <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-success"></i> Ethereum</span>
                                <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-muted"></i> Litecoin</span>
                            </p>
                        </div>
                        <div id="morris-bar-example5" style="height: 350px;" class="morris-chart"></div>
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
<script>
	
	var date1 = "${map.oneResultList.get(6).date}";
	var date2 = "${map.oneResultList.get(5).date}";
	var date3 = "${map.oneResultList.get(4).date}";
	var date4 = "${map.oneResultList.get(3).date}";
	var date5 = "${map.oneResultList.get(2).date}";
	var date6 = "${map.oneResultList.get(1).date}";
	var date7 = "${map.oneResultList.get(0).date}";

	var TotalSales1 = ${map.oneResultList.get(6).totalSales};
	var TotalSales2 = ${map.oneResultList.get(5).totalSales};
	var TotalSales3 = ${map.oneResultList.get(4).totalSales};
	var TotalSales4 = ${map.oneResultList.get(3).totalSales};
	var TotalSales5 = ${map.oneResultList.get(2).totalSales};
	var TotalSales6 = ${map.oneResultList.get(1).totalSales};
	var TotalSales7 = ${map.oneResultList.get(0).totalSales};
	
	var resultPrice1 = ${map.twoResultList.get(6).resultPrice};
	var resultPrice2 = ${map.twoResultList.get(5).resultPrice};
	var resultPrice3 = ${map.twoResultList.get(4).resultPrice};
	var resultPrice4 = ${map.twoResultList.get(3).resultPrice};
	var resultPrice5 = ${map.twoResultList.get(2).resultPrice};
	var resultPrice6 = ${map.twoResultList.get(1).resultPrice};
	var resultPrice7 = ${map.twoResultList.get(0).resultPrice};
	
	var totalMargin1 = ${map.threeResultList.get(6).totalMargin};
	var totalMargin2 = ${map.threeResultList.get(5).totalMargin};
	var totalMargin3 = ${map.threeResultList.get(4).totalMargin};
	var totalMargin4 = ${map.threeResultList.get(3).totalMargin};
	var totalMargin5 = ${map.threeResultList.get(2).totalMargin};
	var totalMargin6 = ${map.threeResultList.get(1).totalMargin};
	var totalMargin7 = ${map.threeResultList.get(0).totalMargin};

	var oneClick1Count1 = ${map.productsCountVo1.get(6).count};
	var oneClick1Count2 = ${map.productsCountVo1.get(5).count};
	var oneClick1Count3 = ${map.productsCountVo1.get(4).count};
	var oneClick1Count4 = ${map.productsCountVo1.get(3).count};
	var oneClick1Count5 = ${map.productsCountVo1.get(2).count};
	var oneClick1Count6 = ${map.productsCountVo1.get(1).count};
	var oneClick1Count7 = ${map.productsCountVo1.get(0).count};
	
	var oneClick2Count1 = ${map.productsCountVo2.get(6).count};
	var oneClick2Count2 = ${map.productsCountVo2.get(5).count};
	var oneClick2Count3 = ${map.productsCountVo2.get(4).count};
	var oneClick2Count4 = ${map.productsCountVo2.get(3).count};
	var oneClick2Count5 = ${map.productsCountVo2.get(2).count};
	var oneClick2Count6 = ${map.productsCountVo2.get(1).count};
	var oneClick2Count7 = ${map.productsCountVo2.get(0).count};
	
	var oneClick3Count1 = ${map.productsCountVo3.get(6).count};
	var oneClick3Count2 = ${map.productsCountVo3.get(5).count};
	var oneClick3Count3 = ${map.productsCountVo3.get(4).count};
	var oneClick3Count4 = ${map.productsCountVo3.get(3).count};
	var oneClick3Count5 = ${map.productsCountVo3.get(2).count};
	var oneClick3Count6 = ${map.productsCountVo3.get(1).count};
	var oneClick3Count7 = ${map.productsCountVo3.get(0).count};
	
	var oneClick4Count1 = ${map.productsCountVo4.get(6).count};
	var oneClick4Count2 = ${map.productsCountVo4.get(5).count};
	var oneClick4Count3 = ${map.productsCountVo4.get(4).count};
	var oneClick4Count4 = ${map.productsCountVo4.get(3).count};
	var oneClick4Count5 = ${map.productsCountVo4.get(2).count};
	var oneClick4Count6 = ${map.productsCountVo4.get(1).count};
	var oneClick4Count7 = ${map.productsCountVo4.get(0).count};

	var oneClick5Count1 = ${map.productsCountVo5.get(6).count};
	var oneClick5Count2 = ${map.productsCountVo5.get(5).count};
	var oneClick5Count3 = ${map.productsCountVo5.get(4).count};
	var oneClick5Count4 = ${map.productsCountVo5.get(3).count};
	var oneClick5Count5 = ${map.productsCountVo5.get(2).count};
	var oneClick5Count6 = ${map.productsCountVo5.get(1).count};
	var oneClick5Count7 = ${map.productsCountVo5.get(0).count};

	
	
	
	
	
	!function($) {

	    "use strict";
	
	    var MorrisCharts = function() {};
	
	    //creates Bar chart
	    MorrisCharts.prototype.createBarChart  = function(element, data, xkey, ykeys, labels, lineColors) {
	        Morris.Bar({
	            element: element,
	            data: data,
	            xkey: xkey,
	            ykeys: ykeys,
	            labels: labels,
	            hideHover: 'auto',
	            resize: true, //defaulted to true
	            gridLineColor: '#eeeeee',
	            barSizeRatio: 0.2,
	            xLabelAngle: 35,
	            barColors: lineColors
	        });
	    },
	
	    MorrisCharts.prototype.init = function() {
	
	        //creating bar chart
	        var $barData1  = [
	            { y: date1+'', a: TotalSales1},
	            { y: date2+'', a: TotalSales2},
	            { y: date3+'', a: TotalSales3},
	            { y: date4+'', a: TotalSales4},
	            { y: date5+'', a: TotalSales5},
	            { y: date6+'', a: TotalSales6}
	        ];
	        //creating bar chart
	        var $barData2  = [
	            { y: date1+'', a: resultPrice1},
	            { y: date2+'', a: resultPrice2},
	            { y: date3+'', a: resultPrice3},
	            { y: date4+'', a: resultPrice4},
	            { y: date5+'', a: resultPrice5},
	            { y: date6+'', a: resultPrice6}
	        ];
	        //creating bar chart
	        var $barData3  = [
	            { y: date1+'', a: totalMargin1},
	            { y: date2+'', a: totalMargin2},
	            { y: date3+'', a: totalMargin3},
	            { y: date4+'', a: totalMargin4},
	            { y: date5+'', a: totalMargin5},
	            { y: date6+'', a: totalMargin6}
	        ];
	        //creating bar chart
	        var $barData4  = [
	            { y: date1+'', a: oneClick1Count1, b: oneClick2Count1, c: oneClick3Count1, d: oneClick4Count1, e: oneClick5Count1},
	            { y: date2+'', a: oneClick1Count2, b: oneClick2Count2, c: oneClick3Count2, d: oneClick4Count2, e: oneClick5Count2},
	            { y: date3+'', a: oneClick1Count3, b: oneClick2Count3, c: oneClick3Count3, d: oneClick4Count3, e: oneClick5Count3},
	            { y: date4+'', a: oneClick1Count4, b: oneClick2Count4, c: oneClick3Count4, d: oneClick4Count4, e: oneClick5Count4},
	            { y: date5+'', a: oneClick1Count5, b: oneClick2Count5, c: oneClick3Count5, d: oneClick4Count5, e: oneClick5Count5},
	            { y: date6+'', a: oneClick1Count6, b: oneClick2Count6, c: oneClick3Count6, d: oneClick4Count6, e: oneClick5Count6}
	        ];
	        //creating bar chart
	        var $barData5  = [
	            { y: date1+'', a: TotalSales1},
	            { y: date2+'', a: TotalSales2},
	            { y: date3+'', a: TotalSales3},
	            { y: date4+'', a: TotalSales4},
	            { y: date5+'', a: TotalSales5},
	            { y: date6+'', a: TotalSales6}
	        ];
	        this.createBarChart('morris-bar-example1', $barData1, 'y', ['a'], ["매출액:"], ['#4fc6e1']);
	        this.createBarChart('morris-bar-example2', $barData2, 'y', ['a'], ["1인당 평균 결제금액"], ['#6658dd']);
	        this.createBarChart('morris-bar-example3', $barData3, 'y', ['a'], ["순 이익"], ['#1ABC9C']);
	        this.createBarChart('morris-bar-example4', $barData4, 'y', ['a', 'b', 'c', 'd', 'e'], ["1:","2:","3:","4:","5:"], ['#6658dd','#F672A7', '#1ABC9C','#F1556C','#4fc6e1']);
	        this.createBarChart('morris-bar-example5', $barData5, 'y', ['a', 'b', 'c','d','e'], ["상의", "하의", "아우터","신발","악세사리"], ['#6658dd','#4fc6e1', '#1ABC9C','#F1556C','#F672A7']);
	    },
	    //init
	    $.MorrisCharts = new MorrisCharts, $.MorrisCharts.Constructor = MorrisCharts
	}(window.jQuery),
	
	//initializing 
	function($) {
	    "use strict";
	    $.MorrisCharts.init();
	}(window.jQuery);
</script>
</html>