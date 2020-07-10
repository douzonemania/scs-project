<!DOCTYPE html>
<html lang="en">
    <head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <title>${ceoVo.siteName }</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

		<link rel="shortcut icon" href="/scs-manager${favicon }">

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
   				<div style="padding-top:100px;"/>
         		<c:forEach var="vo" varStatus="status" items="${list}">
					<div id="${vo.no}" >
					<c:set var="map" value="${contentsList.get(status.index) }" scope="request"/>
					 <jsp:include page='/WEB-INF/views/custom/${vo.designID}.jsp'/>	
					</div>	
				</c:forEach> 
				
     		</div>
     	</div>
     
       <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        
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

		<c:import url="/WEB-INF/views/partials/footer.jsp"></c:import>

        <!-- Dashboar 1 init js-->
        <script src="${ pageContext.request.contextPath }/assets/js/pages/dashboard-1.init.js"></script>

        <!-- App js-->
        <script src="${ pageContext.request.contextPath }/assets/js/app.min.js"></script>
        
    </body>
</html>