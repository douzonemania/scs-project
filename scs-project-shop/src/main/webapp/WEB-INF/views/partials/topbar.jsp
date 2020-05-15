<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- Topbar Start -->

<div class="shop-navbar-first">
	<ul>
		<li><a href="${pageContext.request.contextPath }/member/join">JOIN</a></li>
		<li>/</li>
		<li><a href="${pageContext.request.contextPath }/member/login">LOGIN</a></li>
	</ul>
</div>

<div class="shop-navbar-custom">
	<div class="container-fluid" style="display: flex;">

		<!-- LOGO -->
		<div class="logo-box">
			<a href="index.html" class="logo text-center"> <span
				class="logo-lg"> <img src="../assets/images/logo-scs.png"
					alt="안녕하세요" height="68"> <!-- <span class="logo-lg-text-light">UBold</span> -->
			</span> <span class="logo-sm"> <!-- <span class="logo-sm-text-dark">U</span> -->
					<img src="../assets/images/logo-sm.png" alt="" height="24">
			</span>
			</a>
		</div>



		<ul class="main-menu-group">
			<li><a href="#">NEW</a></li>
			<li><a href="#">BEST</a></li>
			<li><a href="#">SHOP</a></li>
			<li><a href="${pageContext.request.contextPath }/board/faq">FAQ</a></li>
			<li><a href="${pageContext.request.contextPath }/order/review">REVIEW</a></li>
		</ul>


		<ul class="sub-menu-group">
			<li>
				<a href="${pageContext.request.contextPath }/member/mypage">
					<i class="fe-user"></i>
				</a>
			</li>
			<li><i class="fe-search"></i></li>
			<li>
				<a href="${pageContext.request.contextPath }/order/cart">
					<i class="fe-shopping-cart"></i>
				</a>
			</li>
		</ul>
	</div>
	<!-- end container-fluid-->
</div>
<!-- end Topbar -->