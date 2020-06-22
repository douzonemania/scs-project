<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ page import="java.util.*"%>
	<%@ page import="java.text.SimpleDateFormat"%>

    
        <title>주문/배송관리</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico">
       
        <!-- Plugins css -->
        <link href="<%=request.getContextPath() %>/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
       
        <link href="<%=request.getContextPath() %>/assets/libs/dropzone/dropzone.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
        
        <link href="<%=request.getContextPath() %>/assets/libs/jquery-nice-select/nice-select.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/switchery/switchery.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/multiselect/multi-select.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/select2/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/quill/quill.core.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/quill/quill.bubble.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/quill/quill.snow.css" rel="stylesheet" type="text/css" />

        <!-- third party css -->
        <link href="<%=request.getContextPath() %>/assets/libs/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/datatables/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/datatables/buttons.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/datatables/select.bootstrap4.css" rel="stylesheet" type="text/css" />
        <!-- third party css end -->

        <!-- App css -->
        <link href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/css/app.min.css" rel="stylesheet" type="text/css" />  
        
        		<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
		<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

		<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />      
       
</head>
<script type="text/javascript">



$(function() {
	
	$('#cate-select').change(function(){
		var option = $(this).val();
		
		if(option == 'statement') {
			$('#statement-option').show();
			$('#delivery-input-box').hide();
		} else {
			$('#statement-option').hide();
			$('#delivery-input-box').show();
		}
	});
	
	$("#list-search-btn").click(function() {
		
		var date = $("input[name=dates]").val().split(" - ");
		var temp = date[0].split("/");
		var startDate = temp[2]+"-"+temp[0]+"-"+temp[1];
		
		var temp2 = date[1].split("/");
		var endDate = temp2[2]+"-"+temp2[0]+"-"+temp2[1];
		
		var op = $('#cate-select').val();
		if(op == 'statement'){
			var kwd = $('#statement-option').val();
		} else{
			var kwd = $('#delivery-input-box').val();
		}
		
		
		
		
		$.ajax({
			url: '<%=request.getContextPath() %>/${authUser.id}/api/order/delivery',
			contentType: 'application/json',
			data: {"startDate": startDate, "endDate" : endDate, "op" : op, "kwd" : kwd},
			type: "GET",
			dataType: 'json',
			success : function(response){
				console.log(response.data);
				location.href="<%=request.getContextPath() %>/${authUser.id}/order/delivery?p="+response.data.page+"&startDate="+startDate+"&endDate="+endDate+"&op="+op+"&kwd="+kwd;
			},
			error:
				 function(xhr, status, e){
					console.error(status + " : " + e);
				}
		});
	});
	
	$(document).on('click', '.editable-submit', function(){
		if($(this)){
			
			var no = $(this).parents('.select-inline').data('no');
			console.log(no);
			var statement = $('.form-control-sm option:selected').text();
			console.log(statement);
			var test = {"no": no, "statement" : statement};
			
			$('.inline-select').editable().attr('prepend',statement);
			
			
			$.ajax({
				url: '${pageContext.request.contextPath }/${authUser.id}/api/order/delivery/update',
				async: true,
				type: 'post',
				dataType: 'json',
				contentType: 'application/json',
				data: JSON.stringify(test),
				success: function(response){
					
					
					
					
					if(response.result != "success"){
						console.error(response.message);
						return;
					}
					
				},
				error: function(xhr, status, e){
					console.error(status + " : " + e);
				}
			});
			
			
			
			
			
			
			
		}
	});

});

</script>
<body>
<%

 Date now = new Date();
 SimpleDateFormat sf = new SimpleDateFormat("MM/dd/yyyy");
 
 String today = sf.format(now);
 Calendar week = Calendar.getInstance();
 week.add(Calendar.DATE , -7);
 String beforeWeek = new java.text.SimpleDateFormat("MM/dd/yyyy").format(week.getTime());
