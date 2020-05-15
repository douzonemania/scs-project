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
        
        <!-- Sweet Alert-->
        <link href="../assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />
       
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

            <div class="row">
                <div class="col-12">
                    <div class="page-title-box" id="search-form-text"> 
                        <h4 class="page-title">&nbsp</h4>
                    </div>
                </div>
            </div>     


            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body" id="search-form">
                            <h4 class="page-title">관리자 정보 설정</h4>
                            

                                    <!-- 관리자 정보 설정 시작-->
                                    <table class="table-form-exposure">
                                        <colgroup>
                                            <col width="180"><col width="*"><col width="180"><col width="*">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th>관리자아이디</th>
                                            <td colspan="2">
                                                &nbsp;수정불가
                                                <!--<input type="text" id="id" class="form-control product-info" placeholder="수정불가"/> -->
                                            </td>
                                            <th>관리자비밀번호 <span style="color:#FF4040">*</span></th>
                                            <td colspan="2">
                                                <input type="text" id="password" class="form-control product-info" placeholder="수정가능" required/>  
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>대표번호</th>
                                            <td colspan="2">
                                                <input type="text" id="number" class="form-control product-info" placeholder="수정가능"/>                                                          
                                            </td>
                                            <th>관리자휴대폰 <span style="color:#FF4040">*</span></th>
                                            <td colspan="2">
                                                <input type="text" id="phone-number" class="form-control product-info" placeholder="수정가능"/>  
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>대표이메일 <span style="color:#FF4040">*</span></th>
                                            <td colspan="4">
                                                <input type="text" id="email" class="form-control product-info" placeholder="수정가능" required/>                                                       
                                            </td>
                                        </tr>                          
                                        </tbody>
                                    </table>
                                    <!-- 관리자 정보 설정 종료--> 
                                <div class="lspace"></div>
                            

                                <!-- 사이트 기본 설정 시작-->
                                <h4 class="page-title">상품 기본 정보</h4>
                                <table class="table-form-category">
                                    <colgroup>
                                        <col width="180"><col width="*">
                                    </colgroup>
                                        <tbody> 
                                            <tr>
                                                <th>회사명 <span style="color:#FF4040">*</span></th>
                                                <td colspan="2">
                                                    <input type="text" id="company" class="form-control product-info" placeholder="수정가능" required/>                                                          
                                                </td>                                
                                                <th>대표자명 <span style="color:#FF4040">*</span></th>
                                                <td colspan="2">
                                                    <input type="text" id="ceo" class="form-control product-info" placeholder="수정가능" required/>  
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>사이트명</th>
                                                <td colspan="2">
                                                    <input type="text" id="site-name" class="form-control product-info" placeholder="수정가능"/>                                                          
                                                </td>
                                                <th>사업자등록번호</th>
                                                <td colspan="2">
                                                    <input type="text" id="registration-number" class="form-control product-info" placeholder="수정가능"/>  
                                                </td>
                                            </tr> 
                                            <tr>
                                                <th>통신판매신고번호</th>
                                                <td colspan="2"> 
                                                    <input type="text" id="order-report-number" class="form-control product-info" placeholder="수정가능"/>  
                                                </td>
                                                <th>주소</th>
                                                <td colspan="4">
                                                    <input type="text" id="address" class="form-control product-info" placeholder="수정가능"/>                                                       
                                                </td>
                                            </tr>
                                            <tr>

                                            </tr>
                                        </tbody>
                                        
                                    </table>
                                    <!-- 사이트 기본 설정 종료-->
                                    <div class="lspace"></div>

                                        <!-- 이미지 관리 시작-->
                                        <h4 class="page-title">이미지 관리</h4>
                                        <table class="table-form-category">
                                            <colgroup>
                                                <col width="180"><col width="*">
                                            </colgroup>
                                            <tbody> 
                                                <tr>
                                                    <th>파비콘</th>
                                                    <td colspan="2">

                                                        <div class="col-sm-2">
                                                            <img src="../assets/images/logo-scs.png" alt="image"
                                                                class="img-fluid avatar-sm rounded mt-2"/>
                                                        </div>
                                                        <div class="box">
                                                            <span class="filetype">
                                                                <button type="button" class="btn btn-secondary waves-effect">찾아보기
                                                                    <span class="file-select"><input type="file" class="input-file" size="3" onchange="uploadChange(this);"></span>
                                                                </button>
                                                            </span>
                                                        </div>

                                                        </td>
                                                        <th>로고</th>
                                                        <td colspan="2">
                                                                <div class="col-sm-2">
                                                                    <img src="../assets/images/logo-scs.png" alt="image"
                                                                            class="img-fluid rounded img-scs-logo"/>
                                                                </div>
                                                                <div class="box">
                                                                    <span class="filetype">
                                                                        <button type=" filetypebutton" class="btn btn-secondary waves-effect btn-no2" >찾아보기
                                                                        <span class="file-select"><input type="file" class="input-file" size="3" onchange="uploadChange(this);"></span>
                                                                        </button>
                                                                    </span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                    </tr>
                                                    
                                            </tbody>
                                                
                                        </table>
                                        <!-- 이미지 관리 종료-->
        

                                        <div class="lspace"></div>
                                        <!-- 배송사 관리 시작-->
                                        <h4 class="page-title">배송 관리</h4>
                                        <table class="table-form-category">
                                            
                                                <tbody> 
                                                    <tr>
                                                        <th>배송사</th>
                                                        <td colspan="2">
                                                            <button type="button" class="btn btn-secondary waves-effect btn-no2" id="sa-custom-position" style="background-color:#CBCBCB; border-color:white">추가/삭제</button>
                                                        </td>
                                                        <th>배송비 정책</th>
                                                        <td colspan="2">
                                                            <input type=radio name="shipping-charge" checked>&nbsp무료배송<label class="text-space"></label>
                                                            <input type=radio name="shipping-charge">&nbsp;
                                                            <input type="text" id="" class="shipping-charge-custom" />원 이상 무료 배송 
                                                        </td>
                                                    </tr>
                                                    
                                                </tbody>
                                                
                                            </table>
                                            <!-- 배송사 관리 종료-->

                                            <!-- 수정 버튼 -->
                                            <div class="form-group mb-3 float-sm-right" style="margin-top: 10px;">
                                                <button class="btn btn-secondary" type="submit" id="sa-params"> 수정 </button>
                                            </div>

                                        </form>
                                        <!-- 제출 form 종료 -->

                        </div>
                    </div>
                </div>
            </div>

        </div> <!-- end container -->            
    </div>
    <!-- end wrapper -->

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->

	<c:import url ='/WEB-INF/views/partials/script.jsp'/>
</body>
</html>