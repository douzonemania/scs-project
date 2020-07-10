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
        <title>${ceoVo.siteName }</title>
        <link rel="shortcut icon" href="/scs-manager${favicon }">

        <!-- Plugins css -->
        <link href="${pageContext.request.contextPath}/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
		 <link href="<%=request.getContextPath() %>/assets/libs/quill/quill.snow.css" rel="stylesheet" type="text/css" />

        <!-- App css -->
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/app.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css" />
        
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/ejs/ejs.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	quill2.enable(false);			// editor 비활성화
	
	${viewer};
	
	// 답글
	var replyState = ${itemBoardVo.replyState};
	if(replyState == true) {
		quill3.enable(false);
		${reply};
	}
	
});

var removeCheck = function(no) {
	if (confirm("정말 삭제하시겠습니까??") == true) {    //확인
	
	 	event.preventDefault();
			$.ajax({
				url: '${pageContext.servletContext.contextPath }/${db}/api/board/itemboard/delete/' + no,
				async: true,
				type: 'post',
				dataType: 'json',
				contentType: 'application/json',
				data: '',
				success: function(response){
					location.href= "${pageContext.request.contextPath }/${db}/board/itemboard/list";
				},
				error: function(xhr, status, e){

					console.error(status + " : " + e);
		
				}
			});
	}
	else {   //취소
		console.log("아니오오오오");
		event.preventDefault();
	    return;
	}
} 

</script>

</head>
<body>
    <!-- Navigation Bar-->
    <c:import url="/WEB-INF/views/partials/topbar.jsp"></c:import>
    <c:import url="/WEB-INF/views/partials/left-nav.jsp"></c:import>	
	<!-- ============================================================== -->
	<!-- Start Page Content here -->
	<!-- ============================================================== -->



	<div class="wrapper">
		<div class="container-fluid">

				<div class="col-12">
					<div class="card">
						<div class="card-body" id="search-form">
							
							<table class="table-form-exposure"  style=" margin-bottom: 10px;">
                                        <colgroup>
                                            <col width="20%" /><col width="*" />
                                        </colgroup>
                                        <tbody>
	                                        <tr>
	                                            <th style="font-weight: bold; font-size: 1.2em;">제목</th>
	                                            <td>
	                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${itemBoardVo.title }
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th style="font-weight: bold; font-size: 1.2em;">작성자</th>
	                                            <td>
	                                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${itemBoardVo.name }                                                       
	                                            </td>
	                                        </tr>
	                                        <tr>
	                            	            <th style="font-weight: bold; font-size: 1.2em;">작성일</th>
	                                            <td>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${itemBoardVo.regDate }
	                                            </td>
	                                        </tr>                          
                                        </tbody>
                                    </table>
								<div id="snow-viewer" style="height: 400px; border: 1px solid #CECECE;" contentEditable="false"></div>


								<!-- 답글이 있을 경우  -->
								<c:if test="${itemBoardVo.replyState }">
									<br /><br />
									<span class="page-title" style="font-size: 2.1em;">답변</span><br />
									<table class="table-form-exposure">
                                        <colgroup>
                                            <col width="20%" /><col width="*" />
                                        </colgroup>
                                        <tbody>
                                        <tr>
                            	            <th style="font-weight: bold; font-size: 1.2em;">작성일</th>
                                            <td>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${itemReplyVo.regDate }
                                            </td>
                                        </tr>                          
                                        </tbody>
                                    </table>
									
									<div id="snow-reply" style="height: 400px; border: 1px solid #CECECE;" contentEditable="false"></div>
								</c:if>
							
							<br />
							<div class="btn-submit-section">
								<a href="${pageContext.servletContext.contextPath }/${db}/board/itemboard/list">
								<button type="button" class="btn btn-secondary waves-effect" id="btn-list">
									목록</button></a>
									<c:if test="${authUser.no == itemBoardVo.memberNo }">
										<a href="">
										<button type="button" class="btn btn-secondary waves-effect" id="btn-list" onClick="removeCheck(${itemBoardVo.no});">
											글삭제</button></a>	
									</c:if> 
							</div>

						</div>
					</div>
				</div>
					
		</div>
		<!-- end container -->
	</div>
	<!-- end wrapper -->


    <c:import url="/WEB-INF/views/partials/footer.jsp"></c:import>
    <!-- Vendor js -->
   <script src="<%=request.getContextPath() %>/assets/js/vendor.min.js"></script>

   <!-- App js-->
   <script src="<%=request.getContextPath() %>/assets/js/app.min.js"></script>

	<script src="<%=request.getContextPath() %>/assets/libs/quill/quill.min.js"></script>
	<script src="<%=request.getContextPath() %>/assets/js/pages/form-quilljs.init.js"></script>
</body>
</html>