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
            <h1>Q&A 비밀글보기</h1>
            
            <div class="content-form-page">
            <p>이 글은 비밀글입니다. 비밀번호를 입력하여 주세요.<br/>
				관리자는 확인버튼만 누르시면 됩니다.
			 
              <form action="../qna_content_action.br?pageNum=<%=pageNum %>" method="post" class="form-horizontal form-without-legend" id="form" name="f">
               
               <input type="hidden" name="num" value="<%=num%>"> 
                 
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="pass">비밀번호<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="password" id="pass" name="pass" placeholder="비밀번호를 입력해주세요" class="form-control" onkeyup="passCheck()">
                  </div>
                </div>
                
                
				<!-- 버튼 -->
	            <div class="boardBtn2">
                 	<input type="button" id="listBtn"  name="listBtn" value="목록" onclick="location.href='../qna_list.br?pageNum=<%=pageNum%>'"/>    		
		     		<input type="submit" id="deleteBtn" name="deleteBtn" value="확인" onclick=>
		     		
		     	
                </div>
                <!-- 버튼 -->
                </form>
            </div>
           </div>
          </div>
         </div>
         
          