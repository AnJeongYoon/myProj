<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	
	MemberDao mDAO = new MemberDao();
	
	int check = mDAO.userCheck(user_id, user_pw);

	switch (check) {
	case 1:
		session.setAttribute("user_id", user_id);
		response.sendRedirect("../../index.jsp");
		
		break;
		
	case 0:
		%>
		<script>
		alert("아이디 또는 비밀번호를 다시 확인해 주세요.");
		history.back();
		</script>
		<%
		break;
		
	default:
		break;
	}
	
%>