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
        <link rel="shortcut icon" href="../assetsimages/favicon.ico">
       
        <!-- Plugins css -->
        <link href="../assetslibs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
       
        <link href="../assetslibs/dropzone/dropzone.min.css" rel="stylesheet" type="text/css" />
        <link href="../assetslibs/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
        
        <link href="../assetslibs/jquery-nice-select/nice-select.css" rel="stylesheet" type="text/css" />
        <link href="../assetslibs/switchery/switchery.min.css" rel="stylesheet" type="text/css" />
        <link href="../assetslibs/multiselect/multi-select.css" rel="stylesheet" type="text/css" />
        <link href="../assetslibs/select2/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="../assetslibs/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
        <link href="../assetslibs/bootstrap-touchspin/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
        <link href="../assetslibs/quill/quill.core.css" rel="stylesheet" type="text/css" />
        <link href="../assetslibs/quill/quill.bubble.css" rel="stylesheet" type="text/css" />
        <link href="../assetslibs/quill/quill.snow.css" rel="stylesheet" type="text/css" />

        <!-- third party css -->
        <link href="../assetslibs/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="../assetslibs/datatables/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="../assetslibs/datatables/buttons.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="../assetslibs/datatables/select.bootstrap4.css" rel="stylesheet" type="text/css" />
        <!-- third party css end -->

        <!-- App css -->
        <link href="../assetscss/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../assetscss/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="../assetscss/app.min.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <!-- Navigation Bar-->
    <header id="topnav" style="background-color:#ffffff">
        <c:import url ='/WEB-INF/views/partials/topbar.jsp'/>
    </header>


        <div class="wrapper">
            <div class="container-fluid">                
                
                <div class="recipient-info">
                    <span>QNA</span> 문의 게시판
                </div>
                <!-- mail-info 시작-->
                <div class="margin-box-30">
                <div class="col-lg-12">
                    <div class="card-box">
                        <div class="qna-board-title">
                            <span >문의 유형</span>
        
                            <div class="btn-group mb-2">
                                <button class="btn btn-light btn-sm dropdown-toggle qna-custom-dropdown-button" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    문의유형 선택 <i class="mdi mdi-chevron-down"></i>
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">주문</a>
                                    <a class="dropdown-item" href="#">배송</a>
                                    <a class="dropdown-item" href="#">교환/환불/취소</a>
                                    <a class="dropdown-item" href="#">기타</a>
                                </div>
                            </div>
                        </div>
        
                    <div class="qna-board-title">
                        <span >제&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp목</span>
                        <input type="text" class="form-control mail-custom">
    
                    </div>
    
                    <div style="margin-top: 30px;"></div>
    
                    <!-- Editor -->
                    <div id="snow-editor" style="height: 300px; "></div>
    
                    <div class="btn-submit-section qna-custom-btn-group">
                        <button type="button" class="btn btn-secondary waves-effect qna-custom-btn">문의하기</button>
                        <button type="button" class="btn btn-secondary waves-effect qna-custom-cancel-btn">취소</button>
                    </div>
                </div>            
               </div>
        </div> <!-- end container -->            
        </div>
        <!-- end wrapper -->


 

                <!-- Vendor js -->
                <script src="../assetsjs/vendor.min.js"></script>
                

                <script src="../assetslibs/jquery-nice-select/jquery.nice-select.min.js"></script>
                <script src="../assetslibs/switchery/switchery.min.js"></script>
                <script src="../assetslibs/multiselect/jquery.multi-select.js"></script>
                <script src="../assetslibs/select2/select2.min.js"></script>
                <script src="../assetslibs/jquery-mockjax/jquery.mockjax.min.js"></script>
                <script src="../assetslibs/autocomplete/jquery.autocomplete.min.js"></script>
                <script src="../assetslibs/bootstrap-select/bootstrap-select.min.js"></script>
                <script src="../assetslibs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
                <script src="../assetslibs/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>

                <!-- third party js -->
                <script src="../assetslibs/datatables/jquery.dataTables.min.js"></script>
                <script src="../assetslibs/datatables/dataTables.bootstrap4.js"></script>
                <script src="../assetslibs/datatables/dataTables.responsive.min.js"></script>
                <script src="../assetslibs/datatables/responsive.bootstrap4.min.js"></script>
                <script src="../assetslibs/datatables/dataTables.buttons.min.js"></script>
                <script src="../assetslibs/datatables/buttons.bootstrap4.min.js"></script>
                <script src="../assetslibs/datatables/buttons.html5.min.js"></script>
                <script src="../assetslibs/datatables/buttons.flash.min.js"></script>
                <script src="../assetslibs/datatables/buttons.print.min.js"></script>
                <script src="../assetslibs/datatables/dataTables.keyTable.min.js"></script>
                <script src="../assetslibs/datatables/dataTables.select.min.js"></script>
                <script src="../assetslibs/pdfmake/pdfmake.min.js"></script>
                <script src="../assetslibs/pdfmake/vfs_fonts.js"></script>
                <!-- third party js ends -->
        
                <!-- Plugins js -->
                <script src="../assetslibs/katex/katex.min.js"></script>
                <script src="../assetslibs/quill/quill.min.js"></script>
                <script src="../assetslibs/dropzone/dropzone.min.js"></script>
                <script src="../assetslibs/dropify/dropify.min.js"></script>

                <!-- Datatables init -->
                <script src="../assetsjs/pages/datatables.init.js"></script>
        
                <!-- Init js-->
                <script src="../assetsjs/pages/form-advanced.init.js"></script>
                <script src="../assetsjs/pages/form-quilljs.init.js"></script>
                <script src="../assetsjs/pages/form-fileuploads.init.js"></script>

                <!-- App js-->
                <script src="../assetsjs/app.min.js"></script>

                <!-- footer -->
		    	<c:import url ='/WEB-INF/views/partials/footer.jsp'/>



    </body>
</html>