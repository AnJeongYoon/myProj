<%@page import="board.commentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	
	String boardNum = request.getParameter("boardNum");
	String pageNum = request.getParameter("board_pageNum");
	String user_id = (String)session.getAttribute("user_id");
%>
	<jsp:useBean id="comBean" class="board.commentBean" />
	<jsp:setProperty property="*" name="comBean"/>
<%
	comBean.setNo(Integer.parseInt(request.getParameter("no")));
	comBean.setUser_id(request.getParameter("user_id"));
	comBean.setUser_name(request.getParameter("user_name"));

	commentDAO comDao = new commentDAO();
	
	int check = comDao.updateComment(comBean, user_id);
	
	if(check == 1){
		%>
		<script>
			alert("수정했습니다.");
			location.href='noticeRead.jsp?no=<%=boardNum%>&pageNum=<%=pageNum%>';
		</script>
		<%
	} else {
		%>
		<script>
			alert("댓글 수정에 실패하였습니다.");
			history.back();
		</script>
		<%
	}
%>