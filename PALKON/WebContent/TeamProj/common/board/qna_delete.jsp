<%@page import="Qna.QnaDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String id=(String)session.getAttribute("id");
if(id==null){
	response.sendRedirect("/LogServlet.mr");
}
String pageNum=request.getParameter("pageNum");
int num = Integer.parseInt(request.getParameter("num"));
%>





<div class="main">
	<div class="container">
	<div class="col-md-12 col-sm-12">
            <h1>Q&A 글삭제</h1>
            <div class="content-form-page">
              <form action="../qna_delete_action.br?pageNum=<%=pageNum %>" method="post" class="form-horizontal form-without-legend" id="form" name="f">
               
               <input type="hidden" name="num" value="<%=num%>"> 
               
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="id">아이디<span class="require">*</span></label>
                  <div class="col-lg-8">
                 <%=id %>
                    <div class="console"></div>
                  </div>
                </div>
                 
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="pass">비밀번호<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="password" id="pass" name="pass" placeholder="비밀번호를 입력해주세요" class="form-control" onkeyup="passCheck()">
                  </div>
                </div>
                
                
				<!-- 버튼 -->
	            <div class="boardBtn2">
                 	<input type="button" id="listBtn"  name="listBtn" value="목록" onclick="location.href='../qna_list.br?pageNum=<%=pageNum%>'"/>
                 	<input type="reset" id="updateBtn" name="updateBtn"value="다시작성">     		
		     		<input type="submit" id="deleteBtn" name="deleteBtn" value="삭제" onclick="loaction.href='../qna_delete_action.br'">
		     		
		     	
                </div>
                <!-- 버튼 -->
                </form>
            </div>
           </div>
          </div>
         </div>
         
          