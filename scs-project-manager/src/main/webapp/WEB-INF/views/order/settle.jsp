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
                                <li class="breadcrumb-item active">정산 관리</li>
                            </ol>
                        </div>
                        <h4 class="page-title">정산 관리</h4>
                    </div>
                </div>
            </div>     
            <!-- end page title --> 
            <!-- start 검색 부분 -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="card-box">                        
                        <h4 class="header-title">정산 현황</h4>
                        <p class="sub-header">찾고자 하는 날짜와 택배사를 고르시오.</p>


                        <div class="search-form">
                            <div class="form-group mb-3 scs-search"> 
                                <label>날짜 검색</label>
                                <input type="text" id="range-datepicker" class="form-control" placeholder="2020-05-01 to 2020-05-07">
                            </div>
                            <div class="form-group mb-3 scs-category">
                                <label for="product-category">택배사 <span class="text-danger">*</span></label>
                                <select class="form-control select2" id="product-category">
                                        <option value="SH1">전체</option>
                                        <option value="SH2">CJ대한통운</option>
                                        <option value="SH3">한진택배</option>
                                        <option value="SH4">우체국</option>
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

        <div class="row">
            <div class="col-lg-11">
                <div class="card-box" style="margin-top:0; padding-top:0;">
                    <div class="card-body" style="display: inline-flex; height:110px; margin-top:0">
                        
                        <!-- div hello start-->
                        <div id="hello"  style="display: inline-flex; width: 1200px; margin-left:10%; " >
                        
                            <div class="col-md-6 col-xl-3" >
                            <div class="widget-rounded-circle card-box" style="max-height: 50px;" >
                                <div class="row">
                                    <div class="col-6">
                                        <div class="avatar-lg rounded-circle bg-soft-success border-success border">
                                            <i class="fe-shopping-cart font-22 avatar-title text-success"></i>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="text-right">
                                            <h3 class="text-dark mt-1"><span data-plugin="counterup">127</span>건</h3>
                                            <p class="text-muted mb-1 text-truncate">건수</p>
                                        </div>
                                    </div>
                                </div> <!-- end row-->
                            </div> <!-- end widget-rounded-circle-->
                        </div> <!-- end col-->
                        

                        <div class="col-md-6 col-xl-3" style="margin-left:150px">
                            <div class="widget-rounded-circle card-box" style="max-height: 50px;">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="avatar-lg rounded-circle bg-soft-primary border-primary border">
                                            <i class="fe-dollar-sign font-22 avatar-title text-primary"></i>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="text-right">
                                            <h3 class="text-dark mt-1"><span data-plugin="counterup">58,947</span>원</h3>
                                            <p class="text-muted mb-1 text-truncate">매출</p>
                                        </div>
                                    </div>
                                </div> <!-- end row-->
                            </div> <!-- end widget-rounded-circle-->
                        </div> <!-- end col-->
                        

                        <div class="col-md-6 col-xl-3" style="margin-left:150px">
                            <div class="widget-rounded-circle card-box" style="max-height: 50px;">
                                <div class="row">
            
                                    <div class="col-6">
                                        <div class="avatar-lg rounded-circle bg-soft-info border-info border">
                                            <i class="fe-thumbs-up font-22 avatar-title text-info"></i>
                                        </div>
                                    </div>
            
                                    <div class="col-6">
                                        <div class="text-right">
                                            <h3 class="text-dark mt-1"><span data-plugin="counterup">32,481</span>원</h3>
                                            <p class="text-muted mb-1 text-truncate">순수익</p>
                                        </div>
                                    </div>
            
                                </div> <!-- end row-->
                            </div> <!-- end widget-rounded-circle-->
                        </div> <!-- end col-->
                        </div><!-- end hello-->
                    </div>
                </div>
            </div>
        </div>

        <!-- start row -->
        <div class="row" style="margin-top: -30px;">
            <!-- start 정산 결과 리스트 -->
            <div class="col-lg-11">
                <div class="card-box">
                    <div class="card-body">
                        <h4 class="header-title">정산 결과</h4>

                        <table style="width:100%;" class="table table-striped mb-0">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>입점업체</th>
                                    <th>주문일</th>
                                    <th>구매금액</th>
                                    <th>판매량</th>
                                    <th>마진</th>
                                </tr>
                            </thead>
                        
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>CJ대한통운</td>
                                    <td>2020-05-06</td>
                                    <td>10000</td>
                                    <td>1</td>
                                    <td>9,700</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>한진택배</td>
                                    <td>2020-05-06</td>
                                    <td>21000</td>
                                    <td>1</td>
                                    <td>20,480</td>

                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>우체국</td>
                                    <td>2020-05-06</td>
                                    <td>15000</td>
                                    <td>1</td>
                                    <td>14,680</td>
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

                    </div> <!-- end card body-->
                </div> <!-- end card -->

            </div>
            <!-- end 정산 결과 리스트 -->
        </div>
        <!-- end row-->
    </div>
    <!-- end wrapper -->
	<c:import url ='/WEB-INF/views/partials/script.jsp'/>
	
</body>
</html>