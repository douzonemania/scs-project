<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- Footer Start -->
<div style="padding-top: 300px;"></div>
<footer class="footer">
    <div class="container-fluid">
        <div class="footer-wrapper">
            <div class="footer-logo">
                <img src="<%=request.getContextPath() %>/assets/images/logo-scs.png" alt="안녕하세요" height="112"/>
           </div>
           
        <div class="footer-contents">
            <span class="span-bold footer-span-custom">대표자명</span>
            <span class="footer-span-custom">${ceoVo.name }</span>
            <span class="span-bold footer-span-custom">회사명</span>
            <span class="footer-span-custom">${ceoVo.companyName }</span>
           
            <span class="span-bold footer-span-custom">대표번호</span>
            <span class="footer-span-custom">${ceoVo.phoneNumber }</span>
            <br/>
            <span class="span-bold footer-span-custom">주소</span>
            <span class="footer-span-custom">${ceoVo.address }</span>
            <br/>
            <span class="span-bold custom-display-inline-block">사업자등록번호</span>
           <span class="custom-display-inline-block">${ceoVo.coNumber }</span>
           <br/>
           <span class="span-bold custom-display-inline-block">통신판매신고번호</span>
           <span class="custom-display-inline-block">${ceoVo.cmNumber }</span>
        </div>
        
    </div>
</footer>
<!-- end Footer -->