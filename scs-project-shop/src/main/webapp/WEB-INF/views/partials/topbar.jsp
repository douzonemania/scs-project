<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header id="topnav" style="background-color:#ffffff">
        <!-- Topbar Start -->
        <div class="navbar-custom shop-topbar-custom">
            <div class="container-fluid">

              
				 <div class="topbar-join-group float-right">
					<c:choose>
						<c:when test="${empty authUser }">
							<a href="${pageContext.request.contextPath }/${db }/member/join">JOIN</a>
							 <span>/</span>
							<a href="${pageContext.request.contextPath }/${db }/member/login">LOGIN</a>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath }/${db }/member/logout">LOGOUT</a>
						</c:otherwise>
					</c:choose>
	 			</div>


                <div class="dropdown notification-list">
                    <!-- Mobile menu toggle-->
                    <a class="navbar-toggle nav-link">
                        <div class="lines">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>

                        <div class="dropdown-menu">
                        
                    	    <c:forEach items="${cgList }" var="vo">
                                 	<a href="${pageContext.request.contextPath}/${db}/order/list?category=${vo.no}">${vo.name}</a>
                            </c:forEach>
                            
                        </div>
                    </a>
                    <!-- End mobile menu toggle-->
                </div>

                <ul class="list-unstyled topnav-menu float-right mb-0">

           
            		<!-- cart -->
                    <li class="dropdown notification-list">
                        <c:choose>
                        	<c:when test="${empty authUser }">
                        		<a class="nav-link dropdown-toggle waves-effect" href="${ pageContext.request.contextPath }/${db }/member/login" role="button" aria-haspopup="false" aria-expanded="false">
                        	   		 <i class="fe-shopping-cart noti-icon"></i>
                    		    </a>
                        	</c:when>
                        	<c:otherwise>
                        		<a class="nav-link dropdown-toggle waves-effect" href="${ pageContext.request.contextPath }${id }/${db }/order/cart" role="button" aria-haspopup="false" aria-expanded="false">
                        	   		 <i class="fe-shopping-cart noti-icon"></i>
                        	   		 <span class="badge badge-danger rounded-circle noti-icon-badge">${cartCnt}</span>
                    		    </a>
                        	</c:otherwise>
                        </c:choose>
                    </li>

                    <li class="dropdown notification-list">   
                        <c:choose>
						<c:when test="${empty authUser }">
							 <a class="nav-link dropdown-toggle waves-effect" href="${ pageContext.request.contextPath }/${db }/member/login" role="button" aria-haspopup="false" aria-expanded="false">
                            <span style="font-weight: bold;">MY</span>
                        </a>
						</c:when>
						<c:otherwise>
							 <a class="nav-link dropdown-toggle waves-effect" href="${ pageContext.request.contextPath }/${db }/member/mypage" role="button" aria-haspopup="false" aria-expanded="false">
                            <span style="font-weight: bold;">MY</span>
                        </a>
						</c:otherwise>
					</c:choose>
                    </li>

                </ul>
    
            
                <!-- LOGO -->
                <div class="logo-box">
                    <a href="index.html" class="logo text-center">
                        <span class="logo-lg">
                            <img src="/scs-manager/assets/scs-manager/images/20205245527500.png" alt="" style="max-height:64px; max-width:64px">
                            <!-- <span class="logo-lg-text-light">UBold</span> -->
                        </span>
                        <span class="logo-sm" style="margin-left: 120px;">
                            <!-- <span class="logo-sm-text-dark">U</span> -->
                            <img src="/scs-manager/assets/scs-manager/images/20205245527500.png" alt="" style="max-height:48px; max-width:48px">
                        </span>
                    </a>
                </div>
    
                <ul class="list-unstyled topnav-menu topnav-menu-left m-0 ">
            
                    <li class="dropdown d-none d-lg-block">
                        <a class="nav-link dropdown-toggle waves-effect topbar-nav-menu-custom text-dark"  data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            SHOP
                        </a>
                        <div class="dropdown-menu topbar-dropdown">
		                    <!-- item-->
		                    <a href="${pageContext.request.contextPath}/${db}/order/list?category=0" class="dropdown-item">
		                      <span>ALL</span>
		                    </a>
		                    <c:forEach items="${cgList }" var="vo">
                                 	<a class="dropdown-item" href="${pageContext.request.contextPath}/${db}/order/list?category=${vo.no}">${vo.name}</a>
                            </c:forEach>
		                    
		    			</div>
		    			
		    			
                    </li>
            
                    <c:if test="${not empty mainMenu.second }">
                    	<li class="dropdown d-none d-lg-block">
	                        <a class="nav-link dropdown-toggle waves-effect topbar-nav-menu-custom text-dark" 
	                        href="${pageContext.request.contextPath}/${db}/custom/${mainMenu.second}" 
	                        role="button">
	                            ${mainMenu.second}
	                        </a>
                   		 </li>
                    </c:if>
                    
                    
                    <c:if test="${not empty mainMenu.third }">
                    	<li class="dropdown d-none d-lg-block">
	                        <a class="nav-link dropdown-toggle waves-effect topbar-nav-menu-custom text-dark" 
	                        href="${pageContext.request.contextPath}/${db}/custom/${mainMenu.third}" 
	                        role="button">
	                            ${mainMenu.third}
	                        </a>
                   		 </li>
                    </c:if>
                    
                    
                    <c:if test="${not empty mainMenu.fourth }">
                    	<li class="dropdown d-none d-lg-block">
	                        <a class="nav-link dropdown-toggle waves-effect topbar-nav-menu-custom text-dark" 
	                        href="${pageContext.request.contextPath}/${db}/custom/${mainMenu.fourth}" 
	                        role="button">
	                            ${mainMenu.fourth}
	                        </a>
                   		 </li>
                    </c:if>
                    
                    
                    <c:if test="${not empty mainMenu.fifth }">
                    	<li class="dropdown d-none d-lg-block">
	                        <a class="nav-link dropdown-toggle waves-effect topbar-nav-menu-custom text-dark" 
	                        href="${pageContext.request.contextPath}/${db}/custom/${mainMenu.fifth}" 
	                        role="button" >
	                            ${mainMenu.fifth}
	                        </a>
                   		 </li>
                    </c:if>
                    
           
                </ul>
            </div> <!-- end container-fluid-->
        </div>
        <!-- end Topbar -->
        <div class="topbar-menu">
            <div class="container-fluid">
                <div id="navigation">
                    <!-- Navigation Menu-->
                    <ul class="navigation-menu">

                        <li class="has-submenu">
                            <a href="#" style="margin-left: 10px;">SHOP <div class="arrow-down"></div></a>
                            <ul class="submenu">
                               	<c:forEach items="${cgList }" var="vo">
                               		<li>
                                 	   <a href="${pageContext.request.contextPath}/${db}/order/list?category=${vo.no}">${vo.name}</a>
                               		</li>
                               	</c:forEach>
                               
                               
                            </ul>
                        </li>
						 <c:if test="${not empty mainMenu.second }">
	                        <li class="has-submenu">
	                            <a href="${pageContext.request.contextPath}/${db}/custom/${mainMenu.second}" style="margin-left: 10px">  ${mainMenu.second}</a>
	                        </li>
                        </c:if>
                        <c:if test="${not empty mainMenu.third}">
	                        <li class="has-submenu">
	                            <a href="${pageContext.request.contextPath}/${db}/custom/${mainMenu.third}" style="margin-left: 10px">  ${mainMenu.third}</a>
	                        </li>
                        </c:if>
                        <c:if test="${not empty mainMenu.fourth}">
	                        <li class="has-submenu">
	                            <a href="${pageContext.request.contextPath}/${db}/custom/${mainMenu.fourth}" style="margin-left: 10px">  ${mainMenu.fourth}</a>
	                        </li>
                        </c:if>
                        <c:if test="${not empty mainMenu.fifth}">
	                        <li class="has-submenu">
	                            <a href="${pageContext.request.contextPath}/${db}/custom/${mainMenu.fifth}" style="margin-left: 10px">  ${mainMenu.fifth}</a>
	                        </li>
                        </c:if>
                        <c:forEach var="vo" varStatus="status" items="${subMenuList}">
				 			<c:if test="${status.index>1 }">
	              				<li class="has-submenu">
	              					<a href ="${ pageContext.request.contextPath }/${db }/custom/${vo.no}" style="margin-left: 10px">${vo.name }</a>
	              				</li>
	             		 	</c:if>
	      				 </c:forEach> 
                        
                        	
                    </ul>
                    <!-- End navigation menu -->

                    <div class="clearfix"></div>
                </div>
                <!-- end #navigation -->
            </div>
            <!-- end container -->
        </div>
        <!-- end navbar-custom -->
    </header>
