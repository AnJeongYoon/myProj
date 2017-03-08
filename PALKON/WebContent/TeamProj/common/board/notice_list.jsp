<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Notice.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
<!-- 신상품, 구매순... 정렬 하기 -->
 function search(){ 
// 	alert(document.getElementById('keyField').value);
	var searchField = document.getElementById('searchField').value;
	document.getElementById('serkey').value = searchField;
 	document.search.sumbit(); 
} 
 

</script>  

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>





<%
// request.setAttribute("count", count); //모든속성저장 Integer -> Object형저장
// request.setAttribute("boardList", boardList); // List -> Object 저장
// request.setAttribute("pageNum", pageNum); //String -> Object 저장
// request.setAttribute("pageCount", pageCount);
// request.setAttribute("pageBlock", pageBlock);
// request.setAttribute("startPage", startPage);
// request.setAttribute("endPage", endPage);
int count=((Integer)request.getAttribute("count")).intValue();
List<NoticeDTO> noticeList = (List<NoticeDTO>)request.getAttribute("noticeList");
String pageNum=(String)request.getAttribute("pageNum");
int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
int startPage=((Integer)request.getAttribute("startPage")).intValue();
int endPage=((Integer)request.getAttribute("endPage")).intValue();

%>

<div class="title-wrapper">
  <div class="container">
  <div class="container-inner">
	<h1><span>NOTICE</span></h1>
	<em class="catetitle">공지사항 게시판입니다.</em>
  </div>
  </div>
</div>

<div class="main">
   <div class="container">
      <div class="board_wrap">
         <!-- 게시판 목록 -->
<!--          <h4>NOTICE 게시판 입니다</h4> -->
         <table class="board">
            <colgroup>
                 <col width="5%">
                 <col width="40%">
                 <col width="10%">
                 <col width="15%">
                 <col width="5%">
              </colgroup>
              
              <tr>
                 <th>번호</th>
                 <th>제목</th>
                 <th>작성자</th>
                 <th>작성일</th>
                 <th>조회수</th>
              </tr>
              
              
           
             <%
             if(count!=0){
             for(int i=0;i<noticeList.size();i++){
                NoticeDTO nd=noticeList.get(i);
             %>
              <tr onclick="location.href='/projectTForgit/notice_content.no?num=<%=nd.getNotice_num()%>&pageNum=<%=pageNum%>'">
              
              
                 <td><%=nd.getNotice_num() %></td>
                 <td class="title"><%=nd.getNotice_subject()%></td>
                 <td><%=nd.getNotice_name()%></td>
                 <td><%=nd.getDate()%></td>
                 <td><%=nd.getReadcount() %></td>
              </tr>
                 <%
                   }
                }else{
                %>
                <tr>
                 <td colspan="6">등록된 게시물이 없습니다.</td>
                 </tr>
                <%}%>
              
         </table>
         <!-- 게시판 목록 -->
         
         
         <!-- 검색 -->
         <div class="boardBtn">
              <form action="./notice_list_search.no" name="search" method="post">
                  <input type="hidden" id="serkey" name="serkey">
                 <select id="searchField" name="searchField" onchange="submit()">
                    <option value="notice_subject">제목</option>
                    <option value="notice__name">작성자</option>
                 </select>
                 <input type="text" id="searchText" name="searchText" />
                 <input type="submit" id="searchBtn" name="searchBtn" value="검색"/>
                <c:if test="${requestScope.id== 'admin' }">
                 <input type="button" id="writeBtn" name="writeBtn" value="글쓰기" onclick="location.href='../notice_write.no'"/>
                </c:if>
              
              </form>
           </div>
           <!-- 검색 -->
           
            <!-- BEGIN PAGINATOR -->
             
            <div class="row"> 
			<%
			if(count!=0){
			%>
			<div class="col-md-8 col-sm-8">
				<ul class="pagination pull-right">
			<%	
				if(startPage > pageBlock){
			%><li><a href="/projectTForgit/notice_list.no?pageNum=<%=startPage-pageBlock%>">&laquo;</a></li><%
				}
				for(int i=startPage;i<=endPage;i++){
			%><li><a href="/projectTForgit/notice_list.no?pageNum=<%=i%>"><%=i %></a></li><%
				}
				if(endPage < pageCount){
			%><li><a href="/projectTForgit/notice_list.no?pageNum=<%=startPage+pageBlock%>">&raquo;</a></li><%
				}
			}
			%>
				</ul>
			</div>
      </div>
            <%-- <div class="row"> 
      
              <!-- 페이징 -->
              <c:if test="${count!=0}">
              <div class="col-md-8 col-sm-8">
            
                <ul class="pagination pull-right">
                
                 <c:if test="${startPage>pageBlock}">
                  <li><a href="../notice_list.no?pageNum=${startPage-pageBlock}">&laquo;</a></li>
                  </c:if>
               
                  <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1" >
                  <li><a href="../notice_list.no?PageNum=${i}">${i}</a></li>
                  </c:forEach>
                                    
                  <c:if test="${startPage<pageBlock}">
                  <li><a href="../notice_list.no?PageNum=${startPage+pageBlock}">&raquo;</a></li>
                  </c:if>
                  
                </ul>
   
              </div>
              </c:if>
            </div> --%>
            
            <!-- END PAGINATOR -->
      </div>
   </div>
</div>