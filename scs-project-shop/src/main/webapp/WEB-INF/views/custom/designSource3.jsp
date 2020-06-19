<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

<div id='design-source1' >
	<div  class="designSource3TextBox">
		<h1 class="designSource3Title">tes1t</h1>
		<div class="designSource3Space"></div>
		<p id="2" class="designSource3TextArea">tes1t</br></br></br>t1est</p>
		<div class="designSource3SubImgBox">
			<img src="${mapT.key_2}" class=""/>
		</div>
	</div>
	<div class="designSource3MainImgBox">
		<img src="${mapT.key_3}" class=""/>
	</div>
</div>