<!DOCTYPE html>
<html lang="UTF-8">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<title>카테고리 추가/삭제</title>
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
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/assets/js/ejs/ejs.js"></script>
<script>
var shipAddTemplate = new EJS({
	url:"${pageContext.request.contextPath }/assets/js/ejs/ship-item-add.ejs"
});
var shiplistTemplate = new EJS({
	url:"${pageContext.request.contextPath }/assets/js/ejs/ship-list-template.ejs"
});
var fetchList = function(){
	$.ajax({
		url: '${pageContext.request.contextPath }/${authUser.id}/api/setting/shipAdd',
		async: true,
		type: 'get',
		dataType: 'json',
		data: '',
		success: function(response){
			
			if(response.result != "success"){
				console.error(response.message);
				return;
			}
			console.log("response.data: " + response.data);
			var html = shiplistTemplate.render(response);
			$("#admin-cat").append(html);
			
			
		},
		error: function(xhr, status, e){
			console.error(status + " : " + e);
		}
	});	
}
$(function(){
 	
	//입력폼 submit 이벤트
	$('#add-form').submit(function(event){
		event.preventDefault();
		
		var vo = {};
		vo.name = $('#text-ship').val();
		<!--vo.id = '${authUser.id}'; -->
		$.ajax({
			url: '${pageContext.request.contextPath }/${authUser.id}/api/setting/shipAdd/add',
			async: true,
			type: 'post',
			dataType: 'json',
			contentType: 'application/json',
			data: JSON.stringify(vo),
			success: function(response){
				
				console.log("add-form: " + response);
				
				if(response.result != "success"){
					console.error(response.message);
					return;
				}
				// rendering
				
				var lastNo = $("#admin-cat").find('tr').length;
				response.data.lastNo = lastNo;
				var html = shipAddTemplate.render(response.data);
				$("#admin-cat tr").last().after(html);
				
				// form reset
				$("#add-form")[0].reset();
				
			},
			error: function(xhr, status, e){
				console.error(status + " : " + e);
			}
		});
	});
	
	// 클릭시 삭제
	$(document).on('click','#admin-cat tr td button',function(event){
		event.preventDefault();			
		var no = $(this).data('no');
		$(this).parents('tr').remove();
		
		console.log("delete   " + no);
		$.ajax({
			url: '${pageContext.request.contextPath }/${authUser.id}/api/setting/shipAdd/delete/'+ no,
			async: true,
			type: 'delete',
			dataType: 'json',
			data: '',
			success: function(response){
				console.log("delete response:" + response);
				if(response.result != "success"){
					console.error(response.message);
					return;
				}
				if(response.data != -1 ){
					
					return;
				}
			},
			error: function(xhr, status, e){
				console.error(status + " : " + e);
			}
		});
		
		
	});
	
	
});
fetchList();
</script>
</head>
<body>
	<form id="add-form" action="" method="post">
		<table id="admin-cat-add" class="table-form-category">
			<colgroup>
	            <col width="180"><col width="*">
	        </colgroup>
           <tbody> 
			<tr>
				<td class="t">배송사</td>
				<td><input type="text" id="text-ship" name="name"></td>
				<td><input type="submit" value="배송사 추가" style="background-color:#CBCBCB; border-color:white"></td>
			</tr>
			</tbody>
		</table>
	</form>
	
   	<table id="admin-cat" class="table-form-category">

	</table>
</body>
</html>