<!DOCTYPE html>
<html lang="UTF-8">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- App favicon -->
<link rel="shortcut icon" href="../assets/images/favicon.ico">

<!-- Plugins css -->
<link href="../assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />

<link href="../assets/libs/dropzone/dropzone.min.css" rel="stylesheet" type="text/css" />
<link href="../assets/libs/dropify/dropify.min.css" rel="stylesheet" type="text/css" />

<link href="../assets/libs/jquery-nice-select/nice-select.css" rel="stylesheet" type="text/css" />
<link href="../assets/libs/switchery/switchery.min.css" rel="stylesheet" type="text/css" />
<link href="../assets/libs/multiselect/multi-select.css" rel="stylesheet" type="text/css" />
<link href="../assets/libs/select2/select2.min.css" rel="stylesheet" type="text/css" />
<link href="../assets/libs/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
<link href="../assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
<link href="../assets/libs/quill/quill.core.css" rel="stylesheet" type="text/css" />
<link href="../assets/libs/quill/quill.bubble.css" rel="stylesheet" type="text/css" />
<link href="../assets/libs/quill/quill.snow.css" rel="stylesheet" type="text/css" />

<!-- third party css -->
<link href="../assets/libs/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
<link href="../assets/libs/datatables/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
<link href="../assets/libs/datatables/buttons.bootstrap4.css" rel="stylesheet" type="text/css" />
<link href="../assets/libs/datatables/select.bootstrap4.css" rel="stylesheet" type="text/css" />
<!-- third party css end -->

<!-- App css -->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" />

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
			<!-- header-->
			<div class="row">
				<div class="col-12">
					<div class="page-title-box">
						<div class="page-title-right">
							<ol class="breadcrumb m-0">
								<li class="breadcrumb-item"><a href="javascript: void(0);">SCS</a></li>
								<li class="breadcrumb-item"><a href="javascript: void(0);">회원관리</a></li>
								<li class="breadcrumb-item active">메일발송</li>
							</ol>
						</div>
						<h4 class="page-title">메일발송</h4>
					</div>
				</div>
			</div>
			<!--header 종료-->

			<!-- mail-info 시작-->
			<div class="col-lg-12"
				style="background-color: #FFFFFF; padding: 40px;">
				<div class="email-info">
					<span style="margin-right: 20px;"> 받는사람 </span> <input type="text"
						class="form-control mail-custom">
				</div>

				<div class="email-info">
					<span style="margin-right: 60px"> 제목 </span> <input type="text"
						class="form-control mail-custom" placeholder="(제목 없음)">
				</div>
				<!-- mail info 종료-->

				<div style="margin-top: 30px;"></div>

				<!-- Editor -->
				<div id="snow-editor" style="height: 300px;"></div>

				<div class="btn-submit-section" style="margin-top: 30px;">
					<button type="button" class="btn btn-secondary waves-effect ">전송</button>
				</div>
			</div>
		</div>
		<!-- end container -->
	</div>
	<!-- end wrapper -->

	<c:import url ='/WEB-INF/views/partials/script.jsp'/>


</body>
</html>