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
            <div class="order-complete-form">
                <div class="order-title">
                    <span> Order / Payment </span>
                    주문/결제
                </div>
                <div class="recipient-info">
                    <span style="Font-size:24px; font-weight:Bold; color:#323A46;">주문 완료</span> 
                </div>

                <div class="order-complete-box">
                    <div class="order-complete-title">
                        고객님의 주문이 완료 되었습니다.
                    </div>
                    </br>
                    <div class="order-complete-num">
                        주문번호 : <a href="#">1234123491041204</a>
                    </div>
                    <div class="order-complete-date">
                        주문날짜 : 2020년 5월 11일 8시 26분
                    </div>

                    
                </div>
                <button type="button" class="btn btn-dark waves-effect waves-light">마이페이지로 가기</button>
            </div>
        
        </div>
    </div>
    
    @@include('../shop-partials/shop-footer.html')

</body>
</html>