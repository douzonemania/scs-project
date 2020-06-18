
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
            <link href="${pageContext.request.contextPath}/assets/css/orderList.css" rel="stylesheet" type="text/css" />
            
            <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
            <script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">

		
</script>

</head>
<body>
    <c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import>

    <div class="wrapper">
        <div class="container-fluid">
            <div class="mypage-order-group">
                
                <div class="recipient-info">
                    <span >주문 내역</span> 
                    <span class="mypage-main-order float-right"> 전체</span>
                </div>
                
                <div class="mypage-main-order-list">
                    <a href="${ pageContext.request.contextPath }/${db }/order/orderlist/oc" class="mobile-visible"><span class="mypage-order-list-category ">주문완료:&nbsp; ${stList[0] }</span></a>
                    <a href="${ pageContext.request.contextPath }/${db }/order/orderlist/depc" class="mobile-visible"><span class="mypage-order-list-category">입금완료:&nbsp; ${stList[1] }</span></a>
                    <a href="${ pageContext.request.contextPath }/${db }/order/orderlist/pfd" class="mobile-visible"><span class="mypage-order-list-category">배송준비중:&nbsp;${stList[2] }</span></a>
                    <a href="${ pageContext.request.contextPath }/${db }/order/orderlist/sip" class="mobile-none"><span class="mypage-order-list-category ">배송중:&nbsp;${stList[3] }</span></a>
                    <a href="${ pageContext.request.contextPath }/${db }/order/orderlist/delc" class="mobile-none"><span class="mypage-order-list-category ">배송완료:&nbsp;${stList[4] }</span></a>
                    <a href="${ pageContext.request.contextPath }/${db }/order/orderlist/canp" class="mobile-none"><span class="mypage-order-list-category ">취소처리중:&nbsp;${stList[5] }</span></a>
                    <a href="${ pageContext.request.contextPath }/${db }/order/orderlist/chanp" class="mobile-none"><span class="mypage-order-list-category ">교환처리중:&nbsp;${stList[6] }</span></a>
                    <a href="${ pageContext.request.contextPath }/${db }/order/orderlist/rp" class="mobile-none"><span class="mypage-order-list-category ">환불처리중:&nbsp;${stList[7] }</span></a>
					<a href="${ pageContext.request.contextPath }/${db }/order/orderlist/pc" class="mobile-none"><span class="mypage-order-list-category ">처리완료:&nbsp;${stList[8] }</span></a>
					
                    <a class="float-right"href="#"><span class="mypage-order-list-all ">전체</span></a>
                
                    <div class="margin-box-30"></div>
					

                            <div class=ol-col>
	                            <div class="ol-col-member" style="width:40%">상품정보</div>    
	                            <div class="ol-col-member" style="width:15%; padding-right:2">주문일자</div>
	                            <div class="ol-col-member" style="width:11%">주문번호</div>
	                            <div class="ol-col-member" style="width:14%">주문금액(수량)</div>
	                            <div class="ol-col-member" style="width:13%">주문상태</div>   
							</div>	
								<c:forEach items='${orderList }' var='vo' varStatus='status'>
									<div class ="ol-item">
										<img class="ol-img" src="${pageContext.request.contextPath}${vo.image }"/>
										<div class="ol-iteminfo">
											<p class="ol-itemName">${vo.name }</p>
											<div class="ol-option">
												<p class="ol-size">옵션 : ${vo.size } /</p>
												<p class="ol-color">${vo.color }</p>
											</div>
										</div>
										<p class="ol-reg">${vo.regDate }</p>
										<p class="ol-orderNo">${vo.orderNo }</p>
										<div class="ol-price-mount">
										<p class="ol-price">${priceList[status.index]}</p>
										<p class="ol-amount">(${vo.amount }개)</p>
										</div>
										<div class="ol-state-div">
										<p class="ol-state">${vo.statement }</p>
										<c:if test='${vo.statement=="배송완료" }'>
											<input type="button" class="ol-btn-review btn btn-dark waves-effect" value="리뷰 등록"/>
										</c:if>
										</div>										
									</div>
									
								</c:forEach>
                           </div>
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