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
<script>


var stockAddEjs = new EJS({
	url:"${pageContext.request.contextPath }/assets/js/ejs/stock-add.ejs"
});
var optionsArray = new Array();
var options = new Object();
var imageSrc ="";
var index = 1;
var mainImage = "";
var subImage = "";
$(function() {
	/* 옵션 추가 등록 팝업 */
		$('#option-add').click(function(){		
			window.open('optionAdd','옵션등록','width=490,height=500,location=no,status=no,scrollbars=auto');
		});

});

$(document).ready(function(){
	$("#mainImagePreview").attr("alt", "zz");
	//$('#excelForm [name="excelFile"]').val()
	//$("#excelForm").children('.previewSection').attr("alt", "zz");
	$("#excelForm img:nth-child(n)").attr("alt", "zzzzzz");
	
	$(".imageDelete").click(function(){
		alert($('.imageDelete').index(this));
	})
});

function preview(input, target) {
	if(input.files && input.files[0]){
	  	var fileName= input.files[0].name;
	  	var ext=fileName.substr(fileName.length-3, fileName.length);
	  	var isCheck=false; 
	  		if(ext.toLowerCase()=='jpg' || ext.toLowerCase()=='gif' || ext.toLowerCase()=='png'){
	  			isCheck=true;               
  			}
  	if(isCheck==false){
  		alert("이미지 파일 아님");
  		jQuery(input).val("");
  		return;
  	}
  	var reader = new FileReader();
  	reader.readAsDataURL(input.files[0]);          
  	reader.onload = function(e) {
  	  jQuery(target).attr('src', e.target.result);
  	}
	}
}
$(document).on("click", "#btn-reg",function(){	// 등록 버튼 클릭 함수
	var no = null;
	var code = document.getElementById("item-code").value;
	var name = document.getElementById("item-name").value;
	var supPrice = document.getElementById("item-sup-price").value;
	var nowPrice = document.getElementById("item-now-price").value;
	var sale = document.getElementById("item-sale").value;
	
	var editor = JSON.stringify(quill.getContents());
	
	if($('input[name="pro-expo"]:checked').val()!="visible")
		var visible = false;
	if($("input:checkbox[id='item-best']").is(":checked") == true)	
		var bestItem=true;
	if($("input:checkbox[id='item-new']").is(":checked") == true)
		var newItem=true;
	
	var description = $("#item-des").val();
	var regDate = null;
	//var categoryName1 = $("#first-category option:selected").text();
	var categoryName2 = $("#seconds-category option:selected").val();
	console.log(categoryName2 + "????");
	var shipCompany = $("#ship-company-name option:selected").text();
	
	if($('input[name="shipping-charge"]:checked').val()=="free")
		var shippingCharge=0;
	else
		var shippingCharge=3000; // 설정 배송비 나중에 수정할것

	var vo={};
	vo.no = no;
	vo.code = code;
	vo.name = name;
	vo.supPrice = supPrice;
	vo.nowPrice = nowPrice;
	vo.sale = sale;
	
	vo.visible = visible;
	vo.bestItem = bestItem;
	vo.newItem = newItem;
	vo.editor = editor;
	vo.description = description;
	vo.regDate = regDate;
	vo.categoryNo = categoryName2;
	vo.shipCompany = shipCompany;
	vo.shippingCharge = shippingCharge;
	vo.editor = editor;
	
	var i = 0;
	var numberOfOption = $('.sizeOptionSelect').length;
	
	var colorArr = [];
	var sizeArr = [];
	var stockArr=[];
	
	  for(i=0; i<numberOfOption; i++){
		var color = $("#colorOption-" + i + " option:selected").val();
		var size = $("#sizeOption-" + i + " option:selected").val();
		var stock = $("#input-stock-" + i).val();
		
		colorArr.push(color);
		sizeArr.push(size);
		stockArr.push(stock);
	} 
	
	var objParams = {
			'colorArr' : colorArr,
			'sizeArr' : sizeArr,
			'stockArr' : stockArr
	}
	
	var form = $('#excelForm')[0];

	console.log(form);
	
	var formData= new FormData(form);
	console.log(formData);
	  $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: '${pageContext.request.contextPath }/${authUser.id}/api/product/image',
	        data: formData,
	        processData: false,
	        contentType: false,
	        async:false,
	        cache: false,
	        success: function (data) {
	            console.log("SUCCESS : ", data);
	            imageSrc = data.data;
	            imageSrc = JSON.stringify(imageSrc);
	            imageSrc = imageSrc.replace(/\"/g,'');
	            		            
	            var imageSrcSplit = imageSrc.split('?');
	            for ( var i in imageSrcSplit ) {
	               	console.log(imageSrcSplit[i]);
	            }
	            
	            mainImage = imageSrcSplit[0];
	            for (var i=1; i<6; i++){
	            	if(imageSrcSplit[i]!=""){
	            		if(i != 5)
	            			subImage = subImage+imageSrcSplit[i]+"?"
	            	}
	            }
	            console.log(mainImage+subImage+":: in ajaxcode");
	            alert(subImage);
	        	
	        },
	        error: function (e) {
	            console.log("ERROR : ", e);
	        }
	    }); 	
	console.log(mainImage+subImage+"::");
	vo.mainImage = mainImage;
	vo.subImage = subImage;
	
	$.ajax({
		url: '${pageContext.request.contextPath }/${authUser.id}/api/product/regItem',
		contentType: 'application/json',
		data: JSON.stringify(vo),
		type: "POST",
		dataType: 'json',
		success : function(response){
			$.ajax({
				url: '${pageContext.request.contextPath }/${authUser.id}/api/product/stockInsert/' + code,
				contentType :'application/x-www-form-urlencoded; charset=UTF-8',
				data: objParams,
				type: "POST",
				dataType: 'json',		
				success : function(response){
					location.reload();
				},
				error: function(xhr, status, e){
					console.error(status + " : " + e);
				}
			});
		},
		error: function(xhr, status, e){
			console.error(status + " : " + e);
			alert("상품 정보를 모두 입력하세요.")
		}
	});
});




