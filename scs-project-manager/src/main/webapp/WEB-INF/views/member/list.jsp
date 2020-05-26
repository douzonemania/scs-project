<!DOCTYPE html>
<html lang="UTF-8">
<head>
   <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
        <title>회원 설정</title>
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
var listTemplate = new EJS({
	url: "${pageContext.request.contextPath }/assets/js/ejs/member-list.ejs"
});

var list = function() {
	
		$.ajax({
			url: '${pageContext.request.contextPath }/${authUser.id}/api/member/list',
			async: true,
			type: 'get',
			dataType: 'json',
			data: '',
			success: function(response) {
				if(response.result != "success") {
					console.error(response.message);
					return;
				}
				response.contextPath = "${ pageContext.request.contextPath }";
				response.id = "${authUser.id}";
				var html = listTemplate.render(response);
				$("#member-list-table").append(html);
			},
			error: function(xhr, status, e) {
				console.error(status + ":" + e);
			}
		});
}


var searchOption = function() {
	var langSelect = document.getElementById("member-search-option");
    
    // select element에서 선택된 option의 value가 저장된다.
    var selectValue = langSelect.options[langSelect.selectedIndex].value;
	console.log()
    return selectValue;
}

/* $(function() {
	$(document).on('click','#member-search-btn',function(event) {
		event.preventDefault();

		var selectOption = searchOption();
		var input = document.getElementById("member-input-box").value;
		
		
	});

	
	list();

}); */

/* var removeCheck = function() {
if (confirm("정말 삭제하시겠습니까??") == true) {    //확인
	 console.log("네네네");
	 event.preventDefault();
		var no = $(this).data('no');
		
			$.ajax({
				url: '${pageContext.request.contextPath }/${authUser.id}/admin/api/category/delete/' + no,
				async: true,
				type: 'delete',
				dataType: 'json',
				data: '',
				success: function(response) {

					console.log(tdCount+":"+trCount);

					if(response.data != -1){
				          console.log(response.data);
				            
							var tdCount = $('.admin-cat').find('tr td').length;
							var trCount = $('.admin-cat').find('tr').length;
							
							for(var i = tdCount - 5, j = 1; i >= 0; i -= 5, j++) {
								console.log(i, $('.admin-cat tr td')[i]);
								if($('.admin-cat tr td')[i].innerText == j) {
									continue;
								} else {
									console.log("find: " + $('.admin-cat tr td')[i].innerText);
									$('.admin-cat tr td')[i].innerText = j;
								}
							}
				          
				          return;
				    }

					
				},
				error: function(xhr, status, e) {
					console.error(status + ":" + e);
				}
			});
}
else {   //취소
	 console.log("아니오오오오");
	 event.preventDefault();
    return;
}
} */

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
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">회원관리</a></li>
                                    <li class="breadcrumb-item active">회원 관리</li>
                                </ol>
                            </div>
                            <h4 class="page-title">회원 관리</h4>
                        </div>
                    </div>
                </div>     
                <!-- end page title -->

                <div class="row" >
                    <div class="col-sm-12" >
                        <div class="card-box" style="padding-bottom:50px" >

                            <div class="mb-2">
                                <div class="row">
                                
                                	<form action="${pageContext.servletContext.contextPath }/${authUser.id}/member/list">
                                    <div class="col-12 text-sm-center form-inline">
                                        <div class="form-group mr-2">
                                            <select id="member-search-option" class="custom-select custom-select-sm" name="op">
                                                <option value="id">아이디</option>
                                                <option value="email">이메일</option>
                                                <option value="phonenum">휴대폰번호</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input id="member-input-box" name="kwd" type="text" placeholder="Search" class="form-control form-control-sm" autocomplete="on">
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
									<th>아이디</th>
									<th>이메일</th>
									<th>성명</th>
									<th>휴대폰번호</th>
									<th>탈퇴</th>
									<th>메일발송</th>
                                </tr>
                                 <c:forEach items="${map.list }" var="vo" varStatus="status">
                                 	<tr>
                                 		<td>${status.count + (map.page - 1) * 5 }</td>
                                 		<td>${vo.id }</td>
                                 		<td>${vo.email }</td>
                                 		<td>${vo.name }</td>
                                 		<td>${vo.phoneNumber }</td>
                                 		<td>
                                 			<a href="">
											<i id="delete-member-icon" onClick="removeCheck();" class="fe-x-square member-icon"></i></a>
                                 		</td>
                                 		<td>
                                 			<a href="${pageContext.servletContext.contextPath }/${authUser.id}/member/email/${vo.no}">
									        <i id="email-member-icon" class="fe-mail member-icon custom-email-icon"></i></a>
                                 		</td>
                                 	</tr>
                                 </c:forEach>
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

	<c:import url ='/WEB-INF/views/partials/script.jsp'/>
        
    </body>
</html>