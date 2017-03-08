<%@page import="member.memberBean"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../sub_header.jsp" />
    <!-- Header -->
<script type="text/javascript">
function result() {
	//join.jsp창을 open하게 해준 페이지 <== join_IDchk.jsp창 페이지
	opener.document.joinForm.user_id.value = document.nfr.userid.value;
	window.close();
}
</script>
    <div style="height: 100px;"></div>
    <div class="container">
    <%
		String id = request.getParameter("userid");
		MemberDao mdao = new MemberDao();
		int check = mdao.idCheck(id);
		if(check == 1){
			out.println("사용중인 ID입니다.");
		} else {
			out.println("사용 가능한 ID입니다.");
			%>
			<input type="button" value="사용함" onclick="result()" />
			<%
		}
	%>
		<form action="idChk.jsp" method="post" name="nfr">
			ID: <input type="text" name="userid" value="<%=id %>" />
			<input type="submit" value="중복확인" />
		</form>
    </div>
