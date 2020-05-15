<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">
       
        <!-- Plugins css -->
        <link href="assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
       
        <link href="assets/libs/dropzone/dropzone.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
        
        <link href="assets/libs/jquery-nice-select/nice-select.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/switchery/switchery.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/multiselect/multi-select.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/select2/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/quill/quill.core.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/quill/quill.bubble.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/quill/quill.snow.css" rel="stylesheet" type="text/css" />

        <!-- third party css -->
        <link href="assets/libs/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/datatables/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/datatables/buttons.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/datatables/select.bootstrap4.css" rel="stylesheet" type="text/css" />
        <!-- third party css end -->

        <!-- App css -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/app.min.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <!-- Navigation Bar-->
    <header id="topnav" style="background-color:#ffffff">
        @@include('../shop-partials/shop-topbar.html')
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
                <script src="assets/js/vendor.min.js"></script>
                

                <script src="assets/libs/jquery-nice-select/jquery.nice-select.min.js"></script>
                <script src="assets/libs/switchery/switchery.min.js"></script>
                <script src="assets/libs/multiselect/jquery.multi-select.js"></script>
                <script src="assets/libs/select2/select2.min.js"></script>
                <script src="assets/libs/jquery-mockjax/jquery.mockjax.min.js"></script>
                <script src="assets/libs/autocomplete/jquery.autocomplete.min.js"></script>
                <script src="assets/libs/bootstrap-select/bootstrap-select.min.js"></script>
                <script src="assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
                <script src="assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>

                <!-- third party js -->
                <script src="assets/libs/datatables/jquery.dataTables.min.js"></script>
                <script src="assets/libs/datatables/dataTables.bootstrap4.js"></script>
                <script src="assets/libs/datatables/dataTables.responsive.min.js"></script>
                <script src="assets/libs/datatables/responsive.bootstrap4.min.js"></script>
                <script src="assets/libs/datatables/dataTables.buttons.min.js"></script>
                <script src="assets/libs/datatables/buttons.bootstrap4.min.js"></script>
                <script src="assets/libs/datatables/buttons.html5.min.js"></script>
                <script src="assets/libs/datatables/buttons.flash.min.js"></script>
                <script src="assets/libs/datatables/buttons.print.min.js"></script>
                <script src="assets/libs/datatables/dataTables.keyTable.min.js"></script>
                <script src="assets/libs/datatables/dataTables.select.min.js"></script>
                <script src="assets/libs/pdfmake/pdfmake.min.js"></script>
                <script src="assets/libs/pdfmake/vfs_fonts.js"></script>
                <!-- third party js ends -->
        
                <!-- Plugins js -->
                <script src="assets/libs/katex/katex.min.js"></script>
                <script src="assets/libs/quill/quill.min.js"></script>
                <script src="assets/libs/dropzone/dropzone.min.js"></script>
                <script src="assets/libs/dropify/dropify.min.js"></script>

                <!-- Datatables init -->
                <script src="assets/js/pages/datatables.init.js"></script>
        
                <!-- Init js-->
                <script src="assets/js/pages/form-advanced.init.js"></script>
                <script src="assets/js/pages/form-quilljs.init.js"></script>
                <script src="assets/js/pages/form-fileuploads.init.js"></script>

                <!-- App js-->
                <script src="assets/js/app.min.js"></script>

    

                @@include('../shop-partials/shop-footer.html')



    </body>
</html>