<!DOCTYPE html>
<html lang='utf-8'>
    <head>
        <meta charset='utf-8' />
            <title></title>
            <%@ page language='java' contentType='text/html; charset=UTF-8'	pageEncoding='UTF-8'%>
			<%@ taglib uri = 'http://java.sun.com/jsp/jstl/core' prefix='c' %>
			<%@ taglib uri = 'http://java.sun.com/jsp/jstl/functions' prefix='fn' %>
			<%@ taglib uri = 'http://java.sun.com/jsp/jstl/fmt' prefix='fmt' %>
            
            <meta name='viewport' content='width=device-width, initial-scale=1.0'>
            <meta content='A fully featured admin theme which can be used to build CRM, CMS, etc.' name='description' />
            <meta content='Coderthemes' name='author' />
            <meta http-equiv='X-UA-Compatible' content='IE=edge' />
            <!-- App favicon -->
            <link rel='shortcut icon' href='${pageContext.request.contextPath}/assets/images/favicon.ico'>
    
            <!-- Plugins css -->
            <link href='${pageContext.request.contextPath}/assets/libs/flatpickr/flatpickr.min.css' rel='stylesheet' type='text/css' />
    
            <!-- App css -->
            <link href='${pageContext.request.contextPath}/assets/css/bootstrap.min.css' rel='stylesheet' type='text/css' />
            <link href='${pageContext.request.contextPath}/assets/css/icons.min.css' rel='stylesheet' type='text/css' />
            <link href='${pageContext.request.contextPath}/assets/css/app.min.css' rel='stylesheet' type='text/css' />
    		<link href='${pageContext.request.contextPath}/assets/css/common.css' rel='stylesheet' type='text/css' />
    		
    		<!-- jQuery -->
			<script src='https://code.jquery.com/jquery-3.5.1.min.js' integrity='sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=' crossorigin='anonymous'></script>
    		
			<script>
			$(function(){
				$('#cart-all-select').click(function(){
					if($('#cart-all-select').is(':checked')){
						$('input[type=checkbox]').prop('checked',true);
						
					}else{
						$('input[type=checkbox]').prop('checked',false);			
					}
				});
				
				$('#cart-all-order-btn').click(function(){
					
					var cartNoList=[];
					var amountList=[];
					var checkList=[];
					$('.mobile-cart').each(function(){
						
						 var check = new Object();
						
						var nowStock = $(this).data('value');
						var nowAmount = $(this).find("input[type=text]").val();
						if(nowStock<nowAmount){
							check.name=$(this).data('name');
							check.stock=nowStock;
						}
						
						if(check.name!=null){
							checkList.push(check);
						}
						
						cartNoList.push($(this).data('no'));
						amountList.push(nowAmount);   
					
					});	    
					
					
					 if(cartNoList.length ==0){
						alert("상품을 선택해주세요!");
					}else{
						if(checkList.length!=0){
							var nowStr="";
							for(var i=0;i<checkList.length;i++){
										nowStr += "     상품 이름 : "+checkList[i].name + "남은 재고 : " +checkList[i].stock +"\n"
							}
							alert("선택하신 제품에 재고가 부족합니다 \n\n"+nowStr);
							
							
							
						} else{
							var objParams = {
									'cartNoList' : cartNoList,
									'amountList' : amountList
	 						};
							$.ajax({
								url : '${pageContext.request.contextPath }/api/order/order',
								dataType : 'json',
								contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
								type : 'post',
								data : objParams,
								success : function(response) {
									location.href='${pageContext.request.contextPath }/${db}/order/order'
								},
								error : function(xhr, status, e) {
									console.error(status + ':' + e);
								}
							});
						}
					}  
				});
				
				$('#cart-select-order-btn').click(function(){
					var cartNoList=[];
					var amountList=[];
					var checkList=[];
					$('.mobile-cart').each(function(){
						
						if($(this).find('input:checkbox[class=cart-select]').is(':checked')==true){
							
							 var check = new Object();
								
								var nowStock = $(this).data('value');
								var nowAmount = $(this).find("input[type=text]").val();
								if(nowStock<nowAmount){
									check.name=$(this).data('name');
									check.stock=nowStock;
								}
								
								if(check.name!=null){
									checkList.push(check);
								}
								
								cartNoList.push($(this).data('no'));
								amountList.push(nowAmount);   
							
						}
						
					});	    
					
					
					 if(cartNoList.length ==0){
						alert("상품을 선택해주세요!");
					}else{
						if(checkList.length!=0){
							var nowStr="";
							for(var i=0;i<checkList.length;i++){
										nowStr += "     상품 이름 : "+checkList[i].name + "  남은 재고 : " +checkList[i].stock +"\n"
							}
							alert("선택하신 제품에 재고가 부족합니다 \n\n"+nowStr);
							
							
							
						} else{
							var objParams = {
									'cartNoList' : cartNoList,
									'amountList' : amountList
	 						};
							$.ajax({
								url : '${pageContext.request.contextPath }/api/order/order',
								dataType : 'json',
								contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
								type : 'post',
								data : objParams,
								success : function(response) {
									location.href='${pageContext.request.contextPath }/${db}/order/order'
								},
								error : function(xhr, status, e) {
									console.error(status + ':' + e);
								}
							});
						}
					}  
				});
				
				$('#delete-all-product').click(function(){
					
					
					$.ajax({
						url : '${pageContext.request.contextPath }/api/order/cart/delete-all/',
						async : true,
						type : 'get',
						data : '',
						success : function(response) {
							
							$('.mobile-cart').remove();
							
						},
						error : function(xhr, status, e) {
							console.error(status + ':' + e);
						}
					});  
					
				});
							
				$(document).on('click','#cart-delete-product', function(){
					var no = $(this).data('no');
					
					$.ajax({
						url : '${pageContext.request.contextPath }/api/order/cart/delete/' + no ,
						async : true,
						type : 'get',
						dataType : 'json',
						data : '',
						success : function(response) {
							
							$('.mobile-cart[data-no='+no+']').remove();
							
						},
						error : function(xhr, status, e) {
							console.error(status + ':' + e);
						}
					});  
				});
				
				$(document).on('click','#input-button button', function(){
					
					var button = $(this).val();
					var input = $(this).siblings('input');
					var price = $(this).siblings('#price').text();
					var priceText;
					var conInput = parseInt(input.val());
					var nowPrice = parseInt(price)/conInput;
					if(button=='plus'){
						conInput++;
					}else{
						if(conInput==0){
							conInput==0;
						}else{
							conInput--;
						}
					}
					
					input.val(conInput);
				
					
				
				});
			});
			</script>

    </head>
