<%@page import="member.memberBean"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../sub_header.jsp" />
    <!-- Header -->
    
<%
	request.setCharacterEncoding("utf-8");
	MemberDao mDao = new MemberDao();
	
	String user_pw = request.getParameter("user_pw");
	String user_id = request.getParameter("user_id");
	String email = request.getParameter("email");
	memberBean mBean = mDao.getPWFind(user_pw, user_id, email);
%>
    <div style="height: 100px;"></div>
    <div class="container">
		<div class="find">
			<p>새 비밀번호를 입력해주세요. <input type="password" name="newpw" id="newpw"></p>
			<input type="button" value="확인" onclick="self.close();">
		</div>
    </div>
