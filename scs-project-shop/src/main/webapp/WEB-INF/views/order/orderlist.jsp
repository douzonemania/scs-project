
<!DOCTYPE html>
<html lang="utf-8">
    <head>
        <meta charset="utf-8" />
            <title></title>
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
            <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
			<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
			<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
			<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
			<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/3.0.5/daterangepicker.css" />
<script type="text/javascript">
$(document).ready(function(){
	 $("#reg-review-btn").on("click", function(){
	    window.open("", "review", "width=700, height=900, scrollbars=no");
	    //$("#reviewForm").submit();
	    document.review.action = "${ pageContext.request.contextPath }/${db }/order/regReview";
	    document.review.target = "review";
	    document.review.submit();

	 });
});
		
</script>

</head>
<body>
<%
 Date now = new Date();
 SimpleDateFormat sf = new SimpleDateFormat("MM/dd/yyyy");
 SimpleDateFormat sf2 = new SimpleDateFormat("yyyy-MM-dd");
 
 String today = sf.format(now);
 String today2 = sf2.format(now);
 Calendar week = Calendar.getInstance();
 week.add(Calendar.DATE , -7);
 String beforeWeek = new java.text.SimpleDateFormat("MM/dd/yyyy").format(week.getTime());
 String beforeWeek2 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(week.getTime());
%>
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
					
                    <a class="float-right"href="${ pageContext.request.contextPath }/${db }/order/orderlist"><span class="mypage-order-list-all ">전체</span></a>
                
                    <div class="margin-box-30"></div>					
								<form action = "${pageContext.request.contextPath}/${db }/order/orderlist/${statement}" method="post">
								<div style="margin-bottom:10px"> 
                                <label>날짜 검색</label>
                                <span class="input-group-addon">
									<i class="fa fa-calendar bigger-110"></i>
								</span>
								<input type="text" id="date-range-picker" name="dates" value="<%=beforeWeek %> - <%=today %>" class="form-control" style="width:200px; display:inline-block" />
								
								<input type="hidden" id="date-text" name ="date" value="<%=beforeWeek2 %>:<%=today2 %>"/>
								<button id="search-btn"  class="form-control" style="width:80px; display:inline-block; 
								vertical-align: middle; margin-bottom:2px" value="<%=beforeWeek %>:<%=today %>">검색</button>
								
								<script>
								var startDate;
								var endDate;
								
								$('input[id="date-range-picker"]').daterangepicker({
									    "showCustomRangeLabel": true,									    
									    "drops": "auto"
									}, function(start, end) {
									  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
									  	startDate = start.format('YYYY-MM-DD');
										endDate = end.format('YYYY-MM-DD');
										
										$('#date-range-picker').attr( 'value', startDate+ ' ~ ' + endDate );
										console.log(startDate +":"+ endDate)
										
										$('#search-btn').attr( 'value', startDate+ ':' + endDate );
										$('#date-text').attr( 'value', startDate+ ':' + endDate );
							
								});
									
									
								
								</script>
                            </div>
                           </form>
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
											<form name="review"  method="post">
												<input type="hidden" name="image" value="${vo.image }"/>
												<input type="hidden" name="itemNo" value="${vo.no }"/>
												<input type="hidden" name="itemName" value="${vo.name }"/>
												<input type="hidden" name="itemSize" value="${vo.size }"/>
												<input type="hidden" name="itemColor" value="${vo.color }"/>
												
												<input type="hidden" name="memberNo" value="${authUser.no }"/>												
												<input type="button" id="reg-review-btn"class="ol-btn-review btn btn-dark waves-effect" value="리뷰 등록"/>
											</form>
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

	<c:import url ='/WEB-INF/views/partials/script.jsp'/>
</body>
</html>