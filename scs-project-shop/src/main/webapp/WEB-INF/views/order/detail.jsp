<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title></title>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- App favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/images/favicon.ico">

<!-- Plugins css -->
<link
	href="${pageContext.request.contextPath}/assets/libs/flatpickr/flatpickr.min.css"
	rel="stylesheet" type="text/css" />

<!-- App css -->
<link
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/icons.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/app.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/common.css"
	rel="stylesheet" type="text/css" />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/ejs/ejs.js"></script>

<script>
	var dropDownTemplate = new EJS({url : "${pageContext.request.contextPath }/assets/js/ejs/dropdown-box-template.ejs"});
	var mobileDropDownTemplate = new EJS({url : "${pageContext.request.contextPath }/assets/js/ejs/mobile-dropdown-box-template.ejs"});

	$(function() {
		$('#firstOption').change(function() {
				var option = this.value;
				var no = ${map.product.no};

				console.log("test : " + option);
				if (option == 0) {
					alert("품절된 상품 입니다");
					if($(".dynamicDropDown").css("display")=="block"){
						$(".dynamicDropDown").css("display","none");
						}
				} else {
					$.ajax({
							url : '${pageContext.request.contextPath }/api/order/detail/'+ no + "/" + option,
							async : true,
							type : 'get',
							ataType : 'json',
							data : '',
							success : function(response) {
								if(response.data.length!=0){
									var html = dropDownTemplate.render(response);
									$(".dynamicDropDown").append(html);
								}							},
							error : function(xhr, status, e) {
								console.error(status + ":" + e);
							}
						});
					}
		});
		
		$('#mobileFirstOption').change(function() {
			var option = this.value;
			var no = ${map.product.no};

			console.log("test : " + option);
			if (option == 0) {
				alert("품절된 상품 입니다");
				if($(".mobiledynamicDropDown").css("display")=="block"){
					
					$(".mobiledynamicDropDown").css("display","none");
					}
			} else {
				$.ajax({
						url : '${pageContext.request.contextPath }/api/order/detail/'+ no + "/" + option,
						async : true,
						type : 'get',
						ataType : 'json',
						data : '',
						success : function(response) {
							if(response.data.length!=0){
								var html = mobileDropDownTemplate.render(response);
								$(".mobiledynamicDropDown").append(html);
							}							},
						error : function(xhr, status, e) {
							console.error(status + ":" + e);
						}
					});
				}
	});
		
		$('#quantityPlusBtn').click(function(){
			var now = parseInt($("#nowQuantity").val())+1;
			
			$("#nowQuantity").val(now);
			
		});
		
		$('#quantityMinusBtn').click(function(){
			var now = $("#nowQuantity").val();
			
			if(parseInt(now)!=0){
				$("#nowQuantity").val(parseInt(now)-1);
			}
			
		});

	});
</script>


</head>

