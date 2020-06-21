<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


	<div class="design-source1">
		<div class="textBox">
			<span class='first-input'>${requestScope.map[1].content }TEST1번 입니다</span>
			<div style='border:1px solid #cecece; margin-top:10px'></div>
			<span class='second-input'>${requestScope.map[2].content }TEST1번 입니다</span>
			<span class='second-input'>${requestScope.map[3].content }TEST1번 입니다</span>
		</div>
		<div class="imageBox">
			<div class="imgSector">
				<%-- <img src="${requestScope.map[0].content }"/> --%>
				<img src="/scs-shop/assets/images/sampleimg/1.PNG"/>
			</div>
		</div>
	</div>
