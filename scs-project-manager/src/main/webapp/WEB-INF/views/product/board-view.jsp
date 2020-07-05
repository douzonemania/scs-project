<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="<%=request.getContextPath() %>/assets/images/favicon.ico">
       
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
        <link href="<%=request.getContextPath() %>/assets/css/common.css" rel="stylesheet" type="text/css" />    
        
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
	 	console.log("네네네");
	 	event.preventDefault();
			$.ajax({
				url: '${pageContext.servletContext.contextPath }/${authUser.id}/api/product/board/reply/delete/' + no,
				async: true,
				type: 'post',
				dataType: 'json',
				contentType: 'application/json',
				data: '',
				success: function(response){
					location.href= "${pageContext.request.contextPath }/${authUser.id}/product/board/view/" + no;
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

	<header>
		<!-- horizontal-nav -->
		<c:import url='/WEB-INF/views/partials/horizontal-nav.jsp' />
	</header>
	<!-- footer -->
	<c:import url='/WEB-INF/views/partials/footer.jsp' />

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
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">SCS</a></li>
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">상품관리</a></li>
                                    <li class="breadcrumb-item active">상품 게시판 관리</li>
                                </ol>
                            </div>
                            <h4 class="page-title">상품 게시판 관리</h4>
                        </div>
                    </div>
                </div>     
                <!-- end page title -->



				<div class="col-12">
					<div class="card">
						<div class="card-body" id="search-form">
							
							<table class="table-form-exposure">
                                        <colgroup>
                                            <col width="20%" /><col width="*" />
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th>제목</th>
                                            <td>
                                                ${itemBoardVo.title }
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>작성자</th>
                                            <td>
                                                  ${itemBoardVo.name }                                                       
                                            </td>
                                        </tr>
                                        <tr>
                            	            <th>작성일</th>
                                            <td>
												${itemBoardVo.regDate }
                                            </td>
                                        </tr>                          
                                        </tbody>
                                    </table>
								
								<div id="snow-viewer" style="height: 300px;" contentEditable="false"></div>


								<!-- 답글이 있을 경우  -->
								<c:if test="${itemBoardVo.replyState }">
									<br />
									
									<h3 class="page-title">답변</h3>
									<table class="table-form-exposure">
                                        <colgroup>
                                            <col width="20%" /><col width="*" />
                                        </colgroup>
                                        <tbody>
                                        <tr>
                            	            <th>작성일</th>
                                            <td>
												${itemReplyVo.regDate }
                                            </td>
                                        </tr>                          
                                        </tbody>
                                    </table>
									
									<div id="snow-reply" style="height: 300px;" contentEditable="false"></div>
								</c:if>
							
							<br />
							<div class="btn-submit-section">
								<a href="${pageContext.servletContext.contextPath }/${authUser.id}/product/board">
								<button type="button" class="btn btn-secondary waves-effect" id="btn-list">
									목록</button></a>
								
								<c:choose>
									<c:when test="${itemBoardVo.replyState == false}">
										<a href="${pageContext.servletContext.contextPath }/${authUser.id}/product/board/reply/${ itemBoardVo.no }">
											<button type="button" class="btn btn-secondary waves-effect" id="btn-list">
												답글달기</button></a>
									</c:when>
									<c:otherwise>
										<a href="">
											<button type="button" class="btn btn-secondary waves-effect" id="btn-list" onClick="removeCheck(${ itemBoardVo.no });">
											답글삭제</button></a>
									</c:otherwise>
								</c:choose>	

							</div>

						</div>
					</div>
				</div>
					
		</div>
		<!-- end container -->
	</div>
	<!-- end wrapper -->

	<c:import url ='/WEB-INF/views/partials/script.jsp'/>


</body>
</html>