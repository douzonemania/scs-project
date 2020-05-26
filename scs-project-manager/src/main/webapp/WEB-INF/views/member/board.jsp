<!DOCTYPE html>
<html lang="UTF-8">
<head>
   <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico">
        
        <!-- Sweet Alert-->
        <link href="<%=request.getContextPath() %>/assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />
       
        <!-- Plugins css -->
        <link href="<%=request.getContextPath() %>/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
       
        <link href="<%=request.getContextPath() %>/assets/libs/dropzone/dropzone.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
        
        <link href="<%=request.getContextPath() %>/assets/libs/jquery-nice-select/nice-select.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/switchery/switchery.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/multiselect/multi-select.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/select2/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/quill/quill.core.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/quill/quill.bubble.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/quill/quill.snow.css" rel="stylesheet" type="text/css" />

        <!-- third party css -->
        <link href="<%=request.getContextPath() %>/assets/libs/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/datatables/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/datatables/buttons.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/datatables/select.bootstrap4.css" rel="stylesheet" type="text/css" />
        <!-- third party css end -->

        <!-- App css -->
        <link href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/css/app.min.css" rel="stylesheet" type="text/css" />        
       
       
		<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/ejs/ejs.js"></script>
     
     	<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
		<script type="text/JavaScript"
		src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		
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
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">SCS</a></li>
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">회원관리</a></li>
                                    <li class="breadcrumb-item active">문의게시판 관리</li>
                                </ol>
                            </div>
                            <h4 class="page-title">문의게시판 관리</h4>
                        </div>
                    </div>
                </div>     
                <!-- end page title -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box" style="padding-bottom:50px">

                            <div class="mb-2">
                                <div class="row">
                                    <div class="col-12 text-sm-center form-inline">
                                        <div class="form-group mr-2">
                                            <select id="demo-foo-filter-status" class="custom-select custom-select-sm">
                                                <option value="id">아이디</option>
                                                <option value="email">이메일</option>
                                                <option value="phonenum">휴대폰번호</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input id="demo-foo-search" type="text" placeholder="Search" class="form-control form-control-sm" autocomplete="on">
                                        </div>
                                        &nbsp;&nbsp;&nbsp;
                                        <div class="search-button">
                                            <button class="btn btn-secondary btn-sm float-sm-right" type="submit"> 검색 </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <table class="table table-striped mb-0">
                                <thead>
                                <tr>
                                    <th>번호</th>
                                    <th data-sort-initial="true" data-toggle="true">제목</th>
                                    <th>이메일</th>
                                    <th data-hide="phone">성명</th>
                                    <th data-sort-ignore="true" data-hide="phone, tablet">작성일</th>
                                    <th data-sort-ignore="true" data-hide="phone, tablet">답글</th>
                                    <th data-sort-ignore="true" data-hide="phone, tablet">글삭제</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>문의드립니다.</td>
                                    <td>sjy8033@naver.com</td>
                                    <td>신정은</td>
                                    <td>2020-05-11</td>
                                    <td>
                                        <i class=' mdi mdi-message-text-outline member-icon'></i>
                                    </td>
                                    <td class="icon-wrap"><button type="button" class="btn btn-xs sa-warning"><i class="fe-x-square member-icon"></i></button></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td><i class='fe-corner-down-right member-icon'></i> 답변드립니다.</td>
                                    <td>sjy8033@naver.com</td>
                                    <td>신정은</td>
                                    <td>2020-05-11</td>
                                    <td>
                                        <i class=' mdi mdi-message-text-outline member-icon'></i>
                                    </td>
                                    <td class="icon-wrap"><button type="button" class="btn btn-xs sa-warning"><i class="fe-x-square member-icon"></i></button></td>
                                </tr>
                                </tbody>

                            </table>

							<nav>
	                            <ul class="pagination pagination-rounded justify-content-center mb-3">
		                            <li class="page-item">
		                                <a class="page-link" href="${pageContext.servletContext.contextPath }/${authUser.id}/member/list?p=${map.prevPage}&op=${map.option }&kwd=${map.kwd}" aria-label="Previous">
		                                    <span aria-hidden="true">«</span>
		                                    <span class="sr-only">Previous</span>
		                                </a>
		                            </li>
		                            <c:forEach var="i" begin="1" end="${map.listsize }">
										<c:choose>
											<c:when test="${map.page == (map.beginPage+(i-1)) }">
												<li class ="page-item active">
													<a class="page-link" href="${pageContext.servletContext.contextPath }/${authUser.id}/member/list?p=${map.beginPage+(i-1) }&op=${map.option }&kwd=${map.kwd}">${map.beginPage+(i-1) }</a>
												</li>
											</c:when>
											<c:otherwise>
												<li><a class="page-link" href="${pageContext.servletContext.contextPath }/${authUser.id}/member/list?p=${map.beginPage+(i-1) }&op=${map.option }&kwd=${map.kwd}">${map.beginPage+(i-1) }</a></li>
											</c:otherwise>
										
										</c:choose>
									</c:forEach>
		                            <li>
		                                <a class="page-link" href="${pageContext.servletContext.contextPath }/${authUser.id}/member/list?p=${map.nextPage }&op=${map.option }&kwd=${map.kwd}" aria-label="Next">  
		                                 	<span aria-hidden="true">»</span>
		                                    <span class="sr-only">Next</span>
		                                </a>
		                            </li>
	                        	</ul>
                        	</nav>
                            

                        </div> <!-- end card-box -->
                    </div> <!-- end col -->
                </div>
                <!-- end row -->


            
            </div> <!-- end container -->
        </div>
        <!-- end wrapper -->

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->
        
	<!-- Vendor js -->
	<script src="<%=request.getContextPath() %>/assets/js/vendor.min.js"></script>


	<script src="<%=request.getContextPath() %>/assets/libs/jquery-nice-select/jquery.nice-select.min.js"></script>
	<script src="<%=request.getContextPath() %>/assets/libs/switchery/switchery.min.js"></script>
	<script src="<%=request.getContextPath() %>/assets/libs/multiselect/jquery.multi-select.js"></script>
	<script src="<%=request.getContextPath() %>/assets/libs/select2/select2.min.js"></script>
	<script src="<%=request.getContextPath() %>/assets/libs/jquery-mockjax/jquery.mockjax.min.js"></script>
	<script src="<%=request.getContextPath() %>/assets/libs/autocomplete/jquery.autocomplete.min.js"></script>
	<script src="<%=request.getContextPath() %>/assets/libs/bootstrap-select/bootstrap-select.min.js"></script>
	<script	src="<%=request.getContextPath() %>/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
	<script	src="<%=request.getContextPath() %>/assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>

	<c:import url ='/WEB-INF/views/partials/script.jsp'/>
</body>
</html>