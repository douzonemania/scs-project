<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div style="padding-top:30px;">

<div id='design-source1' >
	<div style="display:flex">
		<div  class="designSource3TextBox">
		<h1 class="designSource3Title">${requestScope.map[0].content }</h1>
		<div class="designSource3Space"></div>
		<p id="2" class="designSource3TextArea">${requestScope.map[1].content }</p>
	
		<div class="designSource3SubImgBox">
			<img src="${requestScope.map[2].content }" /> 
		</div>
	</div>
	<div class="designSource3MainImgBox">
		<img src="${requestScope.map[2].content }" /> 
	</div>
	</div>
</div>