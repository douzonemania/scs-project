<!DOCTYPE html>
<html lang="utf-8">
    <head>
        <meta charset="utf-8" />
            <title>Pretty Girls~!</title>
            <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
			<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ page import="java.util.*"%>
			<%@ page import="java.text.SimpleDateFormat"%>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
            <meta content="Coderthemes" name="author" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <!-- Plugins css -->
            <link href="${pageContext.request.contextPath}/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
            <!-- App css -->
            <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
            <link href="${pageContext.request.contextPath}/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
            <link href="${pageContext.request.contextPath}/assets/css/app.min.css" rel="stylesheet" type="text/css" />
            <link href="${pageContext.request.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css" />
            <link href="${pageContext.request.contextPath}/assets/css/orderList.css" rel="stylesheet" type="text/css" />
            <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
            <script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
            <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
			<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
			<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
			<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
			<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/3.0.5/daterangepicker.css" />
<script type="text/javascript">
$(document).ready(function(){
	 $(document).on("click",'#reg-review-btn', function(){
		var no = $(this).data('no')
	    window.open("", "review"+no, "width=700, height=900, scrollbars=no");
		$("#review"+no).attr('action',"${ pageContext.request.contextPath }/${db }/order/regReview");
	    $("#review"+no).attr('target',"review"+no);
	    $("#review"+no).submit();
	 });
});	
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

<style>
#info-table th{width:100px;}
@media(max-width:991px){
	#info-table th{font-size:0.4em;padding:0px; }
	#info-table td{padding:10px;}
}
#board-table {
	width: 100%; 
	border-collapse: collapse; 
}
#board-table th {
	 height: 50px;
	 font-weight: bold; 
	 border-top: 1px solid #CECECE;
	 border-bottom: 1px solid #CECECE;
	 background-color: #F1F5F7;
}
#board-table tbody tr {
	height: 50px;
}
#board-table td, th {
	padding: 6px;
	text-align: left;
}
</style>

    </head>
