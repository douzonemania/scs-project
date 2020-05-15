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
    <!-- Navigation Bar-->
    <header id="topnav" style="background-color:#ffffff">
        @@include('../shop-partials/shop-topbar.html')
    </header>

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
                    <span style="font-weight: bold; color:#323a46; margin-left:10px;margin-right:60px" >배송지 선택</span>

                     <div class="ship-list" style="display: inline-block; margin-right: 10px;">
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


                 </div><!--select ship-->

                 <div class="recipient-name">
                    <span>수령인/배송지</span>
                    <input type="text" class="form-control order-custom" style="margin-left: 30px;">
                 </div>

                 <div class="recipient-name">
                    <span>휴대전화</span>
                    <input type="text" class="form-control order-custom" style=" margin-left: 65px;">
                 </div>

                 <div class="recipient-name" style="display: flex; height: 200px;">
                    <span style="margin-right: 43px;">배송지 주소</span>
                    <div class="post-code">
                        <input type="text" id="postcode1"  class="form-control order-custom post-title" placeholder="우편번호">
                        <button id="order-post-btn" class="btn btn-dark waves-effect waves-light " onClick="openPostCode()">우편 번호 찾기</button>   
                        <input type="text" id="postcode2" class="form-control order-custom post" placeholder="도로명주소">
                        <input type="text" id="postcode4" class="form-control order-custom post" placeholder="상세주소">                     
                    </div>
                 </div>
                    
                 <div class="recipient-name">
                     <span style="margin-right: 50px;">배송 메모</span>
                     <div class="btn-group mb-2">
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

                    <span>※ 택배기사님께 전할 말씀을 남겨주세요.</span>
                 </div>

                 <div class="recipient-info" style="margin-top: 80px;">
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
                </div>


                <div class="recipient-info" style="margin-top: 80px;">
                    <span>Payment Info</span>결제 정보
                </div>

                <div class="recipient-name" >
                    <span >결제 수단 선택</span>

                     <div class="ship-list" style="display: inline-block; margin-right: 20px;">
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
                 </div><!--select ship-->

                 <button type="button" class="btn btn-dark waves-effect waves-light order-button">결제하기</button>
            </div>
        </div>
    </div>

   @@include('../shop-partials/shop-footer.html') 

</body>
</html>