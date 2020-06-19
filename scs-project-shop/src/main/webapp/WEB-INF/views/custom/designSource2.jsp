<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


	<div id="design-source1">
		<div >
			<div class='img-preview'><a href="${requestScope.map[3].content }"><img src="${requestScope.map[0].content }"/></a></div>
			<div class='img-preview'><a href="${requestScope.map[4].content }"><img src="${requestScope.map[1].content }"/></a></div>
			<div class='img-preview'><a href="${requestScope.map[5].content }"><img src="${requestScope.map[2].content }"/></a></div>
		</div>
	</div>