%>
  	<header>
  		<!-- horizontal-nav -->  	
        <c:import url ='/WEB-INF/views/partials/horizontal-nav.jsp'/>
    </header>
    	<!-- footer -->
    	<c:import url ='/WEB-INF/views/partials/footer.jsp'/>
    
     <!-- ============================================================== -->
     <!-- Start Page Content here -->
     <!-- ============================================================== -->

    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->
    <div class="wrapper">
        <div class="container-fluid">
            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box">
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/main">SCS</a></li>
                                <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/{id}/order/delivery">주문관리</a></li>
                                <li class="breadcrumb-item active">주문/배송 관리</li>
                            </ol>
                        </div>
                        <h4 class="page-title">주문/배송 관리</h4>
                    </div>
                </div>
            </div>     
            <!-- end page title --> 
            <!-- start 검색 부분 -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="card-box">                        
                    <h4 class="header-title">주문 검색</h4>
                        <p class="sub-header">찾고자 하는 날짜와 카테고리를 고르시오.</p>


                        <div class="search-form">
                            <div class="form-group mb-3 scs-search"> 
                                <label>날짜 검색</label>
                                <span class="input-group-addon">
									<i class="fa fa-calendar bigger-110"></i>
								</span>
								
								<input type="text" id="date-range-picker" name="dates" value="<%=beforeWeek %> - <%=today %>" class="form-control" />
								<script>
			
								
								
									 $('input[id="date-range-picker"]').daterangepicker({
										 "showCustomRangeLabel": true,
											"drops": "auto"
										}, function(start, end) {
											console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
											startDate = start.format('YYYY-MM-DD');
											endDate = end.format('YYYY-MM-DD');
									});
															
								</script>
                            </div>
                            <div class="form-group mb-3 scs-category">
                                <label for="product-category">1차 카테고리 <span class="text-danger">*</span></label>
                                <select class="form-control select2" id="cate-select" name="op">
		                               	<option value="order_number">주문번호</option>     
		                               	<option value="id">아이디</option>     
		                               	<option value="statement">상태</option>
                                </select>
                            </div>
                            <div class="form-group mb-3 scs-category">
                                <div class="form-group">
                                    <input id="delivery-input-box" name="kwd" type="text" placeholder="Search" class="form-control form-control-sm" autocomplete="on" style="height:37.39px">
                                </div>
                                <div>
                                   	<select id="statement-option" name="kwd" class="custom-select custom-select-sm" style="display:none;" style="height:37.39px">
                                   		<option value="주문완료">주문완료</option>
                                        <option value="입긍완료">입금완료</option>
                                        <option value="배송준비중">배송준비중</option>
                                        <option value="배송중">배송중</option>
                                        <option value="배송완료">배송완료</option>
                                        <option value="취소처리중">취소처리중</option>
                                        <option value="교환처리중">교환처리중</option>
                                        <option value="환불처리중">환불처리중</option>
                                        <option value="처리완료">처리완료</option>
                                   	</select>
                               </div>
                            </div>
                            <div class="col-sm-6 col-xl-3 scs-submit">
                                <div class="search-button">
                                    <button id="list-search-btn" class="btn btn-secondary btn-sm " type="submit" style="height:37.39px"> 검색 </button>
                                </div>
                            </div>
                        </div>
                        
                    </div> <!-- end card-box-->
                </div> <!-- end col -->
            </div>
            <!-- end 검색 부분 -->
        </div> 
        <!-- end container -->

        <!-- start 주문 결과 리스트 -->
        <div class="row">
            <div class="col-lg-11">
                <div class="card-box">
                    <div class="card-body">
                        <h4 class="header-title">주문 결과</h4>
                        <table style="width:100%;" class="table table-striped mb-0">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>상품정보</th>
                                    <th>주문일</th>
                                    <th>주문번호</th>
                                    <th>주문자명</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                        
                            <tbody>
                            	
                            	<c:forEach var="vo" varStatus="status" items="${map.list }">
                                <tr>
                                	
                                    <td>${status.count + (map.page - 1) * 5 }</td>
                                    <c:choose>
	                                    <c:when test="${vo.count == 1} ">
	                                    	<td>${vo.name }</td>
	                                    </c:when>
	                                    <c:otherwise>
	                                    	<td>${vo.name } 외 ${vo.count - 1 }건</td>
	                                    </c:otherwise>
                                    </c:choose>
                                    <td>${vo.regDate }</td>
                                    <td>${vo.orderNumber }</td>
                                    <td>${vo.id }</td>
                               
                                    <td class="select-inline" data-no='${vo.no }'><span class="inline-select" data-type="select" data-pk="1" data-value="${vo.dataValue }" data-title="Select status"></span></td>
                                
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                         <!-- start paging -->
                         <div style="padding-top:30px"></div>
                        <nav>
	                            <ul class="pagination pagination-rounded justify-content-center mb-3">
	                            <li class="page-item">
	                                <a class="page-link" href="${pageContext.servletContext.contextPath }/${authUser.id}/order/delivery?p=${map.prevPage}&op=${map.option }&kwd=${map.kwd}&startDate=${map.startDate }&endDate=${map.endDate}" aria-label="Previous">
	                                    <span aria-hidden="true">«</span>
	                                    <span class="sr-only">Previous</span>
	                                </a>
	                            </li>
	                            
	                            <c:forEach var="i" begin="1" end="${map.listsize }">
									<c:choose>
										<c:when test="${map.page == (map.beginPage+(i-1)) }">
											<li class ="page-item active">
												<a class="page-link" href="${pageContext.servletContext.contextPath }/${authUser.id}/order/delivery?p=${map.beginPage+(i-1) }&op=${map.option }&kwd=${map.kwd}&startDate=${map.startDate }&endDate=${map.endDate}">${map.beginPage+(i-1) }</a>
											</li>
										</c:when>
										<c:otherwise>
											<li><a class="page-link" href="${pageContext.servletContext.contextPath }/${authUser.id}/order/delivery?p=${map.beginPage+(i-1) }&op=${map.option }&kwd=${map.kwd}&startDate=${map.startDate }&endDate=${map.endDate}">${map.beginPage+(i-1) }</a></li>
										</c:otherwise>
									
									</c:choose>
								</c:forEach>
	                            <li>
	                                <a class="page-link" href="${pageContext.servletContext.contextPath }/${authUser.id}/order/delivery?p=${map.nextPage }&op=${map.option }&kwd=${map.kwd}&startDate=${map.startDate }&endDate=${map.endDate}" aria-label="Next">  
	                                 	<span aria-hidden="true">»</span>
	                                    <span class="sr-only">Next</span>
	                                </a>
	                            </li>
	                        </ul>
                        </nav>
                        <!-- end paging -->
                    </div> 
                </div> <!-- end card-box -->
            </div><!-- end col-->
        </div>
        <!-- end 주문 결과 리스트 -->
    </div>
	
	<c:import url ='/WEB-INF/views/partials/script.jsp'/>
</body>
</html>