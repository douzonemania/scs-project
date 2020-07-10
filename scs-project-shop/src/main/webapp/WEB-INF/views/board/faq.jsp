<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
            <title>${ceoVo.siteName }</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
            <meta content="Coderthemes" name="author" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <link rel="shortcut icon" href="/scs-manager${favicon }">
    
            <!-- Plugins css -->
            <link href="<%=request.getContextPath() %>/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
    
            <!-- App css -->
            <link href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
            <link href="<%=request.getContextPath() %>/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
            <link href="<%=request.getContextPath() %>/assets/css/app.min.css" rel="stylesheet" type="text/css" />

    </head>
<body>
    <!-- Navigation Bar-->
    	<c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import>
     	<c:import url="/WEB-INF/views/partials/left-nav.jsp"></c:import>


    <div class="wrapper">
        <div class="container-fluid">
    
            <div class="recipient-info">
                <span>FAQ</span> 자주 묻는 질문
            </div>

            <div class="row">
                <div class="col-xl-12">
                    <div id="accordion" class="mb-3">
                    
                    <c:forEach items="${list }" var="vo" varStatus="status">
                    	<div class="card mb-1">
                    	<c:choose>
                    		<c:when test="${ status.index % 2 == 0}">
                    			<div class="card-header" id="headingOne">
	                                <h4 class="m-0">
	                                    <a class="text-dark" data-toggle="collapse" href="#collapseOne" aria-expanded="true">
	                                        <i class="mdi mdi-help-circle mr-1 text-primary"></i> 
	                                       		&nbsp; ${ vo.content}
	                                    </a>
	                                </h4>
                            	</div>
                    		</c:when>
                    		<c:otherwise>
                    			<div id="collapseOne1" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                               		 <div class="card-body">
                                  	 	 ${ vo.content}
                                	</div>
                           		 </div>
                    		</c:otherwise>
                    	</c:choose>
                        </div>
                     </c:forEach>   
                        
                    </div> <!-- end #accordions-->
                </div> <!-- end col -->
                
            </div> <!-- end row -->
        </div>
    </div>

	<c:import url="/WEB-INF/views/partials/footer.jsp"></c:import>
    
    <!-- end Footer -->

     <!-- Vendor js -->
     <script src="<%=request.getContextPath() %>/assets/js/vendor.min.js"></script>

     <!-- App js-->
     <script src="<%=request.getContextPath() %>/assets/js/app.min.js"></script>
</body>
</html>