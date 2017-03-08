
<%@page import="Notice.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String id=(String)session.getAttribute("id");
if(id==null){
	response.sendRedirect("/LogServlet.mr");
}

NoticeDTO nd=(NoticeDTO)request.getAttribute("nd");
String pageNum=request.getParameter("pageNum");
%>





<div class="main">
	<div class="container">
	<div class="col-md-12 col-sm-12">
            <h1>Notice 글수정</h1>
            <div class="content-form-page">
              <form action="../notice_update_action.no?pageNum=<%=pageNum %>" method="post" class="form-horizontal form-without-legend" id="form" name="f">
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
                  <%=nd.getNotice_name() %>
                    <div class="console"></div>
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="subject">제목<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="subject" name="subject"class="form-control" required="required" value=<%=nd.getNotice_subject() %>>
                    <div class="console"></div>
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="content">내용<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <textarea id="content" name="content" rows="30" cols="100" class="form-control" required="required"><%=nd.getNotice_content() %></textarea>
                    
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="pass">비밀번호<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="password" id="pass" name="pass" placeholder="비밀번호를 입력해주세요" class="form-control" onkeyup="passCheck()">
                  </div>
                </div>
                 
           
                
                <input type="hidden" name="num" id="num" value="<%=nd.getNotice_num()%>">
				<input type="hidden" name="name" id="name" value=${id }>
				
	            <div class="boardBtn2">
                	
                	<input type="button" id="listBtn" name="listBtn" value="목록" onclick="location.href='../notice_list.no?pageNum=<%=pageNum%>'"/>     		
		     		<input type="submit" id="updateBtn" name="updateBtn" value="수정">
		     		<input type="reset" id="deleteBtn" name="writeBtn"value="다시작성">
		     	</div>	
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
     
	     			
		
	