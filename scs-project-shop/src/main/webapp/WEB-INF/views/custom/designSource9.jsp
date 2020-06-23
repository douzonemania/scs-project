<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div style="padding-top:30px;">
<div id="design-source1" style="width:100%; backgroun-color:${requestScope.map[3].content };">

			<div class="designSource9TextBox" >
			<p class="designSource9Title" >${requestScope.map[1].content }</p>
			<p class="designSource9TextArea">${requestScope.map[2].content }</p>
		</div>
		<div class="designSource9ImgSector">
		<%-- <img src=${requestScope.map[0].content }> --%>
		<img src="/scs-shop/assets/images/sampleimg/11.PNG"/>
		</div>
		</div>
</div>