<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../sub_header.jsp" />
    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header subImg06">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>Welcome!</h1>
                        <h3>환영합니다!</h3>
                        <hr class="intro-divider">
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->
    </div>
    <!-- /.intro-header -->

	<div class="container">
	<div class="join_Complete">
		<h1>회원가입이 완료되었습니다.</h1>
		<p>
			OO에서 제공되는 모든 서비스를 이용하실 수 있습니다.<br>
			아이디를 제외한 정보는 추후 <span>'회원정보수정'</span> 페이지에서 언제든지 수정 가능합니다.
		</p>
		<input type="button" id="mainBtn" name="mainBtn" value="메인으로" onclick="location.href='../../index.jsp'" />
		<input type="button" id="loginBtn" name="loginBtn" value="로그인하기" onclick="location.href='../login/login.jsp'" />
	</div>
	</div>

<jsp:include page="../sub_footer.jsp" />