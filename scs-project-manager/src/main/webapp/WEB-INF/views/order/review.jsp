<!DOCTYPE html>
<html lang="UTF-8">
<head>
   <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
        <title>리뷰 관리</title>
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
       
<script type="text/javascript">

var removeCheck = function(no) {
	if (confirm("정말 삭제하시겠습니까??") == true) {    //확인
	 	event.preventDefault();
		console.log(no);
			$.ajax({
				url: '${pageContext.request.contextPath }/${authUser.id}/api/order/review/delete/' + no,
				async: true,
				type: 'post',
				dataType: 'json',
				contentType: 'application/json',
				data: '',
				success: function(response){
					location.href= "${pageContext.request.contextPath }/${authUser.id}/order/review";
				},
				error: function(xhr, status, e){

					console.error(status + " : " + e);
		
				}
			});
	}
	else {   //취소
		event.preventDefault();
	    return;
	}
} 

$(function() {
	
	$(".reviewTd").on("click", function(){
		var no = $(this).attr("no");
		 
		window.open("${ pageContext.request.contextPath }/${authUser.id }/order/review/view/"+no, "review", "width=500, height=800, scrollbars=no");
	 });
	
	$('#review-search-option').change(function(){
		var option = $(this).val();
		
		if(option == 'rate') {
			$('#category-option').show();
			$('#review-input-box').hide();
		} else {
			$('#category-option').hide();
			$('#review-input-box').show();
		}
	});
});

</script>

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
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">주문 관리</a></li>
                                    <li class="breadcrumb-item active">리뷰 관리</li>
                                </ol>
                            </div>
                            <h4 class="page-title">리뷰 관리</h4>
                        </div>
                    </div>
                </div>     
                <!-- end page title -->

                <div class="row" >
                    <div class="col-sm-12" >
                        <div class="card-box" style="padding-bottom:50px" >

                            <div class="mb-2">
                                <div class="row">
                                
                                	<form action="${pageContext.servletContext.contextPath }/${authUser.id}/order/review">
                                    <div class="col-12 text-sm-center form-inline">
                                        <div class="form-group mr-2">
                                            <select id="review-search-option" class="custom-select custom-select-sm" name="op">
                                                <option value="name">상품이름</option>
                                                <option value="id">아이디</option>
                                                <option value="rate">별점</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input id="review-input-box" name="kwd" type="text" placeholder="Search" class="form-control form-control-sm" autocomplete="on">
                                        </div>
                                        <div>
                                        	<select id="category-option" name="kwd" class="custom-select custom-select-sm" style="display:none;">
                                        		<option value="5">5</option>
                                                <option value="4">4</option>
                                                <option value="3">3</option>
                                                <option value="2">2</option>
                                                <option value="1">1</option>
                                        	</select>
                                        </div>
                                        &nbsp;&nbsp;&nbsp;
                                        <div class="search-button">
                                            <button id="member-search-btn" class="btn btn-secondary btn-sm float-sm-right" type="submit"> 검색 </button>
                                        </div>
                                    </div>
                                    </form>
                                    
                                </div>
                            </div>

                            <table id="member-list-table" class="table table-striped mb-0">
                                <tr>
                                	<th>번호</th>
                                	<th>상품이름</th>
									<th>아이디</th>
									<th>제목</th>
									<th>작성일</th>
									<th>삭제</th>
                                </tr>
                                 <c:forEach items="${map.list }" var="vo" varStatus="status">
                                 	<tr>
                                 		<td>${status.count + (map.page - 1) * 5 }</td>
                                 		<td>${vo.itemName }</td>
                                 		<td>${vo.id }</td>
                                 		<td><button class="reviewTd" id="review${vo.no }" no="${vo.no }" style="border:none; background-color: rgba(0,0,0,0); ">
										  	${vo.title }</button>		
						  				</td>
                                 		<td>${vo.regDate }</td>
                                 		<td>
                                 			<a href="">
											<i id="delete-member-icon" onClick="removeCheck(${vo.no});" class="fe-x-square member-icon"></i></a>
                                 		</td>
                                 	</tr>
                                 </c:forEach>
                            </table>
                           <div style="padding-top:30px"></div>
                            <nav>
	                            <ul class="pagination pagination-rounded justify-content-center mb-3">
	                            <li class="page-item">
	                                <a class="page-link" href="${pageContext.servletContext.contextPath }/${authUser.id}/order/review?p=${map.prevPage}&op=${map.option }&kwd=${map.kwd}" aria-label="Previous">
	                                    <span aria-hidden="true">«</span>
	                                    <span class="sr-only">Previous</span>
	                                </a>
	                            </li>
	                            <c:forEach var="i" begin="1" end="${map.listsize }">
									<c:choose>
										<c:when test="${map.page == (map.beginPage+(i-1)) }">
											<li class ="page-item active">
												<a class="page-link" href="${pageContext.servletContext.contextPath }/${authUser.id}/order/review?p=${map.beginPage+(i-1) }&op=${map.option }&kwd=${map.kwd}">${map.beginPage+(i-1) }</a>
											</li>
										</c:when>
										<c:otherwise>
											<li><a class="page-link" href="${pageContext.servletContext.contextPath }/${authUser.id}/order/review?p=${map.beginPage+(i-1) }&op=${map.option }&kwd=${map.kwd}">${map.beginPage+(i-1) }</a></li>
										</c:otherwise>
									
									</c:choose>
								</c:forEach>
	                            <li>
	                                <a class="page-link" href="${pageContext.servletContext.contextPath }/${authUser.id}/order/review?p=${map.nextPage }&op=${map.option }&kwd=${map.kwd}" aria-label="Next">  
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

	<c:import url ='/WEB-INF/views/partials/script.jsp'/>
        
    </body>
</html>