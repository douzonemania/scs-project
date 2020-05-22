<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	
    <!-- Navigation Bar-->
    <header id="topnav">
        <!-- Topbar Start -->
	<div class="navbar-custom">
    <div class="container-fluid">
        <ul class="list-unstyled topnav-menu float-right mb-0">

            <li class="dropdown notification-list">
                <!-- Mobile menu toggle-->
                <a class="navbar-toggle nav-link">
                    <div class="lines">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </a>
                <!-- End mobile menu toggle-->
            </li>
           
    
            <li class="dropdown notification-list">
                <a class="nav-link dropdown-toggle nav-user mr-0 waves-effect" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <span class="pro-user-name ml-1">
                        ${authUser.id}님 안녕하세요<i class="mdi mdi-chevron-down"></i> 
                    </span>
                </a>
                <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                    <!-- item-->
                    <div class="dropdown-header noti-title">
                        <h6 class="text-overflow m-0">Welcome !</h6>
                    </div>
    
                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="fe-user"></i>
                        <span>My Account</span>
                    </a>
    
                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="fe-settings"></i>
                        <span>Settings</span>
                    </a>
    
                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="fe-lock"></i>
                        <span>Lock Screen</span>
                    </a>
    
                    <div class="dropdown-divider"></div>
    
                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="fe-log-out"></i>
                        <span>Logout</span>
                    </a>
    
                </div>
            </li>
    
            <li class="dropdown notification-list">
                <a href="javascript:void(0);" class="nav-link right-bar-toggle waves-effect">
                    <i class="fe-home noti-icon"></i>
                </a>
            </li>
    
        </ul>
    
        <!-- LOGO -->
        <div class="logo-box">
            <a href="index.html" class="logo text-center">
                <span class="logo-lg">
                    <img src="<%=request.getContextPath() %>/assets/images/logo-scs.png" alt="ìëíì¸ì" height="56">
                    <!-- <span class="logo-lg-text-light">UBold</span> -->
                </span>
                <span class="logo-sm">
                    <!-- <span class="logo-sm-text-dark">U</span> -->
                    <img src="<%=request.getContextPath() %>/assets/images/logo-scs.png" alt="" height="56">
                </span>
            </a>
        </div>
    
        
    </div> <!-- end container-fluid-->
</div>
<!-- end Topbar -->
        <div class="topbar-menu">
            <div class="container-fluid">
                <div id="navigation">
                    <!-- Navigation Menu-->
                    <ul class="navigation-menu">
        ​
                        <li class="has-submenu">
                            <a href="#">
                                <i class="fe-settings"></i>환경설정 <div class="arrow-down"></div></a>
                            <ul class="submenu">
                                <li>
                                    <a href="${pageContext.request.contextPath }/${ authUser.id }/setting/basic">쇼핑몰 기본설정</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath }/${authUser.id}/setting/policy">약관 및 정책 설정</a>
                                </li>
                            </ul>
                        </li>
        ​
                        <li class="has-submenu">
                            <a href="#">
                                <i class="fe-edit"></i>디자인<div class="arrow-down"></div></a>
                            <ul class="submenu">
                                <li>
                                    <a href="">메인 메뉴 관리</a>
                                </li>
                                <li>
                                    <a href="">서브 메뉴 관리</a>
                                </li>
                            </ul>
                        </li>
                
                        <li class="has-submenu">
                            <a href="#">
                                <i class="fe-gift"></i>상품관리<div class="arrow-down"></div></a>
                            <ul class="submenu">
                                <li>
                                    <a href="${pageContext.request.contextPath }/${ authUser.id }/product/info">상품 정보</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath }/${ authUser.id }/product/reg">상품 등록</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath }/${ authUser.id }/product/category-reg">카테고리 등록</a>
                                </li>
                            </ul>
                        </li>                   
        ​
                        <li class="has-submenu">
                            <a href="#"> <i class="fe-user"></i>회원관리 <div class="arrow-down"></div></a>
                            <ul class="submenu">
                                <li>
                                    <a href="${pageContext.request.contextPath }/${ authUser.id }/member/list">회원 관리</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath }/${ authUser.id }/member/send-mail">메일 발송</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath }/${ authUser.id }/member/board">문의 게시판 관리</a>
                                </li>  
                            </ul>
                        </li>            
                
                        <li class="has-submenu">
                            <a href="#"> <i class="fe-truck"></i>주문 관리 <div class="arrow-down"></div></a>
                                <ul class="submenu">
                                    <li>
                                        <a href="${pageContext.request.contextPath }/${ authUser.id }/order/delivery">주문/배송 관리</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath }/${ authUser.id }/order/settle">정산 관리</a>
                                    </li>                            
                                </ul>
                        </li>
                    <!-- End navigation menu -->
        ​
                    <div class="clearfix"></div>
                </div>
                <!-- end #navigation -->
            </div>
            <!-- end container -->
        </div>
        <!-- end navbar-custom -->