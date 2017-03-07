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
	bBean.setReg_date(new Timestamp(System.currentTimeMillis())); //글쓴시간 저장
	bBean.setIp(request.getRemoteAddr());	//글쓴이 ip주소 추가 저장
	bBean.setUser_name(request.getParameter("user_name"));
	bBean.setUser_id(request.getParameter("user_id"));
%>

<%
	//디비작업 파일 만들기
	BoardDAO bDao = new BoardDAO();

	int write = bDao.insertBoard(bBean);
	
	if(write == 1){
		response.sendRedirect("notice.jsp");
	} else{
		%>
		<script>
			alert("글쓰기에 실패하였습니다. \n이전 화면으로 돌아갑니다.");
			history.back();
		</script>
		<%
	}
%>