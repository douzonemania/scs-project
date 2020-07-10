<!DOCTYPE html>
<html lang="UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>


<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>


<head>
<meta charset="UTF-8">
<title>${ceoVo.siteName }</title>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath }/assets/css/custom.css"
	rel="stylesheet" type="text/css" />
</head>

<body>

	<div style="margin-top:50px;"></div>

 	<c:forEach var="vo" varStatus="status" items="${list}">
		<div style="border:5px solid black; margin-top:5%" id="${vo.no}">	
			 <c:import url='/WEB-INF/views/custom/${vo.designID }.jsp'>	
				<c:param name="map" value='${contentList.get(status.index) }'></c:param>
			</c:import>	 			
		</div>	
	</c:forEach> 
	
	
	
</body>
</html>