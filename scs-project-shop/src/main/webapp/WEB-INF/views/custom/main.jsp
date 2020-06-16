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
<%-- 	
	<div style="border:5px solid black; margin-top:5%">
		<c:import url='/WEB-INF/views/custom/designSource7.jsp'>
			<c:param name="id" value="test"></c:param>
			 <c:param name="ids" value="${contentsList.get(0).getContent() }"></c:param>  
			<c:param name="list" value="${contentsList }"></c:param>
		</c:import>
	</div>
	<div style="border:5px solid black; margin-top:5%">
		<c:import url='/WEB-INF/views/custom/designSource8.jsp'/>
	</div>
	
	<div style="border:5px solid black; margin-top:5%">
		<c:import url='/WEB-INF/views/custom/designSource9.jsp'/>
	</div>
	
	<div style="border:5px solid black; margin-top:5%">
		<c:import url='/WEB-INF/views/custom/designSource10.jsp'/>
	</div>
	
	<div style="border:5px solid black; margin-top:5%">
		<c:import url='/WEB-INF/views/custom/designSource6.jsp'/>
	</div> --%>	
	
	--${contentList.get(0)["1"]}--
	--${contentList.get(0)["2"]}--
	==${contentList.get(2).size()}==

 	<c:forEach var="vo" varStatus="status" items="${list}">
		<div style="border:5px solid black; margin-top:5%" id="${vo.no}">	
			
			 <c:import url='/WEB-INF/views/custom/${vo.designID }.jsp'>	
				
				<c:param name="map" value='${contentList.get(status.index) }'></c:param>
				
			</c:import>	 
					
		<%-- <c:url var="urlWithQueryString" value="/WEB-INF/views/custom/designSource7.jsp">
		    <c:forEach var="thisParam" varStatus = "status" items="${contentList}">
		        <c:param name="${status.index}">${thisParam.get(status.index)}</c:param>
		    </c:forEach>
		</c:url>
		
		<c:import url="${urlWithQueryString}"/> --%>
			
		</div>	
		
		
		

	</c:forEach> 
</body>
</html>