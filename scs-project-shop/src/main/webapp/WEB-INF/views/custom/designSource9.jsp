<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<style>
	.bg-group{width:90%; height: 300px; background-color:${requestScope.map[3].content}}
	@media(max-width:991px){.bg-group{height:160px;}}
</style>

<div style="padding-top:30px;"/>
	<div class="design-source1 bg-group">
		
			<div class="designSource9TextBox"  >
				<p class="designSource9Title" >${requestScope.map[1].content }</p>
				<p class="designSource9TextArea">${requestScope.map[2].content }</p>
			</div>
			<div class="designSource9ImgSector">
				<img src=${requestScope.map[0].content }>
			</div>
		
	</div>
