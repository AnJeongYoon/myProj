<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<div class="row">
		<div class="loginForm">
			<form action="loginProc">
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
						<td colspan="1">
						<input type="button" value="로그인" onclick="" />
						<input type="button" value="취소" onclick="history.go(-1);" />
						</td>
					</tr>
				</table>
			</form>
			id가 없으신가요?	<a href="../member/member_join.jsp">회원가입</a><br>
			ID 또는 비밀번호를 잊어버렸다면 <a href="#">ID/PW 찾기</a>	
		</div>
	</div>
</div>