
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
            <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
            <script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<script type="text/javascript">
		function openPostCode() {
			new daum.Postcode({
				oncomplete:function(data) {
					jQuery("#postcode1").val(data.zonecode);
					jQuery("#postcode2").val(data.roadAddress);
					jQuery("#postcode3").val(data.jibunAddress);
				}
			}).open();
		}
	</script>

    </head>
<body>
    <c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import>

    <div class="wrapper">
        <div class="container-fluid">
            <div class="order-list">
                <div class="order-title">
                    <span> Order / Payment </span>
                    주문/결제
                </div>
                <div class="recipient-info">
                    <span >Recipient Info</span> 수령자 정보
                </div>

                 <div class="select-ship" >
                    <span class="select-ship-address" >배송지 선택</span>

                     <div class="ship-list" style=>
                        <div class="radio form-check-inline">
                            <input type="radio" id="inlineRadio2" value="option1" name="radioInline" >
                            <label for="inlineRadio2"> 기존 배송지 </label>
                        </div>
                        <div class="radio form-check-inline">
                            <input type="radio" id="inlineRadio2" value="option2" name="radioInline">
                            <label for="inlineRadio2"> 신규 배송지 </label>
                        </div>
                        <div class="radio form-check-inline">
                            <input type="radio" id="inlineRadio3" value="option3" name="radioInline">
                            <label for="inlineRadio2" > 주소록 선택  </label>
                        
                            <div class="btn-group mb-2">
                                <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Secondary <i class="mdi mdi-chevron-down"></i></button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Separated link</a>
                                </div>
                            </div><!-- /btn-group -->
                        </div>
                     </div><!-- ship list-->

                     <div class="mobile-select-ship-list">
                        <span class="moblie-select-ship-address" >배송지 선택</span>

                        <div class="btn-group mb-2">
                            <button type="button" class="btn btn-light dropdown-toggle moblie-select-ship-list-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Secondary <i class="mdi mdi-chevron-down"></i></button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </div><!-- /btn-group -->
                     </div>




                 </div><!--select ship-->

                 <div class="recipient-name">
                    <span>수령인/배송지</span>
                    <input type="text" class="form-control order-custom margin-left-30">
                 </div>

                 <div class="recipient-name">
                    <span>휴대전화</span>
                    <input type="text" class="form-control order-custom margin-left-65">
                 </div>

                 <div class="recipient-name" style="height: 170px;">
                    <span style="margin-right: 43px;">배송지 주소</span>
                    <div class="post-code">
                        <input type="text" id="postcode1"  class="form-control order-custom post-title" placeholder="우편번호">
                        <button id="order-post-btn" class="btn btn-dark waves-effect waves-light " onClick="openPostCode()">우편 번호 찾기</button>   
                        <input type="text" id="postcode2" class="form-control order-custom post" placeholder="도로명주소">
                        <input type="text" id="postcode4" class="form-control order-custom post" placeholder="상세주소">                     
                    </div>
                 </div>
                    
                 <div class="recipient-name" style="height: 100px;">
                     <span style="margin-right: 50px;">배송 메모</span>
                     <div class="btn-group mb-2 order-ship-memo-button">
                        <button id="ship-custom-button" class="btn btn-light btn-lg dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                            Large button <i class="mdi mdi-chevron-down"></i>
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </div>

                    <span class="mobile-ship-memo">※ 택배기사님께 전할 말씀을 남겨주세요.</span>
                 </div>

                 <div class="recipient-info mt-5" >
                    <span style=>Product Info</span>상품 정보
                </div>


                <div class="recipient-name">
                    <div class="col-lg-12">
                        
                            <div class="table-responsive">
                                <table class="table mb-0 order-table-custom">
                                    <colgroup>
                                        <col width="15%">
                                        <col width="55%">
                                        <col width="15%">
                                        <col width="20%">
                                    </colgroup>
                                    <thead class="thead-light">
                                    <tr>    
                                        <th></th>
                                        <th>상품명</th>
                                        <th>수량</th>
                                        <th>가격</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><img src="assets/images/review-img.png" alt="d" height="64" ></td>
                                        <td >Otto</td>
                                        <td>@mdo</td>
                                        <td>30000</td>
                                    </tr>
                                    <tr>
                                       
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                        <td>30000</td>
                                    </tr>
                                    <tr>
                                        
                                        <td>Larry</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                        <td>30000</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div> <!-- end table-responsive-->
                    </div> <!-- end col -->

                    
                        <div class="mobile-order">
                            <div class="mobile-order-box rounded">
                                
                                <div class="mobile-cart-list rounded">
                                    <div class="mobile-cart-list-img">
                                        <img src="assets/images/review-img.png" alt="d" height="80" class="rounded">
                                    </div>
    
                                    <div class="mobile-cart-list-box">
                                        <div class="mobile-cart-list-product-title">
                                            S/S WHALE GRAP TEE WHITE
                                        </div>
                                        <div class="mobile-cart-list-product-option float-left">
                                            옵션 : RED XL
                                        </div>
                                        <div class="mobile-cart-list-product-price float-right">
                                            39,000원
                                        </div>
            
                                    </div> 

                                  
                                </div> 
                            </div>
                            <div style="border-bottom: 1px solid #323A46; margin-top: 8px;" ></div>
                        </div>   
    
                    </div>
                </div>

                <div style="margin-top:100px"></div>
                <div class="recipient-info" style="margin-top: 80px;">
                    <span>Payment Info</span>결제 정보
                </div>

                <div class="recipient-name">
                    <span >결제 수단 선택</span>

                     <div class="ship-list">
                        <div class="radio form-check-inline">
                            <input type="radio" id="inlineRadio2" value="option1" name="radioInline" >
                            <label for="inlineRadio2"> 신용 카드 </label>
                        </div>
                        <div class="radio form-check-inline">
                            <input type="radio" id="inlineRadio2" value="option2" name="radioInline">
                            <label for="inlineRadio2"> 계좌 이체 </label>
                        </div>
                        <div class="radio form-check-inline">
                            <input type="radio" id="inlineRadio3" value="option3" name="radioInline">
                            <label for="inlineRadio2" > 무통장 입금  </label>
                        </div>
                     </div>

                     <div class="btn-group mb-2 mobile-order-button">
                        <button id="ship-custom-button" class="btn btn-light btn-lg dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                            Large button <i class="mdi mdi-chevron-down"></i>
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </div>
                </div><!--select ship-->

                 <button type="button" class="btn btn-dark waves-effect waves-light order-button">결제하기</button> 
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