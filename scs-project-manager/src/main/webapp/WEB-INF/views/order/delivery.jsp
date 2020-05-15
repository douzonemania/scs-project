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
        <c:import url ='/WEB-INF/views/partials/horizontal-nav.jsp'/>
    </header>
    	<!-- footer -->
    	<c:import url ='/WEB-INF/views/partials/footer.jsp'/>
    
     <!-- ============================================================== -->
     <!-- Start Page Content here -->
     <!-- ============================================================== -->

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
                                <li class="breadcrumb-item"><a href="javascript: void(0);">주문관리</a></li>
                                <li class="breadcrumb-item active">주문/배송 관리</li>
                            </ol>
                        </div>
                        <h4 class="page-title">주문/배송 관리</h4>
                    </div>
                </div>
            </div>     
            <!-- end page title --> 
            <!-- start 검색 부분 -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="card-box">                        <h4 class="header-title">주문 검색</h4>
                        <p class="sub-header">찾고자 하는 날짜와 카테고리를 고르시오.</p>


                        <div class="search-form">
                            <div class="form-group mb-3 scs-search"> 
                                <label>날짜 검색</label>
                                <input type="text" id="range-datepicker" class="form-control" placeholder="2020-05-01 to 2020-05-07">
                            </div>
                            <div class="form-group mb-3 scs-category">
                                <label for="product-category">1차 카테고리 <span class="text-danger">*</span></label>
                                <select class="form-control select2" id="product-category">
                                        <option value="SH1">주문번호</option>
                                        <option value="SH2">주문자아이디</option>
                                        <option value="SH3">배송상태</option>
                                        <option value="SH4">정산상태</option>
                                </select>
                            </div>
                            <div class="form-group mb-3 scs-category">
                                <label for="product-category">2차 카테고리 <span class="text-danger">*</span></label>
                                <select class="form-control select2" id="product-category">
                                    <option>직접 수정</option>
                                    <optgroup label="Shopping">
                                        <option value="SH1">Shopping 1</option>
                                        <option value="SH2">Shopping 2</option>
                                        <option value="SH3">Shopping 3</option>
                                        <option value="SH4">Shopping 4</option>
                                    </optgroup>
                                    <optgroup label="CRM">
                                        <option value="CRM1">Crm 1</option>
                                        <option value="CRM2">Crm 2</option>
                                        <option value="CRM3">Crm 3</option>
                                        <option value="CRM4">Crm 4</option>
                                    </optgroup>
                                    <optgroup label="eCommerce">
                                        <option value="E1">eCommerce 1</option>
                                        <option value="E2">eCommerce 2</option>
                                        <option value="E3">eCommerce 3</option>
                                        <option value="E4">eCommerce 4</option>
                                    </optgroup>
        
                                </select>
                            </div>
                            <div class="col-sm-6 col-xl-3 scs-submit">
                                <div class="p-3">
                                    <button type= "button" class="btn btn-secondary waves-effect">Search</button>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end card-box-->
                </div> <!-- end col -->
            </div>
            <!-- end 검색 부분 -->
        </div> 
        <!-- end container -->

        <!-- start 주문 결과 리스트 -->
        <div class="row">
            <div class="col-lg-11">
                <div class="card-box">
                    <div class="card-body">
                        <h4 class="header-title">주문 결과</h4>
                        <table style="width:100%;" class="table table-striped mb-0">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>상품정보</th>
                                    <th>주문일</th>
                                    <th>주문번호</th>
                                    <th>주문자명</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                        
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>쫀쫀한 무지티</td>
                                    <td>2020-05-06</td>
                                    <td>20200506-0001</td>
                                    <td>신정은</td>
                                    <!-- form -xeditable - inline-select 변경 -->
                                    <td class="select-inline"><a href="#" id="inline-sex1" class="inline-select" data-type="select" data-pk="1" data-value="" data-title="Select status"></a></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>어버이날 기념 백바지</td>
                                    <td>2020-05-08</td>
                                    <td>20200508-0001</td>
                                    <td>김강산</td>
                                    <td><a href="#" id="inline-sex2" class="inline-select" data-type="select" data-pk="1" data-value="" data-title="Select status"></a></td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>블링블링 비닐바지</td>
                                    <td>2020-05-09</td>
                                    <td>20200509-0001</td>
                                    <td>박진영</td>
                                    <td><a href="#" id="inline-sex3" class="inline-select" data-type="select" data-pk="1" data-value="" data-title="Select status"></a></td>                               
                                </tr>
                                <tr>
                                    <td>Cedric Kelly</td>
                                    <td>Senior Javascript Developer</td>
                                    <td>Edinburgh</td>
                                    <td>22</td>
                                    <td>2012/03/29</td>
                                    <td>$433,060</td>
                                </tr>
                                <tr>
                                    <td>Airi Satou</td>
                                    <td>Accountant</td>
                                    <td>Tokyo</td>
                                    <td>33</td>
                                    <td>2008/11/28</td>
                                    <td>$162,700</td>
                                </tr>
                                <tr>
                                    <td>Brielle Williamson</td>
                                    <td>Integration Specialist</td>
                                    <td>New York</td>
                                    <td>61</td>
                                    <td>2012/12/02</td>
                                    <td>$372,000</td>
                                </tr>
                                <tr>
                                    <td>Herrod Chandler</td>
                                    <td>Sales Assistant</td>
                                    <td>San Francisco</td>
                                    <td>59</td>
                                    <td>2012/08/06</td>
                                    <td>$137,500</td>
                                </tr>
                                <tr>
                                    <td>Rhona Davidson</td>
                                    <td>Integration Specialist</td>
                                    <td>Tokyo</td>
                                    <td>55</td>
                                    <td>2010/10/14</td>
                                    <td>$327,900</td>
                                </tr>
                            </tbody>
                        </table>
                         <!-- start paging -->
                        <nav style="margin-top: 10px;">
                            <ul class="pagination pagination-rounded justify-content-center">
                                <li class="page-item">
                                    <a class="page-link" href="javascript: void(0);" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                                <li class="page-item"><a class="page-link" >1</a></li>
                                <li class="page-item"><a class="page-link" >2</a></li>
                                <li class="page-item active"><a class="page-link" >3</a></li>
                                <li class="page-item"><a class="page-link" >4</a></li>
                                <li class="page-item"><a class="page-link" >5</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript: void(0);" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <!-- end paging -->
                    </div> 
                </div> <!-- end card-box -->
            </div><!-- end col-->
        </div>
        <!-- end 주문 결과 리스트 -->
    </div>
	
	<c:import url ='/WEB-INF/views/partials/script.jsp'/>
  
</body>
</html>