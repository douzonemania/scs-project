<!DOCTYPE html>
<html lang="utf-8">
<head>
    	<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
		<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
		<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
		
        <title>${ceoVo.siteName }</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link rel="shortcut icon" href="/scs-manager${favicon }">
       	<meta name="_csrf" th:content="${_csrf.token }"/>
       	<meta name="_csrf_header" th:content="${_csrf.haderName }" />
        <!-- Plugins css -->
        <link href="<%=request.getContextPath() %>/assets/libs/jquery-nice-select/nice-select.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/switchery/switchery.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/multiselect/multi-select.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/select2/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath() %>/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
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
        
        <!-- jQuery -->
			<script src='https://code.jquery.com/jquery-3.5.1.min.js' integrity='sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=' crossorigin='anonymous'></script>
    	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var isdetail = "${detail}";
	
	$('#qna-custom-btn').click(function(e){
		
		e.preventDefault();
		var html = quill.getContents();
		
		var title = $('#title').val();
		html.title = title;
		
		// item no를 받아와야함(item detail page에서 글 작성)
 		var no = ${no};
		$.ajax({
			url: '${pageContext.servletContext.contextPath }/${db}/api/board/itemboard/write/' + no,
			type: 'post',
			dataType: 'json',
			contentType: 'application/json',
			data: JSON.stringify(html),
			success: function(response){
				
				if(isdetail=="detail")
					location.href= "${pageContext.request.contextPath }/${db}/order/detail?no=${no}";
				else
				location.href= "${pageContext.request.contextPath }/${db}/board/itemboard/list";	// list로 바꾸기
			},
			error: function(xhr, status, e){

				console.error(status + " : " + e);
	
			}
			
			
		}); 
 		
	});

});

</script>
</head>
<body>

    <!-- Navigation Bar-->
    <header id="topnav" style="background-color:#ffffff">
        @@include('../shop-partials/shop-topbar.html')
    </header>

	<c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import>
    <c:import url="/WEB-INF/views/partials/left-nav.jsp"></c:import>	
        <div class="wrapper">
            <div class="container-fluid">                
                
                <div class="recipient-info">
                    <span>상품 문의 게시판</span>
                </div>
                <!-- mail-info 시작-->
                <div class="margin-box-30">
                <form>
                <div class="col-lg-12">
                    <div class="card-box" style="margin:0px; padding:0px; width:100%;">
	                    <div>
		                    <div class="qna-board-title" style="margin-left:5px; width:100%; display:inline-block">
		                        <span >제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목 </span>
		                        <input type="text" class="form-control mail-custom" id="title" name="title"-/>
		    
		                    </div>
  						</div>
	                    <div style="margin-top: 30px;"></div>
	    
	                    <!-- Editor -->
	                    <div id="snow-editor" style="height:400px; "></div>
	                   
	    
	                    <div class="btn-submit-section qna-custom-btn-group" style="width: 100%;margin-top: 30px;"	>
	                        <button type="submit" id="qna-custom-btn" class="btn btn-secondary waves-effect" style="margin-left: 45%;">문의하기</button>
	                    	<a href="${pageContext.servletContext.contextPath }/${db }/board/itemboard/list">
	                        	<button type="button" class="btn btn-secondary waves-effect" id="btn-list">
									취소</button></a>
	                    </div>
                	</div>            
               </div>
               </form>
               </div>
        </div> <!-- end container -->            
        </div>
        <!-- end wrapper -->


              <c:import url="/WEB-INF/views/partials/footer.jsp"></c:import>
 	

                <!-- Vendor js -->
                <script src="<%=request.getContextPath() %>/assets/js/vendor.min.js"></script>
                

                <!-- third party js -->
                <script src="<%=request.getContextPath() %>/assets/libs/datatables/jquery.dataTables.min.js"></script>
                <script src="<%=request.getContextPath() %>/assets/libs/datatables/dataTables.bootstrap4.js"></script>
                <script src="<%=request.getContextPath() %>/assets/libs/datatables/dataTables.responsive.min.js"></script>
                <script src="<%=request.getContextPath() %>/assets/libs/datatables/responsive.bootstrap4.min.js"></script>
                <script src="<%=request.getContextPath() %>/assets/libs/datatables/dataTables.buttons.min.js"></script>
                <script src="<%=request.getContextPath() %>/assets/libs/datatables/buttons.bootstrap4.min.js"></script>
                <script src="<%=request.getContextPath() %>/assets/libs/datatables/buttons.html5.min.js"></script>
                <script src="<%=request.getContextPath() %>/assets/libs/datatables/buttons.flash.min.js"></script>
                <script src="<%=request.getContextPath() %>/assets/libs/datatables/buttons.print.min.js"></script>
                <script src="<%=request.getContextPath() %>/assets/libs/datatables/dataTables.keyTable.min.js"></script>
                <script src="<%=request.getContextPath() %>/assets/libs/datatables/dataTables.select.min.js"></script>
                <script src="<%=request.getContextPath() %>/assets/libs/pdfmake/pdfmake.min.js"></script>
                <script src="<%=request.getContextPath() %>/assets/libs/pdfmake/vfs_fonts.js"></script>
                <!-- third party js ends -->
        
                <!-- Plugins js -->
                <script src="<%=request.getContextPath() %>/assets/libs/katex/katex.min.js"></script>
                <script src="<%=request.getContextPath() %>/assets/libs/quill/quill.min.js"></script>
                <script src="<%=request.getContextPath() %>/assets/libs/dropzone/dropzone.min.js"></script>
                <script src="<%=request.getContextPath() %>/assets/libs/dropify/dropify.min.js"></script>

                <!-- Datatables init -->
                <script src="<%=request.getContextPath() %>/assets/js/pages/datatables.init.js"></script>
        
                <!-- Init js-->
                <script src="<%=request.getContextPath() %>/assets/js/pages/form-advanced.init.js"></script>
                <script src="<%=request.getContextPath() %>/assets/js/pages/form-quilljs.init.js"></script>
                <script src="<%=request.getContextPath() %>/assets/js/pages/form-fileuploads.init.js"></script>

                <!-- App js-->
                <script src="<%=request.getContextPath() %>/assets/js/app.min.js"></script>


    </body>
</html>