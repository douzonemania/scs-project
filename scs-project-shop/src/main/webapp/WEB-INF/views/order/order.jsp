
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
            <link href="${pageContext.request.contextPath}/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
    
            <!-- App css -->
            <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
            <link href="${pageContext.request.contextPath}/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
            <link href="${pageContext.request.contextPath}/assets/css/app.min.css" rel="stylesheet" type="text/css" />
            <link href="${pageContext.request.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css" />
            
            
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
		$(function(){
			var width = $(window).width();
			var postString = '${recentShip.address}';
			var postArr = postString.split('!');
			var orderName = '${recentShip.shipName}';
			var phoneNumber = '${recentShip.phoneNumber}';
			var orderList = '${orderList}'
			var no = 0;
			$('#ship-option').hide();
			var shipCheck = '${shipListCheck}';
			if(width<=991){
				
				
			}
			if(shipCheck == false){
				$('#drop').attr('disabled',true);
				
			} else{
				
				$('#postcode1').val(postArr[0]);
				$('#postcode2').val(postArr[1]);
				$('#postcode4').val(postArr[2]);
				$('#order-name').val(orderName);
				$('#order-phoneNumber').val(phoneNumber);
			}
			
			$('input[name=radioInline]').change(function(){
				var val = $(this).val();
				
				if(val=="option1"){
					
					no='${recentShip.no}'
					$('#ship-option').hide();
					
					$('#postcode1').val(postArr[0]);
					$('#postcode2').val(postArr[1]);
					$('#postcode4').val(postArr[2]);
					$('#order-name').val(orderName);
					$('#order-phoneNumber').val(phoneNumber);
					
					
				}else if(val=="option2"){
					no=0;
					
					$('#ship-option').hide();
					$('#postcode1').val('');
					$('#postcode2').val('');
					$('#postcode4').val('');
					$('#order-name').val('');
					$('#order-phoneNumber').val('');
					
				
					
				}else if(val=="option3"){
					
					
					$('#ship-option').show();
					
					$('#ship-option').change(function(){
						
						postString =  $('#ship-data[value='+"'"+$(this).val()+"'"+']').find('#select-address').val();
						postArr = postString.split('!');
						
					
						
						$('#postcode1').val(postArr[0]);
						$('#postcode2').val(postArr[1]);
						$('#postcode4').val(postArr[2]);
						$('#order-name').val($('#ship-data[value='+"'"+$(this).val()+"'"+']').find('#select-shipName').val());
						$('#order-phoneNumber').val($('#ship-data[value='+"'"+$(this).val()+"'"+']').find('#select-phoneNumber').val());
						no = $('#ship-data[value='+"'"+$(this).val()+"'"+']').find('#select-no').val();
					
					});
					
					
				}
				
				
			});
			
			$('.order-button').click(function(){
				
				if($('input[name=payRadio]').is(':checked')){
					
				}else{
					
				}
				
				var orderName = $('#order-name').val();
				var orderPhoneNumber = $('#order-phoneNumber').val();
				
				var postcode1= $('#postcode1').val();
				var postcode2= $('#postcode2').val();
				var postcode4= $('#postcode4').val();
				var shipMemo = $('#ship-memo').val();
				var post = postcode1+"!"+postcode2+"!"+postcode4;
				
				var shipVoList ={
						"shipNo" : no,
						"shipName" : orderName,
						"phoneNumber" : orderPhoneNumber,
						"address" : post,
						"shipMemo" : shipMemo
						
				}
				
				
				
				if($('input[name=radioInline]:checked').val()=="option2"){// 주소록 추가 
				
					alert(no);
					
					$.ajax({
						url : '${pageContext.request.contextPath }/api/order/insertShip',
						dataType : 'json',
						type : 'post',
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify(shipVoList),
						success : function(response) {
							location.href='${pageContext.request.contextPath}/${db}/order/complete?orderNum='+response.data;
						},
						error : function(xhr, status, e) {
							console.error(status + ':' + e);
						}
					});  
				}else{// 그냥 오더에 
					
					alert(no);
					$.ajax({
						url : '${pageContext.request.contextPath }/api/order/excuteOrder',
						dataType : 'json',
						type : 'post',
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify(shipVoList),
						success : function(response) {
							location.href='${pageContext.request.contextPath}/${db}/order/complete?orderNum='+response.data;
						},
						error : function(xhr, status, e) {
							console.error(status + ':' + e);
						}
					});  
				}
				
		});
			
	});
		
		
		
		
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

                     <div class="ship-list" >
                    	<div class="radio form-check-inline" id="select-ship-group" data-no="0" >
                    		<c:choose>
		                     	<c:when test="${shipListCheck eq true }">
			                     	<div class="radio form-check-inline">
			                     		 <input type="radio" id="inlineRadio1" value="option1" name="radioInline" checked="checked">
			                     		 <label for="inlineRadio1"> 최근 배송지 </label>
			                     	</div>
		                     		<div class="radio form-check-inline" style="margin-left:30px;">
			                            <input type="radio" id="inlineRadio2" value="option2" name="radioInline">
			                            <label for="inlineRadio2"> 신규 배송지 </label>
                      				</div>
                      			</c:when>
		                     	<c:otherwise>
		                     		<div class="radio form-check-inline">
			                     		 <input type="radio" id="inlineRadio1" value="option1" name="radioInline" disabled>
			                     		 <label for="inlineRadio1"> 최근 배송지 </label>
			                     	</div>
		                     		<div class="radio form-check-inline" style="margin-left:30px;">
			                            <input type="radio" id="inlineRadio2" value="option2" name="radioInline" checked="checked">
			                            <label for="inlineRadio2"> 신규 배송지 </label>
                      				</div>
                      				</c:otherwise>
		                     </c:choose>
		                       </div><!-- ship list-->
							</div><!--select ship-->
							
							
                      				<div class="radio form-check-inline ship-check-list" >
			                            <input type="radio" id="ship-list" value="option3" name="radioInline" >
			                            <label for="ship-list" > 주소록 선택  </label>
				                     </div>
                    			 	<select id="ship-option"  class="custom-select custom-select-sm">
                                  	 	<c:forEach items="${shipList }" var="vo">
                                      			<option value=${vo.no }>${vo.shipName }님의 배송지</option>	
                                      	</c:forEach>
                               		</select>
                               		<div>
                                     <c:forEach items="${shipList }" var="vo2">
				                 	   <div id="ship-data" value="${vo2.no }">
				                    	<input type="hidden" id = "select-shipName" value="${vo2.shipName }"/>
			                            <input type="hidden" id = "select-phoneNumber" value="${vo2.phoneNumber }"/>
			                            <input type="hidden" id = "select-address" value="${vo2.address }"/>
			                            <input type="hidden" id = "select-no" value="${vo2.no }"/> 
				                       </div>     
	                         		 </c:forEach>
		                     		</div>


                 <div class="recipient-name">
                    <span>수령인/배송지</span>
                    <input type="text" class="form-control order-custom margin-left-30" id="order-name">
                 </div>

                 <div class="recipient-name">
                    <span>휴대전화</span>
                    <input type="text" class="form-control order-custom margin-left-65" id="order-phoneNumber">
                 </div>

                 <div class="recipient-name mb-2" style="height: 180px;">
                    <span style="margin-right: 43px;">배송지 주소</span>
                    <div class="post-code">
                        <input disabled type="text" id="postcode1"  class="form-control order-custom post-title" placeholder="우편번호">
                        <button style="height:36px; margin-top:11px;" id="order-post-btn" class="btn btn-dark waves-effect waves-light " onClick="openPostCode()">우편 번호 찾기</button>   
                        <input disabled type="text" id="postcode2" class="form-control order-custom post" placeholder="도로명주소">
                        <input type="text" id="postcode4" class="form-control order-custom post" placeholder="상세주소">                     
                    </div>
                 </div>
                    
                 <div class="recipient-name" style="height: 70px;">
                     <span style="margin-right: 50px;">배송 메모</span>
                    <input type="text" class="form-control order-custom margin-left-14" placeholder="※ 택배기사님께 전할 말씀을 남겨주세요." id = "ship-memo">
                  </div>

                 <div class="recipient-info mt-5" >
                    <span style=>Product Info</span>상품 정보
                </div>

				 <div class='cart-list-group'>
				 <c:set var="total" value="${0}"/>
         	 <c:forEach items='${orderList }' var='vo' varStatus='status'>
         	 <c:set var="total" value="${total+(vo.amount*vo.totalPrice) }" />
            <div class='mobile-order rounded' data-no='${vo.cartNo }'>
            
            	
                <div class='moblie-cart-all-group'>
                    
                   <div class='responsive-cart-img float-left'>
                   		<img src='/assets/images/review-img.png' alt='' class='rounded'>
                   		
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
	                    	
	                     <div class='responsive-order-btn-group' id='input-button'>
	                     		 <label >상품금액 :  &nbsp;&nbsp;</label>
	                      		 <label id='price'>${vo.totalPrice }</label>
	                      		 </br>
	                      		 <label>수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;량 :&nbsp;&nbsp; </label>
	                      	
	                      		 <label value='${vo.amount }'>${vo.amount }</label>
	                        </div>
	                     </div>
                     
                    </div>
                   	
                </div>
            </div>
            </c:forEach>
         </div>
            

                <div style="margin-top:100px"></div>
                <div class="recipient-info"  >
                    <span>Payment Info</span>결제 정보
                </div>

                <div class="recipient-name" style ="padding-bottom:130px">
                	<div>
		                <span style="Font-size:20px; font-weight:Bold; color:#323A46;">결제 예정 금액 :</span> 
		                <span style="Font-size:20px; font-weight:Bold; color:#ff0000;">&nbsp;&nbsp;
		                	
		                	 ${total }
		                
		                </span> 
		                <span style="Font-size:20px; font-weight:Bold; color:#323A46;">원</span> 
     		  	     </div>
                
                
                    <span >결제 수단 선택</span>
					 
     		  	     <div class="ship-list" style="margin-left:20px; ">
                        <div class="radio form-check-inline">
                            <input type="radio" id="payRadio1" value="payRadio1" name="payRadio" >
                            <label for="payRadio1"> 신용 카드 </label>
                        </div>
                        <div class="radio form-check-inline">
                            <input type="radio" id="payRadio2" value="payRadio2" name="payRadio">
                            <label for="payRadio2"> 계좌 이체 </label>
                        </div>
                        <div class="radio form-check-inline">
                            <input type="radio" id="payRadio3" value="payRadio3" name="payRadio">
                            <label for="payRadio3" > 무통장 입금  </label>
                        </div>
                     </div>

                     <div class="btn-group mb-2 mobile-order-button">
                        <button id="ship-custom-button" class="btn btn-light btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                            			결제 수단 <i class="mdi mdi-chevron-down"></i>
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">신용카드</a>
                            <a class="dropdown-item" href="#">계좌이체</a>
                            <a class="dropdown-item" href="#">무통장 입금</a>
                        </div>
                    </div>
                </div><!--select ship-->

                 <button type="button" class="btn btn-dark waves-effect waves-light order-button">결제하기</button> 
            </div>
        </div>
    </div>

   <c:import url="/WEB-INF/views/partials/footer.jsp"></c:import>
    <!-- Vendor js -->
   <script src="${pageContext.request.contextPath}/assets/js/vendor.min.js"></script>

   <!-- App js-->
   <script src="${pageContext.request.contextPath}/assets/js/app.min.js"></script>

</body>
</html>