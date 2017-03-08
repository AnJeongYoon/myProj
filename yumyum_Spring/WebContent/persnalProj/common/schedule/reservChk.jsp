<%@page import="reservation.reservBean"%>
<%@page import="reservation.reservDAO"%>
<%@page import="member.memberBean"%>
<%@page import="member.MemberDao"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDao dao = new MemberDao();
	reservDAO rDao = new reservDAO();
	
	String user_id = (String)session.getAttribute("user_id");
	int no = Integer.parseInt(request.getParameter("no"));

	//세션값이 있으면 글작성 가능
	if(user_id != null){
		
	memberBean mBean = dao.getMember(user_id);
	reservBean rBean = rDao.getReserv3(user_id, no);
	
	String[] numArray = rBean.getPhoneNum1().split("-");
	String[] timeArray = rBean.getReservTime1().split(":");

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
    
	<%@ include file="cal.jsp" %>
		<div class="reserveWrap">
			<div class="calTitle">
		    	<h3>예약수정</h3> 
			</div>
			<form action="rUpdateProc.jsp" method="post">
			<input type="hidden" name="no" value="<%=rBean.getNo()%>">
	        <table name="reservation" id="reservation">
		        <tr>
		            <th>예약자명</th>
		            <td><%=mBean.getUser_name() %></td>
		        </tr>
		        <tr>
		            <th>예약자 번호</th>
		            <td>
						<select id="phoneNum1" name="phoneNum1">
							<option value="<%=numArray[0]%>"><%=numArray[0]%></option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
						</select>&nbsp;&nbsp;-&nbsp;
						<input type="text" id="phoneNum2" name="phoneNum2" value="<%=numArray[1]%>" />&nbsp;&nbsp;-&nbsp;
						<input type="text" id="phoneNum3" name="phoneNum3" value="<%=numArray[2]%>" />
					</td>
		        </tr>
		        <tr>
		            <th>날짜</th>
		            <td>
						<select id="reservY" name="reservY">
					      	<option value="<%=rBean.getReservY()%>"><%=rBean.getReservY()%></option>
							<% 
							Calendar currentCalendar = Calendar.getInstance();
							String nowYear = Integer.toString(currentCalendar.get(Calendar.YEAR));
							int maxYear = Integer.parseInt(nowYear) + 2;
							for (int i = Integer.parseInt(nowYear); i < maxYear; i++) { 
							%>
					      	<option value="<%=i%>"><%=i%></option>
					      	<% } %>
						</select>년&nbsp;
						<select id="reservM" name="reservM">
					      	<option value="<%=rBean.getReservM()%>"><%=rBean.getReservM()%></option>
							<% 
							int nowMonth = currentCalendar.get(Calendar.MONTH);
							for (int i = nowMonth; i <= 12; i++) { %>
					      	<option value="<%=i%>"><%=i%></option>
					      	<% } %>
						</select>월&nbsp;
						<select id="reservD" name="reservD">
					      	<option value="<%=rBean.getReservD()%>"><%=rBean.getReservD()%></option>
							<% int nowDay = currentCalendar.get(Calendar.DAY_OF_MONTH);
							for (int i = nowDay; i <= 31; i++) { %>
					      	<option value="<%=i%>"><%=i%></option>
					      	<% } %>
						</select>일
					</td>
		        </tr>
		        <tr>
		            <th>예약시간</th>
		            <td>
		            	<select id="reservTime1" name="reservTime1">
					      	<option value="<%=timeArray[0]%>"><%=timeArray[0]%></option>
							<% for (int i = 10; i <= 20; i++) { %>
					      	<option value="<%=i%>"><%=i%></option>
					      	<% } %>
						</select>시
						<select id="reservTime2" name="reservTime2">
					      	<option value="<%=timeArray[1]%>"><%=timeArray[1]%></option>
					      	<option value="00">00</option>
					      	<option value="30">30</option>
						</select>분
		            </td>
		        </tr>
		        <tr>
		            <th>인원수</th>
		            <td>
		            	<select id="peopleCnt" name="peopleCnt">
		            		<option value="<%=rBean.getPeopleCnt()%>"><%=rBean.getPeopleCnt()%></option>
							<% for (int i = 1; i <= 20; i++) { %>
					      	<option value="<%=i%>"><%=i%></option>
					      	<% } %>
						</select>명
						<label>* 예약인원은 최대 20명입니다.</label>
		            </td>
		        </tr>
		        <tr>
		            <th>추가사항</th>
		            <td>
		            	<input type="text" name="reservContent" id="reservContent" />
		            </td>
		        </tr>
		        <tr>
					<td colspan="2">
						<input type="submit" id="reservBtn" value="수정하기" />
						<input type="button" id="cancelBtn" value="취소" onclick="history.go(-1);" />
					</td>
				</tr>
		     </table>
		     </form>
		</div>
	</div>
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