<body>
	<!-- Navigation Bar-->
	<c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import>

	<div class="wrapper">
		<div class="container-fluid">
			<div class="order-title">
				<span> Product </span>상품
			</div>
			<div class="recipient-info">
				<span style="Font-size: 24px; font-weight: Bold; color: #323A46;">Product</span>
				상품 정보
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card-box">
						<div class="row">
							<div class="col-xl-5">
								<!--제품 이미지-->
								<div class="tab-content pt-3">
									<div class="tab-pane active show" id="product-1-item">
										<img
											src="${pageContext.request.contextPath}/assets/images/products/product-9.jpg"
											alt="" class="img-fluid mx-auto d-block rounded">
									</div>
									<div class="tab-pane" id="product-2-item">
										<img
											src="${pageContext.request.contextPath}/assets/images/products/product-10.jpg"
											alt="" class="img-fluid mx-auto d-block rounded">
									</div>
									<div class="tab-pane" id="product-3-item">
										<img src="assets/images/products/product-11.jpg" alt=""
											class="img-fluid mx-auto d-block rounded">
									</div>
									<div class="tab-pane" id="product-4-item">
										<img src="assets/images/products/product-12.jpg" alt=""
											class="img-fluid mx-auto d-block rounded">
									</div>
								</div>

								<ul class="nav nav-pills nav-justified">
									<li class="nav-item"><a href="#product-1-item"
										data-toggle="tab" aria-expanded="false"
										class="nav-link product-thumb active show"> <img
											src="${pageContext.request.contextPath}/assets/images/products/product-9.jpg"
											alt="" class="img-fluid mx-auto d-block rounded">
									</a></li>
									<li class="nav-item"><a href="#product-2-item"
										data-toggle="tab" aria-expanded="true"
										class="nav-link product-thumb"> <img
											src="${pageContext.request.contextPath}/assets/images/products/product-10.jpg"
											alt="" class="img-fluid mx-auto d-block rounded">
									</a></li>
									<li class="nav-item"><a href="#product-3-item"
										data-toggle="tab" aria-expanded="false"
										class="nav-link product-thumb"> <img
											src="${pageContext.request.contextPath}/assets/images/products/product-11.jpg"
											alt="" class="img-fluid mx-auto d-block rounded">
									</a></li>
									<li class="nav-item"><a href="#product-4-item"
										data-toggle="tab" aria-expanded="false"
										class="nav-link product-thumb"> <img
											src="${pageContext.request.contextPath}/assets/images/products/product-12.jpg"
											alt="" class="img-fluid mx-auto d-block rounded">
									</a></li>
								</ul>
							</div>
							<!-- end col -->
							<div class="col-xl-7">
								<div class="pl-xl-3 mt-3 mt-xl-3" style="width: 100%">
									<h4 class="mb-3 title">${map.product.name }</h4>
									<div class="text-warning font-16">
										<c:forEach begin="1" end="${map.product.intRevAvg }">
											<i class="mdi mdi-star"></i>
										</c:forEach>
										<c:choose>
											<c:when test="${map.product.douRevAvg>=0.5 }">
												<i class="mdi mdi-star-half"></i>
												<c:forEach begin="2" end="${5-map.product.intRevAvg }">
													<i class="mdi mdi-star-outline"></i>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:forEach begin="1" end="${5-map.product.intRevAvg }">
													<i class="mdi mdi-star-outline"></i>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</div>
									<p class="mb-4">
										<a href="" class="text-muted">( ${map.product.cnt }
											Customer Reviews )</a>
									</p>

									<c:choose>
										<c:when test="${map.product.sale !=0 }">
											<h6 class="text-danger text-uppercase sale-info">${map.product.sale }
												% Off</h6>
											<h4 class="mb-4 price-info">
												Price : <span class="text-muted mr-2 del-info"> <del>￦${map.product.nowPrice}</del>
												</span> <b>￦${map.product.totalPrice}</b>
											</h4>

										</c:when>
										<c:otherwise>
											<b>￦${map.product.nowPrice}</b>
										</c:otherwise>
									</c:choose>

									<p class="text-muted mb-4 des-info">${map.product.des }</p>

									<form class="form-inline mb-4">
										<div style="width: 100%; display: inline-flex;">
											<label class="my-1 mr-2 label-info" for="quantityinput"
												style="width: 20%; justify-content: left">Quantity</label> <select
												class="custom-select my-1 mr-sm-3" id="quantityinput"
												style="width: 40%">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
											</select>
										</div>

										<div style="width: 100%; display: inline-flex;">
											<label class="my-1 mr-2 label-info" for="sizeinput"
												style="width: 20%; justify-content: left">Option</label>
												 <select class="custom-select my-1 mr-sm-3" id="firstOption" style="width:40%">
												<option class="selected" value="X">옵션을 선택해주세요</option>
												<c:forEach items="${option }" var="vo">

													<c:choose>
														<c:when test="${vo.stock == 0 }">
															<option value="0">${vo.name }품절</option>
														</c:when>
														<c:otherwise>
															<option value="${vo.no }">${vo.name }</option>
														</c:otherwise>
													</c:choose>

												</c:forEach>
											</select>
										</div>

										<div class="dynamicDropDown" style='margin-left: 22%; width: 100%'>
										</div>
									</form>

									<div style="board: 1px solid red; margin-top: 100px;">
										<button type="button"
											class="btn btn-dark waves-effect waves-light detail-custom-btn ">
											장바구니</button>

										<button type="button"
											class="btn btn-outline-dark waves-effect waves-light detail-order-btn">
											구매 하기</button>
									</div>
								</div>
							</div>
							<!-- end col -->

							<div class="mobile-product-detail-box">
								<div class="mobile-product-detail-name">
									<span>${map.product.name }</span>
								</div>
								
								<div class="text-warning ml-1">
									<c:forEach begin="1" end="${map.product.intRevAvg }">
											<i class="mdi mdi-star"></i>
										</c:forEach>
										<c:choose>
											<c:when test="${map.product.douRevAvg>=0.5 }">
												<i class="mdi mdi-star-half"></i>
												<c:forEach begin="2" end="${5-map.product.intRevAvg }">
													<i class="mdi mdi-star-outline"></i>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:forEach begin="1" end="${5-map.product.intRevAvg }">
													<i class="mdi mdi-star-outline"></i>
												</c:forEach>
											</c:otherwise>
									</c:choose>
								</div>
								<div class="mobile-product-detail-quantity-name" style="font-size:16px; font-weight:normal">Quantity</div>
								
								<div class="mobile-product-detail-quantity-btn float-right">
									<div class="order-custom-count ">
										<button class="btn btn-dark waves-effect " id="quantityMinusBtn">
											<i class="fe-minus"></i>
										</button>
										<input type="text" class="form-control"
										id="nowQuantity" value="1" required>
										<button class="btn btn-dark waves-effect " id="quantityPlusBtn">
											<i class="fe-plus"></i>
										</button>
									</div>
								</div>
								<div style="margin-top:40px"></div>
								<div class="mobile-product-detail-option">
										<div style="width: 100%; display: inline-flex;">
											<label class="my-1 mr-2 label-info mobile-product-label" for="sizeinput"
												style="width: 30%; justify-content: left; font-size:16px; font-weight:normal; margin-left:10px">Option</label> 
												<select
												class="custom-select my-1 mr-sm-3 " id="mobileFirstOption" style="width:100%">
												<option class="selected" value="X">옵션을 선택해주세요</option>
												<c:forEach items="${option }" var="vo">
													<c:choose>
														<c:when test="${vo.stock == 0 }">
															<option value="0">${vo.name }품절</option>
														</c:when>
														<c:otherwise>
															<option value="${vo.no }">${vo.name }</option>
														</c:otherwise>
													</c:choose>

												</c:forEach>
											</select>
											
											
										</div>
										
										<div class="mobiledynamicDropDown" style='margin-left: 27%; width: 100%'>
											</div>
								</div>

								<div class="mobile-product-detail-order-btn">
									<button type="button"
										class="btn btn-dark waves-effect waves-light">장바구니</button>
									<button type="button"
										class="btn btn-outline-dark waves-effect waves-light">
										구매 하기</button>
								</div>

							</div>
						</div>
						<!-- end row -->
					</div>
					<!-- end card-->
					<div class="border"></div>

					<!-- 제이쿼리로 작업 하기.-->
					<div class="product-detail">
						<div class="select-category">

							<ul class="nav nav-tabs nav-bordered nav-justified">
								<li class="nav-item"><a href="#home-b2" data-toggle="tab"
									aria-expanded="false" class="nav-link"> INFO </a></li>
								<li class="nav-item"><a href="#profile-b2"
									data-toggle="tab" aria-expanded="true" class="nav-link active">
										REVIEW </a></li>
								<li class="nav-item"><a href="#messages-b2"
									data-toggle="tab" aria-expanded="false" class="nav-link">
										FAQ </a></li>
							</ul>
						</div>

						<div class="info-detail">
							<img
								src="${pageContext.request.contextPath}/assets/images/detail-image.PNG"
								alt="" / class="rounded">
						</div>

						<div class="info-review">
							<span>REVIEW</span> <span style="display: block;"><div
									style="font-weight: bold; display: inline;">고객분들의 생생한 후기</div>도
								함께 만나보세요</span>

							<div class="review-group">
								<div class="review-img">
									<img src="assets/images/review-img.PNG" alt=""
										/ class="rounded">
								</div>
								<div class="review-box">
									<div class="pl-xl-3 mt-3 mt-xl-3">
										<!--리뷰 별-->
										<p class="text-muted mr-3">
											<span class="mdi mdi-star text-warning"></span> <span
												class="mdi mdi-star text-warning"></span> <span
												class="mdi mdi-star text-warning"></span> <span
												class="mdi mdi-star text-warning"></span> <span
												class="mdi mdi-star"></span>
										</p>
										<span style="margin-right: 4px;">id</span> <span>l</span> <span>날짜</span>
										<span>l</span> <span>옵션</span>
										<p class="text-muted mb-4 des-info"
											style="margin-top: 8px; color: #323A46;">리뷰내용//height 맞추기</p>

									</div>
								</div>
							</div>

							<div class="review-group">
								<div class="review-img">
									<img
										src="${pageContext.request.contextPath}/assets/images/review-img.PNG"
										alt="" / class="rounded">
								</div>
								<div class="review-box">
									<div class="pl-xl-3 mt-3 mt-xl-3">
										<!--리뷰 별-->
										<p class="text-muted mr-3">
											<span class="mdi mdi-star text-warning"></span> <span
												class="mdi mdi-star text-warning"></span> <span
												class="mdi mdi-star text-warning"></span> <span
												class="mdi mdi-star text-warning"></span> <span
												class="mdi mdi-star"></span>
										</p>
										<span style="margin-right: 4px;">id</span> <span>l</span> <span>날짜</span>
										<span>l</span> <span>옵션</span>
										<p class="text-muted mb-4 des-info"
											style="margin-top: 8px; color: #323A46;">리뷰내용</p>

									</div>
								</div>
							</div>

							<div class="qna-group">
								<span>Q&A</span>
								<div style="border-bottom: 1px solid #323A46;"></div>

								<div class="col-lg-12">
									<div class="card-box">
										<div class="table-responsive">
											<table class="table mb-0">
												<thead class="thead-light">
													<tr>
														<th>#</th>
														<th>First Name</th>
														<th>Last Name</th>
														<th>Username</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th scope="row">1</th>
														<td>Mark</td>
														<td>Otto</td>
														<td>@mdo</td>
													</tr>
													<tr>
														<th scope="row">2</th>
														<td>Jacob</td>
														<td>Thornton</td>
														<td>@fat</td>
													</tr>
													<tr>
														<th scope="row">3</th>
														<td>Larry</td>
														<td>the Bird</td>
														<td>@twitter</td>
													</tr>
												</tbody>
											</table>
										</div>
										<!-- end table-responsive-->

									</div>
									<!-- end card-box -->
								</div>
								<!-- end col -->

							</div>

							<div class="tab-content">
								<div class="tab-pane" id="home-b2"></div>
								<div class="tab-pane active" id="profile-b2"></div>
								<div class="tab-pane" id="messages-b2"></div>
							</div>
						</div>
						<!--제이쿼리로 작업 하기-->



					</div>
					<!-- end col-->
				</div>
				<!-- end row-->
			</div>
			<!-- end container -->
		</div>
		<!-- end wrapper -->
		<c:import url="/WEB-INF/views/partials/footer.jsp"></c:import>
		<!-- Vendor js -->
		<script
			src="${pageContext.request.contextPath}/assets/js/vendor.min.js"></script>

		<!-- App js-->
		<script src="${pageContext.request.contextPath}/assets/js/app.min.js"></script>
</body>
</html>