$(function() {
	/* 1차 카테고리 별 2차 카테고리 이름 리스트 */
		$('#first-category').change(function(){		
			//$("#first-category option:eq(0)").remove();
			var no = $("#first-category option:selected").val();
			var name = $("#first-category option:selected").text();
			
			var vo={};
			vo.no = no;
			vo.name = name;			
			
			$.ajax({
				url: '${pageContext.request.contextPath }/${authUser.id}/api/product/category-reg/childCategoryList',
				contentType: 'application/json',
				data: JSON.stringify(vo),
				type: "POST",
				dataType: 'json',
				success :function(response){
					$('#seconds-category').append("<option value='----'>----</option>");
					for( var key in response.data){
						var data = response.data[key];	
						if(data.name!=null)							
							$('#seconds-category').append("<option value='" + data.no + "'>" + data.name + "</option>");
					}					
				}, 			
				error: function(xhr, status, e){
					console.error(status + " : " + e);
				}
			});			
			
			$("select#seconds-category option").remove();
			
		});
});	
$(function() {
		
	/* 선택된 카테고리 텍스트 뿌리기 */
		$('#seconds-category').change(function(){
			if($('#seconds-category option:selected').text()=="----")
				return;
			
			var category1Name = $("#first-category option:selected").text();
			document.getElementById("selected-category-text").value = category1Name;
			
			var category2Name = $("#seconds-category option:selected").text();
			document.getElementById("selected-category-text").value += "  >  " + category2Name;
		});
});