<body>
    <!-- Navigation Bar-->
     <c:import url='/WEB-INF/views/partials/topbar.jsp'></c:import>
	 <c:import url='/WEB-INF/views/partials/left-nav.jsp'></c:import>
	


    <div class='wrapper'>
        <div class='container-fluid' >
            <div class='order-title'>
                <span> Cart </span>장바구니</div>
            <div class='recipient-info'>
                <span style='Font-size:24px; font-weight:Bold; color:#323A46;'>Product</span> 상품 정보
            </div>

           <%--  <div class='cart-custom-list' >
                <div class='col-lg-12'> 
                        <div class='table-responsive'>
                            <table class='table mb-0 order-table-custom' style='margin : 0 auto; text-align: center;'>
                                <colgroup>
                                    <col width='5%'>
                                    <col width='40%'>
                                    <col width='17%'>
                                    <col width='17%'>
                                    <col width='26%'>
                                </colgroup>
                                <thead class='thead-light'>
                                <tr>    
                                    <th > 
                                        <div class='checkbox checkbox-dark mb-2'>
                                        <input id='cart-all-select' type='checkbox'>
                                        <label for='cart-all-select'>번호</label>
                                        </div>
                                    </th>
                                    <th>상품명</th>
                                    <th>수량</th>
                                    <th>상품금액</th>
                                    <th>주문관리</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${list }' var='vo' varStatus='status'>
                              	  <tr id='cart-list' value='${status.index+1 }'>
                                    <td value='${status.index+1 }'>
	                                   	<div class='checkbox checkbox-dark mb-2 '>
		                                    <input id='${status.index+1 }' type='checkbox' class='cart-select' value='${status.index+1 }'>
		                                    <label for='${status.index+1 }' value='${status.index+1 }'>${status.index+1 }</label>
	                                    </div>
                                  	</td>
                                    <td style='padding-top:15px'>
                                        <img src='assets/images/review-img.png' alt='d' class='rounded cart-img'>
                                        <div class = 'order-custom-product-name'> ${vo.name }</div>
                                    </td>   
                                    <td>
                                       <div class='order-custom-count'>
                                       <button class='btn btn-dark waves-effect ' value='minus'><i class='fe-minus cart-minus-btn'></i></button>
                                        <input type='text' class='form-control' value='${vo.amount}' required>
                                       <button class='btn btn-dark waves-effect ' value='plus' ><i class='fe-plus cart-plus-btn'></i></button>
                                       </div>
                                    </td>
                                    <td>${vo.totalPrice }</td>
                                    <td style='padding-top:10px;'><button class='btn btn-dark waves-effect cart-delete-button' value=${vo.cartNo } id='${status.index+1 }'>삭제하기</button></td>
                                </tr>
                                </c:forEach>
                                </tbody>

                            </table>
                            
                        </div> <!-- end table-responsive-->   

                </div> <!-- end col -->
            </div> --%>
            
            <!-- <div class='payment-info-button'>
                <span>선택된 상품</span>
                <button class='btn btn-dark waves-effect cart-delete-button'>삭제하기</button>

                <button class='btn btn-dark waves-effect cart-delete-button float-right cart-btn'>장바구니 비우기</button>
            </div> -->
            <div class='moblie-cart-all-selector'>
                <div class='checkbox checkbox-blue  m-1'>
                    <input id='cart-all-select' type='checkbox'>
                    <label for='cart-all-select'>
                        	전체 선택
                    </label>
                </div>
		

                <div style='border-bottom: 0.3px solid #555555;'></div>
            </div>
         <div class='cart-list-group'>
         	 <c:forEach items='${list }' var='vo' varStatus='status'>
            <div class='mobile-cart rounded' data-no='${vo.cartNo }' data-value='${vo.stock }' data-name='${vo.name }'>
                <div class='moblie-cart-all-group'>
                    <div class='mobile-cart-list-checkbox m-1' >
                        <div class='checkbox checkbox-blue  ml-1' style='display:inline-block;width:50%' id='mobile-checkbox'>
                            <input id='${status.index+1 }' type='checkbox' class='cart-select' value='${vo.cartNo}'>
                            <label for='${status.index+1 }' value='${vo.cartNo}'>선택</label>  
                        </div>
                        
                        <div data-no='${vo.cartNo }'class ='cart-delete float-right' style='display:inline-block; margin-right:10px;' >
                        	<a href='#' style='color:#000000; border-bottom:1px solid #000000; margin:5px;' id='cart-delete-product' value='${vo.cartNo }' data-no='${vo.cartNo }'>삭제</a>
                        </div>
                    </div>
                   	
                   
                   	<div class='responsive-cart-img float-left' style="max-width:150px; max-height:92px;">
                   		<img src='/scs-manager${vo.mainImage }' style="max-width:150px; max-height:92px;" alt='' class='rounded'>
                    </div>
                    <div class='responsive-cart-info float-right''>
                    	<div style='width:60%; display:inline-block;' >
                    		<div class='responsive-cart-product-title'>
                    		${vo.name }
                    	</div>
                    	<div class='responsive-cart-product-option'>
                                                옵션 : ${vo.firstOptionName } ${vo.secondOptionName }
                        </div>
                    	</div>
                    	<div style='width:38%; display:inline-block;'>
	                    	
	                     <div class='responsive-cart-btn-group ' id='input-button'>
	                     		 <label >상품금액 :  &nbsp;&nbsp;</label>
	                      		 <label id='price'>${vo.totalPrice }</label>
	                      		 </br>
	                      		 <label>수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;량 :&nbsp;&nbsp; </label>
	                      		 <div class='mobile-margin-left'></div>
	                      		<button class='btn btn-dark waves-effect ' value='minus'><i class='fe-minus cart-minus-btn'></i></button>
	                            <input type='text' class='form-control' value='${vo.amount }' required>
	                            <button class='btn btn-dark waves-effect ' value='plus'><i class='fe-plus cart-plus-btn'></i></button>
	                       	 </div>
	                     </div>
                     
                    </div>
                   	
                   	
                    
                    
                    <%-- <div class='mobile-cart-list ' style='Width:100%'>
                        <div class='mobile-cart-list-img'>
                            <img src='assets/images/review-img.png' alt='d' height='80' class='rounded'>
                        </div>
    
                        <div class='mobile-cart-list-box '>
                            <div class='mobile-cart-list-product-title'>
                                ${vo.name }
                            </div>
                            <div class='mobile-cart-list-product-option'>
                               		 옵션 : ${vo.firstOptionName } ${vo.secondOptionName }
                            </div>
                            <div class='mobile-cart-list-product-price float-right'>
                               ${vo.totalPrice }
                            </div>
    
                            <div class='mobile-cart-count-btn float-right'>
                                <button class='btn btn-dark waves-effect '><i class='fe-plus cart-plus-btn'></i></button>
                                <input type='text' class='form-control' value='${vo.amount }' required>
                                <button class='btn btn-dark waves-effect '><i class='fe-minus cart-minus-btn'></i></button>
                            </div>
                        </div>
                    </div> --%>
                </div>
            </div>
            </c:forEach>
         </div>
            
            <button class='btn btn-dark waves-effect float-right' style='margin-top:50px' id='delete-all-product'>전체상품 삭제</button>
            
			<div style='margin-top: 150px;'></div>


           <!--  <div class='recipient-info'>
                <span style='Font-size:24px; font-weight:Bold; color:#323A46;'>주문 정보</span> 
            </div>

            <div class='recipient-info'>
                <div style='margin-top:10px'></div>
                <span style='Font-size:20px; font-weight:Bold; color:#323A46;'>결제 예정 금액 :</span> 
                <span style='Font-size:20px; font-weight:Bold; color:#ff0000;' id='totalPrice'></span> 
                <span style='Font-size:20px; font-weight:Bold; color:#323A46;'>원</span> 
            </div> -->
            <div class='cart-order-btn'>
                <div style='margin-top:30px'></div>
                <button class='btn btn-dark waves-effect cart-delete-button' id='cart-all-order-btn'>전체 상품 주문</button>
                <button class='btn btn-dark waves-effect cart-delete-button' id='cart-select-order-btn'>선택 상품 주문</button>
            </div>
        

            </div>
            

            
            </div>
        </div>
        </div>
    </div>

      <c:import url='/WEB-INF/views/partials/footer.jsp'></c:import>
    <!-- Vendor js -->
   <script src='${pageContext.request.contextPath}/assets/js/vendor.min.js'></script>

   <!-- App js-->
   <script src='${pageContext.request.contextPath}/assets/js/app.min.js'></script>

</body>
</html>