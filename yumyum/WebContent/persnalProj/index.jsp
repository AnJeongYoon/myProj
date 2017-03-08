<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>안정윤개인과제-JY</title>

<link href="css/animate.css" rel="stylesheet">
<link href="css/nomalize.css" rel="stylesheet">
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/landing-page.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
</head>
<body>

	<!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
        <%@ include file="common/nav/nav.jsp" %>
    </nav>
     
    <!-- Header -->
    <div class="intro-header">
    <!-- 캐러셀 부분 시작 -->
    <div id="carousel-generic" class="carousel slide">
      <!-- Indicators -->
       <ol class="carousel-indicators">
         <li data-target="#carousel-generic" data-slide-to="0" class="active"></li>
         <li data-target="#carousel-generic" data-slide-to="1"></li>
         <li data-target="#carousel-generic" data-slide-to="2"></li>
         <li data-target="#carousel-generic" data-slide-to="3"></li>       
       </ol>
     <!-- Carousel items -->
       <div class="carousel-inner">
          <div class="item active">
             <img src="img/food01.jpg" alt="First slide">
               <div class="carousel-caption"> 
					<h1>맛있는 이태리레스토랑, 얌얌입니다</h1>
                    <h3>라구가지 파스타</h3>
                    <hr class="intro-divider">
               </div>
          </div>
          <div class="item">
             <img src="img/food02.jpg" alt="Second slide">  
               <div class="carousel-caption"> 
					<h1>맛있는 이태리레스토랑, 얌얌입니다</h1>
                    <h3>연어 아보카도 샐러드</h3>
                    <hr class="intro-divider">
               </div>
          </div>
          <div class="item">
             <img src="img/food03.jpg" alt="Third slide">
               <div class="carousel-caption"> 
					<h1>맛있는 이태리레스토랑, 얌얌입니다</h1>
                    <h3>토마토갈릭 피자</h3>
                    <hr class="intro-divider">
               </div>                 
          </div>
          <div class="item">
             <img src="img/food04.jpg" alt="Four slide">
               <div class="carousel-caption"> 
					<h1>맛있는 이태리레스토랑, 얌얌입니다</h1>
                    <h3>스톤 스테이크</h3>
                    <hr class="intro-divider">
               </div>                 
          </div>                            
                            
       </div>
      <!-- Controls -->
        <a class="left carousel-control" href="#carousel-generic" data-slide="prev">
          <img src="img/left.png" class="control">
        </a>
        <a class="right carousel-control" href="#carousel-generic" data-slide="next">
          <img src="img/right.png" class="control">
        </a>
      </div>
    <!--// 캐러셀 부분 끝  --> 
        <div class="container">
        </div>
        <!-- /.container -->

    </div>
    <!-- /.intro-header -->

    <!-- Page Content -->
	    
    <a name="about"></a>
    <div class="content-section-a">
    	<div class="container about">
    		<%@ include file="common/about/main_about.jsp" %>
    	</div>
    </div>

	<a name="menu"></a>
    <div class="content-section-b">

        <div class="container menuMain">
        	<%@ include file="common/menu/main_menu.jsp" %>
        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-b -->

	<a  name="reserve"></a>
    <div class="content-section-a">

        <div class="container">
            <%@ include file="common/schedule/main_schedule.jsp" %>
        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-b -->

    </div>
    <!-- /.banner -->
    
    <a  name="notice"></a>
   <div class="content-section-b">

        <div class="container">
        	<%@ include file="common/board/main_board.jsp" %>
        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-a -->
    
    
    <a  name="letter"></a>
    <div class="banner">

        <div class="container">

            <div class="row">
                <div class="col-lg-6">
                    <h2>Connect to Start Bootstrap:</h2>
                </div>
                <div class="col-lg-6">
                    <ul class="list-inline banner-social-buttons">
                        <li>
                            <a href="https://twitter.com/SBootstrap" class="btn btn-default btn-lg">
                            <i class="fa fa-twitter fa-fw"></i> 
                            <span class="network-name">Twitter</span>
                            </a>
                        </li>
                        <li>
                            <a href="https://github.com/IronSummitMedia/startbootstrap" class="btn btn-default btn-lg">
                            <i class="fa fa-github fa-fw"></i> 
                            <span class="network-name">Github</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="btn btn-default btn-lg">
                            <i class="fa fa-linkedin fa-fw"></i> 
                            <span class="network-name">Linkedin</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.banner -->

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="list-inline">
                        <li>
                            <a href="#">Home</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#about">About</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#services">Services</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#contact">Contact</a>
                        </li>
                    </ul>
                    <p class="copyright text-muted small">Copyright &copy; Your Company 2014. All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script>
          $('.carousel').carousel()
    </script>
    
    
    
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script>
          $('.carousel').carousel()
    </script>
    
    

</body>

</html>
