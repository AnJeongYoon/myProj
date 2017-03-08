<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	
	String pageNum = request.getParameter("pageNum");
	String user_id = (String)session.getAttribute("user_id");
%>
	<jsp:useBean id="bBean" class="board.BoardBean" />
	<jsp:setProperty property="*" name="bBean"/>
<%
	BoardDAO dao = new BoardDAO();
	
	int check = dao.updateBoard(bBean, user_id);
	
	if(check == 1){
		%>
		<script>
			alert("수정했습니다.");
			location.href="notice.jsp?pageNum=<%=pageNum%>";
		</script>
		<%
	} else {
		%>
		<script>
			alert("비밀번호가 틀렸습니다.");
			history.back();
		</script>
		<%
	}
%>