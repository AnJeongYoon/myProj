<%@page import="member.memberBean"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../sub_header.jsp" />
    <!-- Header -->
    
<%
	request.setCharacterEncoding("utf-8");
	MemberDao mDao = new MemberDao();
	
	String user_name = request.getParameter("user_name");
	String phoneNum = request.getParameter("phoneNum1")+"-"+request.getParameter("phoneNum2")+"-"+request.getParameter("phoneNum3");
	memberBean mBean = mDao.getIDFind(user_name, phoneNum);
%>
    <div style="height: 100px;"></div>
    <div class="container">
		<div class="find">
			<p>회원님의 아이디는 <b style="color: #337ab7; font-size: 15px;"><%=mBean.getUser_id() %></b>입니다.</p>
			<input type="button" value="확인" onclick="self.close();">
		</div>
    </div>
