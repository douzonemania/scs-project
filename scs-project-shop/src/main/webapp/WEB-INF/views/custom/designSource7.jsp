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








<div id='designSource7'>
	<div class="designSource7Underline"></div>
	<div class="designSource7Textbox">
	<p id="1" class="designSource7Title">${mapT.key_0}</p>
	<textarea id="2" class="designSource7TextArea">${mapT.key_1}</textarea>
	</div>
</div>