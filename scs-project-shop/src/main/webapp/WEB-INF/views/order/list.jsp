<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
        <title>${ceoVo.siteName }</title>
        <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
		<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
		<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
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
        
<script>
function gotoDetail(no){
      location.href="${pageContext.servletContext.contextPath }/${db}/order/detail?no="+no;
}

$(function(){
	var op1 = '${map.op1}';
	var op2 = '${map.op2}';
	
	$("#product-search-option1").val(op1).prop("selected", true);
	$("#product-search-option2").val(op2).prop("selected", true);
	
	var change1 = document.getElementById('product-search-option1');
	
	change1.addEventListener('change', function(event) {
		var option = $('#product-search-option1').val();
		location.href="${pageContext.servletContext.contextPath }/${db}/order/list?p=${map.prevPage}&op1="+option+"&op2=${map.op2 }&category=${map.categoryNo }&subCategory=${map.subCategoryNo}";
	});
	
	var change2 = document.getElementById('product-search-option2');
	
	change2.addEventListener('change', function(event) {
		var option = $('#product-search-option2').val();
		location.href="${pageContext.servletContext.contextPath }/${db}/order/list?p=${map.prevPage}&op1=${map.op1 }&op2="+option+"&category=${map.categoryNo }&subCategory=${map.subCategoryNo}";
	});
	
});
	
