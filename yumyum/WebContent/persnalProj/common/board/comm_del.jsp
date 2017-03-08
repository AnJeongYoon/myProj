
<%@page import="board.commentDAO"%>
<%@page import="member.memberBean"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       
<%
	//delete.jsp(글삭제 비밀번호 입력화면)에서 삭제할 글번호, 페이지넘버, 패스워드값 가져오기
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNum = request.getParameter("pageNum");
	int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	String user_id = (String)session.getAttribute("user_id");
	
	commentDAO cDao = new commentDAO();
	
	int check = cDao.delComment(no, user_id, boardNum);
	//check=1이면 삭제성공 ->notice.jsp로 이동
	//check=0이면 "비밀번호 틀림 ->뒤로 이동
	
	if(check == 1){
		%>
		<script>
			alert("삭제했습니다.");
			location.href="noticeRead.jsp?no=<%=boardNum%>&pageNum=<%=pageNum%>";
		</script>
		<%
	} else {
		%>
		<script>
			alert("본인이 작성한 댓글만 삭제 할 수 있습니다.");
			history.back();
		</script>
		<%
	}
%>


