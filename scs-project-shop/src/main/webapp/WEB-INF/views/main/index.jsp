<!DOCTYPE html>
<html lang="en">
    <head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="${ pageContext.request.contextPath }/assets/images/favicon.ico">

        <!-- Plugins css -->
        <link href="${ pageContext.request.contextPath }/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />

        <!-- App css -->
        <link href="${ pageContext.request.contextPath }/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${ pageContext.request.contextPath }/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="${ pageContext.request.contextPath }/assets/css/app.min.css" rel="stylesheet" type="text/css" />
		 <link href="${ pageContext.request.contextPath }/assets/css/custom.css" rel="stylesheet" type="text/css" />
		
    </head>

    <body>

     	<c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import>
     	<c:import url="/WEB-INF/views/partials/left-nav.jsp"></c:import>	
     
     	<div class="wrapper2">
     		<div class="container-fluid">
     			<%-- <c:forEach var="vo" varStatus="status" items="${list}">
					<div id="${vo.no}">"${contentList.get(status.index) }"
					 <c:import url='/WEB-INF/views/custom/${vo.designID }.jsp'>	
						<c:param name="map" value='${contentList.get(status.index) }'></c:param>
					</c:import>	 			
				</div>	
				</c:forEach>  --%>	
					<%-- <c:set var="map" value="${contentsList.get(4) }" scope="request"/>  --%>
					<jsp:include page='/WEB-INF/views/custom/designSource1.jsp'/>

					<jsp:include page='/WEB-INF/views/custom/designSource2.jsp'/>
					<div style="margin:30px">
					<jsp:include page='/WEB-INF/views/custom/designSource3.jsp'/>
					</div>
					<div style="margin:30px">
					<jsp:include page='/WEB-INF/views/custom/designSource4.jsp'/>
					</div>
					<div style="margin:30px">
					<jsp:include page='/WEB-INF/views/custom/designSource6.jsp'/>
					</div>
					<div style="margin:30px">
					<jsp:include page='/WEB-INF/views/custom/designSource7.jsp'/>
					</div>
					<div style="margin:30px">
					<jsp:include page='/WEB-INF/views/custom/designSource8.jsp'/>
					</div>
					<div style="margin:30px">
					<jsp:include page='/WEB-INF/views/custom/designSource9.jsp'/>
					</div>
					<div style="margin:30px">
					<jsp:include page='/WEB-INF/views/custom/designSource10.jsp'/>
					</div>
					<div style="margin:30px">
					<jsp:include page='/WEB-INF/views/custom/designSource11.jsp'/>
					</div> 
     		</div>
     	</div>
     
     
        <!-- Vendor js -->
        <script src="${ pageContext.request.contextPath }/assets/js/vendor.min.js"></script>

        <!-- Plugins js-->
        <script src="${ pageContext.request.contextPath }/assets/libs/flatpickr/flatpickr.min.js"></script>
        <script src="${ pageContext.request.contextPath }/assets/libs/jquery-knob/jquery.knob.min.js"></script>
        <script src="${ pageContext.request.contextPath }/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
        <script src="${ pageContext.request.contextPath }/assets/libs/flot-charts/jquery.flot.js"></script>
        <script src="${ pageContext.request.contextPath }/assets/libs/flot-charts/jquery.flot.resize.js"></script>
        <script src="${ pageContext.request.contextPath }/assets/libs/flot-charts/jquery.flot.time.js"></script>
        <script src="${ pageContext.request.contextPath }/assets/libs/flot-charts/jquery.flot.tooltip.min.js"></script>
        <script src="${ pageContext.request.contextPath }/assets/libs/flot-charts/jquery.flot.selection.js"></script>
        <script src="${ pageContext.request.contextPath }/assets/libs/flot-charts/jquery.flot.crosshair.js"></script>

        <!-- Dashboar 1 init js-->
        <script src="${ pageContext.request.contextPath }/assets/js/pages/dashboard-1.init.js"></script>

        <!-- App js-->
        <script src="${ pageContext.request.contextPath }/assets/js/app.min.js"></script>
        
    </body>
</html>