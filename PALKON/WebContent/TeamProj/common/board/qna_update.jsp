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

QnaDTO qd=(QnaDTO)request.getAttribute("qd");
String pageNum=request.getParameter("pageNum");
%>





<div class="main">
	<div class="container">
	<div class="col-md-12 col-sm-12">
            <h1>Q&A 글수정</h1>
            <div class="content-form-page">
              <form action="../qna_update_action.br?pageNum=<%=pageNum %>" method="post" class="form-horizontal form-without-legend" id="form" name="f">
                <!-- <div class="form-group">
                  <label class="col-lg-2 control-label" for="id">작성자<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="id" name="name" placeholder="작성자를 입력해주세요" class="form-control" required="required" maxlength="15">
                    <div class="console"></div>
                  </div>
                </div> -->
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="id">아이디<span class="require">*</span></label>
                  <div class="col-lg-8">
                  ${id }
                    <div class="console"></div>
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="subject">제목<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="subject" name="subject"class="form-control" required="required" value=<%=qd.getQna_subject() %>>
                    <div class="console"></div>
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="content">내용<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <textarea id="content" name="content" rows="30" cols="100" class="form-control" required="required"><%=qd.getQna_content() %></textarea>
                    
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
                
                <input type="hidden" name="num" id="num" value="<%=qd.getQna_num()%>">
				<input type="hidden" name="name" id="name" value=${id }>
				
	            <div class="boardBtn2">
                	
                	<input type="button" id="listBtn" name="listBtn" value="목록" onclick="location.href='../qna_list.br?pageNum=<%=pageNum%>'"/>     		
		     		<input type="submit" id="updateBtn" name="updateBtn" value="수정">
		     		<input type="reset" id="deleteBtn" name="writeBtn"value="다시작성">
		     		
                </div>
            </form>
          </div>
        </div> 
     </div>
</div>
 
	     			
		
	