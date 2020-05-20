<!DOCTYPE html>
<html lang="UTF-8">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<title>카테고리 추가/삭제</title>
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
		url: '${pageContext.request.contextPath }/api/setting/shipAdd',
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
			$(".admin-cat").append(html);
			
			
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
			url: '${pageContext.request.contextPath }/api/setting/shipAdd/add',
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
				
				var lastNo = $(".admin-cat").find('tr').length;
				response.data.lastNo = lastNo;
				var html = shipAddTemplate.render(response.data);
				$(".admin-cat tr").last().after(html);
				
				// form reset
				$("#add-form")[0].reset();
				
			},
			error: function(xhr, status, e){
				console.error(status + " : " + e);
			}
		});
	});
	
	// 클릭시 삭제
	$(document).on('click','.admin-cat tr td button',function(event){
		event.preventDefault();			
		var no = $(this).data('no');
		
		console.log("delete   " + no);
		$.ajax({
			url: '${pageContext.request.contextPath }/api/setting/shipAdd/delete/'+ no,
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
		
		$(this).parents('tr').remove();
		console.log($(this).parents('tr'));
		$('.admin-cat tr').remove();
		fetchList();
		
	});
	
	
});
fetchList();
</script>
</head>
<body>
	<form id="add-form" action="" method="post">
		<table id="admin-cat-add">
			<tr>
				<td class="t">배송사</td>
				<td><input type="text" id="text-ship" name="name"></td>
				<td><input type="submit" value="배송사 추가"></td>
			</tr>
		</table>
	</form>
	
   	<table class="admin-cat">

	</table>
</body>
</html>