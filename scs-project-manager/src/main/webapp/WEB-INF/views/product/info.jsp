<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico">
       
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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
	$('.btn-del').click(function(){
		alert('삭제되었습니다.')
	});
});
</script>       

</head>
<body>

	<header>
		<!-- horizontal-nav -->
		<c:import url='/WEB-INF/views/partials/horizontal-nav.jsp' />
	</header>
	<!-- footer -->
	<c:import url='/WEB-INF/views/partials/footer.jsp' />

	<!-- ============================================================== -->
	<!-- Start Page Content here -->
	<!-- ============================================================== -->



	<div class="wrapper">
		<div class="container-fluid">

			<div class="row">
				<div class="col-12">
					<div class="page-title-box">
						<div class="page-title-right">
							<ol class="breadcrumb m-0">
								<li class="breadcrumb-item"><a href="javascript: void(0);">SCS</a></li>
								<li class="breadcrumb-item"><a href="javascript: void(0);">상품</a></li>
								<li class="breadcrumb-item active">상품정보</li>
							</ol>
						</div>
						<h4 class="page-title">상품정보</h4>
					</div>
				</div>
			</div>

			<!-- Search-form 시작 -->
<!-- 			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body" id="search-form" style="margin-top:0">
								
				<div class="col-12">
					<div class="page-title-box" id="search-form-text" >
						<h4 class="page-title" style="margin:0">상품 검색</h4>
					</div>
				</div>
					<select class="btn btn-secondary lg" data-style="selectBox-light">
						<option>상품코드</option>
						<option>상품명</option>
						<option>상품노출여부</option>
						<option>카테고리</option>
					</select> <input type="text" id="search_text" class="form-control">
					<button class="ladda-button btn btn-secondary waves-effect"
					data-style="zoom-in">검색</button>
						</div>
					</div>
				</div>
			</div> -->
			<!-- Search-form 종료 -->

			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
						
									<!-- 상품리스트 시작 -->
			
				<!-- <div class="col-12">
					<div class="page-title-box">
						<h4 class="page-title">상품 리스트</h4>
					</div>
				</div> -->
			
			<!-- 상품리스트 종료 -->

							<div class="table-responsive">
							
							        <form action="${pageContext.servletContext.contextPath }/${authUser.id}/product/info">
                                    <div class="col-12 text-sm-center form-inline"  style="padding-bottom:12px">
                                        <div class="form-group mr-2">
                                            <select id="member-search-option" class="custom-select custom-select-sm" name="op">
                                                <option value="code">상품코드</option>
                                                <option value="name">상품명</option>
                                                <option value="isVisible">상품노출여부</option>
                                                <option value="category">카테고리</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input id="search-text" name="kwd" type="text" placeholder="Search" class="form-control form-control-sm" autocomplete="on">
                                        </div>
                                        &nbsp;&nbsp;&nbsp;
                                        <div class="search-button">
                                            <button id="info-search-btn" class="btn btn-secondary btn-sm float-sm-right" type="submit"> 검색 </button>
                                        </div>
                                    </div>
                                    </form>
								<table class="table table-striped table-centered "
									id="products-datatable">

									<colgroup>
										<col width="60">
										<col width="70">
										<col width="100">
										<col width="200">
										<col width="160">
										<col width="230">
										<col width="110">
										<col width="100">
										<col width="130">
										<col width="30">
									</colgroup>
									<!-- 상품리스트 테이블 열 너비-->

									<thead>
										<tr>
											<th style="width: 20px;">
												<div class="custom-control custom-checkbox">
													<input type="checkbox" class="custom-control-input"
														id="customCheck1"> <label
														class="custom-control-label " for="customCheck1">&nbsp;</label>
												</div>
											</th>
											<th>NO</th>
											<th>노출여부</th>
											<th>상품코드</th>
											<th>이미지</th>
											<th>상품명</th>
											<th>판매가</th>
											<th>재고량</th>
											<th>등록일</th>
											<th style="width: 60px;">관리</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="vo" varStatus="status" items="${itemList }">										
										<tr>
											<td>
												<div class="custom-control custom-checkbox">
													<input type="checkbox" class="custom-control-input"
														id="customCheck1"> <label
														class="custom-control-label" for="customCheck1">&nbsp;</label>
												</div>
											</td>
											<td class="table-user">${vo.no }</td>
											<c:choose>
												<c:when test="${vo.visible == true}">
											<td><span class="badge bg-soft-danger text-danger">노출</span></td>
												</c:when>
												<c:when test="${vo.visible != true}">
											<td><span class="badge badge-warning text-danger">숨김</span></td>	
												</c:when>
											
											</c:choose>
											<td>${vo.code }</td>
											<td><img
												src='${pageContext.request.contextPath }/assets/images/${vo.mainImage}'
												style="width: 90px; height: 90px"></td>
											<td>${vo.name }</td>
											<td> ${salePriceList[status.index]} </td>
											<td>198</td>
											<td>${vo.regDate }</td>
											<td>
												
												<a href="${pageContext.request.contextPath }/${authUser.id }/product/modify-item/${vo.no}">
													<input class="btn-secondary" style="height: 20px; font-size: 11px" type="button" value="수정"></a> 
												<a href="${pageContext.request.contextPath }/${authUser.id }/product/delete-item/${vo.no}">
													<input class="btn-secondary btn-del" style="height: 20px; font-size: 11px" type="button" value="삭제"></a> 
												<a href="">
													<input class="btn-secondary" style="height: 20px; font-size: 11px" type="button" value="통계"></a>
											</td>
										</tr>
									
									</c:forEach>
										<%-- <tr>
											<td>
												<div class="custom-control custom-checkbox">
													<input type="checkbox" class="custom-control-input"
														id="customCheck1"> <label
														class="custom-control-label" for="customCheck1">&nbsp;</label>
												</div>
											</td>
											<td class="table-user">5</td>
											<td><span class="badge bg-soft-danger text-danger">노출</span>
											</td>
											<td>F7962-B6231-S5561</td>
											<td><img
												src='${pageContext.request.contextPath }/assets/images/jjonjjon.png'
												style="width: 90px; height: 90px"></td>
											<td>쫀쫀한 무지티</td>
											<td>7,900</td>
											<td>198</td>
											<td>2020-05-05</td>
											<td><a href=""><input class="btn-secondary"
													style="height: 20px; font-size: 11px" type="button"
													value="수정"></a> <a href=""><input
													class="btn-secondary" style="height: 20px; font-size: 11px"
													type="button" value="삭제"></a> <a href=""><input
													class="btn-secondary" style="height: 20px; font-size: 11px"
													type="button" value="통계"></a></td>
										</tr> --%>

									</tbody>
								</table>
							</div>
							<ul class="pagination pagination-rounded justify-content-center">
								<li class="page-item"><a class="page-link"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
								</a></li>
								<li class="page-item"><a class="page-link">1</a></li>
								<li class="page-item"><a class="page-link">2</a></li>
								<li class="page-item active"><a class="page-link">3</a></li>
								<li class="page-item"><a class="page-link">4</a></li>
								<li class="page-item"><a class="page-link">5</a></li>
								<li class="page-item"><a class="page-link"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
								</a></li>
							</ul>
						</div>
						<!-- end card-body-->
					</div>
					<!-- end card-->
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->


		</div>
		<!-- end container -->
	</div>
	<!-- end wrapper -->


    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->
        
	<c:import url ='/WEB-INF/views/partials/script.jsp'/>
</body>
</html>