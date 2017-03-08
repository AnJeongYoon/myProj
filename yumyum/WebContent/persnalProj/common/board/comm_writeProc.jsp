<%@page import="board.commentDAO"%>
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
	
	int boardNum = Integer.parseInt(request.getParameter("no"));
	String pageNum = request.getParameter("pageNum");
%>
	<jsp:useBean id="comBean" class="board.commentBean" />
	<jsp:setProperty property="*" name="comBean"/>
<%
	comBean.setReg_date(new Timestamp(System.currentTimeMillis())); //글쓴시간 저장
	comBean.setIp(request.getRemoteAddr());	//글쓴이 ip주소 추가 저장
	comBean.setUser_name(request.getParameter("user_name"));
	comBean.setUser_id(request.getParameter("user_id"));
%>

<%
	//디비작업 파일 만들기
	commentDAO comDao = new commentDAO();

	int write = comDao.insertComment(comBean, boardNum);
	
	if(write == 1){
		response.sendRedirect("noticeRead.jsp?no="+boardNum+"&pageNum="+pageNum);
	} else{
		%>
		<script>
			alert("글쓰기에 실패하였습니다. \n이전 화면으로 돌아갑니다.");
			history.back();
		</script>
		<%
	}
%>