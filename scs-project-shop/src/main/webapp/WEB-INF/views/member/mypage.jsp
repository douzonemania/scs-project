<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="utf-8">
    <head>
        <meta charset="utf-8" />
            <title></title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
            <meta content="Coderthemes" name="author" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <!-- App favicon -->
            <link rel="shortcut icon" href="${ pageContext.request.contextPath }/assets/images/favicon.ico">
    
            <!-- Plugins css -->
            <link href="${ pageContext.request.contextPath }/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
    
            <!-- App css -->
            <link href="${ pageContext.request.contextPath }/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
            <link href="${ pageContext.request.contextPath }/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
            <link href="${ pageContext.request.contextPath }/assets/css/app.min.css" rel="stylesheet" type="text/css" />
			
			<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){

	$('#change-pwd-btn').click(function(e){
		window.open('passwordMod','비밀번호변경','width=490,height=500,location=no,status=no,scrollbars=auto');
	});
	
	$('#change-name-btn').click(function(e){
		var id = "${vo.id}"
		var name = $('#name-text').val();
		$.ajax({
			url: '${pageContext.request.contextPath }/api/member/mod/name',
			async: true,
			type: 'post',
			data: {"id":id, "name":name },
			success: function(response){
				alert("이름이 변경되었습니다.");
				location.reload();
			},
			error: function(xhr, status, e){
				console.error(status + " : " + e);
			}
		}); 
	});
	
	
	$('#change-phone-btn').click(function(e){
		var id = "${vo.id}"
		var phone = $('#phone-text').val();
		
		var check =/(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
		
		if(phone==''){
			alert("핸드폰 번호를 입력하세요.");
			return;
		}
		if(check.test(phone)== false){
			alert("휴대번호 형식이 올바르지 않습니다.");
			return;
		}
		$.ajax({
			url: '${pageContext.request.contextPath }/api/member/mod/phone',
			async: true,
			type: 'post',
			data: {"id":id, "phone":phone },
			success: function(response){
				alert("휴대전화번호가 변경되었습니다.");
				location.reload();
			},
			error: function(xhr, status, e){
				console.error(status + " : " + e);
			}
		}); 
	
	});	


});
</script>

    </head>
