<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/* 글 수정 페이지를 위한 글 상세보기 페이지 */
	//세션값 가져오기
	String user_id = (String)session.getAttribute("user_id");
	//세션값이 없으면 login.jsp로 이동
	if(user_id == null){
		response.sendRedirect("../login/login.jsp");
	}
	//content.jsp 페이지에서 글 수정버튼을 클릭해서 전달하여 넘어온 num, pageNum한글처리
	request.setCharacterEncoding("utf-8");
	
	//content.jsp 페이지에서 글 수정버튼을 클릭해서 전달하여 넘어온 num, pageNum 가져오기
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNum = request.getParameter("pageNum");
	//디비작업
	BoardDAO dao = new BoardDAO();
	//글 수정 상세 내용을 볼 글에 대한 글번호를 넘겨서 DB로부터 글정보 (BoardBean객체)가져오기
	BoardBean bBean = dao.getBoard(no);
	
	int DBNum = bBean.getNo();	//글번호
	String DBname = bBean.getUser_name();	//작성자
	String DBsubject = bBean.getSubject();
	String DBContent = "";
	if(bBean.getContent() != null){
		DBContent = bBean.getContent().replace("\n", "<br>");
	}
	
%>
<jsp:include page="../sub_header.jsp" />
    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header subImg04">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>글쓰기</h1>
                        <h3>글쓰기</h3>
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
    	<form action="notice_updateProc.jsp?pageNum=<%=pageNum %>" method="post" name="fr">
		<input type="hidden" name="no" value="<%=no%>" />
		
    		<div class="lHead">
    			<span><input type="text" id="subject" name="subject"value="<%=bBean.getSubject() %>" placeholder="제목" /></span>
    			<span>| 작성자: <%=bBean.getUser_name() %></span>
    		</div>
    		
    		<div class="letterCont">
    			<textarea rows="10" cols="80" id="content" name="content"><%=bBean.getContent() %></textarea>
    		</div>
    		
    		<div class="letterBtn">
    			<input type="submit" id="writeBtn" name="writeBtn" value="수정하기" />
    			<input type="button" id="resetBtn" name="resetBtn" value="다시쓰기" onclick="" />
    			<input type="button" id="listBtn" name="listBtn" value="목록보기" onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'" />
    		</div>
    	</form>
     	</div>
    </div>		

<jsp:include page="../sub_footer.jsp" />