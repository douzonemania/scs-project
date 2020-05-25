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
            <div class="order-title">
                <span> Cart </span>장바구니</div>
            <div class="recipient-info">
                <span style="Font-size:24px; font-weight:Bold; color:#323A46;">Product</span> 상품 정보
            </div>

            <div class="cart-custom-list">
                <div class="col-lg-12"> 
                        <div class="table-responsive">
                            <table class="table mb-0 order-table-custom" style="margin : 0 auto; text-align: center;">
                                <colgroup>
                                    <col width="5%">
                                    <col width="40%">
                                    <col width="17%">
                                    <col width="17%">
                                    <col width="26%">
                                </colgroup>
                                <thead class="thead-light">
                                <tr>    
                                    <th> 
                                        <div class="checkbox checkbox-dark mb-2">
                                        <input id="checkbox6c" type="checkbox">
                                        <label for="checkbox6c">번호</label>
                                        </div>
                                    </th>
                                    <th>상품명</th>
                                    <th>수량</th>
                                    <th>주문금액</th>
                                    <th>주문관리</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <div class="checkbox checkbox-dark mb-2">
                                        <input id="checkbox6c" type="checkbox">
                                        <label for="checkbox6c">1</label>
                                        </div>
                                    </td>
                                    <td style="padding-top:15px">
                                        <img src="assets/images/review-img.png" alt="d" class="rounded cart-img">
                                        <div class = "order-custom-product-name"> 오호라 베스트 콜렉숀 네일 아트 세트 제품명을 오호라 베스트 콜렉숀 네일 아트 세트 제품명을 </div>
                                    </td>   
                                    <td>
                                       <div class="order-custom-count">
                                        <button class="btn btn-dark waves-effect "><i class="fe-plus"></i></button>
                                        <input type="text" class="form-control" id="validationCustom01"  value="1" required>
                                        <button class="btn btn-dark waves-effect "><i class="fe-minus"></i></button>
                                       </div>
                                    </td>
                                    <td>30000</td>
                                    <td style="padding-top:10px;"><button class="btn btn-dark waves-effect cart-delete-button" ">삭제하기</button></td>
                                </tr>
                                
                                </tbody>

                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="checkbox checkbox-dark mb-2">
                                            <input id="checkbox6c" type="checkbox">
                                            <label for="checkbox6c">1</label>
                                            </div>
                                        </td>
                                        <td style="padding-top:15px">
                                            <img src="assets/images/review-img.png" alt="d" class="rounded cart-img" >
                                            <div class = "order-custom-product-name"> 오호라 베스트 콜렉숀 네일 아트 세트 제품명을 오호라 베스트 콜렉숀 네일 아트 세트 제품명을 </div>
                                        </td>   
                                        <td>
                                           <div class="order-custom-count">
                                            <button class="btn btn-dark waves-effect "><i class="fe-plus"></i></button>
                                            <input type="text" class="form-control" id="validationCustom01"  value="1" required>
                                            <button class="btn btn-dark waves-effect "><i class="fe-minus"></i></button>
                                           </div>
                                        </td>
                                        <td>30000</td>
                                        <td style="padding-top:10px;"><button class="btn btn-dark waves-effect cart-delete-button" ">삭제하기</button></td>
                                    </tr>
                                    
                                    </tbody>

                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="checkbox checkbox-dark mb-2">
                                                <input id="checkbox6c" type="checkbox">
                                                <label for="checkbox6c">1</label>
                                                </div>
                                            </td>
                                            <td style="padding-top:15px">
                                                <img src="assets/images/review-img.png" alt="d" class="rounded cart-img">
                                                <div class = "order-custom-product-name"> 오호라 베스트 콜렉숀 네일 아트 세트 제품명을 오호라 베스트 콜렉숀 네일 아트 세트 제품명을 </div>
                                            </td>   
                                            <td>
                                               <div class="order-custom-count">
                                                <button class="btn btn-dark waves-effect "><i class="fe-plus"></i></button>
                                                <input type="text" class="form-control" id="validationCustom01"  value="1" required>
                                                <button class="btn btn-dark waves-effect "><i class="fe-minus"></i></button>
                                               </div>
                                            </td>
                                            <td>30000</td>
                                            <td style="padding-top:10px;"><button class="btn btn-dark waves-effect cart-delete-button" ">삭제하기</button></td>
                                        </tr>
                                        
                                    </tbody>

                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="checkbox checkbox-dark mb-2">
                                                <input id="checkbox6c" type="checkbox">
                                                <label for="checkbox6c">1</label>
                                                </div>
                                            </td>
                                            <td style="padding-top:15px">
                                                <img src="assets/images/review-img.png" alt="d" class="rounded cart-img" >
                                                <div class = "order-custom-product-name"> 오호라 베스트 콜렉숀 네일 아트 세트 제품명을 오호라 베스트 콜렉숀 네일 아트 세트 제품명을 </div>
                                            </td>   
                                            <td>
                                               <div class="order-custom-count">
                                                <button class="btn btn-dark waves-effect "><i class="fe-plus"></i></button>
                                                <input type="text" class="form-control" id="validationCustom01"  value="1" required>
                                                <button class="btn btn-dark waves-effect "><i class="fe-minus"></i></button>
                                               </div>
                                            </td>
                                            <td>30000</td>
                                            <td style="padding-top:10px;"><button class="btn btn-dark waves-effect cart-delete-button" ">삭제하기</button></td>
                                        </tr>
                                        
                                    </tbody>

                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="checkbox checkbox-dark mb-2">
                                                <input id="checkbox6c" type="checkbox">
                                                <label for="checkbox6c">1</label>
                                                </div>
                                            </td>
                                            <td style="padding-top:15px">
                                                <img src="assets/images/review-img.png" alt="d"  class="rounded cart-img">
                                                <div class = "order-custom-product-name"> 오호라 베스트 콜렉숀 네일 아트 세트 제품명을 오호라 베스트 콜렉숀 네일 아트 세트 제품명을 </div>
                                            </td>   
                                            <td>
                                               <div class="order-custom-count">
                                                <button class="btn btn-dark waves-effect "><i class="fe-plus"></i></button>
                                                <input type="text" class="form-control" id="validationCustom01"  value="1" required>
                                                <button class="btn btn-dark waves-effect "><i class="fe-minus"></i></button>
                                               </div>
                                            </td>
                                            <td>30000</td>
                                            <td style="padding-top:10px;"><button class="btn btn-dark waves-effect cart-delete-button" ">삭제하기</button></td>
                                        </tr>
                                        
                                    </tbody>

                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="checkbox checkbox-dark mb-2">
                                                <input id="checkbox6c" type="checkbox">
                                                <label for="checkbox6c">1</label>
                                                </div>
                                            </td>
                                            <td style="padding-top:15px">
                                                <img src="assets/images/review-img.png" alt="d"  class="rounded cart-img">
                                                <div class = "order-custom-product-name"> 오호라 베스트 콜렉숀 네일 아트 세트 제품명을 오호라 베스트 콜렉숀 네일 아트 세트 제품명을 </div>
                                            </td>   
                                            <td>
                                               <div class="order-custom-count">
                                                <button class="btn btn-dark waves-effect "><i class="fe-plus"></i></button>
                                                <input type="text" class="form-control" id="validationCustom01"  value="1" required>
                                                <button class="btn btn-dark waves-effect "><i class="fe-minus"></i></button>
                                               </div>
                                            </td>
                                            <td>30000</td>
                                            <td style="padding-top:10px;"><button class="btn btn-dark waves-effect cart-delete-button" ">삭제하기</button></td>
                                        </tr>
                                        
                                    </tbody>

                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="checkbox checkbox-dark mb-2">
                                                <input id="checkbox6c" type="checkbox">
                                                <label for="checkbox6c">1</label>
                                                </div>
                                            </td>
                                            <td style="padding-top:15px">
                                                <img src="assets/images/review-img.png" alt="d"  class="rounded cart-img">
                                                <div class = "order-custom-product-name"> 오호라 베스트 콜렉숀 네일 아트 세트 제품명을 오호라 베스트 콜렉숀 네일 아트 세트 제품명을 </div>
                                            </td>   
                                            <td>
                                               <div class="order-custom-count">
                                                <button class="btn btn-dark waves-effect "><i class="fe-plus"></i></button>
                                                <input type="text" class="form-control" id="validationCustom01"  value="1" required>
                                                <button class="btn btn-dark waves-effect "><i class="fe-minus"></i></button>
                                               </div>
                                            </td>
                                            <td>30000</td>
                                            <td style="padding-top:10px;"><button class="btn btn-dark waves-effect cart-delete-button" ">삭제하기</button></td>
                                        </tr>
                                        
                                    </tbody>

                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="checkbox checkbox-dark mb-2">
                                                <input id="checkbox6c" type="checkbox">
                                                <label for="checkbox6c">1</label>
                                                </div>
                                            </td>
                                            <td style="padding-top:15px">
                                                <img src="assets/images/review-img.png" alt="d"  class="rounded cart-img" >
                                                <div class = "order-custom-product-name"> 오호라 베스트 콜렉숀 네일 아트 세트 제품명을 오호라 베스트 콜렉숀 네일 아트 세트 제품명을 </div>
                                            </td>   
                                            <td>
                                               <div class="order-custom-count">
                                                <button class="btn btn-dark waves-effect "><i class="fe-plus"></i></button>
                                                <input type="text" class="form-control" id="validationCustom01"  value="1" required>
                                                <button class="btn btn-dark waves-effect "><i class="fe-minus"></i></button>
                                               </div>
                                            </td>
                                            <td>30000</td>
                                            <td style="padding-top:10px;"><button class="btn btn-dark waves-effect cart-delete-button" ">삭제하기</button></td>
                                        </tr>
                                        
                                    </tbody>
                            </table>
                            
                        </div> <!-- end table-responsive-->   

                </div> <!-- end col -->
            </div>
            
            <!-- <div class="payment-info-button">
                <span>선택된 상품</span>
                <button class="btn btn-dark waves-effect cart-delete-button">삭제하기</button>

                <button class="btn btn-dark waves-effect cart-delete-button float-right cart-btn">장바구니 비우기</button>
            </div> -->
            <div class="moblie-cart-all-selector">
                <div class="checkbox checkbox-blue checkbox-circle m-1">
                    <input id="checkbox-13" type="checkbox" checked>
                    <label for="checkbox-13">
                        Blue
                    </label>
                </div>

                <div style="border-bottom: 0.3px solid #555555;"></div>
            </div>
          
            <div class="mobile-cart ">
                <div class="moblie-cart-all-group">
                    <div class="mobile-cart-list-checkbox">
                        <div class="checkbox checkbox-blue checkbox-circle m-2">
                            <input id="checkbox-13" type="checkbox" checked>
                            <label for="checkbox-13">
                                Blue
                            </label>
                        </div>
                    </div>
                    <div class="mobile-cart-list ">
                        <div class="mobile-cart-list-img">
                            <img src="assets/images/review-img.png" alt="d" height="80" class="rounded">
                        </div>
    
                        <div class="mobile-cart-list-box ">
                            <div class="mobile-cart-list-product-title">
                                S/S WHALE GRAP TEE WHITE
                            </div>
                            <div class="mobile-cart-list-product-option float-left">
                                옵션 : RED XL
                            </div>
                            <div class="mobile-cart-list-product-price float-right">
                                39,000원
                            </div>
    
                            <div class="mobile-cart-count-btn">
                                <button class="btn btn-dark waves-effect "><i class="fe-plus"></i></button>
                                <input type="text" class="form-control " id="validationCustom01"  value="1" required>
                                <button class="btn btn-dark waves-effect "><i class="fe-minus"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                
            <div class="mobile-cart ">
                <div class="moblie-cart-all-group">
                    <div class="mobile-cart-list-checkbox">
                        <div class="checkbox checkbox-blue checkbox-circle m-2">
                            <input id="checkbox-13" type="checkbox" checked>
                            <label for="checkbox-13">
                                Blue
                            </label>
                        </div>
                    </div>
                    <div class="mobile-cart-list ">
                        <div class="mobile-cart-list-img">
                            <img src="assets/images/review-img.png" alt="d" height="80" class="rounded">
                        </div>
    
                        <div class="mobile-cart-list-box ">
                            <div class="mobile-cart-list-product-title">
                                S/S WHALE GRAP TEE WHITE
                            </div>
                            <div class="mobile-cart-list-product-option float-left">
                                옵션 : RED XL
                            </div>
                            <div class="mobile-cart-list-product-price float-right">
                                39,000원
                            </div>
    
                            <div class="mobile-cart-count-btn">
                                <button class="btn btn-dark waves-effect "><i class="fe-plus"></i></button>
                                <input type="text" class="form-control " id="validationCustom01"  value="1" required>
                                <button class="btn btn-dark waves-effect "><i class="fe-minus"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            </div>
            

            <div style="margin-top: 100px;"></div>


            <div class="recipient-info">
                <span style="Font-size:24px; font-weight:Bold; color:#323A46;">주문 정보</span> 
            </div>

            <div class="recipient-info">
                <div style="margin-top:10px"></div>
                <span style="Font-size:20px; font-weight:Bold; color:#323A46;">결제 예정 금액 :</span> 
                <span style="Font-size:20px; font-weight:Bold; color:#ff0000;">&nbsp;&nbsp;&nbsp;&nbsp;30000</span> 
                <span style="Font-size:20px; font-weight:Bold; color:#323A46;">원</span> 
            </div>
                <div class="cart-order-btn">
                    <div style="margin-top:30px"></div>
                    <button class="btn btn-dark waves-effect cart-delete-button">전체 상품 주문</button>
                    <button class="btn btn-dark waves-effect cart-delete-button">선택 상품 주문</button>
                </div>
            
   
            
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