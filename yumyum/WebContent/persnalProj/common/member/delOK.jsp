<%@page import="member.memberBean"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       
<%
	request.setCharacterEncoding("utf-8");
	request.getParameter("user_id");

	String user_id = (String)session.getAttribute("user_id");
%>
	<jsp:useBean id="mDao" class="member.MemberDao" />
	<jsp:useBean id="mBean" class="member.memberBean" />
	<jsp:setProperty property="*" name="mBean"/>
<% 
	int delNum = mDao.delMember(user_id);
	System.out.println(delNum);
	
	if(delNum == 1){ %>
		<script>
			alert("탈퇴되었습니다. \n메인 화면으로 돌아갑니다.");
			<% session.invalidate(); %>
			location.href='../../index.jsp';
		</script>
	<% } else { %>
		<script>
			alert("회원 탈퇴에 실패하였습니다. \n이전 화면으로 돌아갑니다.");
			history.back();
		</script>
	<% }%>


