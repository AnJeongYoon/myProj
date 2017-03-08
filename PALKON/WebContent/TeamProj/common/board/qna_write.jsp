<%@page import="Qna.QnaDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String id=(String)session.getAttribute("id");
if(id==null){
	response.sendRedirect("/projectTForgit/LogServlet.mr");
}
%>


<div class="main">
	<div class="container">
	<div class="col-md-12 col-sm-12">
            <h1>게시판 글입력</h1>
            <div class="content-form-page">
              <form action="../qna_write_action.br" method="post" enctype="multipart/form-data" class="form-horizontal form-without-legend" id="form" name="qna_form">
                <!-- <div class="form-group">
                  <label class="col-lg-2 control-label" for="id">작성자<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="id" name="name" placeholder="작성자를 입력해주세요" class="form-control" required="required" maxlength="15">
                    <div class="console"></div>
                  </div>
                </div> -->
                 
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="subject">제목<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="subject" name="subject" placeholder="문의 드립니다" class="form-control" required="required" maxlength="15">
                    <div class="console"></div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="name">작성자<span class="require">*</span></label>
                  <div class="col-lg-8">
                  <%
                  	if(id!=null){
                  %>
                  <%=id %>
                  <%}else{ %>
                  <input type="text" id="name" name="name" placeholder="아이디를 입력하세요" class="form-control" required="required" maxlength="15">
                  <%} %>
                    <div class="console"></div>
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="content">내용<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <textarea id="content" name="content" placeholder="내용을 입력해주세요" rows="30" cols="100" class="form-control" required="required"></textarea>
                    
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="pass">비밀번호<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="password" id="pass" name="pass" placeholder="비밀번호를 입력해주세요" class="form-control" onkeyup="passCheck()">
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-md-2 control-label ">글공개여부</label>
                  <div class="col-md-8">
                    <select class="form-control" id="textck" name="textck" class="form-control">
                  		<option value="lctext" selected="selected">비밀글</option>
                    </select>
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="file">파일첨부<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="file" id="file" name="file" class="form-control" required="required">
                    <div class="console"></div>
                  </div>
                </div>
                
                
                <input type="hidden" name="num" id="num">
				<input type="hidden" name="name" id="name" value=${id }>
				<!-- 버튼 -->
	             <div class="boardBtn2">
                 	<input type="button" id="listBtn" name="listBtn" value="목록" onclick="location.href='../qna_list.br'"/>     		
		     		<input type="submit" id="writeBtn" name="updateBtn" value="글쓰기">
		     		<input type="reset" id="writeBtn" name="writeBtn"value="다시작성">
		     		
                </div>
                <!-- 버튼 -->
                </form>
            </div>
            
          </div>
         </div>
        </div>
       