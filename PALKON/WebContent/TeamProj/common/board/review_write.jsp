<%@page import="review.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String id=(String)session.getAttribute("id");
if(id==null){
	response.sendRedirect("/LogServlet.mr");
}
%>

<div class="main">
	<div class="container">
	<div class="col-md-12 col-sm-12">
            <h1>Review게시판 글입력</h1>
            <div class="content-form-page">
              <form action="../review_write_action.bo" method="post" class="form-horizontal form-without-legend" id="form" name="f">
                <!-- <div class="form-group">
                  <label class="col-lg-2 control-label" for="id">작성자<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="id" name="name" placeholder="작성자를 입력해주세요" class="form-control" required="required" maxlength="15">
                    <div class="console"></div>
                  </div>
                </div> -->
                
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="title">제목<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="subject" name="title" placeholder="문의 드립니다" class="form-control" required="required" maxlength="15">
                    <div class="console"></div>
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="name">작성자<span class="require">*</span></label>
                  <div class="col-lg-8">
                  <c:choose>
                  <c:when test="${!empty id }">
                  ${id}
                  </c:when>
                  <c:otherwise>
                  <input type="text" id="name" name="name1" placeholder="아이디를 입력하세요" class="form-control" required="required" maxlength="15">
                  </c:otherwise>
                  </c:choose>
                    <div class="console"></div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="email">이메일<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="email" name="email" placeholder="ABCD@EFG.NET" class="form-control" required="required" maxlength="15">
                    <div class="console"></div>
                  </div>
                </div>
                 
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="score">평점<span class="require">*</span></label>
                  <div class="col-lg-8">
                 <input type="range" value="3" step="0.25" id="backing4" name="score">
		         <div class="rateit" data-rateit-backingfld="#backing4" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
		         </div>
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
                  <label class="col-lg-2 control-label" for="pw">비밀번호<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="password" id="pass" name="pw" placeholder="비밀번호를 입력해주세요" class="form-control" onkeyup="passCheck()">
                  </div>
                </div>
                
                
                
                <input type="hidden" name="num" id="num">
				<input type="hidden" name="name" id="id" value=${id }>
				<input type="hidden" id="rv_pro_code" name="pr_pro_code" value="<%=request.getParameter("pr_pro_code")%>">
				<!-- 버튼 -->
	             <div class="boardBtn2">
                 	<input type="button" id="listBtn" name="listBtn" value="목록" onclick="location.href='../review_list.bo'"/>     		
		     		<input type="submit" id="writeBtn" name="updateBtn" value="등록" onclick="javascript:submitContents();">
		     		<input type="reset" id="writeBtn" name="writeBtn"value="다시작성">
		     		
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