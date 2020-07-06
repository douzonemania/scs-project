<!DOCTYPE html>
<html lang="UTF-8">
<head>
   <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Pretty Girls~!</title>
        <link rel="shortcut icon" href="/scs-manager${favicon }">

        <!-- Plugins css -->
        <link href="${pageContext.request.contextPath}/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />

        <!-- App css -->
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/app.min.css" rel="stylesheet" type="text/css" />
         <link href="${pageContext.request.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css" />
        
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<style>
#board-table {
	width: 100%; 
	border-collapse: collapse; 
}

#board-table th {
	 font-weight: bold; 
	 font-size: 1.2em;
	 border-bottom: 1px solid #CECECE;
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
</style>

        
<script type="text/javascript">
</script>
</head>
<body>
    <!-- Navigation Bar-->
    <c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import>
    <c:import url="/WEB-INF/views/partials/left-nav.jsp"></c:import>	
    <div class="wrapper ">
        <div class="container-fluid">
            <div class="recipient-info">
                <span style="Font-size:24px; font-weight:Bold; color:#323A46;">상품 문의 게시판</span>
            </div>

			<div class="row" style="margin-bottom: 20px; margin-left: 1%;">
				<form action="${pageContext.servletContext.contextPath }/${db}/board/itemboard/list">
                     <div class="col-12 text-sm-center form-inline">
                         <div class="form-group mr-2">
                              <select id="member-search-option" class="custom-select custom-select-sm" name="op">
                                  <option value="id">아이디</option>
                                  <option value="itemName">상품이름</option>
                              </select>
                         </div>
                         <div class="form-group">
                              <input id="member-input-box" name="kwd" type="text" placeholder="Search" class="form-control form-control-sm" autocomplete="on">
                         </div>
                                        
                       &nbsp;&nbsp;&nbsp;
                       <div class="search-button">
                            <button id="member-search-btn" class="btn btn-secondary btn-sm float-sm-right" type="submit"> 검색 </button>
                       </div>
                       
                     </div>
                </form>
            </div>
            <!-- end row -->
            
           <div style="overflow-x: auto;">
	           <table class="table-form-exposure" id="board-table">
	           	<thead>
			        <tr>
			        	<th>번호</th>
			        	<th>상품이름</th>
				        <th>제목</th>
				        <th>작성자</th>
				        <th>작성일</th>
					</tr> 
				</thead>
				<tbody>	
	          		<c:forEach items="${map.list }" var="vo" varStatus="status">  
			  			<tr>
			  				<td>&nbsp; [${status.count + (map.page - 1) * 5 }] &nbsp;&nbsp;&nbsp;
			  					<a href="${ pageContext.request.contextPath }/${db}/order/detail?no=${vo.itemNo}">
	                            	<img src="/scs-manager${vo.mainImage }" style="max-height:280px"  class="img-fluid" />
			  					</a>	
			  				</td>
			  				<td>${vo.itemName }</td>
			  				<td>
							  	<a style="color:#6C757D;"
									href="${ pageContext.request.contextPath }/${db}/board/itemboard/view/${ vo.no }">${vo.title }</a>			
			  				</td>
			  				<td>${vo.id }</td>
			  				<td>${vo.regDate }</td>
			  				
			  			</tr>
	         		</c:forEach>
	          	</tbody> 
	         </table>
          </div>
          
                <div class="row">
                	
                    <div class="col-12">
                        <ul class="pagination pagination-rounded justify-content-center mb-3">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.servletContext.contextPath }/${db }/board/itemboard/list?p=${map.prevPage}&kwd=${map.kwd}" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <c:forEach var="i" begin="1" end="${map.listsize }">
								<c:choose>
									<c:when test="${map.page == (map.beginPage+(i-1)) }">
										<li class ="page-item active">
											<a class="page-link" href="${pageContext.servletContext.contextPath }/${db }/board/itemboard/list?p=${map.beginPage+(i-1) }&kwd=${map.kwd}">${map.beginPage+(i-1) }</a>
										</li>
									</c:when>
									<c:otherwise>
										<li><a  class="page-link" href="${pageContext.servletContext.contextPath }/${db }/board/itemboard/list?p=${map.beginPage+(i-1) }&kwd=${map.kwd}">${map.beginPage+(i-1) }</a></li>
									</c:otherwise>
								
								</c:choose>
							</c:forEach>
                            <li>
                                <a class="page-link" href="${pageContext.servletContext.contextPath }/${db }/board/itemboard/list?p=${map.nextPage }&kwd=${map.kwd}" aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </div> <!-- end col-->
                </div>
                <!-- end row-->

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