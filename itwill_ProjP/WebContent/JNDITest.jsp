<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<h1>JNDI 설정 테스트</h1>
<%
	Connection conn = null;
	try{
		/**** JNDI(Java Name and Directory Interface) ****/
		// Tomcat(웹서버)의 context.xml파일에 설정을 통해 데이터소스(커넥션풀)을 웹서버에 미리 만들어 놓으면 커넥션 풀을 사용하기 위해
		// 웹서버 내부의 커넥션 풀에 디렉토리 기반의 접근을 위한 기술
		
		//1. 웹서버와 연결된 DBApp웹프로젝트의 모든 정보를 가지고 있는 컨텍스트 객체 생성
		Context init = new InitialContext();
		
		//2. 연결된 웹서버에서 DataSource(커넥션풀) 검색해서 가져오기
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		
		//3. 커넥션풀에서 DB연동객체 가져오기
		conn = ds.getConnection();	//DB연결
		
		if(conn != null){
			out.println("연결성공");
		}		
	}catch(Exception err){
		err.printStackTrace();
	}

%>

</body>
</html>