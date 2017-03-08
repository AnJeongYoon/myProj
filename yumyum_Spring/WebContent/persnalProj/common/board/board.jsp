<%@page import="java.util.Date"%>
<%@page import="board.Board2DAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//DB작업 객체 생성
	Board2DAO board2DAO = new Board2DAO();

	//전체 글 갯수
	int count = board2DAO.getBoardCount();
	//System.out.println(count);
	
	//하나의 화면마다 보여줄 글 개수
	int pageSize = 3;
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
	// 게시판 글객체(BoardBean)를 저장하기 위한 용도
	List<BoardBean> list = null;
	
	//만약 게시판에 글이 있다면?
	if(count > 0){
		//글 목록 가져오기
		//getBoardList(각 페이지마다 맨 위에 첫번째로 보여질 시작 글번호, 한페이지당 보여줄 글 개수)
		list = board2DAO.getBoardList(startRow, pageSize);
	}
	//날짜 포맷
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<jsp:include page="../sub_header.jsp" />
    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header subImg05">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>Review</h1>
                        <h3>이용후기를 남겨주세요.</h3>
                        <hr class="intro-divider">
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.intro-header -->
    
    <div class="container">
     	<div class="boardWrap">
     		<div class="boardBtn">
	     		<select>
	     			<option>제목</option>
	     			<option> | 작성자</option>
	     			<option>아이디</option>
	     		</select>
	     		<input type="text" id="searchTxt" name="seatchTxt" />
	     		<input type="button" id="searchBtn" name="searchBtn" value="검색" onclick="" />
	     		<% String id = (String)session.getAttribute("user_id");
	     		BoardBean bean = new BoardBean();
				if(id != null){ %>
	     		<input type="button" id="writeBtn" name="writeBtn" value="글쓰기" onclick="location.href='boardWrite.jsp?no=<%=bean.getNo()%>&pageNum=<%=pageNum%>'" />
	     		<% } %>
     		</div>
     		
     		<% //만약 게시판 글 갯수가 존재하고 (게시판에 글이 있다면)
			if(count > 0){
				for(int i = 0; i < list.size(); i++){
				BoardBean bBean = list.get(i);
			%>
     		<div class="letterWrap">
     			<div class="lHead">
     				<span>
     					<%
	     					if(bBean.getSubject().length() > 20){
	     						String subject = bBean.getSubject().substring(0, 20);
	     						%><%=subject %>...<%
	     					} else {
	     						%><%=bBean.getSubject() %><%
	     					}
	     				%>
	     				<% Date today = new Date();
							if(sdf.format(bBean.getReg_date()).equals(sdf.format(today))){
								String newIcon = "<img src='../../img/new.png' alt='new' />";
								%><%=newIcon%><%
							} else {
								String newIcon = "";
								%><%=newIcon%><%
							}
						%>
     				</span>
     				<span>| 작성자: <%=bBean.getUser_name() %></span>
     				<span><%=sdf.format(bBean.getReg_date()) %></span>
     			</div>
     			<div class="letterCont">
     				<img src="http://placehold.it/300x150" /><br>
     				<%=bBean.getContent() %>
     			</div>
     			
     			<!-- 작성자id와 세션 id가 같을때! -->
     			<div class="btn">
	     			<a href="#" id="updateBtn" name="updateBtn">수정</a> | 
	     			<a href="#" id="delBtn" name="delBtn">삭제</a>
     			</div>
     			
     			<div class="commentWrap">
	    		<%-- boardNo에 대한 댓글 개수가 0보다 크면 나옴
	    		 if() --%>
	   				<div class="commentCount"><a href="#">댓글 1개</a></div><%-- count --%>
	   				<div class="comment">
	   					<span>관리자</span><%-- 유저네임 --%>
	   					<p>감사합니다^^</p><%-- 댓글내용 --%>
	   				</div>
	   				<div class="commentWrite">
	   					<input type="text" id="comment" name="comment" />
	   					<input type="button"  id="cWriteBtn" name="cWriteBtn" value="댓글쓰기" />
	   				</div>
	   			</div>
	   			
     		</div>
	   			<% } %>
			<% } else { %>
			<div class="letterWrap">
     			<div class="lHead">
     				<h3>등록된 게시물이 없습니다.</h3>
     			</div>
     		</div>
     		<% } %>
     		
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