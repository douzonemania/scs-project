<!DOCTYPE html>
<html lang="UTF-8">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<title>상품 통계</title>
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
 
</head>
<body>
<div class="wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card-box" dir="ltr">
                            <h5 class="header-title mb-3">일별 통계</h5>
                            <div class="text-center">
                                <p class="text-muted font-15 font-family-secondary mb-0">
                                    <span class="mx-2"><i class="mdi mdi-checkbox-blank-circle text-blue"></i>&nbsp;${iVo.name }</span>
                                </p>
                            </div>
                            <div id="morris-line-example" style="height: 350px;" class="morris-chart"></div>
                        </div> <!-- card-box -->
                    </div> <!-- end row -->
                </div>
                <!-- end row -->
            </div> <!-- end container -->
        </div>
        <!-- end wrapper -->
        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>
        

        <c:import url ='/WEB-INF/views/partials/script.jsp'/>
</body>
<script>
	var a = "${list.get(6).date}";
	var b = "${list.get(5).date}";
	var c = "${list.get(4).date}";
	var d = "${list.get(3).date}";
	var e = "${list.get(2).date}";
	var f = "${list.get(1).date}";
	var g = "${list.get(0).date}";
	var a2 = ${list.get(6).count};
	var b2 = ${list.get(5).count};
	var c2 = ${list.get(4).count};
	var d2 = ${list.get(3).count};
	var e2 = ${list.get(2).count};
	var f2 = ${list.get(1).count};
	var g2 = ${list.get(0).count};

	!function($) {
	    "use strict";
	    var MorrisCharts = function() {};
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
	          pointSize: 0,
	          preUnits: '',
	          resize: true, //defaulted to true
	          lineColors: lineColors
	        });
	    },

	    MorrisCharts.prototype.init = function() {


	        //create line chart
	        var $data  = [
	        	// period 형식: 'yyyy-mm-dd', a 형식: int값 
	            { period: a+'', a: a2},
	            { period: b+'', a: b2},
	            { period: c+'', a: c2},
	            { period: d+'', a: d2},
	            { period: e+'', a: e2},
	            { period: f+'', a: f2},
	            { period: g+'', a: g2}
	          ];
	        this.createLineChart('morris-line-example', $data, 'period', ['a'], ["count"],['0.1'],['#ffffff'],['#999999'], ['#4A81D4']);

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