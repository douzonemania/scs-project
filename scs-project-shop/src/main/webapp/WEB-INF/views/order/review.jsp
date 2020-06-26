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

<style>
#board-table {
	width: 100%; 
	border-collapse: collapse; 
}

#board-table th {
	 font-weight: bold; 
	 font-size: 1.25em;
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
	#board-table th {
		font-size: 1em;
	}
	
	#board-table td {
		font-size: 0.8em;
	}
	
	#board-table .mainImage {
		display: none;
	}
}

</style>            

<script type="text/javascript">
$(document).ready(function(){
	$(".reviewTd").on("click", function(){
		var no = $(this).attr("no");
		 
	
		window.open("${ pageContext.request.contextPath }/${db }/order/review/view/"+no, "review", "width=500, height=400, scrollbars=no");
	    /* document.review.target = "review";
	    document.review.submit();  */

	 });
});
		
</script>

    </head>
<body>
    <!-- Navigation Bar-->
     <c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import>

    <div class="wrapper">
        <div class="container-fluid">

            <div class="photo-review-group">
                <div class="photo-review-title">
                    PHOTO REVIEW  &nbsp;&nbsp; l &nbsp;&nbsp;  포토 리뷰
                </div>        
                
              

               

                <div class="row">
                    <div class="col-12">
                        <div class="card-columns">
                        
                        <c:forEach items="${map.photoList }" var="vo" varStatus="status">  
                            <div class="card" style='min-height: 325px; min-width: 450px;'>
	                          <img class="ol-img reviewTd img-fluid" id="review${vo.no }" no="${vo.no }" src="/scs-manager${vo.image }" style="max-height:280px; cursor: pointer;" />
                                <p style="margin-left: 15px; width: 25%;">
                                	<c:forEach begin="1" end="${vo.rate }">
										<span class="mdi mdi-star text-warning"></span>
									</c:forEach>
									<c:set var="emptyStar" value="${5-vo.rate }"/>
									<c:forEach begin='1' end='${emptyStar }'>
										<span class="mdi mdi-star-outline"></span>
									</c:forEach>
                                </p>
                                <div class="card-body">
                                    <h5 class="card-title">${vo.title }</h5>
                                    <p class="card-text">${vo.content }</p>
                                </div>
                            </div>
                        </c:forEach>
                            
                        </div>
                        
                    </div>
                </div>
 
            </div><!-- photoreview search-->
           
            <div class="all-review" style="margin-top:20px;">

                <div class="photo-review-title">
                    ALL REVIEW  &nbsp;&nbsp; l &nbsp;&nbsp;  전체 리뷰
                </div>        
				<br/>

               <div style="overflow-x: auto;">
	        	   <table class="table-form-exposure" id="board-table">
		           	<thead>
				        <tr>
				        	<th>&nbsp;&nbsp;번호</th>
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
				  					<a class="mainImage" href="${ pageContext.request.contextPath }/${db}/order/detail?no=${vo.itemNo}">
		                            	<img src="/scs-manager${vo.mainImage }" style="max-height:100px"  class="img-fluid" />
				  					</a>	
				  				</td>
				  				<td>${vo.itemName }</td>
				  				<td><button class="reviewTd" id="review${vo.no }" no="${vo.no }" style="border:none; background-color: rgba(0,0,0,0);">
								  	${vo.title }</button>		
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
                                <a class="page-link" href="${pageContext.servletContext.contextPath }/${db }/custom/REVIEW?p=${map.prevPage}" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <c:forEach var="i" begin="1" end="${map.listsize }">
								<c:choose>
									<c:when test="${map.page == (map.beginPage+(i-1)) }">
										<li class ="page-item active">
											<a class="page-link" href="${pageContext.servletContext.contextPath }/${db }/custom/REVIEW?p=${map.beginPage+(i-1) }">${map.beginPage+(i-1) }</a>
										</li>
									</c:when>
									<c:otherwise>
										<li><a  class="page-link" href="${pageContext.servletContext.contextPath }/${db }/custom/REVIEW?p=${map.beginPage+(i-1) }">${map.beginPage+(i-1) }</a></li>
									</c:otherwise>
								
								</c:choose>
							</c:forEach>
                            <li>
                                <a class="page-link" href="${pageContext.servletContext.contextPath }/${db }/custom/REVIEW?p=${map.nextPage }" aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </div> <!-- end col-->
           </div>
           <!-- end row-->
          
        </div > 
     </div>

                
  </div>


 <c:import url="/WEB-INF/views/partials/footer.jsp"></c:import>
    <!-- Vendor js -->
   <script src="${pageContext.request.contextPath}/assets/js/vendor.min.js"></script>

   <!-- App js-->
   <script src="${pageContext.request.contextPath}/assets/js/app.min.js"></script>

</body>
</html>