<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>안정윤개인과제</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

<!-- Theme CSS -->
<link href="css/agency.min.css" rel="stylesheet">
</head>

<body id="page-top" class="index">
    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
        	<%@ include file="common/mainNav.jsp" %>
        <!-- /.container-fluid -->
    </nav>

    <!-- HEADER -->
    <header>
    	<%@ include file="common/header.jsp" %>
    </header>

    <!-- ABOUT -->
    <section id="about">
    	<%@ include file="common/about/about_me.jsp" %>
    </section>
	
    <!-- 포트폴리오 -->
    <section id="portfolio" class="bg-light-gray">
    	<%@ include file="common/portfolio/portfolio.jsp" %>
    </section>

    <!-- 히스토리  ..경력사항?-->
    <section id="history">
    	<%@ include file="common/history.jsp" %>
    </section>

    <!-- 게시판 -->
    <section id="board" class="bg-light-gray">
    	<%@ include file="common/board/board.jsp" %>
    </section>

    <!-- Contact Section -->
    <section id="contact">
    	<%@ include file="common/contact.jsp" %>
    </section>
    
    <!-- 포트폴리오 눌렀을때 화면 -->
    <%@ include file="common/portfolio/portfolio_fade.jsp" %>
    <!-- 포트폴리오 눌렀을때 화면 -->
    
    <!-- FOOTER -->
    <footer>
    	<%@ include file="common/footer.jsp" %>
    </footer>
    
    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>
    <!-- Theme JavaScript -->
    <script src="js/agency.min.js"></script>

</body>
</html>