<body>
    <!-- Navigation Bar-->
     <c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import>
     <c:import url='/WEB-INF/views/partials/left-nav.jsp'></c:import>
     
    <div class="wrapper">
        <div class="container-fluid">
        
             <div class="mypage-order-group">
                <div class="recipient-info">
                    <span >나의 정보</span> 
                </div>
                
                <div class="mypage-my-info">
                	<div class="row">
                         <div class="col-12">	
                         	<table class="table table-striped mb-0"  id="info-table">
                         		<colgroup>
	                         		<col style="width:10%;">
						            <col style="width:35%;">
						            <col style="width:*;">
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
                         				value="비밀번호 변경"/></td>
                         			</tr>
                           			<tr>
                         				<th>이름</th>
                         				<td><input type="text" class="form-control" value="${vo.name }" id="name-text"/></td>
                         				<td><input type="button" class="btn btn-dark waves-effect cart-delete-button" id="change-name-btn" 
                         				 style="padding:7px 26px;"
                         				 value="이름 변경"/></td>
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
                         				<td><input type="text" class="form-control" value="${vo.phoneNumber }"  id="phone-text"/></td>
                         				<td><input type="button" class="btn btn-dark waves-effect cart-delete-button" id="change-phone-btn" 
                         				value="휴대전화 변경" /></td>
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
                </div>
                
                <div class="mypage-main-order-list">
                   <a class="float-right"href="${ pageContext.request.contextPath }/${db }/order/orderlist"><span class="mypage-order-list-all ">전체</span></a>
					<div style="height: 30px;"></div>
                    	<div class="ol-col" style="background-color: #F1F5F7;">
	                          	<div class="ol-col-member" style="width:40%">상품정보</div>
	                            <div class="ol-col-member" style="width:15%; padding-right:2">주문일자</div>
	                            <div class="ol-col-member" style="width:11%">주문번호</div>
	                            <div class="ol-col-member" style="width:14%">주문금액(수량)</div>
	                            <div class="ol-col-member" style="width:13%">주문상태</div>
							</div>	
							<div class="mobile-border"></div>
								<c:forEach items='${orderList }' var='vo' varStatus='status'>
									<div class ="ol-item">
										<img class="ol-img" src="/scs-manager${vo.image }" />
										<div class="ol-iteminfo">
											<p class="ol-itemName">${vo.name }</p>
											<div class="ol-option">
												<p class="ol-size" style="margin:0px; padding:0px;">옵션 : ${vo.size } /</p>
												<p class="ol-color" style="margin:0px; padding:0px;">${vo.color }</p>
											</div>
										</div>
										<input type="hidden" value="<fmt:parseDate var="fmtRegDate" value="${vo.regDate}" pattern="yyyy-MM-dd HH:mm" />"/>
										<p class="ol-reg"><fmt:formatDate value="${fmtRegDate}" pattern="yyyy-MM-dd HH:mm"/></p> 
										
										<p class="ol-orderNo">${vo.orderNo }</p>
										<div class="ol-price-mount">
										<p class="ol-price">${priceList[status.index]}</p>
										<p class="ol-amount">(${vo.amount }개)</p>
										</div>
										
										<div class="ol-state-div">
										<p class="ol-state">${vo.statement }</p>
										<c:if test='${vo.statement=="배송완료" }'>
											<c:if test='${restateList[status.index]==0 }'>
												<form id="review${status.index }"  method="post">
													<input type="hidden" name="image" value="${vo.image }"/>
													<input type="hidden" name="itemNo" value="${vo.no }"/>
													<input type="hidden" name="orderNo" value="${vo.orderNoPrime }"/>
													<input type="hidden" name="stockNo" value="${vo.stockNo }"/>												
													<input type="hidden" name="itemName" value="${vo.name }"/>
													<input type="hidden" name="itemSize" value="${vo.size }"/>
													<input type="hidden" name="itemColor" value="${vo.color }"/>
													
													<input type="hidden" name="memberNo" value="${authUser.no }"/>												
													<input type="button" id="reg-review-btn" data-no=${status.index } class=" ol-btn-review btn btn-dark waves-effect" value="리뷰 등록"/>
												</form>
											</c:if>
											<c:if test='${restateList[status.index]==1 }'>
													<input type="button" class="ol-btn-review btn btn-dark waves-effect" value="리뷰 완료" disabled/>
											</c:if>
										</c:if>
										</div>	
											<div style="border-bottom:1px solid #9e9e9e;margin-top:10px;"></div>								
									</div>
									
								</c:forEach>
                           </div>   
                </div>


                <div class="mypage-main-gap"></div>
                
                <div class="recipient-info">
                    <span >장바구니</span> 
                    <a class="float-right"href="${ pageContext.request.contextPath }/${db }/order/cart"><span style ="font-size:16px"class="mypage-order-list-all ">전체</span></a>
                </div>
                
          		<div class='cart-list-group'>
         	 <c:forEach items='${cartList }' var='vo' varStatus='status'>
            <div class='mobile-cart rounded' style="border-bottom:1px solid #cecece" data-no='${vo.cartNo }' data-value='${vo.stock }' data-name='${vo.name }'>
                <div class='moblie-cart-all-group'>
                    <div class='mobile-cart-list-checkbox m-1' >
                        <div class='checkbox checkbox-blue  ml-1' style='display:inline-block;width:50%' id='mobile-checkbox'>
                            <input id='${status.index+1 }' type='checkbox' class='cart-select' value='${vo.cartNo}'>
                            <label for='${status.index+1 }' value='${vo.cartNo}'>선택</label>  
                        </div>
                        
                        <%-- <div data-no='${vo.cartNo }'class ='cart-delete float-right' style='display:inline-block; margin-right:10px;' >
                        	<a href='#' style='color:#000000; border-bottom:1px solid #000000; margin:5px;' id='cart-delete-product' value='${vo.cartNo }' data-no='${vo.cartNo }'>삭제</a>
                        </div> --%>
                    </div>
                   	
                   
                   	<div class='responsive-cart-img float-left' style="max-width:150px; max-height:92px;">
                   		<img src='/scs-manager${vo.mainImage }' style="max-width:150px; max-height:92px;" alt='' class='rounded'>
                    </div>
                    <div class='responsive-cart-info float-right''>
                    	<div style='width:55%; display:inline-block;' >
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
	                      		
	                            <span class="mypage-cart-count">${vo.amount }</span>
	                            
	                       	 </div>
	                     </div>
                    </div>
                </div>
            </div>
            </c:forEach>
         </div>
            
            <div class="mypage-main-gap"></div>
            
            <div class="recipient-info" style="margin-bottom: 5px;">
                <span >상품문의</span> 
            </div> 
            
           	<div style="margin-bottom: 30px;"></div>
            <div style="overflow-x: auto;">
	           <table class="table-form-exposure" id="board-table">
	           	<thead>
			        <tr>
			        	<th>상품이름</th>
				        <th>제목</th>
				        <th>작성일</th>
				        <th>답변여부</th>
					</tr> 
				</thead>
				<tbody>	
	          		<c:forEach items="${itemBoardList }" var="vo" varStatus="status">  
			  			<tr style="border-bottom:1px solid #cecece">
			  				<td>
			  					<a href="${ pageContext.request.contextPath }/${db}/order/detail?no=${vo.itemNo}">
	                            	<img class="ol-img" src="/scs-manager${vo.mainImage }" />
			  					</a>	
			  					${vo.itemName }</td>
			  				<td>
							  	<a style="color:#6C757D;"
									href="${ pageContext.request.contextPath }/${db}/board/itemboard/view/${ vo.no }">${vo.title }</a>			
			  				</td>
			  				<td>${vo.regDate }</td>
				  			<c:choose>
				  				<c:when test="${vo.replyState }">
				  					<td>답변완료</td>
				  				</c:when>
				  				<c:otherwise>
				  					<td>답변미완료</td>
				  				</c:otherwise>
				  			</c:choose>
				  			</tr>
		         		</c:forEach>
		          	</tbody> 
		         </table>
	          </div>    
			<div class="mypage-main-gap"></div>
			<div class="recipient-info" style="margin-bottom: 5px;">
                <span>1:1문의</span> 
            </div> 
            
           	<div style="margin-bottom: 30px;"></div>
            <div style="overflow-x: auto;">
	           <table class="table-form-exposure" id="board-table">
	           	<thead>
			        <tr>
			        	<th>카테고리</th>
				        <th>제목</th>
				        <th>작성일</th>
				        <th>답변여부</th>
					</tr> 
				</thead>
				<tbody >	
	          		<c:forEach items="${qnaList }" var="vo" varStatus="status">  
			  			<tr style="border-bottom:1px solid #cecece">
			  				<td>${vo.category }</td>
			  				<td>
							  	<a style="color:#6C757D;"
									href="${ pageContext.request.contextPath }/${db}/board/qna/view/${ vo.no }">${vo.title }</a>			
			  				</td>
			  				<td>${vo.regDate }</td>
				  			<c:choose>
				  				<c:when test="${vo.replyState }">
				  					<td>답변완료</td>
				  				</c:when>
				  				<c:otherwise>
				  					<td>답변미완료</td>
				  				</c:otherwise>
				  			</c:choose>	
				  			</tr>
		         		</c:forEach>
		          	</tbody> 
		         </table>
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
