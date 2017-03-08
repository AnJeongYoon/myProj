<%@page import="member.memberBean"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDao dao = new MemberDao();
	String user_id = (String)session.getAttribute("user_id");		

	memberBean mBean = dao.getMember(user_id);

	//세션값이 있으면 글작성 가능
	if(user_id != null){
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
    
<!--     <script type="text/javascript" src="../../SE2.3.10.O11329/js/HuskyEZCreator.js" charset="utf-8"></script> -->
    <div class="container">
    <form action="notice_writeProc.jsp" method="post">
    <input type="hidden" name="user_id" value=<%=user_id %> />
    <input type="hidden" name="user_name" value=<%=mBean.getUser_name() %> />
    
    	<div class="letterWrap">
    		<div class="lHead">
    			<span><input type="text" id="subject" name="subject" placeholder="제목" /></span>
    			<span>| 작성자: <%=mBean.getUser_name() %></span>
    		</div>
    		
    		<div class="letterCont">
    			<textarea name="content" id="content" rows="10" cols="100"></textarea>
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
    
    <script type="text/javascript">
// 	var oEditors = [];
// 	nhn.husky.EZCreator.createInIFrame({
// 	    oAppRef: oEditors,
// 	    elPlaceHolder: "content",
// 	    sSkinURI: "../../SE2.3.10.O11329/SmartEditor2Skin.html",
// 	    fCreator: "createSEditor2"
// 	});
	</script>

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