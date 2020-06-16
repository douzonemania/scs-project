<!DOCTYPE html>
<html lang="UTF-8">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script type="text/javascript">

</script>

</head>

	<c:set var="mapT" value="<%=new java.util.HashMap()%>" />


<c:forEach var="test" varStatus="status" items="${param.map }">
	${test }</br>
	<c:choose>
	
		<c:when test="${status.index==0 }">
			<c:set target="${mapT}" property="key_${status.index }" value="${fn:substring(test,4,fn:length(test))}" />
		</c:when>
		<c:when test="${status.last }">
			<c:set target="${mapT}" property="key_${status.index }" value="${fn:substring(test,4,fn:length(test)-1)}" />
		</c:when>
		
		<c:when test="${status.index==10 }">
			<c:set target="${mapT}" property="key_${status.index }" value="${fn:substring(test,4,fn:length(test)-1)}" />
		</c:when>
		<c:otherwise>
			<c:set target="${mapT}" property="key_${status.index }" value="${fn:substring(test,3,fn:length(test))}" />
		</c:otherwise>
	</c:choose>	
</c:forEach>
<div>
	${param.map }
</div>

<div id="designSource10">
	<div class="designSource10CardBox" style="background-color:${mapT.key_0 } ">
		<div class="designSource10Card" style="background-color:${mapT.key_10 }">
			<p id="1" class="designSource10Title">${mapT.key_1}</p>
			<p id="2" class="designSource10Text">${mapT.key_2}</p>
			<p id="3" class="designSource10Text">${mapT.key_3}</p>
		</div>
		<div class="designSource10Card"	style="background-color:${mapT.key_10 }">
			<p id="4" class="designSource10Title">${mapT.key_4}</p>
			<p id="5" class="designSource10Text">${mapT.key_5}</p>
			<p id="6" class="designSource10Text">${mapT.key_6}</p>
		</div>
		<div class="designSource10Card"	style="background-color:${mapT.key_10 }">
			<p id="7" class="designSource10Title">${mapT.key_7}</p>
			<p id="8" class="designSource10Text">${mapT.key_8}</p>
			<p id="9" class="designSource10Text">${mapT.key_9}</p>
		</div>
	</div>
</div>