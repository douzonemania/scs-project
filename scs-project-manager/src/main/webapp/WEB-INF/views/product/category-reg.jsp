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

<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/ejs/ejs.js"></script>
	
<script>
var id = '${authUser.id}';
/* var listItemTemplate = new EJS({
	url: "${pageContext.request.contextPath }/assets/js/ejs/list-item-template.ejs"
});
var listTemplate = new EJS({
	url: "${pageContext.request.contextPath }/assets/js/ejs/list-template.ejs"
}); */

$(function() {
	
	$("#cate-add-button").click(function() {
		
		var name = $('#category-name').val();
		var no = null;		
		var isParent = $('input[name="cate-n"]:checked').val();
		
		/* parentNo 구하기 1차:null 2차: 1*/
		var parentNo;
		
		if(isParent=="parent")
			parentNo = null;
		else
			parentNo = 1;		
		
		var vo={};
		
		vo.no = no;
		vo.name = name;
		vo.parentNo = parentNo;		
		$.ajax({
			url: '${pageContext.request.contextPath }/api/product/category-reg/add',
			contentType: 'application/json',
			data: JSON.stringify(vo),
			type: "POST",
			dataType: 'json',
			success : function(response){
				alert("성공")
			},
			error:
				alert("실패")
		});
	});
});


$(function() {
	
	$("#cate-del-button").click(function() {
					
		//var isParent = $('input[name="cate-n"]:checked').val();
		var name = $("#cate-select-del option:selected").text();		
		
		var vo={};
		
		vo.name = name;
			
		$.ajax({
			url: '${pageContext.request.contextPath }/api/product/category-reg/del',
			contentType: 'application/json',
			data: JSON.stringify(vo),
			type: "POST",
			dataType: 'json',
			success : function(response){
				alert("성공")
			},
			error:
				alert("실패")
		});
	});
});

$(function() {
	
	$("#cate-mod-button").click(function() {
		
		console.log("click!");
		//var isParent = $('input[name="cate-n"]:checked').val();
		var name = $("#cate-select-mod option:selected").text();
		var afterName = $('#category-name-mod').val();		
		
		var vo={};
		
		vo.name = name;					// 카테고리 이름
		vo.afterName = afterName;		// 변경할 카테고리 이름
			
		$.ajax({
			url: '${pageContext.request.contextPath }/api/product/category-reg/mod/' + afterName,
			contentType: 'application/json',
			data: JSON.stringify(vo),
			type: "POST",
			dataType: 'json',
			success : function(response){
				alert("성공")
			},
			error:
				alert("실패")
		});
	});
});

</script>       
       
       
</head>
<body>

  	<header>
  		<!-- horizontal-nav -->  	
        <c:import url ='/WEB-INF/views/partials/horizontal-nav.jsp'/>
    </header>
    	<!-- footer -->
    	<c:import url ='/WEB-INF/views/partials/footer.jsp'/>
    
     <!-- ============================================================== -->
     <!-- Start Page Content here -->
     <!-- ============================================================== -->


        <div class="wrapper">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">SCS</a></li>
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">상품</a></li>
                                    <li class="breadcrumb-item active">카테고리등록</li>
                                </ol>
                            </div>
                            <h4 class="page-title">카테고리등록</h4>
                        </div>
                    </div>
                </div>     

                <!-- <div class="row">
                    <div class="col-12">
                        <div class="page-title-box" id="search-form-text"> 
                            <h4 class="page-title">&nbsp</h4>
                        </div>
                    </div>
                </div>      -->

                <!-- row, col-12 시작-->
                <div class="row">
                    <div class="col-12">

                        <!-- card, card-body 시작-->
                        <div class="card">
                            <div class="card-body" id="search-form">
                                <h4 class="page-title">현재 카테고리</h4>
                                <!-- 카테고리 리스트 시작-->

                                <div class="category-list">
                                    
                                </div>
                                <!-- 카테고리 리스트 종료-->
                                <label class="lspace"></label>


                                <!-- 카테고리 추가 시작-->
                                <h4 class="page-title">카테고리 등록</h4>
								<form id="add-cate">
                                <table class="category-add">
                                    <tr>
                                        <td>
                                            <input type=radio name="cate-n" value="parent"checked >&nbsp1차 카테고리 등록<label class="text-space"></label>
                                            <input type=radio name="cate-n" value="child" >&nbsp2차 카테고리 등록
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>                                        	
	                                        <button type="button" class="btn btn-secondary waves-effect textbox" id="cate-add-button-text" disabled>1차카테고리</button> 
	                                        <input type="text" class="form-control " id="category-name" style="width:200px; display:inline-block;" value="">	                                        
	                                        <button type="button" class="btn btn-secondary waves-effect " id="cate-add-button">추가</button>	                                                                                   
                                        </td>
                                    </tr>
                                </table>
                                </form>
                                <!-- 카테고리 추가 종료-->
                                </h4><label class="lspace"></label>


                                <!-- 카테고리 삭제 시작-->
                                <h4 class="page-title">카테고리 삭제</h4>
								<form id="del-cate">
                                <table class="category-remove">
                                    <tr>
                                        <td>
                                            <input type=radio name="cate-n-del" checked>&nbsp1차 카테고리 삭제<label class="text-space"></label>
                                            <input type=radio name="cate-n-del">&nbsp2차 카테고리 삭제
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <button type="button" class="btn btn-secondary waves-effect textbox " id="cate-del-button-text" disabled>1차카테고리</button> 
                                            
									
									
											<!-- 카테고리 이름 select box -->
                                            <select class="form-control" id="cate-select-del" style="display:inline-block">
	                                            <c:forEach var="vo" varStatus="status" items="${categoryNameList }">
	                                            	<option>${vo.name }</option>
	                                            </c:forEach>                                                                                                      
                                            </select> 
                                                                                     
                                            <button type="button" class="btn btn-secondary waves-effect " id="cate-del-button">삭제</button>
                                        </td>
                                    </tr>
                                </table>
                                </form>
                                <!-- 카테고리 삭제 종료-->
                                <label class="lspace"></label>

                                <h4 class="page-title">카테고리 수정</h4>

                                <!-- 카테고리 수정 시작-->
                                <table class="category-modify">
                                    <tr>
                                        <td>
                                            <input type=radio name="cate-n-mod" checked>&nbsp1차 카테고리 수정<label class="text-space"></label>
                                            <input type=radio name="cate-n-mod">&nbsp2차 카테고리 수정
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <button type="button" class="btn btn-secondary waves-effect btn-submit-color textbox " id="cate-mod-button-text" disabled>1차카테고리</button> 
                                            <select class="form-control" id="cate-select-mod" style="display:inline-block">
	                                            <c:forEach var="vo" varStatus="status" items="${categoryNameList }">
	                                            	<option>${vo.name }</option>
	                                            </c:forEach>                                                                                                      
                                            </select>
                                            <input type="text" class="form-control " id="category-name-mod" style="width:200px; display:inline-block;">                                            
                                            <button type="button" class="btn btn-secondary waves-effect " id="cate-mod-button">수정</button>
                                        </td>
                                    </tr>
                                </table>
                                <!-- 카테고리 수정 종료-->
                                
                                

                            </div>
                        </div>
                        <!-- card, card-body 종료-->
                        
                        
                    </div>
                </div>
            </div>
        </div>
                
                <!-- row, col-12 종료-->

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->
        
	<c:import url ='/WEB-INF/views/partials/script.jsp'/>
</body>
</html>