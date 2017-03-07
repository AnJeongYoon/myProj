<%@page import="member.MemberDao"%>
<%@page import="member.memberBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.commentBean"%>
<%@page import="java.util.List"%>
<%@page import="board.commentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	commentDAO cDao = new commentDAO();

	int boardNum = Integer.parseInt(request.getParameter("no"));
	commentBean comBean = cDao.getComment(boardNum);
	
	String board_pageNum = request.getParameter("pageNum");

	//전체 글 갯수
	int count = cDao.getCommCount(boardNum);
	
	//하나의 화면마다 보여줄 글 개수
	int pageSize = 5;
	//현재 보여질(선택한) 페이지 번호 가져오기.
	String comm_pageNum = request.getParameter("comm_pageNum");
	//현재 보여질(선택한) 페이지번호가 없으면 1페이지 처리
	if(comm_pageNum == null){
		comm_pageNum = "1";
	}
	/* 현재 보여질(선택한) 페이지번호 "1"을 ->기본정수 1로 변경 */
	int currentPage = Integer.parseInt(comm_pageNum);
	
	/* 각 페이지 마다 맨 위에 첫번째로 보여질 시작 글 번호 구하기 */
	//(현재 보여질 페이지번호 -1)*한페이지당 보여줄 글 갯수 15
	int startRow = (currentPage-1)*pageSize;
	
	List<commentBean> list = null;
	
	//만약 게시판에 글이 있다면?
	if(count > 0){
		//글 목록 가져오기
		//getBoardList(각 페이지마다 맨 위에 첫번째로 보여질 시작 글번호, 한페이지당 보여줄 글 개수)
		list = cDao.getCommentList(startRow, pageSize, boardNum);
	}
	//날짜 포맷
	SimpleDateFormat day = new SimpleDateFormat("yy-MM-dd");
	
%> 
<script>
$(function(){
	<% if(count > 0){ %>
	<% for(int i = 0; i < list.size(); i++){ %>
	$("#updateBtn_<%=i%>").click(function (){
		$('.commArea1_<%=i%>').css('display','none');
		$('.commArea2_<%=i%>').css('display','block');
	})
	<% } } %>
});

$(function(){
	<% if(count > 0){ %>
	<% for(int i = 0; i < list.size(); i++){ %>
	$("#replyBtn_<%=i%>").click(function (){
		$('.commArea3_<%=i%>').css('display','block');
	})
	<% } } %>
});
</script>
<%-- boardNo에 대한 댓글 개수가 0보다 크면 나옴 if() --%>
	<div class="commentCount"><a href="#">댓글 <%=count %>개</a></div>
<% if(count > 0){ %>
	<% for(int i = 0; i < list.size(); i++){
		commentBean cBean = list.get(i); %>
	<div class="comment">
	<% if(cBean.getComm_seq() == 0){ %>
		<span><%=cBean.getUser_name() %></span><%-- 유저네임 --%>
		<span><%=day.format(cBean.getReg_date()) %></span>
		<div class="commBtn">
 			<a href="#" id="replyBtn_<%=i%>" name="replyBtn">답변</a>
			<% if(session.getAttribute("user_id").equals(cBean.getUser_id())){ %>
  			| <a href="#" id="updateBtn_<%=i%>" name="updateBtn">수정</a> |
  			<a href="comm_del.jsp?no=<%=cBean.getNo()%>&pageNum=<%=board_pageNum %>&comm_pageNum=<%=comm_pageNum %>&boardNum=<%=boardNum %>" id="delBtn" name="delBtn">삭제</a>
 			<% } %>
 		</div>
		
		<p class="commArea1_<%=i%>" style="display:block;"><%=cBean.getComment() %></p><%-- 댓글내용 --%>
		
	<% } else { %>
	<div class="replayArea">
		<span><img alt="" src="../../img/comment_reply.png"></span>
		<span><%=cBean.getUser_name() %></span><%-- 유저네임 --%>
		<span><%=day.format(cBean.getReg_date()) %></span>
		<div class="commBtn">
			<% if(session.getAttribute("user_id").equals(cBean.getUser_id())){ %>
  			<a href="#" id="updateBtn_<%=i%>" name="updateBtn">수정</a> |
  			<% } %>
  			<a href="comm_del.jsp?no=<%=cBean.getNo()%>&pageNum=<%=board_pageNum %>&comm_pageNum=<%=comm_pageNum %>&boardNum=<%=boardNum %>" id="delBtn" name="delBtn">삭제</a>
 			
 		</div>
 		
		<p class="commArea1_<%=i%>" style="display:block;"><%=cBean.getComment() %></p><%-- 댓글내용 --%>
	</div>
	<% } %>		
		<!-- 댓글수정폼 -->
		<form action="comm_updateProc.jsp" class="commArea2_<%=i%>" style="display:none;">
		<input type="hidden" name="boardNum" value="<%=boardNum %>">
		<input type="hidden" name="board_pageNum" value="<%=board_pageNum %>">
		<input type="hidden" name="no" value="<%=cBean.getNo() %>">
		<input type="hidden" name="user_id" value="<%=session.getAttribute("user_id") %>" />
		<input type="hidden" name="user_name" value="<%=cBean.getUser_name() %>" />
			<p>
			<input type="text" id="comment" name="comment" value="<%=cBean.getComment() %>" />
			<input type="submit" id="commUpdate" name="commUpdate" value="수정" />
			</p>
		</form>
		<!-- 댓글수정폼 -->
		
		<!-- 댓글답변폼 -->
		<form action="comm_replyProc.jsp" class="commArea3_<%=i%>" style="display:none;">
		<input type="hidden" name="boardNum" value="<%=boardNum %>">
		<input type="hidden" name="board_pageNum" value="<%=board_pageNum %>">
		<input type="hidden" name="no" value="<%=cBean.getNo() %>">
		<input type="hidden" name="user_id" value="<%=session.getAttribute("user_id") %>" />
		<input type="hidden" name="comm_group" value="<%=cBean.getComm_group() %>">
			<p>
			<img alt="" src="../../img/comment_reply.png">
			<input type="text" id="comment" name="comment" />
			<input type="submit" id="commReply" name="commReply" value="답변쓰기" />
			</p>
		</form>
		<!-- 댓글답변폼 -->
	</div>
	<% } %>
<% }  %>

	<div class="pageWrap">
	<div class="page">
		<%
		if(count > 0){
			int pageCount = count/pageSize + (count % pageSize == 0? 0:1);

			int pageBlock = 3;

			int startPage = ((currentPage/pageBlock)-(currentPage%pageBlock == 0 ? 1:0)) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;

			if(endPage > pageCount){ endPage = pageCount; }

			if(startPage > pageBlock){
				%><div class="prev"><a id="link" href="noticeRead.jsp?no=<%=boardNum %>&pageNum=<%=board_pageNum %>&comm_pageNum=<%=startPage-pageBlock%>" style="color: white;"><</a></div><%
			}
			//[1][2][3]...[10]
			for(int i = startPage; i <= endPage; i++){
				%><div class="pageNum"><a id="link" href="noticeRead.jsp?no=<%=boardNum %>&pageNum=<%=board_pageNum %>&comm_pageNum=<%=i%>"><%=i%></a></div><%
			}
			//[다음] 끝페이지 번호가 전체 페이지 수 보다 작을때
			if(endPage < pageCount){
				%><div class="next"><a id="link" href="noticeRead.jsp?no=<%=boardNum %>&pageNum=<%=board_pageNum %>&comm_pageNum=<%=startPage+pageBlock%>" style="color: white;">></a></div><%
			}
		}
		%>
	</div>
	</div>

