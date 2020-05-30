<!DOCTYPE html>
<html lang="UTF-8">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<title>옵션 추가</title>
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
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/assets/js/ejs/ejs.js"></script>
<script>
var optionAddEjs = new EJS({
	url:"${pageContext.request.contextPath }/assets/js/ejs/option-add.ejs"
});

function sizeList(no, name, type, ad){
	var cOp = {};
	cOp.no = no;
	cOp.name = name;
	cOp.type = type;
	cOp.ad = ad;
	console.log("sizeList!!")
	console.log(cOp.name + cOp.type + cOp.ad + "!!!");
	
	$(opener.document).find('.form-control.colorOptionSelect').append("<option value='"+ cOp.no +"'>"+cOp.name+"</option>");
}

function modOption(no, name, type, ad){
	if(ad=="add"){
		if(type=='size')
			$(opener.document).find('.form-control.sizeOptionSelect').append("<option value='"+ no +"'>"+name+"</option>");
		else if(type=='color')
			$(opener.document).find('.form-control.colorOptionSelect').append("<option value='"+ no +"'>"+name+"</option>");
	}else if(ad=="del"){
		if(type=='size')
			$(opener.document).find(".form-control.sizeOptionSelect option[value='"+no+"']").remove();
		else if(type=='color'){
			$(opener.document).find(".form-control.colorOptionSelect option[value='"+no+"']").remove();
		}
	}	
}
$(function(){
	
	//추가 버튼 클릭시 size option add 
	$("#size-add").click(function() {	
		
		var no = null;
		var name = $('#size-option-name').val();
		var type = "size";
		var vo={}
		vo.no = no;
		vo.name = name;
		vo.type = type;
		$.ajax({
			url: '${pageContext.request.contextPath }/${authUser.id}/api/product/option/addSize' ,
			contentType: 'application/json',
			data: JSON.stringify(vo),
			type: "POST",
			dataType: 'json',
			success : function(response){				
				var html = optionAddEjs.render(response.data);
				$('#last-SizeTable').before(html);				
				modOption(response.data.no,name,type,"add");
			},
			error:
				function(xhr, status, e){
					console.error(status + " : " + e);
				}
		});
		$('#size-option-name').val('');
	});
	
	// 추가 버튼 클릭시 size color add
	$("#color-add").click(function() {
		
		var no = null;
		var name = $('#color-option-name').val();
		var type = "color";
		
		var vo={}
		vo.no = no;
		vo.name = name;
		vo.type = type;
		
		$.ajax({
			url: '${pageContext.request.contextPath }/${authUser.id}/api/product/option/addColor' ,
			contentType: 'application/json',
			data: JSON.stringify(vo),
			type: "POST",
			dataType: 'json',
			success : function(response){
				
				var html = optionAddEjs.render(response.data);
				$('#last-ColorTable').before(html);				
				modOption(response.data.no,name,type,"add");
			},
			error:
				function(xhr, status, e){
					console.error(status + " : " + e);
				}
		});
		$('#color-option-name').val('');
	});
	
	// 삭제 버튼 클릭시 size del
	$(document).on('click','.button-zone button',function(){
		event.preventDefault();	
		var no = $(this).data('no');
		$(this).parents('tr').remove();	
		
		var vo={};
		vo.no = no;		
		
		$.ajax({
			url: '${pageContext.request.contextPath }/${authUser.id}/api/product/option/deleteOpiton' ,
			contentType: 'application/json',
			data: JSON.stringify(vo),
			type: "POST",
			dataType: 'json',
			success : function(response){
				modOption(response.data.no, response.data.name, response.data.type, "del");				
			},
			error:
				function(xhr, status, e){
					console.error(status + " : " + e);
			}
		});	
	});
});

</script>
</head>
<body>
	<div style="display:flex">
	<table class="option-add-table">
		<colgroup>
			<col width="165px">
			<col width="55px">			
		</colgroup>
		<tr id="">
			<th colspan="2">SIZE</th>
		</tr>
		
		<c:forEach var="vo" varStatus="status" items="${sizeOptionList }">
			
			<c:if test="${vo.name!=null }">	<!-- name이 null이면 td 안붙임 -->
				<tr>
			    	<td class="button-zone">
						${vo.name}	
					</td>
					<td class="button-zone">
						<button type="button" data-no="${vo.no }" class="btn btn-secondary waves-effect del">삭제</button>
					</td>
				</tr>
			</c:if>
		</c:forEach>
		<tr id="last-SizeTable">
			<td style="text-align:center; border-right:solid 1px transparent;">
				<input type="text" class="form-control" id="size-option-name" value="" />
			</td>
			<td>
				<button type="button" id="size-add" class="btn btn-secondary waves-effect">추가</button>
			</td>
		</tr>		
	</table>
	
	<table class="option-add-table">
		<colgroup>
			<col width="155px">
			<col width="55px">			
		</colgroup>
		<tr id="">
			<th colspan="2">COLOR</th>
		</tr>
		
		<c:forEach var="vo" varStatus="status" items="${colorOptionList }">
			<!-- name이 null이면 td 안붙임 -->
			<c:if test="${vo.name!=null }">	
				<tr>
			    	<td class="button-zone">
						${vo.name}	
					</td>
					<td class="button-zone">
						<button type="button" data-no="${vo.no }" class="btn btn-secondary waves-effect del">삭제</button>
					</td>
				</tr>
			</c:if>
		</c:forEach>
		<tr id="last-ColorTable">
			<td style="text-align:center; border-right:solid 1px transparent;">
				<input type="text" class="form-control" id="color-option-name" value="" />
			</td>
			<td>
				<button type="button" id="color-add" class="btn btn-secondary waves-effect">추가</button>
			</td>
		</tr>		
	</table>
	</div>
	
	
  
</body>
</html>