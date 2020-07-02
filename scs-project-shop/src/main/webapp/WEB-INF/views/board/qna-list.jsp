<!DOCTYPE html>
<html lang="UTF-8">
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

<style>
#board-table {
	 width: 100%; 
	border-collapse: collapse; 
}

#board-table th {
	 font-weight: bold; 
	 font-size: 1.2em;
	 border-bottom: 1px solid #CECECE;"
}

#board-table tbody tr {
	height: 50px;
}

#board-table tbody tr:nth-of-type(odd) {
	background-color: #eee;
}

#board-table td, th {
	padding: 6px;
	font-size: 1.1em;
	text-align: left;
}

@media(max-width:991px){
	#board-table th {font-size:1em;padding:5px;}
	#board-table td {font-size:0.6em;padding:5px;}
	.pagination{}
	.mobile-size-modify{width:35%;}
	
}
</style>        
        
<script type="text/javascript">
$(function(){
	$('#member-search-option').change(function(){
		var option = $(this).val();
		
		if(option == 'category') {
			$('#category-option').show();
			$('#member-input-box').hide();
		} else {
			$('#category-option').hide();
			$('#member-input-box').show();
		}
	});
});       
</script>
</head>
<body>
    <!-- Navigation Bar-->
  		<c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import> 
        <c:import url="/WEB-INF/views/partials/left-nav.jsp"></c:import>	
       <div class="wrapper">
        <div class="container-fluid">
           <div style="width:100%;">
           	 <!-- <div class="order-title" style="margin-top:40px">
                <span> Product </span>상품</div> -->
            <div class="recipient-info">
                <span style="Font-size:24px; font-weight:Bold; color:#323A46;">Q&A 게시판</span>
            </div>

			<div class="row" style="margin-left: 0.3%;" >
				<form action="${pageContext.servletContext.contextPath }/${db}/custom/Q&A">
                     <div class="col-12 text-sm-center form-inline" style="padding:0px;">
                         <div class="form-group mr-2">
                              <select id="member-search-option" class="custom-select custom-select-sm" name="op">
                                    <option value="id">아이디</option>
                                    <option value="name">이름</option>
                                    <option value="category">카테고리</option>
                              </select>
                         </div>
                         
                         <div class="form-group mobile-size-modify">
                              <input id="member-input-box" name="kwd" type="text" placeholder="Search" class="form-control form-control-sm" autocomplete="on">
                         </div>
                         <div>
                         	<select id="category-option" name="kwd" class="custom-select custom-select-sm" style="display:none;">
                                   <option value="주문">주문</option>
                                   <option value="배송">배송</option>
                                   <option value="교환환불취소">교환환불취소</option>
                                   <option value="기타">기타</option>
                            </select>
                        </div>
                               
                        <div class="form-group">        
                        &nbsp;&nbsp;&nbsp;
                      	 <button id="member-search-btn" class="btn btn-secondary btn-sm float-sm-right" type="submit"> 검색 </button>
                        </div>	  
                       
                     </div>
                      <div style="margin:20px;"></div>
                </form>
            </div>
            <!-- end row -->

		  <div style="overflow-x: auto;">
	           <table class="table-form-exposure" id="board-table">
	           
	           	<thead>
			        <tr>
			        	<th>번호</th>
			        	<th>카테고리</th>
				        <th>제목</th>
				        <th>아이디</th>
				        <th>작성자</th>
				        <th>작성일</th>
					</tr> 
				</thead>
				<tbody>
          			<c:forEach items="${map.list }" var="vo" varStatus="status">            
		            	<tr>
		            		<td>&nbsp; [${status.count + (map.page - 1) * 5 }]</td>
		                                		<td>${vo.category }</td>
		                                		<td> 
		                                			<a style="color:#6C757D;"
														href="${ pageContext.request.contextPath }/${db}/board/qna/view/${ vo.no }">${vo.title }</a>
												</td>
		                                		<td>${vo.id }</td>
		                                		<td>${vo.name }</td>
		                                		<td>${vo.regDate }</td>
		               </tr>
                    
            		</c:forEach>
            	</tbody> 
	         </table>
           </div>
          
          	<c:if test="${authUser.id  != null}">
            <div style="border: none; float: right; margin-top: 15px;">
            	<a href="${pageContext.servletContext.contextPath }/${db }/board/qna/write">
	            	 <button class="btn btn-secondary btn-sl float-sm-right" style="font-size:1.2em;">글쓰기</button></a>
            </div>
            </c:if>
            
                <div class="row">
                	
                    <div class="col-12">
                        <ul class="pagination pagination-rounded justify-content-center mb-3">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.servletContext.contextPath }/${db }/custom/Q&A?p=${map.prevPage}&kwd=${map.kwd}" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <c:forEach var="i" begin="1" end="${map.listsize }">
								<c:choose>
									<c:when test="${map.page == (map.beginPage+(i-1)) }">
										<li class ="page-item active">
											<a class="page-link" href="${pageContext.servletContext.contextPath }/${db }/custom/Q&A?p=${map.beginPage+(i-1) }&kwd=${map.kwd}">${map.beginPage+(i-1) }</a>
										</li>
									</c:when>
									<c:otherwise>
										<li><a  class="page-link" href="${pageContext.servletContext.contextPath }/${db }/custom/Q&A?p=${map.beginPage+(i-1) }&kwd=${map.kwd}">${map.beginPage+(i-1) }</a></li>
									</c:otherwise>
								
								</c:choose>
							</c:forEach>
                            <li>
                                <a class="page-link" href="${pageContext.servletContext.contextPath }/${db }/custom/Q&A?p=${map.nextPage }&kwd=${map.kwd}" aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </div> <!-- end col-->
                </div>
                <!-- end row-->
           	
           </div>
        </div> <!-- end container -->
    </div>
    <!-- end wrapper -->


    <c:import url="/WEB-INF/views/partials/footer.jsp"></c:import>
    <!-- Vendor js -->
   <script src="<%=request.getContextPath() %>/assets/js/vendor.min.js"></script>

   <!-- App js-->
   <script src="<%=request.getContextPath() %>/assets/js/app.min.js"></script>


</body>
</html>