<body>
    <!-- Navigation Bar-->
     <c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import>
    <div class="wrapper">
        <div class="container-fluid">
        
             <div class="mypage-order-group">
                <div class="recipient-info">
                    <span >나의 정보</span> 
                    <span class="mypage-main-order float-right"> 전체</span>
                </div>
                
                <div class="mypage-my-info">
                	<div class="row">
                         <div class="col-12">	
                         	<table class="table table-striped mb-0" style="line-height:40px">
                         		<colgroup>
                         			<col style="width:190px">
                         			<col style="width:*">
                         			<col style="width:50%">
                         		</colgroup>
                         		<tbody>
                         			<tr>
                         				<th>아이디</th>
                         				<td>${vo.id }</td>
                         				<td></td>
                         			</tr>
                           			<tr>
                         				<th>비밀번호</th>
                         				<td>********</td>
                         				<td><input type="button" class="btn btn-dark waves-effect cart-delete-button" id="change-pwd-btn" 
                         				value="비밀번호 변경" style="width:120px"/></td>
                         			</tr>
                           			<tr>
                         				<th>이름</th>
                         				<td><input type="text" class="form-control" value="${vo.name }" style="width:250px" id="name-text"/></td>
                         				<td><input type="button" class="btn btn-dark waves-effect cart-delete-button" id="change-name-btn" 
                         				value="이름 변경" style="width:120px"/></td>
                         			</tr>                         			
                         			<tr>
                         				<th>이메일</th>
                         				<td>${vo.email }</td>
                         				<td>
                         			</tr>
                         			<!-- <input type="button" class="btn btn-dark waves-effect cart-delete-button" id="change-email-btn" 
                         				value="이메일 변경" style="width:120px"/></td> -->
                         			<tr>
                         				<th>휴대전화</th>
                         				<td><input type="text" class="form-control" value="${vo.phoneNumber }" style="width:250px" id="phone-text"/></td>
                         				<td><input type="button" class="btn btn-dark waves-effect cart-delete-button" id="change-phone-btn" 
                         				value="휴대전화 변경" style="width:120px"/></td>
                         			</tr>                         			
                         		</tbody>
                         	</table> 
                         </div>
                    </div>
                </div>
             </div>
             
             <br>
             <br>
            <div class="mypage-order-group">
                
                <div class="recipient-info">
                    <span >주문 내역</span> 
                    <span class="mypage-main-order float-right"> 전체</span>
                </div>
                
                <div class="mypage-main-order-list">
                    <a href="#" class="mobile-visible"><span class="mypage-order-list-category ">입금/결제:&nbsp; 0</span></a>
                    <a href="#" class="mobile-visible"><span class="mypage-order-list-category">배송중:&nbsp; 0</span></a>
                    <a href="#" class="mobile-visible"><span class="mypage-order-list-category">배송완료:&nbsp;0</span></a>
                    <a href="#" class="mobile-none"><span class="mypage-order-list-category ">교환:&nbsp;0</span></a>
                    <a href="#" class="mobile-none"><span class="mypage-order-list-category ">환불:&nbsp;0</span></a>
                    <a href="#" class="mobile-none"><span class="mypage-order-list-category ">환불완료:&nbsp;0</span></a>

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
                                            <img src="${ pageContext.request.contextPath }/assets/images/review-img.PNG" alt="" class="rounded ">
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
                                            <img src="${ pageContext.request.contextPath }/assets/images/review-img.PNG" alt="" class="rounded">
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
                                            <img src="${ pageContext.request.contextPath }/assets/images/review-img.PNG" alt="" class="rounded">
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
                                            <img src="${ pageContext.request.contextPath }/assets/images/review-img.PNG" alt="" class="rounded">
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

                    <div class="mobile-order">
                        <!-- <div class="mobile-cart-list rounded">
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
                        </div>-->
                        
                        <div class="mobile-order-box rounded">
                            <div class="mobile-order-no">
                                주문번호 : 213121323123
                            </div>
                            <div class="mobile-order-date">
                                주문날짜 : 20.05.13
                            </div>
                            
                            <div style="margin-top: 8px;  border-bottom: 1px solid #000000;"></div>
                        
                            <div class="mobile-cart-list rounded">
                                <div class="mobile-cart-list-img">
                                    <img src="${ pageContext.request.contextPath }/assets/images/review-img.png" alt="d" height="80" class="rounded">
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
            
                                    <div class="mobile-order-state float-right">
                                        구매확정
                                    </div>
                                </div> 
                            </div>

                           
                        </div>

                        <div class="mobile-order-box rounded">
                            <div class="mobile-order-no">
                                주문번호 : 213121323123
                            </div>
                            <div class="mobile-order-date">
                                주문날짜 : 20.05.13
                            </div>
                            
                            <div style="margin-top: 8px;  border-bottom: 1px solid #000000;"></div>
                        
                            <div class="mobile-cart-list rounded">
                                <div class="mobile-cart-list-img">
                                    <img src="${ pageContext.request.contextPath }/assets/images/review-img.png" alt="d" height="80" class="rounded">
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
            
                                    <div class="mobile-order-state float-right">
                                        구매확정
                                    </div>
                                </div> 
                            </div>

                           
                        </div>
                    </div>   

                </div>


                <div class="mypage-main-gap"></div>
                
                <div class="recipient-info">
                    <span >장바구니</span> 
                    <span class="mypage-main-cart float-right"> 전체</span>
                </div>
                
                <div class="col-lg-12 mobile-none"> 
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
                                    <img src="${ pageContext.request.contextPath }/assets/images/review-img.png" alt="d" height="64" class="rounded cart-img">
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
            <div class="mobile-cart-group"> 
                <div class="moblie-cart-all-selector">
                
                </div>
          
           
                <div class="mobile-cart ">
                    <div class="moblie-cart-all-group">
                        
                        <div class="mobile-cart-list ">
                            <div class="mobile-cart-list-img">
                                <img src="${ pageContext.request.contextPath }/assets/images/review-img.png" alt="d" height="80" class="rounded">
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
                        
                        <div class="mobile-cart-list ">
                            <div class="mobile-cart-list-img">
                                <img src="${ pageContext.request.contextPath }/assets/images/review-img.png" alt="d" height="80" class="rounded">
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
            <div class="mypage-main-gap"></div>
            <div class="recipient-info">
                <span >상품문의</span> 
                <span class="mypage-main-cart float-right"> 전체</span>
            </div>
            <div class="mypage-product-qna">
                <div class="mypage-product-qna-title">
                    상품 문의 입니다.
                </div>
                <div class="mypage-product-qna-date">
                    20.05.14 19:16
                </div>
            </div>
            <div class="mypage-product-qna">
                <div class="mypage-product-qna-title">
                    상품 문의 입니다.
                </div>
                <div class="mypage-product-qna-date">
                    20.05.14 19:16
                </div>
            </div>


            <div class="mypage-main-gap"></div>
            <div class="recipient-info">
                <span >1:1문의</span> 
                <span class="mypage-main-cart float-right"> 전체</span>
            </div>
            <div class="mypage-product-qna">
                <div class="mypage-product-qna-title">
                    상품 문의 입니다.
                </div>
                <div class="mypage-product-qna-date">
                    20.05.14 19:16
                </div>
            </div>
            <div class="mypage-product-qna">
                <div class="mypage-product-qna-title">
                    상품 문의 입니다.
                </div>
                <div class="mypage-product-qna-date">
                    20.05.14 19:16
                </div>
            </div>

            
        </div>
    </div>

	 <c:import url="/WEB-INF/views/partials/footer.jsp"></c:import>
    <!-- Vendor js -->
   <script src="${ pageContext.request.contextPath }/assets/js/vendor.min.js"></script>

   <!-- App js-->
   <script src="${ pageContext.request.contextPath }/assets/js/app.min.js"></script>

</body>
</html>