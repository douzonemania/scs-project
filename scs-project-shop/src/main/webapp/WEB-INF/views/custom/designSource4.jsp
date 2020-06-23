<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div id='design-source1'>
	<div class="designSource4TextBox">
		<p class="designSource4Title">${requestScope.map[0].content }</p>
		<p class="designSource4Content">${requestScope.map[1].content }</p>
	</div>
	<div class="designSource4Space"></div>
	<div class="designSource4ImgSector">
		<img src="${requestScope.map[2].content }"/>
	</div>
</div>
