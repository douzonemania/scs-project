<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<html lang="UTF-8">
<head>
<meta charset="utf-8" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title></title>


<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- Plugins css -->
<link href="assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet"
	type="text/css" />

<!-- App css -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="assets/css/app.min.css" rel="stylesheet" type="text/css" />
<link href="${ pageContext.request.contextPath }/assets/css/design-leftbar.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div style="padding-top: 109px;">
	<div class="left-nav float-left" style="height:2150px;">
		<div class = "menuGroup">
		
			<ul style=" margin-top:200px">				
				 <c:forEach var="vo" varStatus="status" items="${subMenuList}">
				 	<c:if test="${status.index>1 }">
	              		<li><a href ="${ pageContext.request.contextPath }/${db }/custom/${vo.no}">
	              			<button class="subButton" value="${vo.no }">${vo.name }</button>
	              			</a></li>
	              	</c:if>
	      		 </c:forEach>  
			</ul>
			  
		</div>


	</div>
</div>
</body>
</html>