$(function() {
	
	$('#stock-add').click(function(){		
		var vo={};
		var colorOption = "";
		var sizeOption= "";
		$.ajax({
			url: '${pageContext.request.contextPath }/${authUser.id}/api/product/stock/add',
			async: true,
			type: 'post',
			dataType: 'json',
			contentType: 'application/json',
			data: JSON.stringify(vo),
			success: function(response){
				console.log(response.data + +":" + response)
				for( var key in response.data){
					var data = response.data[key];
					//$('.form-control.colorOptionSelect').append("<option value='" + data.no + "'>" + data.name + "</option>");
					//$('.form-control.sizeOptionSelect').append("<option value='" + data.no + "'>" + data.name + "</option>");
					console.log(data.no + ":" + data.name + ":" + data.type);
					if(data.type=="color"){
						colorOption = colorOption + ("<option value='" + data.no + "'>" + data.name + "</option>")
					}else if (data.type=="size"){						
						sizeOption = sizeOption + ("<option value='" + data.no + "'>" + data.name + "</option>")
					}
				}
				//$('#option-zone').append(html);
				$('#option-zone').append("<div id='optionTest' style='width:1000px; display:inline-block' class='option-zone'>사이즈 <select class='form-control sizeOptionSelect' id='sizeOption-"+ index + "' name = 'optionName'><option>----</option>"+sizeOption+"</select><label class='text-space'></label> 색상 <select class='form-control colorOptionSelect' id='colorOption-"+ index +"' name='colorName''><option>----</option>"+colorOption+"</select><label class='text-space'></label>  재고량 <input type='text' class='form-control product-info' id='input-stock-"+index+"' name='stockName'value='' /></div>");
				//$('#option-zone').append("<div style='width:1000px; display:inline-block' class='option-zone' id='option-zone'>1차 옵션<select class='form-control sizeOptionSelect' id='sizeOption'><option>----</option><c:forEach var='vo' varStatus='status' items='${sizeOptionList }'>option value='${vo.no }'>${vo.name }</option></c:forEach></select><label class='text-space'></label>	<button type='button' id='stock-add' class='btn btn-secondary waves-effect'>추가</button>	</div>");
				index++;
			},
			error: function(xhr, status, e){
				console.error(status + " : " + e);
			}
		});		
	});
});


