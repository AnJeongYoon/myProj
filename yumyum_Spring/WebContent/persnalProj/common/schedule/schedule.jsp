<%@page import="java.util.List"%>
<%@page import="reservation.reservBean"%>
<%@page import="member.memberBean"%>
<%@page import="reservation.reservDAO"%>
<%@page import="member.MemberDao"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDao dao = new MemberDao();
	reservDAO rDao = new reservDAO();	
	
	//전체 글 갯수
	int count = rDao.getreservCount2();
	
	List<reservBean> list = null;
	
	//만약 게시판에 글이 있다면?
	if(count > 0){
		//글 목록 가져오기
		//getBoardList(각 페이지마다 맨 위에 첫번째로 보여질 시작 글번호, 한페이지당 보여줄 글 개수)
		list = rDao.getReservList2();
	}
%>
<jsp:include page="../sub_header.jsp" />
<!-- Header -->
<a name="about"></a>
<div class="intro-header subImg03">
	<div class="container">

		<div class="row">
			<div class="col-lg-12">
				<div class="intro-message">
					<h1>Schedule</h1>
					<h3>원하시는 날짜와 시간에 예약할 수 있습니다.</h3>
					<hr class="intro-divider">
				</div>
			</div>
		</div>

	</div>
	<!-- /.container -->

</div>
<!-- /.intro-header -->

<div class="container">
	<div class="reservation">
		<aside>
			<div class="reservMenu">
				<a href="schedule.jsp" id="reservCal">예약일정</a> 
				<a href="reservation.jsp" id="reservation">예약하기</a> 
				<a href="reservList.jsp" id="reservChk">예약확인</a>
			</div>
		</aside>

		<%@ include file="cal.jsp"%>
		<div class="reserveWrap">
			<div class="calTitle">
				<a href="./schedule.jsp?y=<%=prevYear%>&m=<%=prevMonth%>"><</a>
				<h3><%=year%>년 <%=month+1%>월</h3>
				<a href="./schedule.jsp?y=<%=nextYear%>&m=<%=nextMonth%>">></a>
			</div>
			<% int reservYear = year;
				int reservMonth = month+1;
			reservBean rBean = rDao.getReserv2(reservYear, reservMonth);
			%>
			<table name="reserveTbl" id="reserveTbl">
				<tr>
					<th>일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
				<tr>
					<%
			    // 시작요일까지 이동
			    for (int i=1; i<bgnWeek; i++){
			    	 %><td>&nbsp;</td><%
			    }
			
			    // 첫날~마지막날까지 처리
			    // - 날짜를 하루씩 이동하여 월이 바뀔때까지 그린다
			    while (cal.get(Calendar.MONTH) == month) {
			        %>
					<td>
						<dl>
							<dt>
								<font id="calNum"><%=cal.get(Calendar.DATE) %></font>
							</dt>
							<% String today = year+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DATE);
				        		if(count > 0){
				        			for(int i = 0; i < list.size(); i++){
				        			reservBean resBean = list.get(i);	
				        			String rDay = resBean.getReservY()+"-"+resBean.getReservM()+"-"+resBean.getReservD();
				        				if(today.equals(rDay)){
				        				StringBuffer sb = new StringBuffer(resBean.getUser_name());
				        	%>
							<dt>
								<%=sb.replace(1, 2, "*") %>님
								<%=resBean.getReservTime1() %>예약
							</dt>
							<%
				        				}
									}
								} 
							
							%>
						</dl>
					</td>
					<%
			        // 토요일인 경우 다음줄로 생성
			        if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) {
			        	%>
				</tr>
				<tr>
					<%
			        }
			
			        // 날짜 증가
			        cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1);
			    }
			
			    // 끝날부터 토요일까지 빈칸으로 처리
			    for (int i=cal.get(Calendar.DAY_OF_WEEK); i<=7; i++) {
			    	%><td>&nbsp;</td><%
			    }
			%>
				</tr>
			</table>
		</div>
	</div>
</div>


<jsp:include page="../sub_footer.jsp" />