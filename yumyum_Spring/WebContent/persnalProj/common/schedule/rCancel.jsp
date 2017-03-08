<%@page import="reservation.reservDAO"%>
<%@page import="member.memberBean"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       
<%
	String user_id = (String)session.getAttribute("user_id");
%>
	<jsp:useBean id="rBean" class="reservation.reservBean" />
	<jsp:setProperty property="*" name="rBean"/>
<%
	reservDAO rDao = new reservDAO();

	rBean.setNo(Integer.parseInt(request.getParameter("no")));
	int check = rDao.CancelReserve(rBean, user_id);
	
	if(check == 1){
		%>
		<script>
			alert("취소했습니다.");
			location.href="reservList.jsp";
		</script>
		<%
	} else {
		%>
		<script>
			alert("예약취소에 실패하였습니다.");
			history.back();
		</script>
		<%
	}
%>