$(function() {
	/* 판매가 계산 */
		$('#item-sup-price, #item-now-price, #item-sale').change(function(){		
			if( $('#item-now-price').val() != ""){				
				var nowPrice = $('#item-now-price').val();
				var sale = $('#item-sale').val();		
				
				nowPrice = Number(nowPrice);
				sale = Number(sale);
				
				var salePrice = nowPrice * ( 1 - (sale/100));
				//salePrice = Math.floor((salePrice/10)) * 10;	// 원단위 계산
				$('#item-sale-price').val(salePrice);
			}
		});
	
	 $('#testbtn').click(function(){
		 
	});

});
	
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
								<li class="breadcrumb-item"><a href="javascript: void(0);">상품</a></li>
								<li class="breadcrumb-item active">상품등록</li>
							</ol>
						</div>
						<h4 class="page-title">상품등록</h4>
					</div>
				</div>
			</div>
			<!-- end page title -->

			
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body" id="search-form">
							<h4 class="page-title">상품노출 설정</h4>


							<!-- 상품노출 테이블 시작-->
							<table class="table-form-exposure">
								<colgroup>
									<col width="180">
									<col width="*">
									<col width="180">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
								
									<c:set var="isVisible" value="${vo.visible }" />
									<c:choose>
	 
		  								  <c:when test="${isVisible eq false}">
										        <th>상품 노출</th>
												<td colspan="2">
													<input type=radio name="pro-expo" value="visible">&nbsp노출<label class="text-space"></label> 
													<input type=radio name="pro-expo" value="unvisible" checked>&nbsp숨김
												</td>
										  </c:when>								 
										  
										  <c:otherwise>					
											<tr>
												<th>상품 노출</th>
												<td colspan="2">
													<input type=radio name="pro-expo" value="visible" checked>&nbsp노출<label class="text-space"></label> 
													<input type=radio name="pro-expo" value="unvisible">&nbsp숨김
												</td>
										 </c:otherwise>
									 </c:choose>
									 
									 <c:set var="isBest" value="${vo.bestItem }" />
									 <c:set var="isNew" value="${vo.newItem }" />
											<th>상품 아이콘</th>
											<td colspan="2">										
											
											<c:choose>
												<c:when test="${isBest eq true}">
													<input type='checkbox' id="item-best" value="best" checked/>
												</c:when>
												<c:otherwise>
													<input type='checkbox' id="item-best" value="best"/>											
												</c:otherwise>										
											</c:choose>
											
												<span class="badge badge-danger">BEST</span><label class="text-space"></label> 
											
											<c:choose>
												<c:when test="${isNew eq true }">
													<input type='checkbox' id="item-new" value="new" checked/>
												</c:when>
												<c:otherwise>
													<input type='checkbox' id="item-new" value="new"/>
												</c:otherwise>	
											</c:choose>
										
											<span class="badge badge-warning checkbox-space">NEW</span>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- 상품노출 테이블 종료-->
							<div class="lspace"></div>
							<h4 class="page-title">상품카테고리 설정</h4>

							<!-- 상품카테고리 테이블 시작-->
							<table class="table-form-category">
								<colgroup>
									<col width="180">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>상품 카테고리</th>
										<td colspan="2">　1차분류 
											<select class="form-control" id="first-category">
	                                       		<option>----</option>
	                                        <c:forEach var="vo" varStatus="status" items="${categoryNameList }">
	                                           	<option value="${vo.no }">${vo.name }</option>
	                                        </c:forEach>                                                                                                      
                                            </select> 
										
										<label class="text-space">
										</label> 2차분류 
											<select class="form-control" id="seconds-category">
												<option>----</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>선택된 카테고리</th>
										<td colspan="2"><input type="text" class="form-control" id="selected-category-text"
											readonly></td>
									</tr>
								</tbody>

							</table>
							<!-- 상품카테고리 테이블 종료-->
							<div class="lspace"></div>
							<h4 class="page-title">상품 기본 정보</h4>

							<!-- 상품기본정보 테이블 시작-->
							<table class="table-form-category">
								<colgroup>
									<col width="180">
									<col width="*">
								</colgroup>
								
								<tbody>
									<tr>
										<th>상품코드 <span style="color: #FF4040">*</span></th>
										<td colspan="4">
											<input type="text" class="form-control product-info" id="item-code" value="${vo.code }" />
										</td>
									</tr>
									<tr>
										<th>상품명 <span style="color: #FF4040">*</span></th>
										<td colspan="4">
											<input type="text" class="form-control product-info" id="item-name" value="${vo.name }" />
										</td>
									</tr>
									<tr>
										<th>부가설명</th>
										<td colspan="4">
											<textarea class="form-control txtb" id="item-des" rows="3">${vo.description }</textarea>
										</td>
									</tr>

									<tr>
										<th>판매정보 <span style="color: #FF4040">*</span></th>
										<td colspan="4">
											</label> 공급가 <span style="color: #FF4040">*</span>
											<input type="text" id="item-sup-price" class="form-control product-info" value="${vo.supPrice }"><label class="text-space"></label> 
											&nbsp정상가 <input type="text" id="item-now-price" class="form-control product-info" value="${vo.nowPrice }"><label class="text-space"></label> 
											&nbsp 할인율 <input type="text" id="item-sale" class="form-control product-info" value="${vo.sale }">
											
											<label class="text-space"></label><label class="text-space"></label><label class="text-space"></label>
											<label class="text-space"></label>
											
											판매가 <input type="text" id="item-sale-price" class="form-control product-info" readonly value="${salePrice }" >
											<!-- &nbsp 재고량<span style="color: #FF4040">*</span><input type="text" id="item-stock" class="form-control product-info"> -->
										</td>
									</tr>
									<tr>
										<th>배송사 <span style="color: #FF4040">*</span></th>
										<td colspan="2">
											<select class="form-control" style="min-width: 200px" id="ship-company-name">
												<option>----</option>
												<c:forEach var="vo" varStatus="status" items="${shipCompanyList }">
	                                           	<option value="${vo.no }">${vo.name }</option>
	                                        </c:forEach>
											</select>
										</td>
										
										<th>배송비 <span style="color: #FF4040">*</span></th>
										<td colspan="2">
											<input type=radio name="shipping-charge" value="free" checked>&nbsp무료배송<label class="text-space"></label>
											<input type=radio name="shipping-charge" value="basic-charge">&nbsp설정 배송비
										</td>
									</tr>
									<!-- image 등록 -->
									<tr class="img-reg">
										<th>이미지 등록</th>
										<td colspan="4">
												<form method="POST" enctype="multipart/form-data" id="excelForm">
												    <div class="main-section">
												  		<img id="mainImagePreview" src="" alt="" class="previewSection" style="width:250px; height:80px;"/>
												    	<input type="file" name="excelFile" onchange="preview(this, $('#mainImagePreview'));"/>
												    	<input type="button" class="imageDelete" value="삭제"/>
												    </div>
												    <div class="sub-section">
												   	 <img id="subImagePreview1" src="" alt="" class="previewSection" style="width:250px; height:80px;"/>
												    	<input type="file" name="excelFile1" onchange="preview(this, $('#subImagePreview1'));"/>
												    	<input type="button" class="imageDelete" value="삭제"/>
												    </div>
												    <div class="sub-section">
												    	<img id="subImagePreview2" src="" alt="" class="previewSection" style="width:250px; height:80px;"/>
												    	<input type="file" name="excelFile2" onchange="preview(this, $('#subImagePreview2'));"/>
												    	<input type="button" class="imageDelete" value="삭제"/>
												    </div>
												    <div class="sub-section">
												    	<img id="subImagePreview3" src="" alt="" class="previewSection" style="width:250px; height:80px;"/>
												    	<input type="file" name="excelFile3" onchange="preview(this, $('#subImagePreview3'));"/>
												    	<input type="button" class="imageDelete" value="삭제"/>
													</div>
													<div class="sub-section">
												    	<img id="subImagePreview4" src="" alt="" class="previewSection" style="width:250px; height:80px;"/>
												    	<input type="file" name="excelFile4" onchange="preview(this, $('#subImagePreview4'));"/>
												    	<input type="button" class="imageDelete" value="삭제"/>
													</div>
													<div class="sub-section">
												    	<img id="subImagePreview5" src="" alt="" class="previewSection" style="width:250px; height:80px;"/>
												    	<input type="file" name="excelFile5" onchange="preview(this, $('#subImagePreview5'));"/>
												    	<input type="button" class="imageDelete" value="삭제"/>
													</div>
												</form>
										</td>
									</tr>
									<!-- image 등록 종료-->

									<tr class="pro-op">
										<th>
											상품옵션<br>
											<button type="button" id="option-add" class="btn btn-secondary waves-effect" style="background-color:#6C757D">옵션추가</button>
										</th>
										<td colspan="4">
