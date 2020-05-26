<!DOCTYPE html>
<html lang="utf-8">
    <head>
        <meta charset="utf-8" />
            <title></title>
            <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

            <div class="photo-review-group">
                <div class="photo-review-title">
                    PHOTO REVIEW  &nbsp;&nbsp; l &nbsp;&nbsp;  포토 리뷰
                </div>        
                
               <div class="review-search-group">
                    <div class="review-search-category-title"><span class="review-category-span">카테고리</span></div>
                   
                    <div class="review-search-category-border"></div>
                    <div ></div>
                    <div class="review-search-category">
                        <button class="btn btn-light btn-lg dropdown-toggle review-category-custom-btn"  type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            최신순 <i class="mdi mdi-chevron-down"style="float:right"></i>
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </div>
                    
                    <div class="review-search-category-border"></div>

                    <div class="review-search-category2">
                        <button class="btn btn-light btn-lg dropdown-toggle review-category-custom-btn"  type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Large button <i class="mdi mdi-chevron-down"style="float:right"></i>
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </div>
                    
                    <div class="review-search-category-border"></div>


                    <div class="review-search-category3">
                        <i class="fe-search review-search-icon"></i>
                    </div>

                </div>

               

                <div class="row">
                    <div class="col-12">
                        <div class="card-columns">
                            <div class="card">
                                <img class="card-img-top img-fluid" src="assets/images/small/img-7.jpg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title">Card title that wraps to a new line</h5>
                                    <p class="card-text">This is a longer card with supporting text below as a
                                        natural lead-in to additional content. This content is a little bit
                                        longer.</p>
                                </div>
                            </div>

                            <div class="card">
                                <img class="card-img-top img-fluid" src="assets/images/small/img-7.jpg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title">Card title that wraps to a new line</h5>
                                    <p class="card-text">This is a longer card with supporting text below as a
                                        natural lead-in to additional content. This content is a little bit
                                        longer.</p>
                                </div>
                            </div>
                            
                            <div class="card">
                                <img class="card-img-top img-fluid" src="assets/images/small/img-7.jpg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title">Card title that wraps to a new line</h5>
                                    <p class="card-text">This is a longer card with supporting text below as a
                                        natural lead-in to additional content. This content is a little bit
                                        longer.</p>
                                </div>
                            </div>
                            
                            <div class="card">
                                <img class="card-img-top img-fluid" src="assets/images/small/img-7.jpg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title">Card title that wraps to a new line</h5>
                                    <p class="card-text">This is a longer card with supporting text below as a
                                        natural lead-in to additional content. This content is a little bit
                                        longer.</p>
                                </div>
                            </div>

                            <div class="card">
                                <img class="card-img-top img-fluid" src="assets/images/small/img-7.jpg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title">Card title that wraps to a new line</h5>
                                    <p class="card-text">This is a longer card with supporting text below as a
                                        natural lead-in to additional content. This content is a little bit
                                        longer.</p>
                                </div>
                            </div>

                            <div class="card">
                                <img class="card-img-top img-fluid" src="assets/images/small/img-7.jpg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title">Card title that wraps to a new line</h5>
                                    <p class="card-text">This is a longer card with supporting text below as a
                                        natural lead-in to additional content. This content is a little bit
                                        longer.</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <ul class="pagination pagination-rounded justify-content-center mb-3">
                                    <li class="page-item">
                                        <a class="page-link" href="javascript: void(0);" aria-label="Previous">
                                            <span aria-hidden="true">«</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item active"><a class="page-link" href="javascript: void(0);">1</a></li>
                                    <li class="page-item"><a class="page-link" href="javascript: void(0);">2</a></li>
                                    <li class="page-item"><a class="page-link" href="javascript: void(0);">3</a></li>
                                    <li class="page-item"><a class="page-link" href="javascript: void(0);">4</a></li>
                                    <li class="page-item"><a class="page-link" href="javascript: void(0);">5</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="javascript: void(0);" aria-label="Next">
                                            <span aria-hidden="true">»</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </div> <!-- end col-->
                        </div>
                        <!-- end row-->
                        
                    </div>
                </div>

            </div><!-- photoreview search-->
           
            <div class="all-review">

                <div class="photo-review-title">
                    ALL REVIEW  &nbsp&nbsp l &nbsp&nbsp  전체 리뷰
                </div>        
              
                   <div class="review-search-group">
                        <div class="review-search-category-title"><span class="review-category-span">카테고리</span></div>
                       
                        <div class="review-search-category-border"></div>
                        <div ></div>
                        <div class="review-search-category">
                            <button class="btn btn-light btn-lg dropdown-toggle review-category-custom-btn"  type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                최신순 <i class="mdi mdi-chevron-down"style="float:right"></i>
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </div>
                        
                        <div class="review-search-category-border"></div>
    
                        <div class="review-search-category2">
                            <button class="btn btn-light btn-lg dropdown-toggle review-category-custom-btn"  type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Large button <i class="mdi mdi-chevron-down"style="float:right"></i>
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </div>
                        
                        <div class="review-search-category-border"></div>
    
    
                        <div class="review-search-category3">
                            <i class="fe-search review-search-icon"></i>
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

                         <div class="all-review-mobile-custom">
                            <!--리뷰 별-->
                            <div style="margin-top: 3px;"></div>
                            <div class="mobile-review-info">
                                <span style="margin-right: 4px;">abcd***</span>
                                <span>l</span>
                                <span>20.05.12</span>
                                <span>l</span>
                                <span>사이즈:XL 컬러:블랙</span>
                            </div>
                            <p class="text-muted mr-0 mobile-review-star">
                                <span class="mdi mdi-star text-warning"></span>
                                <span class="mdi mdi-star text-warning"></span>
                                <span class="mdi mdi-star text-warning"></span>
                                <span class="mdi mdi-star text-warning"></span>
                                <span class="mdi mdi-star"></span>
                            </p>
                            
                            <p class="text-muted mb-4 des-info" style="color: #323A46;">리뷰내용</p>
                           
                         </div>
                    </div > 
                </div>

                
            </div>

        </div>
    </div>

 <c:import url="/WEB-INF/views/partials/footer.jsp"></c:import>
    <!-- Vendor js -->
   <script src="../assets/js/vendor.min.js"></script>

   <!-- App js-->
   <script src="../assets/js/app.min.js"></script>

</body>
</html>