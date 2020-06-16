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

<div id='designSource3' >
	<div id='title' class="designSource3TextBox">
		<p id="1" class="designSource3Title">${mapT.key_0}</p>
		<div class="designSource3Space"></div>
		<p id="2" class="designSource3TextArea">${mapT.key_1} area</p>
		<div class="designSource3SubImgBox">
			<div class="designSource3SubImgSector"><img src="${mapT.key_2}" class=""/></div>
		</div>
	</div>
	<div class="designSource3MainImgBox">
		<div class="designSource3MainImgSector">
		<img src="${mapT.key_3}" class=""/>
		</div>
	</div>
</div>