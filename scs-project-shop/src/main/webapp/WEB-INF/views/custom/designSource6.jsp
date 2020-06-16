<!DOCTYPE html>
<html lang="UTF-8">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


</script>
</head>

	<c:set var="mapT" value="<%=new java.util.HashMap()%>" />


<c:forEach var="test" varStatus="status" items="${param.map }">
	<c:choose>
		<c:when test="${status.index==0 }">
			<c:set target="${mapT}" property="key_${status.index }" value="${fn:substring(test,3,fn:length(test))}" />
		</c:when>
		<c:when test="${status.last }">
			<c:set target="${mapT}" property="key_${status.index }" value="${fn:substring(test,3,fn:length(test)-1)}" />
		</c:when>
		<c:otherwise>
			<c:set target="${mapT}" property="key_${status.index }" value="${fn:substring(test,3,fn:length(test))}" />
		</c:otherwise>
	</c:choose>	
</c:forEach>

<div id='designSource6'>
	<div class="designSource6ImgFrame">
		<div class="designSource6Imgbox">
			<div class="designSource6ImgSector">${mapT.key_0}</div>
			
			<div>
				<p class="designSource6Title" id="4">${mapT.key_3}</p>
				<p class="designSource6Text" id="7">${mapT.key_6}</p>
			</div>
		</div>
		<div class="designSource6Imgbox">
			<div class="designSource6ImgSector">${mapT.key_1}</div>
			
			<div>
				<p class="designSource6Title" id="5">${mapT.key_4}</p>
				<p class="designSource6Text" id="8">${mapT.key_7}</p>
			</div>
		</div>
		<div class="designSource6Imgbox">
			<div class="designSource6ImgSector">${mapT.key_2}</div>
			<div>
				<p class="designSource6Title" id="6">${mapT.key_5}</p>
				<p class="designSource6Text" id="9">${mapT.key_8}</p>
			</div>
		</div>
	</div>
</div>