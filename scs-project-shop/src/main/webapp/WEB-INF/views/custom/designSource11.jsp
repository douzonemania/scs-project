<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div style="padding-top:30px;"/>
<div class='design-source3'>
	<div class="designSource11ImageBox">
		<div class="designSource11ImgSector">
			<img src="${requestScope.map[0].content }" /> 
		</div>
		<div class="designSource11TextBox">
			<p class="designSource11Text">${requestScope.map[1].content }</p>
		</div>
	</div>
</div>
