<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<%
		    Calendar cal = Calendar.getInstance();
		    int year = request.getParameter("y") == null ? cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("y"));
		    int month = request.getParameter("m") == null ? cal.get(Calendar.MONTH) : (Integer.parseInt(request.getParameter("m")) - 1);
		
		    // 시작요일 확인
		    // - Calendar MONTH는 0-11까지임
		    cal.set(year, month, 1);
		    int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);
		
		    // 다음/이전월 계산
		    // - MONTH 계산시 표기월로 계산하기 때문에 +1을 한 상태에서 계산함
		    int prevYear = year;
		    int prevMonth = (month + 1) - 1;
		    int nextYear = year;
		    int nextMonth = (month  + 1) + 1;
		
		    // 1월인 경우 이전년 12월로 지정
		    if (prevMonth < 1) {
		        prevYear--;
		        prevMonth = 12;
		    }
		
		    // 12월인 경우 다음년 1월로 지정
		    if (nextMonth > 12) {
		        nextYear++;
		        nextMonth = 1;
		    }
		%>