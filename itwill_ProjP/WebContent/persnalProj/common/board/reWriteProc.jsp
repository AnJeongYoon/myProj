<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션값 가져오기
	String user_id = (String)session.getAttribute("user_id");
	
	if(user_id == null){
		response.sendRedirect("../login/login.jsp");
	}
	
	request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="bBean" class="board.BoardBean" />
	<jsp:setProperty property="*" name="bBean"/>
<%

	bBean.setReg_date(new Timestamp(System.currentTimeMillis()));
	bBean.setIp(request.getRemoteAddr());
	bBean.setUser_name(request.getParameter("user_name"));
	bBean.setUser_id(request.getParameter("user_id"));
%>

<%
	BoardDAO bdao = new BoardDAO();
	// (자식글 답변내용+부모글의 그룹번호, 들여쓰기번호, 위치번호)를 지니고 있는 dto객체 넘기기
	int update = bdao.reInsertBoard(bBean);
	
	if(update == 1){
		response.sendRedirect("notice.jsp");
	} else {
		%>
		<script>
			alert("실패");
			history.back();
		</script>
		<%
	}
%>