<%@page import="Qna.QnaDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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


<div class="main">
	<div class="container">
		<div class="board_wrap">
			<!-- �Խ��� ��� -->
			<h4>Q&A ��ǰ���� �Խ��� �Դϴ�</h4>
			<table class="board">
				<colgroup>
	     			<col width="5%">
	     			<col width="20%">
	     			<col width="40%">
	     			<col width="10%">
	     			<col width="10%">
	     			<col width="10%">
	     		</colgroup>
	     		<tr>
	     			<th>��ȣ</th>
	     			<th>��ǰ����</th>
	     			<th>����</th>
	     			<th>�ۼ���</th>
	     			<th>�ۼ���</th>
	     			<th>��ȸ��</th>
	     		</tr>
	     		
	     		 <%
		    	if(count==0){
		    	%>
	     		<tr>
	     			<td colspan="6">��ϵ� �Խù��� �����ϴ�.</td>
	     		</tr>
	     		<%
		    	}else{
		    	for(int i=0;i<boardList.size();i++){
		    		QnaDTO qd=boardList.get(i);
    			%>
	     		<tr onclick="location.href='./QnaContent.br?num=<%=qd.getQna_num()%>&pageNum=<%=pageNum%>'">
	     			<td><%=qd.getQna_num() %></td>
	     			<td><img src="http://placehold.it/30x30" /> LO-1015 BR (BROWN)</td>
					<td class="left"><%
					 int wid=0;
					 if(qd.getQna_lev()>0){
						 wid=qd.getQna_lev()*10;
						 %>
						 <img src="" width="<%=wid%>">
						 <img src="">
						 <%
					 }
					 %><%=qd.getQna_subject() %></td>
	     			<td><%=qd.getQna_name()%></td>
	     			<td><%=qd.getDate() %></td>
	     			<td><%=qd.getRedcount() %></td>
	     		</tr>
	     			<%
				    	}
				    }
				    %>
	     		
			</table>
			<!-- �Խ��� ��� -->
			
			
			<!-- �˻� -->
			<div class="boardBtn2">
	     		<form action="../qna_list_search.br" name="search" method="post">
		     		<select id="searchField" name="searchField">
		     			<option value="subject">����</option>
		     			<option value="user_name">�ۼ���</option>
		     			<option value="user_id">���̵�</option>
		     		</select>
		     		<input type="text" id="searchText" name="searchText" />
		     		<input type="submit" id="searchBtn" name="searchBtn" value="�˻�"/>
		     		<% 
					String id=(String)session.getAttribute("id");
					if(id!=null){
					%>
		     		<input type="button" id="writeBtn" name="writeBtn" value="�۾���" onclick="location.href='./qna_write.br'"/>
		     		<% 
					}		     	
		     		%>
		     	
		     	</form>
	     	</div>
	     	<!-- �˻� -->
	     	
	     	<!-- BEGIN PAGINATOR -->
            <div class="row">
              <div class="col-md-4 col-sm-4 items-info">Items 1 to 9 of 10 total</div>
              <div class="col-md-8 col-sm-8">
                <ul class="pagination pull-right">
                  <li><a href="javascript:;">&laquo;</a></li>
                  <li><a href="javascript:;">1</a></li>
                  <li><span>2</span></li>
                  <li><a href="javascript:;">3</a></li>
                  <li><a href="javascript:;">4</a></li>
                  <li><a href="javascript:;">5</a></li>
                  <li><a href="javascript:;">&raquo;</a></li>
                </ul>
              </div>
            </div>
            <!-- END PAGINATOR -->
		</div>
	</div>
</div>