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
        <link href="../assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
       
        <link href="../assets/libs/dropzone/dropzone.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/libs/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
        
        <link href="../assets/libs/jquery-nice-select/nice-select.css" rel="stylesheet" type="text/css" />
        <link href="../assets/libs/switchery/switchery.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/libs/multiselect/multi-select.css" rel="stylesheet" type="text/css" />
        <link href="../assets/libs/select2/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/libs/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
        <link href="../assets/libs/quill/quill.core.css" rel="stylesheet" type="text/css" />
        <link href="../assets/libs/quill/quill.bubble.css" rel="stylesheet" type="text/css" />
        <link href="../assets/libs/quill/quill.snow.css" rel="stylesheet" type="text/css" />

        <!-- third party css -->
        <link href="../assets/libs/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="../assets/libs/datatables/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="../assets/libs/datatables/buttons.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="../assets/libs/datatables/select.bootstrap4.css" rel="stylesheet" type="text/css" />
        <!-- third party css end -->

        <!-- App css -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" />        
       
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

			<!-- start page title -->
			<div class="row">
				<div class="col-12">
					<div class="page-title-box">
						<div class="page-title-right">
							<ol class="breadcrumb m-0">
								<li class="breadcrumb-item"><a href="javascript: void(0);">SCS</a></li>
								<li class="breadcrumb-item"><a href="javascript: void(0);">상품</a></li>
								<li class="breadcrumb-item active">상품등록</li>
							</ol>
						</div>
						<h4 class="page-title">상품등록</h4>
					</div>
				</div>
			</div>
			<!-- end page title -->

			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body" id="search-form">
							<h4 class="page-title">상품노출 설정</h4>


							<!-- 상품노출 테이블 시작-->
							<table class="table-form-exposure">
								<colgroup>
									<col width="180">
									<col width="*">
									<col width="180">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>상품 노출</th>
										<td colspan="2"><input type=radio name="pro-expo" checked>&nbsp노출<label
											class="text-space"></label> <input type=radio name="pro-expo">&nbsp숨김
										</td>

										<th>상품 아이콘</th>
										<td colspan="2"><input type='checkbox' /> <span
											class="badge badge-danger">BEST</span><label
											class="text-space"></label> <input type='checkbox' /> <span
											class="badge badge-warning checkbox-space">NEW</label></td>
									</tr>
								</tbody>
							</table>
							<!-- 상품노출 테이블 종료-->
							<div class="lspace"></div>
							<h4 class="page-title">상품카테고리 설정</h4>

							<!-- 상품카테고리 테이블 시작-->
							<table class="table-form-category">
								<colgroup>
									<col width="180">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>상품 카테고리</th>
										<td colspan="2">1차분류 <select class="form-control">
												<option>----</option>
												<option>아우터</option>
												<option>상의</option>
												<option>하의</option>
												<option>etc</option>
										</select> <label class="text-space"></label> 2차분류 <select
											class="form-control">
												<option>----</option>
												<option>아우터</option>
												<option>상의</option>
												<option>하의</option>
												<option>etc</option></td>
									</tr>
									<tr>
										<th>선택된 카테고리</th>
										<td colspan="2"><input type="text" class="no-outline"
											readonly></td>
									</tr>
								</tbody>

							</table>
							<!-- 상품카테고리 테이블 종료-->
							<div class="lspace"></div>
							<h4 class="page-title">상품 기본 정보</h4>

							<!-- 상품기본정보 테이블 시작-->
							<table class="table-form-category">
								<colgroup>
									<col width="180">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th></span>상품코드 <span style="color: #FF4040">*</span></th>
										<td colspan="4"><input type="text" id=""
											class="form-control product-info" id="simpleinput" /></td>
									</tr>
									<tr>
										<th>상품명 <span style="color: #FF4040">*</span></th>
										<td colspan="4"><input type="text" id=""
											class="form-control product-info" /></td>
									</tr>
									<tr>
										<th>상품설명</th>
										<td colspan="4"><textarea class="form-control txtb"
												id="example-textarea" rows="3"></textarea></td>
									</tr>

									<tr>
										<th>판매정보 <span style="color: #FF4040">*</span></th>
										<td colspan="4">공급가 <span style="color: #FF4040">*</span>
											<input type="text" class="form-control product-info">&nbsp
											정상가 <input type="text" id=""
											class="form-control product-info">&nbsp 할인율 <input
											type="text" id="" class="form-control product-info"><label
											class="text-space"></label><label class="text-space"></label><label
											class="text-space"></label> 판매가 <input type="text" id=""
											class="form-control product-info" readonly>&nbsp 재고량
											<span style="color: #FF4040">*</span> <input type="text"
											id="" class="form-control product-info">
										</td>
									</tr>
									<tr>
										<th>배송사 <span style="color: #FF4040">*</span></th>
										<td colspan="2"><select class="form-control"
											style="min-width: 200px">
												<option>----</option>
												<option>로젠택배</option>
												<option>cj대한통운</option>
												<option>현대택배</option>
												<option>우체국택배</option>
										</select></td>
										<th>배송비 <span style="color: #FF4040">*</span></th>
										<td colspan="2"><input type=radio name="shipping-charge"
											checked>&nbsp무료배송<label class="text-space"></label> <input
											type=radio name="shipping-charge">&nbsp설정 배송비</td>
									</tr>
									<!-- image 등록 -->
									<tr class="img-reg">
										<th>이미지 등록</th>


										<td colspan="4">


											<div class="img-section">
												<form action="/" method="post" class="dropzone"
													id="img-section">
													<div class="fallback">
														<input name="file" type="file" multiple />
													</div>
												</form>
												<p class="text-muted text-center mt-2 mb-0">대표이미지</p>
											</div>

											<div class="img-section">
												<form action="/" method="post" class="dropzone"
													id="img-section">
													<div class="fallback">
														<input name="file" type="file" multiple />
													</div>
												</form>
												<p class="text-muted text-center mt-2 mb-0">부가이미지1</p>
											</div>

											<div class="img-section">
												<form action="/" method="post" class="dropzone"
													id="img-section">
													<div class="fallback">
														<input name="file" type="file" multiple />
													</div>
												</form>
												<p class="text-muted text-center mt-2 mb-0">부가이미지2</p>
											</div>

											<div class="img-section">
												<form action="/" method="post" class="dropzone"
													id="img-section">
													<div class="fallback">
														<input name="file" type="file" multiple />
													</div>
												</form>
												<p class="text-muted text-center mt-2 mb-0">부가이미지3</p>
											</div>

											<div class="img-section">
												<form action="/" method="post" class="dropzone"
													id="img-section">
													<div class="fallback">
														<input name="file" type="file" multiple />
													</div>
												</form>
												<p class="text-muted text-center mt-2 mb-0">부가이미지4</p>
											</div>

											<div class="img-section">
												<form action="/" method="post" class="dropzone"
													id="img-section">
													<div class="fallback">
														<input name="file" type="file" multiple />
													</div>
												</form>
												<p class="text-muted text-center mt-2 mb-0">부가이미지5</p>
											</div>

										</td>
									</tr>
									<!-- image 등록 종료-->

									<tr class="pro-op">
										<th>상품옵션</th>
										<td colspan="4">
											<div>
												<input type=radio name="pro-opt" checked>&nbsp옵션사용안함<label
													class="text-space"></label> <input type=radio
													name="pro-opt">&nbsp1차옵션사용<label class="text-space"></label>
												<input type=radio name="pro-opt">&nbsp2차옵션사용
											</div>
											<div>옵션 영역</div>
										</td>
									</tr>

								</tbody>

							</table>
							<!-- 상품기본정보 테이블 종료-->
							<label class="lspace"></label>

							<!-- 상품 설명 시작-->
							<h4 class="page-title">상품 설명</h4>

							<div id="snow-editor" style="height: 300px;"></div>
							<!--상품 설명 종료-->

							<br>

							<!-- 등록,목록 버튼-->
							<div class="btn-submit-section">
								<button type="button" class="btn btn-secondary waves-effect ">등록</button>
								<button type="button" class="btn btn-secondary waves-effect ">목록</button>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end container -->
	</div>
	<!-- end wrapper -->

	<c:import url ='/WEB-INF/views/partials/script.jsp'/>


</body>
</html>