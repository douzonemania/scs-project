<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
        <title>카테고리 관리</title>
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
function changeTable(no,name){
	
	vo={};
	vo.name = name;
	$.ajax({
		url: '${pageContext.request.contextPath }/${authUser.id}/api/product/category-reg/createTable' ,
		contentType: 'application/json',
		data: JSON.stringify(vo),
		type: "POST",
		dataType: 'json',
		success : function(response){
			$(".category-list").append("<table class='category-table' id='category-table-"+response.data+"' style='margin-left:20px; margin-top:20px;'>" + "<tr id='category-table-tr-"+response.data+"'><th style='min-width:100px' id='category-table-th-"+response.data+"'>"+ name +"</th><td style='min-width:150px;' id='category-table-td-"+response.data+"'></td></tr></table>" );
		},
		error:
			function(xhr, status, e){
				console.error(status + " : " + e);
			}
	});
}
function changeTable2(no){
	
	$("table#category-table-"+no+" td#category-table-td-"+no).remove();
	var vo={};
	vo.parentNo = no;
	
	$.ajax({
		url: '${pageContext.request.contextPath }/${authUser.id}/api/product/category-reg/createTable2' ,
		contentType: 'application/json',
		data: JSON.stringify(vo),
		type: "POST",
		dataType: 'json',
		success : function(response){				
				for( var key in response.data){
					var data = response.data[key];
										
					$("#category-table-tr-"+no).append("<td style='min-width:150px;' id='category-table-td-"+no+"'> " +data.name +"</td>");					
				}			
		},
		error:
			 function(xhr, status, e){
				console.error(status + " : " + e);
			}
	});
}

	
//$(document).ready(createCategoryTable());
function initial(){
	$("#cate-select-del2").prepend("<option>----</option>");
	$("#cate-select-mod2").prepend("<option>----</option>");
	$('#category-name').val('');
	$('#category-name-del').val('');
	$('#category-name-mod').val('');
	$("#cate-select-del2").attr('disabled',true);
	$("#cate-select-mod2").attr('disabled',true);
	$("#cate-select-del option:eq(0)").prop("selected", true);
	$("#cate-select-mod option:eq(0)").prop("selected", true);
	$("#cate-select-del2 option:eq(0)").prop("selected", true);
	$("#cate-select-mod2 option:eq(0)").prop("selected", true);
}
$(function() {
	
	$("#cate-add-button").click(function() {
		 
		var name = $('#category-name').val();
		var no= null;
		var isParent = $('input[name="cate-n"]:checked').val();
		var parentCategory = $("#cate-select-add option:selected").text();
		
		if(name==""){
			alert("카테고리 이름을 입력하세요");
			return;
		}
		if(parentCategory==""){
			alert("카테고리 이름을 입력하세요");
			return;
		}
		
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
		
		
		if(parentNo==null){
		$.ajax({
			url: '${pageContext.request.contextPath }/${authUser.id}/api/product/category-reg/add/' + parentCategory ,
			contentType: 'application/json',
			data: JSON.stringify(vo),
			type: "POST",
			dataType: 'json',
			success : function(response){
				if(response.data=="duplication"){
					alert("중복된 카테고리명입니다.")
				}else{
				$("select#cate-select-add option, select#cate-select-del option, select#cate-select-mod option").remove();
				$('#cate-select-add,#cate-select-del,#cate-select-mod').append("<option value=''>----</option>");
				for( var key in response.data){
					var data = response.data[key];	
					if(data.name!=null)
						$('#cate-select-add,#cate-select-del,#cate-select-mod').append("<option value='" + data.no + "'>" + data.name + "</option>");
				}
				changeTable(vo.no, vo.name);
				initial();
				}
				alert("카테고리가 추가되었습니다.");
			},
				error: function(xhr, status, e){
					console.error(status + " : " + e);
				}
		});
		} else {
			$.ajax({
				url: '${pageContext.request.contextPath }/${authUser.id}/api/product/category-reg/add/' + parentCategory ,
				contentType: 'application/json',
				data: JSON.stringify(vo),
				type: "POST",
				dataType: 'json',
				success : function(response){
					if(response.data=="duplication"){
						alert("중복된 카테고리명입니다.")
					}else{
					$("select#cate-select-del2 option, select#cate-select-mod2 option").remove();
					$('#cate-select-del2,#cate-select-mod2').append("<option value=''>----</option>");
					for( var key in response.data){
						var data = response.data[key];	
						if(data.name!=null)
							$('#cate-select-del2,#cate-select-mod2').append("<option value='" + data.no + "'>" + data.name + "</option>");							
						
					}
					var no = $("#cate-select-add option:selected").val();
					
					changeTable2(no);
					initial();
					}
					alert("카테고리가 추가되었습니다.");
				},
					error: function(xhr, status, e){
						console.error(status + " : " + e);
					}
			});			
		}
		/* $("input:radio[name=cate-n-del][value=" + 'parent' + "]").attr("checked",true); */
		
		
	});
});
$(function() {
	
	$("#cate-del-button").click(function() {
		
		var isParent = $('input[name="cate-n-del"]:checked').val();
		var name = $("#cate-select-del option:selected").text();		
		var childCategoryName = $("#cate-select-del2 option:selected").text();
		var no = $("#cate-select-del2 option:selected").val();

		// 카테고리 선택이 안되었을 때 return
		if(isParent=="parent"){
			if(name=="----"){
				alert("카테고리를 선택하세요");
				return;
			}
		}
		if(isParent=="child"){
			if(childCategoryName==""){
				alert("카테고리를 선택하세요");
				return;
			}
		}

		var vo={};
		if(isParent=="parent")
			parentNo = null;
		else
			parentNo = 99;
		vo.parentNo = parentNo;
		vo.no = no;		
		
		// 2차카테고리 입력 별 name 값 설정
		if(parentNo == null){
			vo.name = name;			
		}else{
			vo.name = childCategoryName;			
		}	
			$.ajax({
				url: '${pageContext.request.contextPath }/${authUser.id}/api/product/category-reg/del',
				contentType: 'application/json',
				data: JSON.stringify(vo),
				type: "POST",
				dataType: 'json',
				success : function(response){
					$("select#cate-select-add option, select#cate-select-del option, select#cate-select-mod option").remove();
					$('#cate-select-add,#cate-select-del,#cate-select-mod').append("<option value=''>----</option>");
					for( var key in response.data){
						var data = response.data[key];	
						if(data.name!=null)
							$('#cate-select-add,#cate-select-del,#cate-select-mod').append("<option value='" + data.no + "'>" + data.name + "</option>");
					}
					alert("카테고리가 삭제되었습니다.");
				},
					error: function(xhr, status, e){
						console.error(status + " : " + e);
					}
			});
			if(parentNo==99)
				changeTable2(no);
			else{ //1차카테고리일때 테이블 삭제
				var name = $("#cate-select-del option:selected").text();
				var no = $("#cate-select-del option:selected").val();
				
				$("table#category-table-"+no).remove();				
			}
			initial();
	});
});
$(function() {
	
	$("#cate-mod-button").click(function() {
				var isParent = $('input[name="cate-n-mod"]:checked').val();
				var name = $("#cate-select-mod option:selected").text();
				var childCategoryName = $("#cate-select-mod2 option:selected").text();
				var afterName = $('#category-name-mod').val();		
				var no = $("#cate-select-mod2 option:selected").val();
				//createTable에 사용
			
				// 카테고리 선택이 안되었을 때 return
				
				var vo={};
				vo.afterName = afterName;		// 변경할 카테고리 이름
				// 2차카테고리 입력 별 name 값 설정
				if(childCategoryName==""){
					vo.name = name;
				}else{
					vo.name = childCategoryName;
				}				
				
				if(isParent=="parent"){
					if(name=="----"){
						alert("카테고리를 선택하세요");
						return;
					}
					if(afterName==""){
						alert("수정할 카테고리 이름을 입력하세요");
						return;
					}
				}
				if(isParent=="child"){
					if(childCategoryName==""){
						alert("카테고리를 선택하세요");
						return;
					}
					if(afterName==""){
						alert("수정할 카테고리 이름을 입력하세요");
						return;
					}
				}
				
		$.ajax({
			url: '${pageContext.request.contextPath }/${authUser.id}/api/product/category-reg/mod/' + afterName,
			contentType: 'application/json',
			data: JSON.stringify(vo),
			type: "POST",
			dataType: 'json',
			success : function(response){
				$("select#cate-select-add option, select#cate-select-del option, select#cate-select-mod option").remove();
				$('#cate-select-add,#cate-select-del,#cate-select-mod').append("<option value=''>----</option>");
				for( var key in response.data){
					var data = response.data[key];	
					if(data.name!=null)
						$('#cate-select-add,#cate-select-del,#cate-select-mod').append("<option value='" + data.no + "'>" + data.name + "</option>");
					initial();
				}
				alert("카테고리가 수정되었습니다.");
			},
			error:
				 function(xhr, status, e){
					console.error(status + " : " + e);
				}
		});
		
		
		if(childCategoryName!=""){
			changeTable2(no);
			
		}
		else{		
			var no = $("#cate-select-mod option:selected").val();
			$("#category-table-th-"+no).html(afterName);
			initial();
			
		}
	});
});
$(function() {
	/* 카테고리 추가 라디오버튼 별 화면 뿌리기 */
	$("input:radio[name=cate-n]").click(function(){
        	
        if($("input[name=cate-n]:checked").val() == "parent"){
        	$('#cate-add-button-text').show();
        	$('#cate-add-button-text2').hide();
        	$('#cate-select-add').css('display','none');
        	/* $("#cate-select-del option:eq(0)").prop("selected", true); */
        	$('#category-name').val('');
        	
        }else if($("input[name=cate-n]:checked").val() == "child"){
        	$('#cate-add-button-text').hide();
        	$('#cate-add-button-text2').show();
        	$('#cate-select-add').css('display','inline-block');
        	$('#category-name').val('');
        	
        }
	});
});
$(function() {
	/* 카테고리 삭제 라디오버튼 별 화면 뿌리기 */
	$("input:radio[name=cate-n-del]").click(function(){
        	
        if($("input[name=cate-n-del]:checked").val() == "parent"){
        	$('#cate-del-button-text').show();
        	$('#cate-del-button-text2').hide();
        	$('#cate-select-del2').css('display','none');        	
        	$("select#cate-select-del2 option").remove();
        	$('#cate-select-del2').append("<option value=''>----</option>");
        	$("#cate-select-del2 option:eq(2)").prop("selected", true);
        	$("#cate-select-del option:eq(0)").prop("selected", true);
			
        	
        	
        }else if($("input[name=cate-n-del]:checked").val() == "child"){
        	$('#cate-del-button-text').hide();
        	$('#cate-del-button-text2').show();
        	$('#cate-select-del2').css('display','inline-block');
        	$("#cate-select-del option:eq(0)").prop("selected", true);
        	if( $("#cate-select-del option:selected").text() =="----"){
        		$("#cate-select-del2").attr('disabled',true);        		
        	}
        	
        	
        }
	});
});
$(function() {
	/* 카테고리 수정 라디오버튼 별 화면 뿌리기 */
	$("input:radio[name=cate-n-mod]").click(function(){
        	
        if($("input[name=cate-n-mod]:checked").val() == "parent"){
        	$('#cate-mod-button-text').show();
        	$('#cate-mod-button-text2').hide();
        	$('#cate-select-mod2').css('display','none');        	
        	$("select#cate-select-mod2 option").remove();
        	$('#cate-select-mod2').append("<option value=''>----</option>");
        	$('#category-name-mod').val('');
        	
        	$("#cate-select-mod option:eq(0)").prop("selected", true);
        	$("#cate-select-mod2 option:eq(1)").prop("selected", true); 
        	
        }else if($("input[name=cate-n-mod]:checked").val() == "child"){
        	$('#cate-mod-button-text').hide();
        	$('#cate-mod-button-text2').show();
        	$('#cate-select-mod2').css('display','inline-block');        	
        	$('#category-name-mod').val('');
        	$("#cate-select-mod option:eq(0)").prop("selected", true);
        	if( $("#cate-select-mod option:selected").text() =="----"){
        		$("#cate-select-mod2").attr('disabled',true);        		
        	}
        	
        }
	});
});
$(function() {
/* 1차 카테고리 별 2차 카테고리 이름 리스트 */
	$('#cate-select-del').change(function(){		
    	
    	$("#cate-select-del2").removeAttr("disabled");
    	if( $("#cate-select-del option:selected").text() =="----"){
    		$("#cate-select-del2").attr('disabled',true);
    		
    	}
    	var name =  $("#cate-select-del option:selected").text();
		var vo={};
		vo.name = name;		
		
		$.ajax({
			url: '${pageContext.request.contextPath }/${authUser.id}/api/product/category-reg/childCategoryList' ,
			contentType: 'application/json',
			data: JSON.stringify(vo),
			type: "POST",
			dataType: 'json',
			success : function(response){				
				if(($("input[name=cate-n-del]:checked").val() == "child")){
					
					for( var key in response.data){
						var data = response.data[key];	
						if(data.name!=null)							
							$('#cate-select-del2').append("<option value='" + data.parentNo + "'>" + data.name + "</option>");
					}
				}
			},
			error:
				function(xhr, status, e){
					console.error(status + " : " + e);
				}
		});
		$("select#cate-select-del2 option").remove();
	});
});
$(function() {
	/* 1차 카테고리 별 2차 카테고리 이름 리스트 */
		$('#cate-select-mod').change(function(){
			
	    	$("#cate-select-mod2").removeAttr("disabled");
	    	if( $("#cate-select-mod option:selected").text() =="----"){
	    		$("#cate-select-mod2").attr('disabled',true);        		
	    	}
	    	/* 1차 카테고리 선택 안해도 2차 카테고리 갱신되는것 방지 */
			var name =  $("#cate-select-mod option:selected").text();		
			var vo={};
			vo.name = name;
			
			$.ajax({
				url: '${pageContext.request.contextPath }/${authUser.id}/api/product/category-reg/childCategoryList' ,
				contentType: 'application/json',
				data: JSON.stringify(vo),
				type: "POST",
				dataType: 'json',
				success : function(response){				
					if(($("input[name=cate-n-mod]:checked").val() == "child")){
						
						for( var key in response.data){
							var data = response.data[key];	
							if(data.name!=null)
								$('#cate-select-mod2').append("<option value='" + data.parentNo + "'>" + data.name + "</option>");
						}
					}
				},
				error:
					function(xhr, status, e){
						console.error(status + " : " + e);
					}
			});
			$("select#cate-select-mod2 option").remove();
		});
	
	$(".sortable").sortable({
		revert: true
	});
		
	$(".draggable").draggable({
		connectToSortable : ".sortable",
		helper:"clone",
		revert:"invalid"
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
                                    <li class="breadcrumb-item active">카테고리관리</li>
                                </ol>
                            </div>
                            <h4 class="page-title">카테고리관리</h4>
                                                                                                                                                  
                        </div>
                    </div>
                </div>     

                <!-- row, col-12 시작-->
                <div class="row">
                    <div class="col-12">

                        <!-- card, card-body 시작-->
                        <div class="card">
                            <div class="card-body" id="search-form">
                                <h4 class="page-title">현재 카테고리</h4>
                                <!-- 카테고리 리스트 시작-->

                                <div class="category-list" style="overflow:auto">                      

									<c:forEach var="vo" varStatus="status" items="${categoryNameList }">
									
									<table class="category-table draggable" id="category-table-${vo.no }" style="margin-left:20px; margin-top:20px;">
										<tr id="category-table-tr-${vo.no}" class="sortable">
											<th style="min-width:100px;" id="category-table-th-${vo.no }">${vo.name }</th>
											
											<c:forEach var="vo2" varStatus="status" items="${category2NameList }">
												<c:if test="${vo.no == vo2.parentNo }">
													<td id="category-table-td-${vo.no }" style="min-width:150px; ">${vo2.name}</td>
												</c:if>
											</c:forEach>
										</tr>
									</table>
									
									</c:forEach>
									
									
                                
                                </div>
                                <!-- 카테고리 리스트 종료-->
                                <label class="lspace"></label>


                                <!-- 카테고리 추가 시작-->
                                <h4 class="page-title">카테고리 등록</h4>
								<form id="add-cate">
                                <table class="category-add">
                                    <tr>
                                        <td>
                                            <input type=radio name="cate-n" value="parent" checked >&nbsp1차 카테고리 등록<label class="text-space"></label>
                                            <input type=radio name="cate-n" value="child" >&nbsp2차 카테고리 등록
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>                                        	
	                                        <button type="button" class="btn btn-secondary waves-effect textbox" id="cate-add-button-text" disabled>1차카테고리</button>
	                                        <button type="button" class="btn btn-secondary waves-effect textbox" id="cate-add-button-text2" disabled style="display:none">2차카테고리</button>
	                                        
	                                        <select class="form-control" id="cate-select-add" style="display:none">
	                                        		<option>----</option>
	                                            <c:forEach var="vo" varStatus="status" items="${categoryNameList }">
	                                            	<option value="${vo.no }">${vo.name }</option>
	                                            </c:forEach>                                                                                                      
                                            </select> 
	                                         
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
                                            <input type=radio name="cate-n-del" value="parent" checked>&nbsp1차 카테고리 삭제<label class="text-space"></label>
                                            <input type=radio name="cate-n-del" value="child">&nbsp2차 카테고리 삭제
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <button type="button" class="btn btn-secondary waves-effect textbox " id="cate-del-button-text" disabled>1차카테고리</button>
                                            <button type="button" class="btn btn-secondary waves-effect textbox " id="cate-del-button-text2" style="display:none" disabled>2차카테고리</button>       
									
											<!-- 카테고리 이름 select box -->
                                            <select class="form-control" id="cate-select-del" style="display:inline-block">
	                                            	<option>----</option>
	                                            <c:forEach var="vo" varStatus="status" items="${categoryNameList }">
	                                            	<option value="${vo.no }">${vo.name }</option>
	                                            </c:forEach>                                                                                                      
                                            </select>
                                            
                                            <select class="form-control" id="cate-select-del2" style="display:none">
	                                            	<option>----</option>
	                                            <c:forEach var="vo" varStatus="status" items="${childCategoryNameList }">
	                                            	<option value="${vo.no }">${vo.name }</option>
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
                                            <input type=radio name="cate-n-mod" value="parent" checked>&nbsp1차 카테고리 수정<label class="text-space"></label>
                                            <input type=radio name="cate-n-mod" value="child">&nbsp2차 카테고리 수정
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <button type="button" class="btn btn-secondary waves-effect btn-submit-color textbox " id="cate-mod-button-text" disabled>1차카테고리</button>
                                            <button type="button" class="btn btn-secondary waves-effect btn-submit-color textbox " id="cate-mod-button-text2" style="display:none" disabled>2차카테고리</button> 
                                            
                                            <select class="form-control" id="cate-select-mod" style="display:inline-block">
	                                            	<option>----</option>
	                                            <c:forEach var="vo" varStatus="status" items="${categoryNameList }">
	                                            	<option value="${vo.no }">${vo.name }</option>
	                                            </c:forEach>                                                                                                      
                                            </select>
                                            
                                            <select class="form-control" id="cate-select-mod2" style="display:none">
	                                            	<option>----</option>
	                                            <c:forEach var="vo" varStatus="status" items="${childCategoryNameList }">
	                                            	<option value="${vo.no }">${vo.name }</option>
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