</script>
</head>
<body>
    <!-- Navigation Bar-->
    <c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import>
    <c:import url="/WEB-INF/views/partials/left-nav.jsp"></c:import>	
    <div class="wrapper ">
        <div class="container-fluid">
            <div class="order-title" style="margin-top:40px">
                <span> Product </span>상품</div>
            <div class="recipient-info">
                <span style="Font-size:24px; font-weight:Bold; color:#323A46;">Category</span> 카테고리
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card-box">
                        <div class="row product-list-custom mobile-visible">
                          	<c:choose>
                            	<c:when test="${empty map.category }">
                            		<div>모든 상품을 보여드립니다.</div>
                            	</c:when>
                            	<c:otherwise>
                            	 	<div class="col-lg-8 list-span-custom " >
		                                <c:forEach items="${map.category }" var="vo">
		                                	<a href="${pageContext.request.contextPath}/${db}/order/list?category=${vo.parentsNo}&subCategory=${vo.no}">${vo.name }</a>
		                                	<span>l</span>
		                                </c:forEach>                       
                          		  </div>
                            	</c:otherwise>
                            </c:choose>
                        </div> <!-- end row -->    
                    </div> <!-- end card-box -->   
                </div> <!-- end col-->
            </div>
            <!-- end row-->
            <div class="float-right" style="margin-left: 0.3%; width:30%;">
					<form name="form">
						<div class="float-right" style="margin-left: 10px; margin-bottom: 5px;">
	                              <select id="product-search-option2" name="op2" class="custom-select custom-select-sm">
	                                    <option value="new">신상품순</option>
	                                    <option value="desc-price">가격 높은순</option>
	                                    <option value="asc-price">가격 낮은순</option>
	                                    <option value="review">리뷰 많은순</option>
	                              </select>
	               		</div>
                		<div class="float-right">
	                              <select id="product-search-option1" name="op1" class="custom-select custom-select-sm">
	                                    <option value="8">8개씩 보기</option>
	                                    <option value="16">16개씩 보기</option>
	                                    <option value="24">24개씩 보기</option>
	                              </select>
	                    </div>
                	</form>
            </div>
            <div style="margin-bottom:50px;"></div>
            
            <div class="row product-list">
			<c:forEach items="${map.list }" var="vo">
            	<div class="col-md-6 col-xl-3" >
					<c:if test="${vo.visible ==true }">
					  <div class="card-box" style="max-height:100%;">
						<div class="product-group" onClick="gotoDetail(${vo.no})">
							<div class="product-img-bg">
	                        	<!-- img source 받아오기  -->
	                            <img src="/scs-manager${vo.mainImage }" style="max-height:280px" alt="product-pic" class="img-fluid" />
	                            	<!-- best, new 노출 -->
	                            	<c:if test="${vo.bestItem ==true }">
	                            		 <span class="badge badge-pink" >BEST</span>
	                            	</c:if>
	                            	<c:if test="${vo.newItem ==true }">
	                            		 <span class="badge badge-warning">NEW</span>
	                            	</c:if>
	                        </div>

                        <div class="product-info">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h5 class="font-16 mt-0 sp-line-1"><a href="${pageContext.servletContext.contextPath }/${db}/order/detail?no=${vo.no}" class="text-dark" style="font-weight:bold">${vo.name } </a> </h5>
                                    <div class="text-warning font-16">
                             				<c:forEach begin="1" end="${vo.intRevAvg }">
                             					<i class="mdi mdi-star"></i>
                             				</c:forEach>
                             				<c:choose>
                             					<c:when test="${vo.douRevAvg>=0.5 }">
                             						<i class="mdi mdi-star-half"></i>
                             						<c:forEach begin="2"  end="${5-vo.intRevAvg }">
                             							<i class="mdi mdi-star-outline"></i>
                             						</c:forEach>
                             					</c:when>
                             					<c:otherwise>
                             						<c:forEach begin="1"  end="${5-vo.intRevAvg }">
                             							<i class="mdi mdi-star-outline"></i>
                             						</c:forEach>
                             					</c:otherwise>
                             				</c:choose>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <div class="product-price-tag">
                                   		    <fmt:formatNumber value="${vo.nowPrice*(1-(vo.sale/100))  }" type="currency" currencySymbol="￦" />
                                        
                                    </div>
                                </div>
                            </div> <!-- end row -->
                        </div> <!-- end product info-->
						</div>
                  	  </div> <!-- end card-box-->
					</c:if>
                </div> <!-- end col-->
    		 </c:forEach>
           	 </div>         

            <div class="mobile-product-list">
	            <c:forEach items="${map.list }" var="vo">
	           	 <div class="mobile-product card-box" style="max-height:100%;" onClick="gotoDetail(${vo.no })"> 
                    <div class="mobile-product-img" >
                        <img src="/scs-manager${vo.mainImage }" style="max-height:280px" alt="product-pic" class="mobile-product-img-mg" />
                        <!-- best, new 노출 -->
                       	<c:if test="${vo.bestItem ==true }">
                       		 <span class="badge badge-pink" >BEST</span>
                       	</c:if>
                       	<c:if test="${vo.newItem ==true }">
                       		 <span class="badge badge-warning">NEW</span>
                       	</c:if>
                    </div>
                    <div class="mobile-product-des-box">
                        <div class="mobile-product-list-title">
                          	${vo.name }
                        </div>
                        <div class="mobile-product-price">
               			      <fmt:formatNumber value="${vo.nowPrice*(1-(vo.sale/100))  }" type="currency" currencySymbol="￦" />
                        </div>
                    </div>
                 </div> 	 
	            </c:forEach>
            </div>

            


                <div class="row">
                    <div class="col-12">
                        <ul class="pagination pagination-rounded justify-content-center mb-3">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.servletContext.contextPath }/${db }/order/list?p=${map.prevPage}&op1=${map.op1 }&op2=${map.op2 }&category=${map.categoryNo }&subCategory=${map.subCategoryNo}" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <c:forEach var="i" begin="1" end="${map.listsize }">
								<c:choose>
									<c:when test="${map.page == (map.beginPage+(i-1)) }">
										<li class ="page-item active">
											<a class="page-link" href="${pageContext.servletContext.contextPath }/${db }/order/list?p=${map.beginPage+(i-1) }&op1=${map.op1 }&op2=${map.op2 }&category=${map.categoryNo }&subCategory=${map.subCategoryNo}">${map.beginPage+(i-1) }</a>
										</li>
									</c:when>
									<c:otherwise>
										<li><a  class="page-link" href="${pageContext.servletContext.contextPath }/${db }/order/list?p=${map.beginPage+(i-1) }&op1=${map.op1 }&op2=${map.op2 }&category=${map.categoryNo }&subCategory=${map.subCategoryNo}">${map.beginPage+(i-1) }</a></li>
									</c:otherwise>
								
								</c:choose>
							</c:forEach>
                            <li>
                                <a class="page-link" href="${pageContext.servletContext.contextPath }/${db }/order/list?p=${map.nextPage }&op1=${map.op1 }&op2=${map.op2 }&category=${map.categoryNo }&subCategory=${map.subCategoryNo}" aria-label="Next">
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