<!-- 											<div>
												<input type=radio name="pro-opt" checked>&nbsp옵션사용안함	<label class="text-space"></label> 
												<input type=radio name="pro-opt">&nbsp1차옵션사용 <label class="text-space"></label>
												<input type=radio name="pro-opt">&nbsp2차옵션사용
											</div>
											<div>옵션 영역</div> -->
											<div id="option-zone">
											<div style="width:1000px; margin-bottom:10px; display:inline-block" class="option-zone">
												사이즈
												<select class="form-control sizeOptionSelect" id="sizeOption-0">												
		                                       		<option>----</option>
		                                        <c:forEach var="vo" varStatus="status" items="${sizeOptionList }">
		                                           	<option value="${vo.no }">${vo.name }</option>
		                                        </c:forEach>
												</select><label class="text-space"></label>
												색상
												<select class="form-control colorOptionSelect" id="colorOption-0">
		                                       		<option>----</option>
		                                        <c:forEach var="vo" varStatus="status" items="${colorOptionList }">
		                                           	<option value="${vo.no }">${vo.name }</option>
		                                        </c:forEach>											
												</select><label class="text-space"></label>
												
												재고량 <input type="text" class="form-control product-info" id="input-stock-0" value="" />
												<button type="button" id="stock-add" class="btn btn-secondary waves-effect">추가</button>	
												<button type="button" id="testtest" class="btn btn-secondary waves-effect">실험쥐</button>												
												
											</div>
											</div>
												
										</td>
									</tr>
								</tbody>

							</table>
							<!-- 상품기본정보 테이블 종료-->
							<label class="lspace"></label>

							<!-- 상품 설명 시작-->
							<h4 class="page-title">상품 설명</h4>

							<div id="snow-editor" style="height: 300px;" name="item-editor"></div>
							<!--상품 설명 종료-->

							<br>

							<!-- 등록,목록 버튼-->
							<div class="btn-submit-section">
								<button type="button" class="btn btn-secondary waves-effect" id="btn-reg">등록</button>
								<button type="button" class="btn btn-secondary waves-effect" id="btn-list">목록</button>
							</div>

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