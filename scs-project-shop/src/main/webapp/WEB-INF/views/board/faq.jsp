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
    
            <!-- App css -->
            <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
            <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css" />
            <link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" />

    </head>
	<body>
    <!-- Navigation Bar-->
    <header id="topnav" style="background-color:#ffffff">
    	<c:import url ='/WEB-INF/views/partials/topbar.jsp'/>    
    </header>



    <div class="wrapper">
        <div class="container-fluid">
    
            <div class="recipient-info">
                <span>FAQ</span> 자주 묻는 질문
            </div>

            <div class="row">
                <div class="col-xl-12">
                    <div id="accordion" class="mb-3">
                        <div class="card mb-1">
                            <div class="card-header" id="headingOne">
                                <h5 class="m-0">
                                    <a class="text-dark" data-toggle="collapse" href="#collapseOne" aria-expanded="true">
                                        <i class="mdi mdi-help-circle mr-1 text-primary"></i> 
                                        배송 준비 중 / 발송 후 주소지를 변경할 수 있나요?
                                    </a>
                                </h5>
                            </div>
                
                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                                <div class="card-body">
                                    배송 준비 중 부터는 주문 정보 변경이 불가능합니다.
                                </div>
                            </div>
                        </div>
                        <div class="card mb-1">
                            <div class="card-header" id="headingTwo">
                                <h5 class="m-0">
                                    <a class="text-dark" data-toggle="collapse" href="#collapseTwo" aria-expanded="false">
                                        <i class="mdi mdi-help-circle mr-1 text-primary"></i> 
                                       주문한 상품이 일부만 도착했어요.
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                                <div class="card-body">
                                    브랜드에 따라 출고지가 다르므로 다수의 브랜드를 주문하신 경우 각각 배송됩니다.
                                </div>
                            </div>
                        </div>
                        <div class="card mb-1">
                            <div class="card-header" id="headingThree">
                                <h5 class="m-0">
                                    <a class="text-dark" data-toggle="collapse" href="#collapseThree" aria-expanded="false">
                                        <i class="mdi mdi-help-circle mr-1 text-primary"></i> 
                                        입금 전 주문 취소는 어떻게 하나요?
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                                <div class="card-body">
                                    마이페이지에서 가능합니다.
                                </div>
                            </div>
                        </div>

                        <div class="card mb-1">
                            <div class="card-header" id="headingFour">
                                <h5 class="m-0">
                                    <a class="text-dark" data-toggle="collapse" href="#collapseFour2" aria-expanded="false">
                                        <i class="mdi mdi-help-circle mr-1 text-primary"></i> 
                                        교환 배송비는 어떻게 보내야 하나요?
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseFour2" class="collapse" aria-labelledby="collapseFour" data-parent="#accordion">
                                <div class="card-body">
                                    교환 배송비를 동봉하지 않으신 경우 계좌로 입금 가능합니다.
                                </div>
                            </div>
                        </div>

                        <div class="card mb-1">
                            <div class="card-header" id="headingFour">
                                <h5 class="m-0">
                                    <a class="text-dark" data-toggle="collapse" href="#collapseFour3" aria-expanded="false">
                                        <i class="mdi mdi-help-circle mr-1 text-primary"></i> 
                                       입금 전 다른 사이즈으로 교환하고 싶어요
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseFour3" class="collapse" aria-labelledby="collapseFour" data-parent="#accordion">
                                <div class="card-body">
                                  주문 접수 상태인 경우 주문 취소 후 재주문 해주셔야 합니다.
                                </div>
                            </div>
                        </div>

               

                        
                    </div> <!-- end #accordions-->
                </div> <!-- end col -->
                
            </div> <!-- end row -->
        </div>
    </div>


    <c:import url ='/WEB-INF/views/partials/footer.jsp'/>

     <!-- Vendor js -->
     <script src="../assets/js/vendor.min.js"></script>

     <!-- App js-->
     <script src="../assets/js/app.min.js"></script>
</body>
</html>