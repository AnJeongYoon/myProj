<%@page import="reservation.reservDAO"%>
<%@page import="member.MemberDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String user_id = (String)session.getAttribute("user_id");	
	String user_name = request.getParameter("user_name");
%>
	<jsp:useBean id="rBean" class="reservation.reservBean" />
	<jsp:setProperty property="*" name="rBean"/>
<%
	rBean.setReg_date(new Timestamp(System.currentTimeMillis()));

	reservDAO rDao = new reservDAO();
	
	int reserv = rDao.insertReserve(rBean, user_id, user_name);
	
	//5. 회원가입에 성고했다면 login.jsp로 이동
	if(reserv == 1){
		%>
		<script>
			alert("예약 하였습니다. \n예약내역은 예약확인 페이지에서 확인 가능합니다.");
			location.href='reservList.jsp';
		</script>
		<%
	} else{
		%>
		<script>
			alert("예약에 실패하였습니다. \n이전 화면으로 돌아갑니다.");
			history.back();
		</script>
		<%
	}
		
%>


