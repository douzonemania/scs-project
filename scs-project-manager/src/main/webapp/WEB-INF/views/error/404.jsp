<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ERROR</title>

<!-- App css -->
<link href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/assets/css/app.min.css" rel="stylesheet" type="text/css" />

<style>
body {
	font-family: dotum, "돋움";
	font-weight: bold; 
}
</style>

</head>
<body>
	<div class="col-lg-6 card-body" style="margin: 0 auto; margin-top: 10%;">
		<div style="margin-top: 10%; margin-left: 10%;">
			<img src="https://pngformat.net/wp-content/uploads/2019/08/404-png-2.png" alt="404 png 2" style="width: 340px;">
			<a style="font-size: 2.8rem;color: #253445; text-shadow:3px 3px 3px rgba(0,0,0,0.5);">PAGE NOT FOUND =(</a>
		</div>
		
		<div class="text-center" style="margin-top: 1%; margin-right: 40%; width: 100%;">
			<p>찾을 수 없는 페이지입니다.</p>
			<p>존재하지 않는 주소이거나,</p>
			<p style="margin-left: 10%;">요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.</p>
		</div>
	</div>
</body>
</html>