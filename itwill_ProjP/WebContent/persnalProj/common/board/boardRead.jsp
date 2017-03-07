<%@page import="member.MemberDao"%>
<%@page import="member.memberBean"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String user_id = (String)session.getAttribute("user_id");

	int no = Integer.parseInt(request.getParameter("no"));
	String pageNum = request.getParameter("pageNum");
	
	
	BoardDAO dao = new BoardDAO();
	
	dao.updateReadCount(no);
	BoardBean bBean = dao.getBoard(no);
	
	int DBNum = bBean.getNo();
	int DBReadcount = bBean.getReadCnt();
	String DBname = bBean.getUser_name();
	
	String DBContent = "";
	
	if(bBean.getContent() != null){
		DBContent = bBean.getContent().replace("\r\n", "<br>");
	}
	
	int DBre_group = bBean.getRe_group();	//그룹번호
	int DBre_lev = bBean.getRe_lev();	//들여쓰기 레벨 값
	int DBre_seq = bBean.getRe_seq();	//
	
%>
<jsp:include page="../sub_header.jsp" />
    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header subImg05">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>Notice</h1>
                        <h3>공지사항 게시판 입니다.</h3>
                        <hr class="intro-divider">
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.intro-header -->
    
    <div class="container">
    	<div class="letterWrap">
    	<input type="hidden" name="user_id" value="<%=user_id %>" />
    	
    		<div class="lHead">
    			<span><%=bBean.getSubject() %></span>
    			<span>| 작성자: <%=bBean.getUser_name() %></span>
    		</div>
    		
    		<div class="letterCont">
    			<%=bBean.getContent() %>
    		</div>
    		
    		<div class="commentWrap">
    		<%-- boardNo에 대한 댓글 개수가 0보다 크면 나옴
    		 if() --%>
   				<div class="commentCount"><a href="#">댓글 1개</a></div><%-- count --%>
   				<div class="comment">
   					<span>관리자</span><%-- 유저네임 --%>
   					<p>감사합니다^^</p><%-- 댓글내용 --%>
   				</div>
   				<div class="commentWrite">
   					<input type="text" id="cWrite" name="cWrite" />
   					<input type="button"  id="cWriteBtn" name="cWriteBtn" value="댓글쓰기" />
   				</div>
   			</div>
    		
    		<div class="letterBtn">
    		 <% if(user_id != null){ %> 
    		 	<%-- if(user_id.equals(bBean.getUser_id())){ --%>
    			<input type="button" id="updateBtn" name="updateBtn" value="수정" onclick="location.href='boardUpdate.jsp?no=<%=DBNum%>&pageNum=<%=pageNum%>'" />
    			<%-- } --%>
    			<input type="button" id="delBtn" name="delBtn" value="삭제" onclick="location.href='delete.jsp?no=<%=DBNum%>&pageNum=<%=pageNum%>'" />
    			<input type="button" id="repleBtn" name="repleBtn" value="답변" onclick="location.href='reWrite.jsp?no=<%=DBNum%>&re_group=<%=DBre_group%>&re_lev=<%=DBre_lev%>&re_seq=<%=DBre_seq%>'" />
    		<% } %>	
    			<input type="button" id="listBtn" name="listBtn" value="목록보기" onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'" />
    		</div>
     	</div>
    </div>		

<jsp:include page="../sub_footer.jsp" />
