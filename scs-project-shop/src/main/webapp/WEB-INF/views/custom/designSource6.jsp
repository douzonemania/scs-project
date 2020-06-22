<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div id='design-source4'>
	<div class="designSource6ImgFrame">
	
		 <div>
            <div class="borderStyle"></div>
            <div style="display:inline-block; width:25%"><h1 class="titleStyle">${requestScope.map[9].content }WHAT'S NEW</h1></div>
            <div class="borderStyle"></div>
       	 </div>
		<div class="designSource6Imgbox">
			<div class="designSource6ImgSector"><%-- <img src="${requestScope.map[0].content }"> --%><img src="/scs-shop/assets/images/sampleimg/7.PNG"/></div>
			<div>
				<p class="designSource6Title">${requestScope.map[3].content }TEST</p>
				<p class="designSource6Text" >${requestScope.map[6].content }TEST</p>
			</div>
		</div>
		<div class="designSource6Imgbox">
			<div class="designSource6ImgSector"><%-- <img src="${requestScope.map[0].content }"> --%><img src="/scs-shop/assets/images/sampleimg/8.PNG"/></div>
			
			<div>
				<p class="designSource6Title">${requestScope.map[4].content }TEST</p>
				<p class="designSource6Text" >${requestScope.map[7].content }TEST</p>
			</div>
		</div>
		<div class="designSource6Imgbox">
			<div class="designSource6ImgSector"><%-- <img src="${requestScope.map[0].content }"> --%><img src="/scs-shop/assets/images/sampleimg/9.PNG"/></div>
			<div>
				<p class="designSource6Title">${requestScope.map[5].content }TEST</p>
				<p class="designSource6Text" >${requestScope.map[8].content }TEST</p>
			</div>
		</div>
	</div>
</div>