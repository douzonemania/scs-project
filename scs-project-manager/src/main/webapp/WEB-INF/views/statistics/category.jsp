<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ page import="java.util.*"%>
	<%@ page import="java.text.SimpleDateFormat"%>
        <title>카테고리 별 통계</title>
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
        <!-- C3 Chart css -->
        <link href="<%=request.getContextPath() %>/assets/libs/c3/c3.min.css" rel="stylesheet" type="text/css" />
        
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

	$.ajax({
		url: '<%=request.getContextPath() %>/${authUser.id}/api/statistics/category',
		async: true,
		type: 'get',
		dataType: 'json',
		contentType: 'application/json',
		data: { "startDate": startDate, "endDate": endDate },
		success: function(response){

			console.log(response.data);
			location.href="<%=request.getContextPath() %>/${authUser.id}/statistics/category?startDate="+startDate+"&endDate="+endDate;
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
								<li class="breadcrumb-item active">카테고리 별</li>
							</ol>
						</div>
						<h4 class="page-title">카테고리 별 통계</h4>
					</div>
				</div>
			</div>
			<!-- end row -->
			<div class="row">
                    <div class="col-lg-6">
                        <div class="card-box" dir="ltr">
                            <h4 class="header-title mb-3">카테고리별 TOP 5 구매건수</h4>
                            <div id="morris-donut-example" style="height: 350px;" class="morris-chart"></div>
                            <div class="text-center">
                                <p class="text-muted font-15 font-family-secondary mb-0">
                                	<c:forEach var="list" items="${map.donutList }" varStatus="status">
                                    	<span class="mx-2"><i class="mdi mdi-checkbox-blank-circle ${map.temp.get(status.index) }"></i>${list.categoryName }</span>
                                    </c:forEach>
                                </p>
                            </div>
                        </div> <!-- end card-box-->
                    </div> <!-- end col-->

                    <div class="col-lg-6">
                        <div class="card-box" dir="ltr">
                            <h4 class="header-title mb-3">카테고리별 TOP 5 일간 매출</h4>
                            <div class="text-center">
                                <p class="text-muted font-15 font-family-secondary mb-0">
                                	<c:forEach var="list" items="${map.categoryList }" varStatus="status">
                                    	 <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle ${map.temp.get(status.index) }">${list.name }</i></span>                                    
                                   	 </c:forEach>                             
                                 </p>
                            </div>
                            <div id="morris-bar-example" style="height: 350px;" class="morris-chart"></div>
                        </div> <!-- end card-box-->
                    </div> <!-- end col-->
                </div>
                <!-- end row -->
                <div class="row">
				<div class="col-12">
					<div class="page-title-box">
						<div class="page-title-right">
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
					</div>
				</div>
				  
					  
			</div>
                
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card-box" dir="ltr">
                            <h4 class="header-title mb-3">Total 구매건수와 매출</h4>
                            <div class="text-center">
                                <p class="text-muted font-15 font-family-secondary mb-0">
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-blue"></i> 구매 건수</span>
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-pink"></i> 매출</span>
                                </p>
                            </div>
                            <div id="morris-line-example" style="height: 350px;" class="morris-chart"></div>
                        </div> <!-- card-box -->
                    </div> <!-- end row -->
                </div>
                <!-- End row -->

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

	var a = "${map.donutList.get(0).categoryName}";
	var b = "${map.donutList.get(1).categoryName}";
	var c = "${map.donutList.get(2).categoryName}";

	var a2 = ${map.donutList.get(0).count};
	var b2 = ${map.donutList.get(1).count};
	var c2 = ${map.donutList.get(2).count};
	
	// 0 이 최근, 6이 일주일전
	var barDataTop1TotalPrice1 = ${map.dateList1.get(6).totalPrice};
	var barDataTop1TotalPrice2 = ${map.dateList1.get(5).totalPrice};
	var barDataTop1TotalPrice3 = ${map.dateList1.get(4).totalPrice};
	var barDataTop1TotalPrice4 = ${map.dateList1.get(3).totalPrice};
	var barDataTop1TotalPrice5 = ${map.dateList1.get(2).totalPrice};
	var barDataTop1TotalPrice6 = ${map.dateList1.get(1).totalPrice};
	var barDataTop1TotalPrice7 = ${map.dateList1.get(0).totalPrice};
	
	var barDataTop2TotalPrice1 = ${map.dateList2.get(6).totalPrice};
	var barDataTop2TotalPrice2 = ${map.dateList2.get(5).totalPrice};
	var barDataTop2TotalPrice3 = ${map.dateList2.get(4).totalPrice};
	var barDataTop2TotalPrice4 = ${map.dateList2.get(3).totalPrice};
	var barDataTop2TotalPrice5 = ${map.dateList2.get(2).totalPrice};
	var barDataTop2TotalPrice6 = ${map.dateList2.get(1).totalPrice};
	var barDataTop2TotalPrice7 = ${map.dateList2.get(0).totalPrice};

	var barDataTop3TotalPrice1 = ${map.dateList3.get(6).totalPrice};
	var barDataTop3TotalPrice2 = ${map.dateList3.get(5).totalPrice};
	var barDataTop3TotalPrice3 = ${map.dateList3.get(4).totalPrice};
	var barDataTop3TotalPrice4 = ${map.dateList3.get(3).totalPrice};
	var barDataTop3TotalPrice5 = ${map.dateList3.get(2).totalPrice};
	var barDataTop3TotalPrice6 = ${map.dateList3.get(1).totalPrice};
	var barDataTop3TotalPrice7 = ${map.dateList3.get(0).totalPrice};
	
	var barDataTop4TotalPrice1 = ${map.dateList4.get(6).totalPrice};
	var barDataTop4TotalPrice2 = ${map.dateList4.get(5).totalPrice};
	var barDataTop4TotalPrice3 = ${map.dateList4.get(4).totalPrice};
	var barDataTop4TotalPrice4 = ${map.dateList4.get(3).totalPrice};
	var barDataTop4TotalPrice5 = ${map.dateList4.get(2).totalPrice};
	var barDataTop4TotalPrice6 = ${map.dateList4.get(1).totalPrice};
	var barDataTop4TotalPrice7 = ${map.dateList4.get(0).totalPrice};
	
	var barDataTop5TotalPrice1 = ${map.dateList5.get(6).totalPrice};
	var barDataTop5TotalPrice2 = ${map.dateList5.get(5).totalPrice};
	var barDataTop5TotalPrice3 = ${map.dateList5.get(4).totalPrice};
	var barDataTop5TotalPrice4 = ${map.dateList5.get(3).totalPrice};
	var barDataTop5TotalPrice5 = ${map.dateList5.get(2).totalPrice};
	var barDataTop5TotalPrice6 = ${map.dateList5.get(1).totalPrice};
	var barDataTop5TotalPrice7 = ${map.dateList5.get(0).totalPrice};
	
	var date1 = "${map.dateList1.get(6).date}";
	var date2 = "${map.dateList1.get(5).date}";
	var date3 = "${map.dateList1.get(4).date}";
	var date4 = "${map.dateList1.get(3).date}";	
	var date5 = "${map.dateList1.get(2).date}";
	var date6 = "${map.dateList1.get(1).date}";
	var date7 = "${map.dateList1.get(0).date}";
	
	var lineDataCount1 = ${map.countLineList.get(6).count};
	var lineDataCount2 = ${map.countLineList.get(5).count};
	var lineDataCount3 = ${map.countLineList.get(4).count};
	var lineDataCount4 = ${map.countLineList.get(3).count};
	var lineDataCount5 = ${map.countLineList.get(2).count};
	var lineDataCount6 = ${map.countLineList.get(1).count};
	var lineDataCount7 = ${map.countLineList.get(0).count};
	
	var lineDataPrice1 = ${map.salesLineList.get(6).totalPrice};
	var lineDataPrice2 = ${map.salesLineList.get(5).totalPrice};
	var lineDataPrice3 = ${map.salesLineList.get(4).totalPrice};
	var lineDataPrice4 = ${map.salesLineList.get(3).totalPrice};
	var lineDataPrice5 = ${map.salesLineList.get(2).totalPrice};
	var lineDataPrice6 = ${map.salesLineList.get(1).totalPrice};
	var lineDataPrice7 = ${map.salesLineList.get(0).totalPrice};
	
	
	
	
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
		            barSizeRatio: 0.4,
		            xLabelAngle: 35,
		            barColors: lineColors
		        });
		    },
		    //creates line chart
		    MorrisCharts.prototype.createLineChart = function(element, data, xkey, ykeys, labels, opacity, Pfillcolor, Pstockcolor, lineColors) {
		        Morris.Line({
		          element: element,
		          data: data,
		          xkey: xkey,
		          ykeys: ykeys,
		          labels: labels,
		          fillOpacity: opacity,
		          pointFillColors: Pfillcolor,
		          pointStrokeColors: Pstockcolor,
		          behaveLikeLine: true,
		          gridLineColor: '#eef0f2',
		          hideHover: 'auto',
		          lineWidth: '3px',
		          pointSize: 5,
		          preUnits: '',
		          resize: true, //defaulted to true
		          lineColors: lineColors
		        });
		    },
		        
		    //creates Donut chart
		    MorrisCharts.prototype.createDonutChart = function(element, data, colors) {
		        Morris.Donut({
		            element: element,
		            data: data,
		            barSize: 0.2,
		            resize: true, //defaulted to true
		            colors: colors
		        });
		    },
		    MorrisCharts.prototype.init = function() {
		       //creating bar chart
		        var $barData  = [
		            { y: date1+'', a: barDataTop1TotalPrice1, b: barDataTop2TotalPrice1 , c: barDataTop3TotalPrice1, d: barDataTop4TotalPrice1, e: barDataTop5TotalPrice1},
		            { y: date2+'', a: barDataTop1TotalPrice2, b: barDataTop2TotalPrice2 , c: barDataTop3TotalPrice2, d: barDataTop4TotalPrice2, e: barDataTop5TotalPrice2},
		            { y: date3+'', a: barDataTop1TotalPrice3, b: barDataTop2TotalPrice3 , c: barDataTop3TotalPrice3, d: barDataTop4TotalPrice3, e: barDataTop5TotalPrice3},
		            { y: date4+'', a: barDataTop1TotalPrice4, b: barDataTop2TotalPrice4 , c: barDataTop3TotalPrice4, d: barDataTop4TotalPrice4, e: barDataTop5TotalPrice4},
		            { y: date5+'', a: barDataTop1TotalPrice5, b: barDataTop2TotalPrice5 , c: barDataTop3TotalPrice5, d: barDataTop4TotalPrice5, e: barDataTop5TotalPrice5},
		            { y: date6+'', a: barDataTop1TotalPrice6, b: barDataTop2TotalPrice6 , c: barDataTop3TotalPrice6, d: barDataTop4TotalPrice6, e: barDataTop5TotalPrice6}
		        ];
		        this.createBarChart('morris-bar-example', $barData, 'y', ['a', 'b', 'c','d','e'], ["1", "2", "3", "4", "5"], ['#6658dd','#4fc6e1', '#1ABC9C','#F1556C','#F672A7']);
		
		
		        //creating donut chart
		        var $donutData = [
		                {label: a+"", value: a2},
		                {label: b+"", value: b2},
		                {label: c+"", value: c2}
		            ];
		        this.createDonutChart('morris-donut-example', $donutData, ['#4fc6e1','#6658dd', '#1ABC9C','#F1556C','#F672A7']);
		        
		      //create line chart
		        var $data  = [
		        	// y: 일자, a:구매건수, b:매출max
		            { y: date1+'', a: lineDataCount1, b: lineDataPrice1},
		            { y: date2+'', a: lineDataCount2, b: lineDataPrice2},
		            { y: date3+'', a: lineDataCount3, b: lineDataPrice3},
		            { y: date4+'', a: lineDataCount4, b: lineDataPrice4},
		            { y: date5+'', a: lineDataCount5, b: lineDataPrice5},
		            { y: date6+'', a: lineDataCount6, b: lineDataPrice6}
		          ];
		        this.createLineChart('morris-line-example', $data, 'y', ['a', 'b'], ["최대 구매 건수:"	, "최대 매출: "],['0.5'],['#ffffff'],['#999999'], ['#4a81d4', '#f672a7']);

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