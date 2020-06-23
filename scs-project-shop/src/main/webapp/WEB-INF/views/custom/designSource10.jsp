<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="design-source3">
	<div class="designSource10CardBox">
		<div class="designSource10Card">
			<p class="designSource10Title">${requestScope.map[0].content }</p>
			<p class="designSource10Text">${requestScope.map[1].content }</p>
			<p class="designSource10Text">${requestScope.map[2].content }</p>
		</div>
		<div class="designSource10Card">
			<p class="designSource10Title">${requestScope.map[3].content }</p>
			<p class="designSource10Text">${requestScope.map[4].content }</p>
			<p class="designSource10Text">${requestScope.map[5].content }</p>
		</div>
		<div class="designSource10Card">
			<p class="designSource10Title">${requestScope.map[6].content }</p>
			<p class="designSource10Text">${requestScope.map[7].content }</p>
			<p class="designSource10Text">${requestScope.map[8].content }</p>
		</div>
	</div>
</div>