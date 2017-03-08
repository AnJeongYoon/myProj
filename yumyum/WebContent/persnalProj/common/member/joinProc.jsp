<%@page import="member.MemberDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//1. join.jsp에서 넘어온 회원데이터 request한글처리
	request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="memberbean" class="member.memberBean" />
	<jsp:setProperty property="*" name="memberbean"/>
<%
	//2-1 reg_date set메소드를 호출하여 현재 회원가입한 날짜를 자바빈 memeberbean(DTO)객체에 넣기
	memberbean.setReg_date(new Timestamp(System.currentTimeMillis()));

	//3. 먼저 해야 할 일
	// ->insertMemeber()메소드 만들기
	
	//4. 회원추가(회원가입) DB작업할 DAO객체 생성
	MemberDao memberdao = new MemberDao();
	
	//4-1. 회원가입 메서드 호출시 join.jsp에서 요청받은 회원정보를 담을 memberBean객체를 전달하여 DB작업
	int join = memberdao.insertMember(memberbean);
	
	//5. 회원가입에 성고했다면 login.jsp로 이동
	if(join == 1){
		response.sendRedirect("member_joinComp.jsp");
	} else{
		%>
		<script>
			alert("회원가입에 실패하였습니다. \n이전 화면으로 돌아갑니다.");
			history.back();
		//	location.href('../../index.jsp');
		</script>
		<%
	}
		
%>


