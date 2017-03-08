<%@page import="member.memberBean"%>
<%@page import="member.MemberDao"%>
<%@page import="board.commentDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");	
	
	String boardNum = request.getParameter("boardNum");
	String pageNum = request.getParameter("board_pageNum");
	
	//세션값 가져오기
	String user_id = (String)session.getAttribute("user_id");
	
	if(user_id == null){
		response.sendRedirect("../login/login.jsp");
	}
%>
	<jsp:useBean id="comBean" class="board.commentBean" />
	<jsp:setProperty property="*" name="comBean"/>
<%
	MemberDao mDao = new MemberDao();
	memberBean mBean = mDao.getMember(user_id);

	comBean.setReg_date(new Timestamp(System.currentTimeMillis()));
	comBean.setIp(request.getRemoteAddr());
	comBean.setUser_name(mBean.getUser_name());
	comBean.setUser_id(user_id);
	comBean.setComm_group(Integer.parseInt(request.getParameter("comm_group")));
%>

<%
	commentDAO comDao = new commentDAO();
	// (자식글 답변내용+부모글의 그룹번호, 들여쓰기번호, 위치번호)를 지니고 있는 dto객체 넘기기
	int update = comDao.reInsertComment(comBean);
	
	if(update == 1){
		%>
		<script>
			alert("답변을 달았습니다.");
			location.href='noticeRead.jsp?no=<%=boardNum%>&pageNum=<%=pageNum%>';
		</script>
		<%
	} else {
		%>
		<script>
			alert("실패");
			history.back();
		</script>
		<%
	}
%>