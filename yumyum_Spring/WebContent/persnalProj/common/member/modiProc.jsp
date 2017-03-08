<%@page import="member.MemberDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	request.getParameter("user_id");
	
	String user_id = (String)session.getAttribute("user_id");	
%>
	<jsp:useBean id="MemberDao" class="member.MemberDao" />
	<jsp:useBean id="memberbean" class="member.memberBean" />
	<jsp:setProperty property="*" name="memberbean"/>
<%	
	int modi = MemberDao.modiMember(memberbean);
	
	if(modi == 1){
		%>
		<script>
			alert("회원정보수정에 성공하였습니다.");
			location.href='member_info.jsp';
		</script>
		<%
	} else {
		%>
		<script>
			alert("회원정보수정에 실패하였습니다. \n이전 화면으로 돌아갑니다.");
			history.back();
		//	location.href='../../index.jsp';
		</script>
		<%
	}
		
%>


