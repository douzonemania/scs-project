<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
		<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	        
        <title>SCS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="<%=request.getContextPath() %>/assets/images/favicon.ico">

        <!-- Plugins css -->
        <link href="<%=request.getContextPath() %>/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />

        <!-- App css -->
        <link href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/css/app.min.css" rel="stylesheet" type="text/css" />

    </head>

    <body>

        <header>
			<!-- horizontal-nav -->  	
        <c:import url ='/WEB-INF/views/partials/horizontal-nav.jsp'/>
    	</header>
		<!-- footer -->
    	<c:import url ='/WEB-INF/views/partials/footer.jsp'/>

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->

        <div class="wrapper">
            <div class="container-fluid"> 

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <div class="page-title-right">
                                
                            </div>
                            <h4 class="page-title" style="font-weight: bold">관리자페이지 메인입니다.</h4>
                        </div>
                    </div>
                </div>     
                <!-- end page title --> 
                <div class="row">
                	
                    <div class="col-md-6 col-xl-6">
                        <div class="widget-rounded-circle card-box">
                            <div class="row">
                                <div class="col-6">
                                    <div class="avatar-lg rounded-circle bg-primary">
                                        <i class="fe-dollar-sign font-22 avatar-title text-white"></i>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="text-right">
                                        <h4 class="text-dark mt-1"><span data-plugin="counterup" style="font-size:20px; padding-right:5px; color:#6658DD;">${map.totalRevenue }</span>원</h4>
                                        <p class="text-muted mb-1 text-truncate">총 수익</p>
                                    </div>
                                </div>
                            </div> <!-- end row-->
                        </div> <!-- end widget-rounded-circle-->
                    </div> <!-- end col-->

                    <div class="col-md-6 col-xl-6">
                        <div class="widget-rounded-circle card-box">
                            <div class="row">
                                <div class="col-6">
                                    <div class="avatar-lg rounded-circle bg-primary">
                                        <i class="fe-bar-chart-2 font-22 avatar-title text-white"></i>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="text-right">
                                        <h6 class="text-dark mt-1"><span data-plugin="counterup" style="font-size:20px; padding-right:5px; color:#6658DD;">${map.sales }</span>개</h6>
                                        <p class="text-muted mb-1 text-truncate">총 판매량</p>
                                    </div>
                                </div>
                            </div> <!-- end row-->
                        </div> <!-- end widget-rounded-circle-->
                    </div> <!-- end col-->
                </div>
                <!-- end row-->
				
                <div class="row">
                        <div class="col-md-2 col-xl-2" >
	                        <div class="widget-rounded-circle card-box">
	                            <div class="row">	                                
                            		<div class="col-6">
	                                    <div class="avatar-lg rounded-circle bg-warning">
	                                        <i class="mdi mdi-rocket font-22 avatar-title text-white"></i>
	                                    </div>
	                                </div>
	                                <div class="col-6">
	                                    <div class="text-right">
	                                        <h6 class="text-dark mt-1"><span data-plugin="counterup" style="font-size:20px; padding-right:5px; color:#F7B84B;">${map.vo.get(1) }</span>건</h6>
	                                        <p class="text-muted mb-1 text-truncate">입금완료</p>
	                                    </div>
	                                </div> <!-- end col -->
	                        	</div> <!-- end row -->
	                   		</div> <!-- end widget-rounded-circle-->
                        </div> <!--  end col-md, col-xl -->
                        <div class="col-md-2 col-xl-2" >
	                        <div class="widget-rounded-circle card-box">
	                            <div class="row">	                                
                            		<div class="col-6">
	                                    <div class="avatar-lg rounded-circle bg-warning">
	                                        <i class="fe-truck font-22 avatar-title text-white"></i>
	                                    </div>
	                                </div>
	                                <div class="col-6">
	                                    <div class="text-right">
	                                        <h6 class="text-dark mt-1"><span data-plugin="counterup" style="font-size:20px; padding-right:5px; color:#F7B84B;">${map.vo.get(2) }</span>건</h6>
	                                        <p class="text-muted mb-1 text-truncate">배송준비중</p>
	                                    </div>
	                                </div> <!-- end col -->
	                        	</div> <!-- end row -->
	                   		</div> <!-- end widget-rounded-circle-->
                        </div> <!--  end col-md, col-xl -->
                        <div class="col-md-3 col-xl-4" >
	                        <div class="widget-rounded-circle card-box">
	                            <div class="row">	                                
                            		<div class="col-6">
	                                    <div class="avatar-lg rounded-circle bg-success">
	                                        <i class="fe-users font-22 avatar-title text-white"></i>
	                                    </div>
	                                </div>
	                                <div class="col-6">
	                                    <div class="text-right">
	                                        <h6 class="text-dark mt-1"><span data-plugin="counterup" style="font-size:20px; padding-right:5px; color:#1ABC9C;">${map.vo.get(0) }</span>건</h6>
	                                        <p class="text-muted mb-1 text-truncate">주문완료</p>
	                                    </div>
	                                </div> <!-- end col -->
	                        	</div> <!-- end row -->
	                   		</div> <!-- end widget-rounded-circle-->
                        </div> <!--  end col-md, col-xl -->
                        <div class="col-md-2 col-xl-2" >
	                        <div class="widget-rounded-circle card-box">
	                            <div class="row">	                                
                            		<div class="col-6">
	                                    <div class="avatar-lg rounded-circle bg-danger border">
	                                        <i class="mdi mdi-emoticon-devil font-22 avatar-title text-white"></i>
	                                    </div>
	                                </div>
	                                <div class="col-6">
	                                    <div class="text-right">
	                                        <h6 class="text-dark mt-1"><span data-plugin="counterup" style="font-size:20px; padding-right:5px; color:#F1556C;">${map.vo.get(5) }</span>건</h6>
	                                        <p class="text-muted mb-1 text-truncate">취소처리중</p>
	                                    </div>
	                                </div> <!-- end col -->
	                        	</div> <!-- end row -->
	                   		</div> <!-- end widget-rounded-circle-->
                        </div> <!--  end col-md, col-xl -->
                        <div class="col-md-2 col-xl-2" >
	                        <div class="widget-rounded-circle card-box">
	                            <div class="row">	                                
                            		<div class="col-6">
	                                    <div class="avatar-lg rounded-circle bg-danger border">
	                                        <i class="mdi mdi-emoticon-devil font-22 avatar-title text-white"></i>
	                                    </div>
	                                </div>
	                                <div class="col-6">
	                                    <div class="text-right">
	                                        <h6 class="text-dark mt-1"><span data-plugin="counterup" style="font-size:20px; padding-right:5px; color:#F1556C;">${map.vo.get(6) }</span>건</h6>
	                                        <p class="text-muted mb-1 text-truncate">교환처리중</p>
	                                    </div>
	                                </div> <!-- end col -->
	                        	</div> <!-- end row -->
	                   		</div> <!-- end widget-rounded-circle-->
                        </div> <!--  end col-md, col-xl -->
                </div> <!-- end row -->
                <div class="row">
                        <div class="col-md-2 col-xl-2" >
	                        <div class="widget-rounded-circle card-box">
	                            <div class="row">	                                
                            		<div class="col-6">
	                                    <div class="avatar-lg rounded-circle bg-warning">
	                                        <i class="fe-truck font-22 avatar-title text-white"></i>
	                                    </div>
	                                </div>
	                                <div class="col-6">
	                                    <div class="text-right">
	                                        <h6 class="text-dark mt-1"><span data-plugin="counterup" style="font-size:20px; padding-right:5px; color:#F7B84B;">${map.vo.get(3) }</span>건</h6>
	                                        <p class="text-muted mb-1 text-truncate">배송중</p>
	                                    </div>
	                                </div> <!-- end col -->
	                        	</div> <!-- end row -->
	                   		</div> <!-- end widget-rounded-circle-->
                        </div> <!--  end col-md, col-xl -->
                        <div class="col-md-2 col-xl-2" >
	                        <div class="widget-rounded-circle card-box">
	                            <div class="row">	                                
                            		<div class="col-6">
	                                    <div class="avatar-lg rounded-circle bg-warning">
	                                        <i class="fe-truck font-22 avatar-title text-white"></i>
	                                    </div>
	                                </div>
	                                <div class="col-6">
	                                    <div class="text-right">
	                                        <h6 class="text-dark mt-1"><span data-plugin="counterup" style="font-size:20px; padding-right:5px; color:#F7B84B;">${map.vo.get(4) }</span>건</h6>
	                                        <p class="text-muted mb-1 text-truncate">배송완료</p>
	                                    </div>
	                                </div> <!-- end col -->
	                        	</div> <!-- end row -->
	                   		</div> <!-- end widget-rounded-circle-->
                        </div> <!--  end col-md, col-xl -->
                        <div class="col-md-3 col-xl-4" >
	                        <div class="widget-rounded-circle card-box">
	                            <div class="row">	                                
                            		<div class="col-6">
	                                    <div class="avatar-lg rounded-circle bg-success">
	                                        <i class="fe-users font-22 avatar-title text-white"></i>
	                                    </div>
	                                </div>
	                                <div class="col-6">
	                                    <div class="text-right">
	                                        <h6 class="text-dark mt-1"><span data-plugin="counterup" style="font-size:20px; padding-right:5px; color:#1ABC9C;">${map.vo.get(8) }</span>건</h6>
	                                        <p class="text-muted mb-1 text-truncate">처리완료</p>
	                                    </div>
	                                </div> <!-- end col -->
	                        	</div> <!-- end row -->
	                   		</div> <!-- end widget-rounded-circle-->
                        </div> <!--  end col-md, col-xl -->
                        <div class="col-md-2 col-xl-2" >
	                        <div class="widget-rounded-circle card-box">
	                            <div class="row">	                                
                            		<div class="col-6">
	                                    <div class="avatar-lg rounded-circle bg-danger border">
	                                        <i class="mdi mdi-emoticon-devil font-22 avatar-title text-white"></i>
	                                    </div>
	                                </div>
	                                <div class="col-6">
	                                    <div class="text-right">
	                                        <h6 class="text-dark mt-1"><span data-plugin="counterup" style="font-size:20px; padding-right:5px; color:#F1556C;">${map.vo.get(7) }</span>건</h6>
	                                        <p class="text-muted mb-1 text-truncate">환불처리중</p>
	                                    </div>
	                                </div> <!-- end col -->
	                        	</div> <!-- end row -->
	                   		</div> <!-- end widget-rounded-circle-->
                        </div> <!--  end col-md, col-xl -->
                </div> <!-- end row -->               
                
                <div class="row">
                    <div class="col-xl-6">
                        <div class="card-box">
                            <h4 class="header-title mb-3" style="font-weight: bold">상품 문의게시판</h4>

                            <div class="table-responsive">
                                <table class="table table-borderless table-hover table-centered m-0">

                                    <thead class="thead-light">
                                        <tr>
                                        	<th>번호</th>
                                            <th style="width: 200px;">제목</th>
                                            <th>아이디</th>
                                            <th>작성일</th>
                                            <th>답글</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <c:forEach items="${map.productList }" var="vo" varStatus="status">
		                                	<tr>
		                                		<td>${status.count }</td>
		                                		<td> 
		                                			<a style="color:#6C757D;"
														href="${ pageContext.request.contextPath }/${authUser.id}/product/board/view/${ vo.no }">${vo.title }</a>
												</td>
		                                		<td>${vo.id }</td>
		                                		<td>${vo.regDate }</td>
		                                		
		                                		<c:choose>
		                                			<c:when test="${ vo.replyState  == false }">
			                                			<td>
			                                			<a href="${pageContext.servletContext.contextPath }/${authUser.id}/product/board/reply/${ vo.no }">
															<i class='mdi mdi-message-text-outline member-icon'></i></a>
														</td>
		                                			</c:when>
		                                			<c:otherwise>
		                                				<td>
		                                					<i class='mdi mdi-read text-outline member-icon'></i>
		                                				</td>
		                                			</c:otherwise>
		                                		</c:choose>
		                                	</tr>
										</c:forEach> 

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div> <!-- end col -->
                    <div class="col-xl-6">
                        <div class="card-box">
                            <h4 class="header-title mb-3" style="font-weight: bold">일반 문의게시판</h4>
							<div class="table-responsive">
                                <table class="table table-borderless table-hover table-centered m-0">

                                    <thead class="thead-light">
                                        <tr>
                                        	<th>번호</th>
                                            <th>카테고리</th>
                                            <th style="width: 150px;">제목</th>
                                            <th>아이디</th>
                                            <th>작성일</th>
                                            <th>답글</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${map.normalList }" var="vo" varStatus="status">
		                                	<tr>
		                                		<td>${status.count }</td>
												<td>${vo.category }</td>
												<td> 
		                                			<a style="color:#6C757D;"
														href="${ pageContext.request.contextPath }/${authUser.id}/product/board/view/${ vo.no }">${vo.title }</a>
												</td>
		                                		<td>${vo.id }</td>
		                                		<td>${vo.regDate }</td>
		                                		
		                                		<c:choose>
		                                			<c:when test="${ vo.replyState  == false }">
			                                			<td>
			                                			<a href="${pageContext.servletContext.contextPath }/${authUser.id}/product/board/reply/${ vo.no }">
															<i class='mdi mdi-message-text-outline member-icon'></i></a>
														</td>
		                                			</c:when>
		                                			<c:otherwise>
		                                				<td>
		                                					<i class='mdi mdi-read text-outline member-icon'></i>
		                                				</td>
		                                			</c:otherwise>
		                                		</c:choose>
		                                	</tr>
										</c:forEach> 

                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div> <!-- end col -->

                </div>
                <!-- end row -->
                
            </div> <!-- end container -->
        </div>
        <!-- end wrapper -->

        <!-- ============================================================== -->
        <!-- End Page content -->
        <!-- ============================================================== -->

        <!-- Footer Start -->
        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        since2020 &copy; Smart Custom Store by DouzoneMania
                    </div>           
                </div>
            </div>
        </footer>
        <!-- end Footer -->


        <!-- Right Sidebar -->
        <div class="right-bar">
            <div class="rightbar-title">
                <a href="javascript:void(0);" class="right-bar-toggle float-right">
                    <i class="dripicons-cross noti-icon"></i>
                </a>
                <h5 class="m-0 text-white">Settings</h5>
            </div>
            <div class="slimscroll-menu rightbar-content">
                <!-- User box -->
                <div class="user-box">
                    <div class="user-img">
                        <img src="<%=request.getContextPath() %>/assets/images/users/user-1.jpg" alt="user-img" title="Mat Helme" class="rounded-circle img-fluid">
                        <a href="javascript:void(0);" class="user-edit"><i class="mdi mdi-pencil"></i></a>
                    </div>
            
                    <h5><a href="javascript: void(0);">Geneva Kennedy</a> </h5>
                    <p class="text-muted mb-0"><small>Admin Head</small></p>
                </div>

                <!-- Settings -->
                <hr class="mt-0" />
                <h5 class="pl-3">Basic Settings</h5>
                <hr class="mb-0" />

                <div class="p-3">
                    <div class="checkbox checkbox-primary mb-2">
                        <input id="Rcheckbox1" type="checkbox" checked>
                        <label for="Rcheckbox1">
                            Notifications
                        </label>
                    </div>
                    <div class="checkbox checkbox-primary mb-2">
                        <input id="Rcheckbox2" type="checkbox" checked>
                        <label for="Rcheckbox2">
                            API Access
                        </label>
                    </div>
                    <div class="checkbox checkbox-primary mb-2">
                        <input id="Rcheckbox3" type="checkbox">
                        <label for="Rcheckbox3">
                            Auto Updates
                        </label>
                    </div>
                    <div class="checkbox checkbox-primary mb-2">
                        <input id="Rcheckbox4" type="checkbox" checked>
                        <label for="Rcheckbox4">
                            Online Status
                        </label>
                    </div>
                    <div class="checkbox checkbox-primary mb-0">
                        <input id="Rcheckbox5" type="checkbox" checked>
                        <label for="Rcheckbox5">
                            Auto Payout
                        </label>
                    </div>
                </div>

                <!-- Timeline -->
                <hr class="mt-0" />
                <h5 class="pl-3 pr-3">Messages <span class="float-right badge badge-pill badge-danger">25</span></h5>
                <hr class="mb-0" />
                <div class="p-3">
                    <div class="inbox-widget">
                        <div class="inbox-item">
                            <div class="inbox-item-img"><img src="<%=request.getContextPath() %>/assets/images/users/user-2.jpg" class="rounded-circle" alt=""></div>
                            <p class="inbox-item-author"><a href="javascript: void(0);" class="text-dark">Tomaslau</a></p>
                            <p class="inbox-item-text">I've finished it! See you so...</p>
                        </div>
                        <div class="inbox-item">
                            <div class="inbox-item-img"><img src="<%=request.getContextPath() %>/assets/images/users/user-3.jpg" class="rounded-circle" alt=""></div>
                            <p class="inbox-item-author"><a href="javascript: void(0);" class="text-dark">Stillnotdavid</a></p>
                            <p class="inbox-item-text">This theme is awesome!</p>
                        </div>
                        <div class="inbox-item">
                            <div class="inbox-item-img"><img src="<%=request.getContextPath() %>/assets/images/users/user-4.jpg" class="rounded-circle" alt=""></div>
                            <p class="inbox-item-author"><a href="javascript: void(0);" class="text-dark">Kurafire</a></p>
                            <p class="inbox-item-text">Nice to meet you</p>
                        </div>

                        <div class="inbox-item">
                            <div class="inbox-item-img"><img src="<%=request.getContextPath() %>/assets/images/users/user-5.jpg" class="rounded-circle" alt=""></div>
                            <p class="inbox-item-author"><a href="javascript: void(0);" class="text-dark">Shahedk</a></p>
                            <p class="inbox-item-text">Hey! there I'm available...</p>
                        </div>
                        <div class="inbox-item">
                            <div class="inbox-item-img"><img src="<%=request.getContextPath() %>/assets/images/users/user-6.jpg" class="rounded-circle" alt=""></div>
                            <p class="inbox-item-author"><a href="javascript: void(0);" class="text-dark">Adhamdannaway</a></p>
                            <p class="inbox-item-text">This theme is awesome!</p>
                        </div>
                    </div> <!-- end inbox-widget -->
                </div> <!-- end .p-3-->

            </div> <!-- end slimscroll-menu-->
        </div>
        <!-- /Right-bar -->

        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>

        <!-- Vendor js -->
        <script src="<%=request.getContextPath() %>/assets/js/vendor.min.js"></script>

        <!-- Plugins js-->
        <script src="<%=request.getContextPath() %>/assets/libs/flatpickr/flatpickr.min.js"></script>
        <script src="<%=request.getContextPath() %>/assets/libs/jquery-knob/jquery.knob.min.js"></script>
        <script src="<%=request.getContextPath() %>/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
        <script src="<%=request.getContextPath() %>/assets/libs/flot-charts/jquery.flot.js"></script>
        <script src="<%=request.getContextPath() %>/assets/libs/flot-charts/jquery.flot.resize.js"></script>
        <script src="<%=request.getContextPath() %>/assets/libs/flot-charts/jquery.flot.time.js"></script>
        <script src="<%=request.getContextPath() %>/assets/libs/flot-charts/jquery.flot.tooltip.min.js"></script>
        <script src="<%=request.getContextPath() %>/assets/libs/flot-charts/jquery.flot.selection.js"></script>
        <script src="<%=request.getContextPath() %>/assets/libs/flot-charts/jquery.flot.crosshair.js"></script>

        <!-- Dashboar 1 init js-->
        <script src="<%=request.getContextPath() %>/assets/js/pages/dashboard-1.init.js"></script>

        <!-- App js-->
        <script src="<%=request.getContextPath() %>/assets/js/app.min.js"></script>
        
    </body>
</html>