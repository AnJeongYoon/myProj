<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
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

	//세션값이 있으면 글작성 가능
	if(user_id != null){
	
	//전체 글 갯수
	int count = rDao.getreservCount(user_id);

	//하나의 화면마다 보여줄 글 개수
	int pageSize = 10;
	//현재 보여질(선택한) 페이지 번호 가져오기.
	String pageNum = request.getParameter("pageNum");
	//현재 보여질(선택한) 페이지번호가 없으면 1페이지 처리
	if(pageNum == null){
		pageNum = "1";
	}
	/* 현재 보여질(선택한) 페이지번호 "1"을 ->기본정수 1로 변경 */
	int currentPage = Integer.parseInt(pageNum);
	
	/* 각 페이지 마다 맨 위에 첫번째로 보여질 시작 글 번호 구하기 */
	//(현재 보여질 페이지번호 -1)*한페이지당 보여줄 글 갯수 15
	int startRow = (currentPage-1)*pageSize;
	
	List<reservBean> list = null;
	
	//만약 게시판에 글이 있다면?
	if(count > 0){
		//글 목록 가져오기
		//getBoardList(각 페이지마다 맨 위에 첫번째로 보여질 시작 글번호, 한페이지당 보여줄 글 개수)
		list = rDao.getReservList(startRow, pageSize, user_id);
	}
		
	memberBean mBean = dao.getMember(user_id);
	reservBean rBean = rDao.getReserv(user_id);
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
    
		<div class="reserveWrap">
			<div class="calTitle">
		    	<h3>예약확인</h3> 
			</div>
			
			<table class="reserveList">
     		<tr>
     			<th>번호</th>
     			<th>예약자명</th>
     			<th>총 인원</th>
     			<th>예약날짜</th>
     			<th>예약시간</th>
     			<th>기타요청사항</th>
     			<th>예약상태</th>
     		</tr>
     		<% //만약 게시판 글 갯수가 존재하고 (게시판에 글이 있다면)
			if(count > 0){
				for(int i = 0; i < list.size(); i++){
				reservBean reservBean = list.get(i);
				
				int listNum = count-startRow-i;
			%>
     		<tr>
     			<td><%=listNum %></td>
     			<td><%=reservBean.getUser_name() %></td>
     			<td><%=reservBean.getPeopleCnt() %></td>
     			<td><%=reservBean.getReservY() %>년 <%=reservBean.getReservM() %>월 <%=reservBean.getReservD() %>일</td>
     			<td><%=reservBean.getReservTime1() %></td>
     			<td>
     				<% if(reservBean.getReservContent() == null){ %>
     					없음
     				<% } else { %>
     				<%=reservBean.getReservContent() %>
     				<% } %>
     			</td>
     			<td>
     				<!-- 
     				예약상태0 == 예약취소
     				예약상태(예약날짜 < 오늘날짜) == 예약일 지남(후기게시판 이동 버튼)
     				예약상태1 == 예약완료
     				 -->
     				 <% Date bToday = new Date();
     				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
     				String rDay = Integer.toString(reservBean.getReservY())+String.format("%02d", reservBean.getReservM())+String.format("%02d", reservBean.getReservD());
     				
     				 if(reservBean.getState() == 0){ %>
     				 	취소
     				 <% } else if(Integer.parseInt(rDay) < Integer.parseInt(sdf.format(bToday))){ %>
     				 	<input type="button" name="goReview" id="goReview" value="후기작성하기" onclick="location.href='../board/board.jsp'" />
     				 <% } else if(reservBean.getState() == 1){ %>
	     				 예약완료<br>
	     				 <input type="button" name="rUpdate" id="rUpdate" value="예약수정" onclick="location.href='reservChk.jsp?no=<%=reservBean.getNo() %>'" />
	     				 <input type="button" name="rCancel" id="rCancel" value="예약취소" onclick="location.href='rCancel.jsp?no=<%=reservBean.getNo() %>'" />
     				 <% } %>
     			</td>
     		</tr>
     		<% }
			} else { %>
     			<td colspan="6">예약 내역이 없습니다.</td>
     		<% } %>
     		</table>
	        
		</div>
		
		<div class="pageWrap">
    	<div class="page">
    		<%
				if(count > 0){
					//전체 페이지수 구하기 글 20개 한페이지에 보여질 글 수 10개 ->2페이지
					//			        글 25개 한 페이지에 보여질 글 수 10개 -> 3페이지
					//			        조건(삼항)연산자	 조건?참:거짓
					//전체페이지수 = 전체글개수/한페이지에 보여줄 + 글 수 + (전체글수를 한페이지에 보여줄 글 수로 나눈 나머지 값)
					int pageCount = count/pageSize + (count%pageSize == 0? 0:1);
					//한화면(한블럭)에 보여줄 페이지수 설정
					int pageBlock = 1;
					/* 시작페이지 번호 구하기 */
					//1~10 -> 1, 11~20 -> 11, 21~30 -> 21
					// ((현재 보여질(선택한)페이지번호/한화면(한블럭)에 보여줄 페이지수) - (현재 보여질(선택한)페이지 번호를 한화면에 보여줄 페이지수로 나눈 나머지 값))
					// * 한화면(한블럭)에 보여줄 페이지수 + 1
					int startPage = ((currentPage/pageBlock)-(currentPage%pageBlock == 0 ? 1:0)) * pageBlock + 1;
					
					//끝페이지 번호 구하기 1~10 -> 10, 11~20->20, 21~30->30
					//시작페이지 번호 + 현재 블럭에 보여줄 페이지수 -1
					int endPage = startPage + pageBlock - 1;
					
					//끝페이지 번호가 전체 페이지수보다 클 때
					if(endPage > pageCount){
						//끝페이지번호를 전체페이지수로 저장
						endPage = pageCount;
					}
					
					//[이전] 시작페이지 번호가 한화면에 보여줄 페이지수보다 클때
					if(startPage > pageBlock){
						%><div class="prev"><a id="link" href="notice.jsp?pageNum=<%=startPage-pageBlock%>"><</a></div><%
					}
					//[1][2][3]...[10]
					for(int i = startPage; i <= endPage; i++){
						%><div class="pageNum"><a id="link" href="notice.jsp?pageNum=<%=i%>"><%=i%></a></div><%
					}
					//[다음] 끝페이지 번호가 전체 페이지 수 보다 작을때
					if(endPage < pageCount){
						%><div class="next"><a id="link" href="notice.jsp?pageNum=<%=startPage+pageBlock%>">></a></div><%
					}
				}
			%>
    	</div>
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