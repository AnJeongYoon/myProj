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
<link href="css/agencySub.min.css" rel="stylesheet">
<style type="text/css">
.loginForm{width: 100%; height: 100%; overflow: hidden; padding-top: 100px;}
.loginForm h1{text-align: center; padding-bottom: 50px;}
.loginForm table{width: 300px; height: 200px;}
.loginForm tr{}
.loginForm td{}
.loginForm #loginBtn{margin: 0 auto; border: 1px solid red;}
.loginForm #backBtn{margin: 0 auto; border: 1px solid red;}

.find{width: 400px; margin: 0 auto; border: 1px solid red;}
</style>
</head>

<body id="page-top" class="index">
    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top affix">
        	<%@ include file="common/subNav.jsp" %>
        <!-- /.container-fluid -->
    </nav>

    

    <div class="container">
	<div class="row">
		<div class="loginForm">
		<h1>로그인</h1>
			<form action="loginProc">
				<table align="center">
					<tr>
						<td>ID</td>
						<td><input type="text" id="user_id" name="user_id" /></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="user_pw" name="user_pw" /></td>
					</tr>
					<tr>
						<td><input type="button" value="로그인" id="loginBtn" onclick="" /></td>
						<td><input type="button" value="취소" id="backBtn" onclick="history.go(-1);" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="find">
			id가 없으신가요?	<a href="common/member/member_join.jsp">회원가입</a><br>
			ID 또는 비밀번호를 잊어버렸다면 <a href="#">ID/PW 찾기</a>
		</div>	
	</div>
	</div>
    
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
