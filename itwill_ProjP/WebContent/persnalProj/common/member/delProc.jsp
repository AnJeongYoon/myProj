<%@page import="member.memberBean"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       
<%
	request.setCharacterEncoding("utf-8");
	request.getParameter("user_id");

	String user_id = (String)session.getAttribute("user_id");
	
	MemberDao mDao = new MemberDao();
	memberBean mBean = mDao.getMember(user_id);
	
	String dbPW = mBean.getUser_pw();
	
	if(request.getParameter("user_pw") != null){
		String enterPW = request.getParameter("user_pw");
		
		if(enterPW.equals(dbPW)){
			%>
			<script>
				if(confirm("정말 탈퇴하시겠습니까?") == true){
					location.href='delOK.jsp';
				} else {
					alert("취소하였습니다. \n메인 화면으로 돌아갑니다.");
					location.href='../../index.jsp';
				}
			</script>
			<%
		} else {
			%>
			<script>
				alert("비밀번호가 맞지않습니다. \n메인 화면으로 돌아갑니다.");
			//	history.back();
				location.href='../../index.jsp';
			</script>
			<%
		}
	}
%>


