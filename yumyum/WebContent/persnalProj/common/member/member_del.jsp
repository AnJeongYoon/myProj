<%@page import="member.memberBean"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDao dao = new MemberDao();
	String user_id = (String)session.getAttribute("user_id");	

	//세션값이 있으면 회원정보 수정 가능
	if(user_id != null){
		
	memberBean mBean = dao.getMember(user_id);
%> 
<jsp:include page="../sub_header.jsp" />
    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header subImg06">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>My Info</h1>
                        <h3>회원정보를 수정 또는 탈퇴 할 수 있습니다.</h3>
                        <hr class="intro-divider">
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.intro-header -->
    
    
    <div class="container">
    	<form action="delProc.jsp" method="post">
		<input type="hidden" name="user_id" value="<%=user_id%>" />
		
			<h3>회원 탈퇴를 원하시면 본인인증을 위해 비밀번호를 입력 해 주세요.</h3>
			<table align="center">
			<colgroup>
     			<col width="15%">
     			<col width="50%">
     		</colgroup>
				<tr>
					<td>비밀번호 </td>
					<td><input type="password" id="user_pw" name="user_pw" /></td>
				</tr>
				<tr>
					<td><input type="submit" id="delBtn" value="탈퇴" /></td>
				</tr>
			</table>
    	
    	</form>
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