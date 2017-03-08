<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="reservation.reservBean"%>
<%@page import="member.memberBean"%>
<%@page import="reservation.reservDAO"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="cal.jsp" %>
<%
	MemberDao dao = new MemberDao();
	reservDAO rDao = new reservDAO();
	
	//전체 글 갯수
	int reservCount = rDao.getreservCount2();
	
	List<reservBean> rList = null;
	
	//만약 게시판에 글이 있다면?
	if(reservCount > 0){
		//글 목록 가져오기
		//getBoardList(각 페이지마다 맨 위에 첫번째로 보여질 시작 글번호, 한페이지당 보여줄 글 개수)
		rList = rDao.getReservList2();
	}
	
	//날짜 포맷
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
%>
<div class="row">
	<div class="col-lg-5 col-lg-offset-1 col-sm-push-6  col-sm-6">
		<div class="main_reserve">
			<div class="cal_title">
				<a href="./index.jsp?y=<%=prevYear%>&m=<%=prevMonth%>#reserve"><</a> 
					<h3><%=year%>년 <%=month+1%>월</h3> 
				<a href="./index.jsp?y=<%=nextYear%>&m=<%=nextMonth%>#reserve">></a>
			</div>
			<% int reservYear = year;
				int reservMonth = month+1;
			reservBean rBean = rDao.getReserv2(reservYear, reservMonth);
			%>
			<table id="reserveTbl">
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
				
				  while (cal.get(Calendar.MONTH) == month) {
					  %>
						<td>
							<dl>
								<dt>
									<font id="calNum" 
								<% String today = year+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DATE);
								if(reservCount > 0){
				        			for(int i = 0; i < rList.size(); i++){
				        			reservBean resBean = rList.get(i);	
				        			String rDay = resBean.getReservY()+"-"+resBean.getReservM()+"-"+resBean.getReservD();
				        				if(today.equals(rDay)){
						        		%>class="reserv"<% }
									}
				        		}
				        		%>>
										<%=cal.get(Calendar.DATE) %>
									</font>
								</dt>
							</dl>
						</td>
						<%
				      // 토요일인 경우 다음줄로 생성
				      if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) out.println("</tr><tr>");
				
				      // 날짜 증가시키지
				      cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1);
				  }
				
				  // 끝날부터 토요일까지 빈칸으로 처리
				  for (int i=cal.get(Calendar.DAY_OF_WEEK); i<=7; i++) out.println("<td>&nbsp;</td>");
				%>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="col-lg-5 col-sm-pull-6  col-sm-6">
		<div class="today_reserve">
			<h3>오늘의 예약</h3>
			<input type="button" name="goReservation" id="goReservation" value="예약하기" onclick="location.href='common/schedule/reservation.jsp'" />
			<table class="todayReserve">
				<tr>
					<th>예약자명</th>
					<th>총 인원</th>
					<th>예약시간</th>
				</tr>
				<%  
				for(int i = 0; i < rList.size(); i++){
        		reservBean resBean = rList.get(i);	
        		String rDay = resBean.getReservY()+"-"+String.format("%02d", resBean.getReservM())+"-"+String.format("%02d", resBean.getReservD());
				
				 Date rToday = new Date();
				 String[] ReservTimeArray = rBean.getReservTime1().split(":");

				if(rDay.equals(sdf1.format(rToday))){
				if(reservCount > 0){
					StringBuffer sb = new StringBuffer(rBean.getUser_name());
				%>
				<tr>
					<td><%=sb.replace(1, 2, "*") %> 님</td>
					<td><%=rBean.getPeopleCnt() %>명</td>
					<td><%=ReservTimeArray[0]%>시 <%=ReservTimeArray[1]%>분</td>
				</tr>
				<%  }
				} else { %>
				<tr>
					<td colspan="3">오늘의 예약이 없습니다.</td>
				</tr>
				<%  } 
				}
				%>
			</table>
		
		</div>
	</div>
</div>