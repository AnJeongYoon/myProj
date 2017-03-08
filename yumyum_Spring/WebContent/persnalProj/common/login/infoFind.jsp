<%@page import="member.memberBean"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../sub_header.jsp" />
    <!-- Header -->
    
<script>
$(function(){
	$('.infoFind > p').click(function (){
		var num = $(this).index();
		$('.infoFind').css('display','none');
		$('.find > div').eq(num).css('display','block');
	})
});
</script>
    <div style="height: 100px;"></div>
    <div class="container">
    	<div class="infoFind">
			<p><a href="#">아이디 찾기</a></p>
			<p><a href="#">비밀번호 찾기(미구현)</a></p>
		</div>
		
		<div class="find">
			<div class="findID" style="display: none;">
				<form action="idFind.jsp" method="post">
					<p>이름: <input type="text" name="user_name" id="user_name" /></p>
					<p>전화번호: <input type="text" name="phoneNum1" id="phoneNum1" />-<input type="text" name="phoneNum2" id="phoneNum2" />-<input type="text" name="phoneNum3" id="phoneNum3" /></p>
					<p><input type="submit" name="findID" id="findID" value="아이디 찾기" /></p>
					<p><input type="button" name="cancel" id="cancel" value="취소" onclick="self.close();" /></p>
				</form>
			</div>
			
			<div class="findPW" style="display: none;">
				<form action="pwFind.jsp" method="post">
				<p>아이디: <input type="text" name="user_id" id="user_id" /></p>
				<p>이메일주소: <input type="text" name="email" id="email" /></p>
				<p><input type="submit" name="findPW" id="findPW" value="비밀번호 찾기" /></p>
				<p><input type="button" name="cancel" id="cancel" value="취소" onclick="self.close();" /></p>
				</form>
			</div>
		</div>
    </div>
