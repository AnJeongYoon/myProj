<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
	!!!!!! 로그인 유효성체크 !!!!!!
 -->
<jsp:include page="../sub_header.jsp" />
    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header subImg06">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>Login</h1>
                        <h3>로그인하세요</h3>
                        <hr class="intro-divider">
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.intro-header -->
	
	<div class="container">
	<div class="loginForm">
		<form action="loginProc.jsp" method="post" name="loginForm">
			<table>
				<tr>
					<td>ID</td>
					<td><input type="text" id="user_id" name="user_id" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="user_pw" name="user_pw" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" id="loginBtn" value="로그인" onclick="" />&nbsp;
						<input type="button" id="cancelBtn" value="취소" onclick="history.go(-1);" />
					</td>
				</tr>
			</table>
		</form>
		<p>아이디가 없으신가요?<br><a href="../member/member_join.jsp">회원가입</a></p>
		<p>아이디 또는 비밀번호를 잊었다면 <a href="javascript:popupOpen();">ID/PW 찾기</a></p>
	</div>
	</div>
	<script type="text/javascript">
	<!--
	function popupOpen(){
		var popUrl = "infoFind.jsp";	//팝업창에 출력될 페이지 URL
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
		}
	//-->
	</script>
<jsp:include page="../sub_footer.jsp" />