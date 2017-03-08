<%@page import="member.MemberDao"%>
<%@page import="member.memberBean"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String user_id = (String)session.getAttribute("user_id");
	//세션값이 있으면 글작성 가능
	if(user_id != null){
	
	MemberDao mdao = new MemberDao();
	memberBean mBean = mdao.getMember(user_id);

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
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<jsp:include page="../sub_header.jsp" />
    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header subImg04">
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
    			<span>작성일: <%=sdf.format(bBean.getReg_date()) %></span>
    		</div>
    		
    		<div class="letterCont">
    			<%=bBean.getContent() %>
    		</div>
    		
    		<div class="commentWrap">
    			<%@ include file="comment.jsp" %>

				<form action="comm_writeProc.jsp">
				<input type="hidden" name="no" value="<%=no %>">
				<input type="hidden" name="pageNum" value="<%=pageNum %>">
				<input type="hidden" name="user_id" value="<%=user_id %>" />
				<input type="hidden" name="user_name" value="<%=mBean.getUser_name() %>" />
				
					<div class="commentWrite">
						<input type="text" id="comment" name="comment" />
						<input type="submit" id="cWriteBtn" name="cWriteBtn" value="댓글쓰기" />
					</div>
				</form>
   			</div>
     	</div>
    		
   		<div class="letterBtn">
   		 <% if(user_id != null){ %> 
   		 	<% if(user_id.equals(bBean.getUser_id())){ %>
   			<input type="button" id="updateBtn" name="updateBtn" value="수정" onclick="location.href='noticeUpdate.jsp?no=<%=DBNum%>&pageNum=<%=pageNum%>'" />
   			<% } %>
   			<input type="button" id="delBtn" name="delBtn" value="삭제" onclick="location.href='noticeDel.jsp?no=<%=DBNum%>&pageNum=<%=pageNum%>'" />
   			<input type="button" id="repleBtn" name="repleBtn" value="답변" onclick="location.href='notice_reply.jsp?no=<%=DBNum%>&re_group=<%=DBre_group%>&re_lev=<%=DBre_lev%>&re_seq=<%=DBre_seq%>'" />
   		<% } %>	
   			<input type="button" id="listBtn" name="listBtn" value="목록보기" onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'" />
   		</div>
    </div>

<jsp:include page="../sub_footer.jsp" />

<%
	} else {
		%>
		<script>
		alert("로그인 후 이용할 수 있습니다."); 
		location.href="../login/login.jsp";
		</script>
		<%
	}
%>
