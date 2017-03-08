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

<!-- Bootstrap Core CSS -->
<link href="css/sub.bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/sub.landing-page.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<style type="text/css">

</style>
</head>
<body>
	<!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
        <%@ include file="common/nav/nav.jsp" %>
    </nav>

    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>Landing Page</h1>
                        <h3>A Template by Start Bootstrap</h3>
                        <hr class="intro-divider">
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.intro-header -->

    <div class="joinForm">
	<form action="joinProc.jsp">
		<h1>회원가입</h1>
		<table align="center">
			<tr>
				<td>ID </td>
				<td><input type="text" id="user_id" name="user_id" /></td>
			</tr>
			<tr>
				<td>비밀번호 </td>
				<td><input type="password" id="user_pw" name="user_pw" /></td>
			</tr>
			<tr>
				<td>비밀번호 확인 </td>
				<td><input type="password" id="user_pwChk" name="user_pwChk" /></td>
			</tr>
			<tr>
				<td>이름 </td>
				<td><input type="text" id="user_name" name="user_name" /></td>
			</tr>
			<tr>
				<td>성별 </td>
				<td>
					<input type="radio" id="gender" name="gender" value="남" />남
					<input type="radio" id="gender" name="gender" value="여" />여
				</td>
			</tr>
			<tr>
				<td>생년월일 </td>
				<td><input type="text" id="user_name" name="user_name" /></td>
			</tr>
			<tr>
				<td>전화번호 </td>
				<td>
					<input type="text" id="phoneNum1" name="phoneNum1" />-
					<input type="text" id="phoneNum2" name="phoneNum2" />-
					<input type="text" id="phoneNum3" name="phoneNum3" />
				</td>
			</tr>
			<tr>
				<td>주소 </td>
				<td>
					<input type="text" id="sample4_postcode" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
					<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
					<span id="guide" style="color:#999"></span>
				</td>
			</tr>
			<tr>
				<td>이메일주소 </td>
				<td>
					<input type="text" id="email_id" name="email_id" />@
					<select class="emailAddr">
						<option value="">직접입력</option> <!-- !!!!!!!스크립트!!!!!! -->
						<option value="naver.com">naver.com</option>
						<option value="nate">nate.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id="joinBtn" value="회원가입" onclick="" />
					<input type="button" id="cancelBtn" value="취소" onclick="history.go(-1);" />
				</td>
			</tr>
		</table>
	</form>
	</div>

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

</body>

</html>
