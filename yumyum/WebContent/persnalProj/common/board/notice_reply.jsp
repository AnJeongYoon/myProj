<%@page import="member.MemberDao"%>
<%@page import="member.memberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/* 주글에 대한 답글을 쓰기 위한 주글 상세보기 페이지 */
	//세션값 가져오기
	String user_id = (String)session.getAttribute("user_id");
	//세션값이 없으면 login.jsp로 이동
	if(user_id == null){
		response.sendRedirect("../login/login.jsp");
	}
	//content.jsp페이지에서 답변쓰기 버튼을 클릭해서 전달하여 넘어온 데이터 한글처리
	request.setCharacterEncoding("utf-8");
	
	//content.jsp페이지에서 답변쓰기 버튼을 클릭해서 전달하여 넘어온 데이터 받기
	int no = Integer.parseInt(request.getParameter("no"));
	int re_group = Integer.parseInt(request.getParameter("re_group"));
	int re_lev = Integer.parseInt(request.getParameter("re_lev"));
	int re_seq = Integer.parseInt(request.getParameter("re_seq"));
	
	MemberDao dao = new MemberDao();
	memberBean mBean = dao.getMember(user_id);
%>
<jsp:include page="../sub_header.jsp" />
    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header subImg04">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>답변쓰기</h1>
                        <h3>답변쓰기</h3>
                        <hr class="intro-divider">
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.intro-header -->
    
    <div class="container">
    <form action="notice_replyProc.jsp" method="post">
    <input type="hidden" name="user_id" value=<%=user_id %> />
    <input type="hidden" name="user_name" value="<%=mBean.getUser_name()%>" />
	<input type="hidden" name="no" value="<%=no%>" />
	<input type="hidden" name="re_group" value="<%=re_group%>" />
	<input type="hidden" name="re_lev" value="<%=re_lev%>" />
	<input type="hidden" name="re_seq" value="<%=re_seq%>" />
    
    	<div class="letterWrap">
    		<div class="lHead">
    			<span><input type="text" id="subject" name="subject" placeholder="제목" /></span>
    			<span>| 작성자: <%=mBean.getUser_name() %></span>
    		</div>
    		
    		<div class="letterCont">
    			<textarea rows="10" cols="80" id="content" name="content"></textarea>
    			<input type="file" id="file" name="file" />
    		</div>
    		<div class="letterBtn">
    			<input type="submit" id="writeBtn" name="writeBtn" value="글쓰기" />
    			<input type="reset" id="resetBtn" name="resetBtn" value="수정" />
    			<input type="button" id="cancelBtn" name="cancelBtn" value="취소" onclick="history.back();" />
    		</div>
     	</div>
     </form>
    </div>

<jsp:include page="../sub_footer.jsp" />