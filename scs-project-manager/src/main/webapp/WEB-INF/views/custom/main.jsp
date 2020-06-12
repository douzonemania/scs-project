<!DOCTYPE html>
<html lang="UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="<%=request.getContextPath() %>/assets/css/custom.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div style="border:5px solid black; margin-top:5%">
		<c:import url='/WEB-INF/views/custom/designSource4.jsp'/>
	</div>
	
	<div style="border:5px solid black; margin-top:5%">
		<c:import url='/WEB-INF/views/custom/designSource3.jsp'/>
	</div>
	
	<div style="border:5px solid black; margin-top:5%">
		<c:import url='/WEB-INF/views/custom/designSource11.jsp'/>
	</div>
	
	<div style="border:5px solid black; margin-top:5%">
		<c:import url='/WEB-INF/views/custom/designSource9.jsp'/>
	</div>
	
	<div style="border:5px solid black; margin-top:5%">
		<c:import url='/WEB-INF/views/custom/designSource6.jsp'/>
	</div>
</body>
</html>