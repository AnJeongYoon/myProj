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
int num=Integer.parseInt(request.getParameter("num"));
int re_ref=Integer.parseInt(request.getParameter("re_ref"));
int re_lev=Integer.parseInt(request.getParameter("re_lev"));
int re_seq=Integer.parseInt(request.getParameter("re_seq"));
%>


<div class="main">
	<div class="container">
	<div class="col-md-12 col-sm-12">
            <h1>게시판 글입력</h1>
            <div class="content-form-page">
              <form action="../qna_rewrite_action.br" method="post" class="form-horizontal form-without-legend" id="form" name="f">
                <input type="hidden" name="num" value="<%=num%>">
				<input type="hidden" name="qna_ref" value="<%=re_ref%>">
				<input type="hidden" name="qna_lev" value="<%=re_lev%>">
				<input type="hidden" name="qna_seq" value="<%=re_seq%>">
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
                  <label class="col-lg-2 control-label" for="subject">제목<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="subject" name="subject" placeholder="문의 드립니다" class="form-control" required="required"  value="[답글]">
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
                  		<option value="none" selected="selected">선택해주세요</option>
						<option value="lctext">비밀글</option>
                    </select>
                  </div>
                </div>
                
                <input type="hidden" name="num" id="num">
				<input type="hidden" name="name" id="name" value=${id }>
				<!-- 버튼 -->
	             <div class="boardBtn2">
                 	<input type="button" id="listBtn" name="listBtn" value="목록" onclick="location.href='../qna_list.br'"/>     		
		     		<input type="reset" id="updateBtn" name="updateBtn"value="다시작성">
		     		<input type="submit" id="replyBtn" name="ReplyBtn" value="답글쓰기" onclick="javascript:submitContents();">
		     		
		     		
                </div>
                <!-- 버튼 -->
                </form>
            </div>
            
          </div>
         </div>
        </div>
         <!-- Smart Editor --> <script type="text/javascript">
					var oEditors = [];
					nhn.husky.EZCreator.createInIFrame({
						oAppRef : oEditors,
						elPlaceHolder : "content",
						sSkinURI : "assets/se2/SmartEditor2Skin.html",
						fCreator : "createSEditor2"
					});

					//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
					function submitContents(elClickedObj) {
						// 에디터의 내용이 textarea에 적용된다.
						oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

						// 에디터의 내용에 대한 값 검증은 이곳에서
						// document.getElementById("textAreaContent").value를 이용해서 처리한다.

						try {
							elClickedObj.form.submit();
						} catch (e) {

						}
					}
					// textArea에 이미지 첨부
					function pasteHTML(filepath) {
						var sHTML = '<img src="./common/board/uploadFolder/'+filepath+'">';
						oEditors.getById["content"].exec("PASTE_HTML", [ sHTML ]);
					}
				</script>
	     	