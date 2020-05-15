<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
            <title></title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
            <meta content="Coderthemes" name="author" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <!-- App favicon -->
            <link rel="shortcut icon" href="assets/images/favicon.ico">
    
            <!-- Plugins css -->
            <link href="assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
    
            <!-- App css -->
            <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
            <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
            <link href="assets/css/app.min.css" rel="stylesheet" type="text/css" />

    </head>
<body>
    <!-- Navigation Bar-->
    <header id="topnav" style="background-color:#ffffff">
        @@include('../shop-partials/shop-topbar.html')
    </header>

    <div class="wrapper">
        <div class="container-fluid">
            <div class="mypage-order-group">
                
                <div class="recipient-info">
                    <span >주문 내역</span> 
                </div>

                <div class="mypage-main-order-list">
                    <a href="#"><span class="mypage-order-list-category">입금/결제:&nbsp; 0</span></a>
                    <a href="#"><span class="mypage-order-list-category">배송중:&nbsp 0</span></a>
                    <a href="#"><span class="mypage-order-list-category">배송완료:0</span></a>
                    <a href="#"><span class="mypage-order-list-category">교환:0</span></a>
                    <a href="#"><span class="mypage-order-list-category">환불:0</span></a>
                    <a href="#"><span class="mypage-order-list-category">환불완료:0</span></a>

                    <a class="float-right"href="#"><span class="mypage-order-list-all ">전체</span></a>
                
                    <div class="margin-box-30"></div>


                    <div class="mypage-main-order-table">
                       <div class="row">
                           <div class="col-12">
                            <table class="table table-striped mb-0">

                                <colgroup>
                                    <col width="40%">
                                    <col width="14%">
                                    <col width="14%">
                                    <col width="14%">
                                    <col width="18%">
                                </colgroup>
                                
                                <thead>
                                <tr>
                                    <th>상품정보</th>
                                    <th>주문일자</th>
                                    <th>주문번호</th>
                                    <th>주문금액(수량)</th>
                                    <th>주문 상태</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="mypage-main-order-table-product-info">
                                        <div class="product-info-imagebox">
                                            <img src="assets/images/review-img.PNG" alt="" class="rounded ">
                                        </div>
                                        
                                        <div class="product-info-desbox">     
                                            <a href="#"><span class="border-bottom">상품 이름</span></a>
                                            <span sytle="display:block">옵션 : XL</span>
                                        </div>
                                        
                                    </td>
                                    <td class="text-align-center">
                                        2020.05.13
                                    </td>
                                    <td class="text-align-center"><a href="#"><span>2020051300001</span></a></td>
                                    <td class="text-align-center"> 
                                        <div class="product-info-desbox">     
                                            <span>33900원</span>
                                            <span>1개</span>
                                        </div>
                                    </td>
                                    <td class="text-align-center">01039027775</td>
                                </tr>

                                <tr>
                                    <td class="mypage-main-order-table-product-info">
                                        <div class="product-info-imagebox">
                                            <img src="assets/images/review-img.PNG" alt="" class="rounded">
                                        </div>
                                        
                                        <div class="product-info-desbox">     
                                            <a href="#"><span class="border-bottom">상품 이름</span></a>
                                            <span sytle="display:block">옵션 : XL</span>
                                        </div>
                                        
                                    </td>
                                    <td class="text-align-center">
                                        2020.05.13
                                    </td>
                                    <td class="text-align-center"><a href="#"><span>2020051300001</span></a></td>
                                    <td class="text-align-center"> 
                                        <div class="product-info-desbox">     
                                            <span>33900원</span>
                                            <span>1개</span>
                                        </div>
                                    </td>
                                    <td class="text-align-center">교환중</td>
                                </tr>

                                <tr>
                                    <td class="mypage-main-order-table-product-info">
                                        <div class="product-info-imagebox">
                                            <img src="assets/images/review-img.PNG" alt="" class="rounded">
                                        </div>
                                        
                                        <div class="product-info-desbox">     
                                            <a href="#"><span class="border-bottom">상품 이름</span></a>
                                            <span sytle="display:block">옵션 : XL</span>
                                        </div>
                                        
                                    </td>
                                    <td class="text-align-center">
                                        2020.05.13
                                    </td>
                                    <td class="text-align-center"><a href="#"><span>2020051300001</span></a></td>
                                    <td class="text-align-center"> 
                                        <div class="product-info-desbox">     
                                            <span>33900원</span>
                                            <span>1개</span>
                                        </div>
                                    </td>
                                    <td class="text-align-center">배송완료</td>
                                </tr>

                                <tr>
                                    <td class="mypage-main-order-table-product-info">
                                        <div class="product-info-imagebox">
                                            <img src="assets/images/review-img.PNG" alt="" class="rounded">
                                        </div>
                                        
                                        <div class="product-info-desbox">     
                                            <a href="#"><span class="border-bottom">상품 이름</span></a>
                                            <span sytle="display:block">옵션 : XL</span>
                                        </div>
                                        
                                    </td>
                                    <td class="text-align-center">
                                        2020.05.13
                                    </td>
                                    <td class="text-align-center"><a href="#"><span >2020051300001</span></a></td>
                                    <td class="text-align-center"> 
                                        <div class="product-info-desbox">     
                                            <span>33900원</span>
                                            <span>1개</span>
                                        </div>
                                    </td>
                                    <td class="text-align-center">배송중</td>
                                </tr>
                                </tbody>
                            </table>    
                           </div>
                       </div>
                    </div>
                </div>

                <div style="margin-top: 90px;"></div>
                
                <div class="recipient-info">
                    <span >장바구니</span> 
                    <span class="mypage-main-cart float-right"> 전체</span>
                </div>
                
                <div class="col-lg-12"> 
                    <div class="table-responsive">
                        <table class="table mb-0 order-table-custom" style="margin : 0 auto; text-align: center;">
                            <colgroup>
                                <col width="5%">
                                <col width="35%">
                                <col width="15%">
                                <col width="15%">
                                <col width="25%">
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
                                    <img src="assets/images/review-img.png" alt="d" height="64" class="rounded cart-img">
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
            <div style="margin-top: 80px;"></div>
            <div class="recipient-info">
                <span >상품문의</span> 
                <span class="mypage-main-cart float-right"> 전체</span>
            </div>

            <div style="margin-top: 80px;"></div>
            <div class="recipient-info">
                <span >1:1문의</span> 
                <span class="mypage-main-cart float-right"> 전체</span>
            </div>


            
            <div style="margin-top: 80px;"></div>
            <div class="recipient-info">
                <span >구매후기</span> 
                <span class="mypage-main-cart float-right"> 전체</span>
            </div>
            </div>
        </div>
    </div>


    @@include('../shop-partials/shop-footer.html')

</body>
</html>