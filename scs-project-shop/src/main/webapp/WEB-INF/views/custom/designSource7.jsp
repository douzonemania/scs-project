<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div style="padding-top:30px;"/>
<div id='design-source1'>
	<div class="designSource7Textbox">
		<div class="designSource7Underline"></div>
	<h1 class="designSource7Title">${requestScope.map[0].content }</h1>
	<p class="designSource7TextArea">${requestScope.map[1].content }</p>
	<div class="designSource7Underline"></div>
	</div>
</div>