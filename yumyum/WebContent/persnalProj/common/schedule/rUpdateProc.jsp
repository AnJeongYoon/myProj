<%@page import="reservation.reservDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	
	String user_id = (String)session.getAttribute("user_id");
%>
	<jsp:useBean id="rBean" class="reservation.reservBean" />
	<jsp:setProperty property="*" name="rBean"/>
<%
	rBean.setNo(Integer.parseInt(request.getParameter("no")));
	
	reservDAO rDao = new reservDAO();
	int check = rDao.updateReserve(rBean, user_id);
	
	if(check == 1){
		%>
		<script>
			alert("수정했습니다.");
			location.href="reservList.jsp";
		</script>
		<%
	} else {
		%>
		<script>
			alert("수정에 실패하였습니다.");
			history.back();
		</script>
		<%
	}
%>