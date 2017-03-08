<%@page import="member.memberBean"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDao dao = new MemberDao();
	String user_id = (String)session.getAttribute("user_id");		
	
	memberBean mBean = dao.getMember(user_id);
%>
<jsp:include page="../sub_header.jsp" />
    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>Letter</h1>
                        <h3>후기를 남겨주세요.</h3>
                        <hr class="intro-divider">
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.intro-header -->
    
    <div class="container">
    <form action="writeProc2.jsp" method="post">
    <input type="hidden" name="user_id" value=<%=user_id %> />
    <input type="hidden" name="user_name" value=<%=mBean.getUser_name() %> />
    
     	<div class="boardWrap">
     		<div class="letterWrap">
     			<div class="lHead">
     				<span><input type="text" name="subject" id="subject" /></span>
     				<span>| 작성자: <%=mBean.getUser_name() %></span>
     				<span></span>
     			</div>
     			<div class="letterCont">
     				<textarea rows="10" cols="80" id="content" name="content"></textarea>
     				<input type="file" id="file" name="file" />
     			</div>
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