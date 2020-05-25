<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
            <title></title>
            <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
            <meta content="Coderthemes" name="author" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <!-- App favicon -->
            <link rel="shortcut icon" href="../assets/images/favicon.ico">
    
            <!-- Plugins css -->
            <link href="../assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
    
            <!-- App css -->
            <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
            <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css" />
            <link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" />

    </head>
<body>
    <!-- Navigation Bar-->
    <c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import>

    <div class="wrapper">
        <div class="container-fluid">

            <div class="order-title">
                <span> Product </span>상품</div>
            <div class="recipient-info">
                <span style="Font-size:24px; font-weight:Bold; color:#323A46;">Product</span> 상품 정보
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card-box">
                        <div class="row">
                            <div class="col-xl-5">
                                <!--제품 이미지-->
                                <div class="tab-content pt-3">
                                    <div class="tab-pane active show" id="product-1-item">
                                        <img src="assets/images/products/product-9.jpg" alt="" class="img-fluid mx-auto d-block rounded">
                                    </div>
                                    <div class="tab-pane" id="product-2-item">
                                        <img src="assets/images/products/product-10.jpg" alt="" class="img-fluid mx-auto d-block rounded">
                                    </div>
                                    <div class="tab-pane" id="product-3-item">
                                        <img src="assets/images/products/product-11.jpg" alt="" class="img-fluid mx-auto d-block rounded">
                                    </div>
                                    <div class="tab-pane" id="product-4-item">
                                        <img src="assets/images/products/product-12.jpg" alt="" class="img-fluid mx-auto d-block rounded">
                                    </div>
                                </div>

                                <ul class="nav nav-pills nav-justified">
                                    <li class="nav-item">
                                        <a href="#product-1-item" data-toggle="tab" aria-expanded="false" class="nav-link product-thumb active show">
                                            <img src="assets/images/products/product-9.jpg" alt="" class="img-fluid mx-auto d-block rounded">
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#product-2-item" data-toggle="tab" aria-expanded="true" class="nav-link product-thumb">
                                            <img src="assets/images/products/product-10.jpg" alt="" class="img-fluid mx-auto d-block rounded">
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#product-3-item" data-toggle="tab" aria-expanded="false" class="nav-link product-thumb">
                                            <img src="assets/images/products/product-11.jpg" alt="" class="img-fluid mx-auto d-block rounded">
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#product-4-item" data-toggle="tab" aria-expanded="false" class="nav-link product-thumb">
                                            <img src="assets/images/products/product-12.jpg" alt="" class="img-fluid mx-auto d-block rounded">
                                        </a>
                                    </li>
                                </ul>
                            </div> <!-- end col -->
                            <div class="col-xl-7">
                                <div class="pl-xl-3 mt-3 mt-xl-3">
                                    <a href="#" class="text-primary">카테고리(2차)</a>
                                    <h4 class="mb-3 title">Jack & Jones Men's T-shirt (Blue)</h4>
                                    
                                    <!--리뷰 별-->
                                    <p class="text-muted float-left mr-3">
                                        <span class="mdi mdi-star text-warning"></span>
                                        <span class="mdi mdi-star text-warning"></span>
                                        <span class="mdi mdi-star text-warning"></span>
                                        <span class="mdi mdi-star text-warning"></span>
                                        <span class="mdi mdi-star"></span>
                                    </p>
                                    <p class="mb-4"><a href="" class="text-muted">( 36 Customer Reviews )</a></p>
                                    
                                    <h6 class="text-danger text-uppercase sale-info">20 % Off</h6>
                                    
                                    <h4 class="mb-4 price-info">Price : <span class="text-muted mr-2 del-info"><del>$80 USD</del></span> <b>$64 USD</b></h4>
                                    
                                    <h4><span class="badge bg-soft-success text-success mb-4">구매가능</span></h4>
                                    <p class="text-muted mb-4 des-info">The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators.</p>
                                   
                                    <form class="form-inline mb-4">
                                        <label class="my-1 mr-2 label-info" for="quantityinput">Quantity</label>
                                        <select class="custom-select my-1 mr-sm-3" id="quantityinput">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                        </select>

                                        <label class="my-1 mr-2 label-info" for="sizeinput">Size</label>
                                        <select class="custom-select my-1 mr-sm-3" id="sizeinput">
                                            <option selected>Small</option>
                                            <option value="1">Medium</option>
                                            <option value="2">Large</option>
                                            <option value="3">X-large</option>
                                        </select>
                                    </form>

                                    <div>
                                        <button type="button" class="btn btn-dark waves-effect waves-light detail-custom-btn ">
                                            장바구니
                                        </button>

                                        <button type="button" class="btn btn-outline-dark waves-effect waves-light detail-custom-btn">
                                            구매 하기
                                        </button>
                                    </div>
                                </div>
                            </div> <!-- end col -->

                            <div class="mobile-product-detail-box">
                                <div class="mobile-product-detail-name">
                                    <span>쫀쫀한 무지티</span>
                                </div>

                                <p class="text-muted ml-2">
                                    <span class="mdi mdi-star "></span>
                                    <span class="mdi mdi-star "></span>
                                    <span class="mdi mdi-star "></span>
                                    <span class="mdi mdi-star "></span>
                                    <span class="mdi mdi-star"></span>
                                    <span>10reviews</span>
                                </p>
                                <div class="mobile-product-detail-quantity-name">
                                    Quantity
                                </div>
                                <div class="mobile-product-detail-quantity-btn float-right">
                                    <div class="order-custom-count ">
                                        <button class="btn btn-dark waves-effect "><i class="fe-plus"></i></button>
                                        <input type="text" class="form-control" id="validationCustom01"  value="1" required>
                                        <button class="btn btn-dark waves-effect "><i class="fe-minus"></i></button>
                                    </div>
                                </div>

                                <div class="mobile-product-detail-order-btn">
                                    <button type="button" class="btn btn-dark waves-effect waves-light">
                                        장바구니
                                    </button>
                                    <button type="button" class="btn btn-outline-dark waves-effect waves-light">
                                        구매 하기
                                    </button>
                                </div>
                                
                            </div>
                        </div>
                        <!-- end row -->
                    </div> <!-- end card-->
                    <div class="border"></div> 
                        
                    <!-- 제이쿼리로 작업 하기.-->
                    <div class="product-detail">
                        <div class="select-category">

                            <ul class="nav nav-tabs nav-bordered nav-justified">
                                <li class="nav-item">
                                    <a href="#home-b2" data-toggle="tab" aria-expanded="false" class="nav-link">
                                        INFO
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#profile-b2" data-toggle="tab" aria-expanded="true" class="nav-link active">
                                        REVIEW
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#messages-b2" data-toggle="tab" aria-expanded="false" class="nav-link">
                                        FAQ
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <div class="info-detail">
                            <img src="assets/images/detail-image.PNG" alt=""/ class="rounded">
                        </div>

                        <div class="info-review">
                            <span >REVIEW</span>
                            <span style="display: block;"><div style="font-weight: bold; display: inline;">고객분들의 생생한 후기</div>도 함께 만나보세요</span>
                            
                            <div class="review-group">
                                <div class="review-img">
                                   <img src="assets/images/review-img.PNG" alt=""/ class="rounded">
                                </div>
                                <div class="review-box">
                                    <div class="pl-xl-3 mt-3 mt-xl-3">
                                        <!--리뷰 별-->
                                        <p class="text-muted mr-3">
                                            <span class="mdi mdi-star text-warning"></span>
                                            <span class="mdi mdi-star text-warning"></span>
                                            <span class="mdi mdi-star text-warning"></span>
                                            <span class="mdi mdi-star text-warning"></span>
                                            <span class="mdi mdi-star"></span>
                                        </p>
                                        <span style="margin-right: 4px;">id</span>
                                        <span>l</span>
                                        <span>날짜</span>
                                        <span>l</span>
                                        <span>옵션</span>
                                        <p class="text-muted mb-4 des-info" style="margin-top: 8px; color: #323A46;">리뷰내용//height 맞추기</p>
                                       
                                     </div>
                                </div>
                            </div>

                            <div class="review-group">
                                <div class="review-img">
                                   <img src="assets/images/review-img.PNG" alt=""/ class="rounded">
                                </div>
                                <div class="review-box">
                                    <div class="pl-xl-3 mt-3 mt-xl-3">
                                        <!--리뷰 별-->
                                        <p class="text-muted mr-3">
                                            <span class="mdi mdi-star text-warning"></span>
                                            <span class="mdi mdi-star text-warning"></span>
                                            <span class="mdi mdi-star text-warning"></span>
                                            <span class="mdi mdi-star text-warning"></span>
                                            <span class="mdi mdi-star"></span>
                                        </p>
                                        <span style="margin-right: 4px;">id</span>
                                        <span>l</span>
                                        <span>날짜</span>
                                        <span>l</span>
                                        <span>옵션</span>
                                        <p class="text-muted mb-4 des-info" style="margin-top: 8px; color: #323A46;">리뷰내용</p>
                                       
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
                                        </div> <!-- end table-responsive-->
            
                                    </div> <!-- end card-box -->
                                </div> <!-- end col -->

                            </div>

                        <div class="tab-content">
                            <div class="tab-pane" id="home-b2">
                               
                            </div>
                            <div class="tab-pane active" id="profile-b2">
                               
                            </div>
                            <div class="tab-pane" id="messages-b2">
                               
                            </div>
                        </div>
                    </div>  <!--제이쿼리로 작업 하기--> 
               
               
               
                </div> <!-- end col-->
            </div>
            <!-- end row-->
        </div> <!-- end container -->
    </div>
    <!-- end wrapper -->
   <c:import url="/WEB-INF/views/partials/footer.jsp"></c:import>
    <!-- Vendor js -->
   <script src="../assets/js/vendor.min.js"></script>

   <!-- App js-->
   <script src="../assets/js/app.min.js"></script>

</body>
</html>