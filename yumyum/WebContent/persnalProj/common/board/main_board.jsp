<%@page import="board.commentDAO2"%>
<%@page import="board.Board2DAO"%>
<%@page import="java.util.Date"%>
<%@page import="board.commentDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-lg-5 col-sm-6 main_board">
	<%
		//DB작업 객체 생성
		BoardDAO boardDAO = new BoardDAO();
	
		//전체 글 갯수
		int count = boardDAO.getBoardCount();
		//System.out.println(count);
		
		//하나의 화면마다 보여줄 글 개수
		int pageSize = 6;
		//현재 보여질(선택한) 페이지 번호 가져오기.
		String pageNum = request.getParameter("pageNum");
		//현재 보여질(선택한) 페이지번호가 없으면 1페이지 처리
		if(pageNum == null){
			pageNum = "1";
		}
		/* 현재 보여질(선택한) 페이지번호 "1"을 ->기본정수 1로 변경 */
		int currentPage = Integer.parseInt(pageNum);
		
		/* 각 페이지 마다 맨 위에 첫번째로 보여질 시작 글 번호 구하기 */
		//(현재 보여질 페이지번호 -1)*한페이지당 보여줄 글 갯수 15
		int startRow = (currentPage-1)*pageSize;
		// 게시판 글객체(BoardBean)를 저장하기 위한 용도
		List<BoardBean> list = null;
		
		//만약 게시판에 글이 있다면?
		if(count > 0){
			//글 목록 가져오기
			//getBoardList(각 페이지마다 맨 위에 첫번째로 보여질 시작 글번호, 한페이지당 보여줄 글 개수)
			list = boardDAO.getBoardList(startRow, pageSize);
		}
		//날짜 포맷
		SimpleDateFormat sdf2 = new SimpleDateFormat("yy-MM-dd");
	%>
	<div class="boardWrap">
			<div class="notice_title">
	     		<h3>공지사항
	     		<a href="common/board/notice.jsp" id="more">+</a>
	     		</h3>
     		</div>
     		
     		<table class="boardList">
     		<colgroup>
     			<col width="5%">
     			<col width="30%">
     			<col width="10%">
     			<col width="10%">
     		</colgroup>
     		<% //만약 게시판 글 갯수가 존재하고 (게시판에 글이 있다면)
			if(count > 0){
				for(int i = 0; i < list.size(); i++){
				BoardBean bBean = list.get(i);
				
				/* 댓글 */
				commentDAO commDao = new commentDAO();
				int boardNum = bBean.getNo();
				int CommCount = commDao.getCommCount(boardNum);
			%>
     		<tr style="border-top: 1px solid #999">
     			<td>
     			<% Date bToday = new Date();
					if(sdf2.format(bBean.getReg_date()).equals(sdf2.format(bToday))){
						String newIcon = "<img src='./img/new.png' />";
						%><%=newIcon%><%
					} else {
						String newIcon = "<img src='./img/dot.png' alt='dot'>";
						%><%=newIcon%><%
					}
				%>
     			</td>
     			<td>
     				<a id="link" onclick="location.href='common/board/noticeRead.jsp?no=<%=bBean.getNo()%>&pageNum=1'">
     				<%
     					if(bBean.getSubject().length() > 14){
     						String subject = bBean.getSubject().substring(0, 14);
     						%><%=subject %>...<%
     					} else {
     						%><%=bBean.getSubject() %><%
     					}
     				%>
     				
     				<% if(CommCount != 0){ %>
     				<b>(<%=CommCount%>)</b>
     				<% } %>
     				</a>
     			</td>
     			<td><%=bBean.getUser_name() %></td>
     			<td><%=sdf2.format(bBean.getReg_date()) %></td>
     		</tr>
     		<% }
			} else { %>
     			<td colspan="5">등록된 게시물이 없습니다.</td>
     		<% } %>
     		</table>
     	</div>
</div>

<div class="col-lg-5 col-lg-offset-2 col-sm-6 main_board2">
   <%
	//DB작업 객체 생성
	Board2DAO board2DAO = new Board2DAO();

	//전체 글 갯수
	int bCount2 = boardDAO.getBoardCount();
	//System.out.println(count);
	
	//하나의 화면마다 보여줄 글 개수
	int pageSize2 = 3;
	//현재 보여질(선택한) 페이지 번호 가져오기.
	String pageNum2 = request.getParameter("pageNum");
	//현재 보여질(선택한) 페이지번호가 없으면 1페이지 처리
	if(pageNum2 == null){
		pageNum2 = "1";
	}
	/* 현재 보여질(선택한) 페이지번호 "1"을 ->기본정수 1로 변경 */
	int currentPage2 = Integer.parseInt(pageNum2);
	
	/* 각 페이지 마다 맨 위에 첫번째로 보여질 시작 글 번호 구하기 */
	//(현재 보여질 페이지번호 -1)*한페이지당 보여줄 글 갯수 15
	int startRow2 = (currentPage2-1)*pageSize2;
	// 게시판 글객체(BoardBean)를 저장하기 위한 용도
	List<BoardBean> list2 = null;
	
	//만약 게시판에 글이 있다면?
	if(bCount2 > 0){
		//글 목록 가져오기
		//getBoardList(각 페이지마다 맨 위에 첫번째로 보여질 시작 글번호, 한페이지당 보여줄 글 개수)
		list2 = board2DAO.getBoardList(startRow2, pageSize2);
	}
%>
<div class="boardWrap2">
		<div class="notice_title">
     		<h3>후기게시판 <a href="common/board/board.jsp" id="more">+</a></h3>
    	</div>
    	
    	<div class="board2">
    		<% //만약 게시판 글 갯수가 존재하고 (게시판에 글이 있다면)
			if(bCount2 > 0){
				for(int i = 0; i < list2.size(); i++){
				BoardBean bBean = list2.get(i);
				
				/* 댓글 */
				commentDAO2 commDao2 = new commentDAO2();
				int boardNum = bBean.getNo();
				int CommCount = commDao2.getCommCount(boardNum);
			%>
    		<div class="letter">
    			<a id="link" onclick="location.href='common/board/board.jsp?no=<%=bBean.getNo()%>&pageNum=1'">
	    			<div class="letterThum"><img src="http://placehold.it/125x110" /></div>
	   				<%if(bBean.getSubject().length() > 8){ String subject = bBean.getSubject().substring(0, 8);%>
	   					<%=subject %>...
	   				<% } else { %>
	   					<%=bBean.getSubject() %>
	   				<% } %>
	   				
	    			<% Date bToday = new Date();
						if(sdf2.format(bBean.getReg_date()).equals(sdf2.format(bToday))){
							String newIcon = "<img src='./img/new.png' />";
							%><%=newIcon%><%
						} else {
							String newIcon = "";
							%><%=newIcon%><%
						}
					%>
					
<%-- 	   				<% if(CommCount != 0){ %> --%>
<%-- 	   				<b>(<%=CommCount%>)</b> --%>
<%-- 	   				<% } %> --%>
    			</a>
    		</div>
	    	<% }
			} else { %>
	    	<div class="letter">등록된 게시물이 없습니다.</div>
	    	<% } %>
    	</div>
</div>
</div>