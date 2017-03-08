<%@page import="Qna.QnaDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<%
// request.setAttribute("count", count); //���Ӽ����� Integer -> Object������
// request.setAttribute("boardList", boardList); // List -> Object ����
// request.setAttribute("pageNum", pageNum); //String -> Object ����
// request.setAttribute("pageCount", pageCount);
// request.setAttribute("pageBlock", pageBlock);
// request.setAttribute("startPage", startPage);
// request.setAttribute("endPage", endPage);
int count=((Integer)request.getAttribute("count")).intValue();
List<QnaDTO> boardList=(List<QnaDTO>)request.getAttribute("boardList");
String pageNum=(String)request.getAttribute("pageNum");
int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
int startPage=((Integer)request.getAttribute("startPage")).intValue();
int endPage=((Integer)request.getAttribute("endPage")).intValue();
%>

<div class="title-wrapper">
  <div class="container">
  <div class="container-inner">
	<h1><span>FAQ&A</span></h1>
	<em class="catetitle">��ǰ���� �Խ����Դϴ�.</em>
  </div>
  </div>
</div>


<div class="main">
   <div class="container">
      <div class="board_wrap">
         <!-- �Խ��� ��� -->
         <h4>Q&A ���� �Խ��� �Դϴ�</h4>
         <table class="board">
            <colgroup>
                 <col width="10%">
                 <col width="55%">
                 <col width="10%">
                 <col width="10%">
                 <col width="10%">
              </colgroup>
              
              <tr>
                 <th>��ȣ</th>
                 <th>����</th>
                 <th>�ۼ���</th>
                 <th>�ۼ���</th>
                 <th>��ȸ��</th>
              </tr>
              
              
           
               <%
             if(count!=0){
             for(int i=0;i<boardList.size();i++){
                QnaDTO qd=boardList.get(i);
             %>
              <tr onclick="location.href='../qna_contentck.br?num=<%=qd.getQna_num()%>&pageNum=<%=pageNum%>'">
              
               <td><%=qd.getQna_num() %></td>
               <td class="title">
               <%
		 		int wid = 0;
	 			if(qd.getQna_lev() > 0){
		 			wid = qd.getQna_lev() * 10;
		 		%>
		 		<img src="assets/img/level.png" width="<%=wid%>">
			 	
			 	<%
			 		}
			 	%>
               
               <%=qd.getQna_subject()%></td>
                 <td><%=qd.getQna_name()%></td>
                 <td><%=qd.getDate() %></td>
                 <td><%=qd.getRedcount() %></td>
              </tr>
                 <%
                   }
                }else{
                %>
                <tr>
                 <td colspan="6">��ϵ� �Խù��� �����ϴ�.</td>
                 </tr>
                 <%} %>
              
         </table>
         <!-- �Խ��� ��� -->
         
         
         <!-- �˻� -->
         <div class="boardBtn">
              <form action="../qna_list_search.br" name="search" method="post">
                 <select id="searchField" name="search">
                    <option value="subject">����</option>
                    <option value="user_name">�ۼ���</option>
                    <option value="user_id">���̵�</option>
                 </select>
                 <input type="text" id="searchText" name="searchText" />
                 <input type="submit" id="searchBtn" name="searchBtn" value="�˻�"/>
                 <input type="button" id="writeBtn" name="writeBtn" value="�۾���" onclick="location.href='../qna_write.br'"/>
            
              </form>
           </div>
           <!-- �˻� -->
           
           <%-- <!-- BEGIN PAGINATOR -->
            <div class="row"> 
      
              <!-- ����¡ -->
              <c:if test="${count!=0}">
              <div class="col-md-8 col-sm-8">
            
                <ul class="pagination pull-right">
                
                 <c:if test="${startPage>pageBlock}">
                  <li><a href="/projectTForgit/qna_list.br?pageNum=${startPage-pageBlock}">&laquo;</a></li>
                  </c:if>
               
                  <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1" >
                  <li><a href="/projectTForgit/qna_list.br?PageNum=${i}">${i}</a></li>
                  </c:forEach>
                                    
                  <c:if test="${startPage<pageBlock}">
                  <li><a href="/projectTForgit/qna_list.br?PageNum=${startPage+pageBlock}">&raquo;</a></li>
                  </c:if>
                  
                </ul>
   
              </div>
              </c:if>
            </div>
            <!-- END PAGINATOR -->  --%>
            
            <div class="row"> 
			<%
			if(count!=0){
			%>
			<div class="col-md-8 col-sm-8">
				<ul class="pagination pull-right">
			<%	
				if(startPage > pageBlock){
			%><li><a href="/projectTForgit/qna_list.br?pageNum=<%=startPage-pageBlock%>">&laquo;</a></li><%
				}
				for(int i=startPage;i<=endPage;i++){
			%><li><a href="/projectTForgit/qna_list.br?pageNum=<%=i%>"><%=i %></a></li><%
				}
				if(endPage < pageCount){
			%><li><a href="/projectTForgit/qna_list.br?pageNum=<%=startPage+pageBlock%>">&raquo;</a></li><%
				}
			}
			%>
				</ul>
			</div>
      </div>
   </div>
</div>