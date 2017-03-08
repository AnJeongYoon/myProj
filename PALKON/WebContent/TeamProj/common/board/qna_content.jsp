<%@page import="Qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
// request.setAttribute("bb", bb);
// request.setAttribute("pageNum", pageNum);
QnaDTO qd=(QnaDTO)request.getAttribute("qd");
String pageNum=(String)request.getAttribute("pageNum");

%>

<body>
	<div class="main">
		<div class="container">
			<div class="boardView">
				<table class="table table-condensed">
					<tr>
						<th width="10%">제목</th>
						<td width="40%"><%=qd.getQna_subject() %></td>
						<th>작성일</th>
						<td><%=qd.getDate() %></td>
					</tr>
					<tr>
						<th>글쓴이</th>
						<td><%=qd.getQna_name()%> <span style='float: right'></td>
						<th>조회수</th>
						<td><%=qd.getRedcount() %></span></td>
					</tr>
					<tr>
						<td colspan="5" class="content"><%=qd.getQna_content() %></td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td colspan="3">
						<%if(!(qd.getQna_file()==null)){%>
						<a href='../FileDownloadAction.br?file_name=<%=qd.getQna_file()%>'>
							<%=qd.getQna_file()%>
						</a>
						<%} %>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="boardBtn2">
				<input type="button" id="listBtn" name="listBtn" value="목록" onclick="location.href='../qna_list.br?pageNum=<%=pageNum%>'" />
				
				<input type="button" id="updateBtn" name="updateBtn" value="수정" onclick="location.href='../qna_update.br?num=<%=qd.getQna_num()%>&pageNum=<%=pageNum%>'" />
				<input type="button" id="deleteBtn" name="deleteBtn" value="삭제" onclick="location.href='../qna_delete.br?num=<%=qd.getQna_num()%>&pageNum=<%=pageNum%>'" />
				 <c:if test="${requestScope.id== 'admin' }">
				<input type="button" id="replyBtn" name="replyBtn" value="답글쓰기" onclick="location.href='../qna_rewrite.br?num=<%=qd.getQna_num()%>&re_ref=<%=qd.getQna_ref()%>&re_lev=<%=qd.getQna_lev()%>&re_seq=<%=qd.getQna_seq()%>'" />
				</c:if>
			</div>
			 <table id="commentTable" class="table table-condensed"></table>
			<table class="table table-condensed">
				<tr>
					<td>
					<span class="form-inline" role="form">
						<p>
							<div class="form-group">
								<input type="text" id="commentParentName" name="commentParentName" class="form-control col-lg-2" data-rule-required="true" placeholder="이름" maxlength="10">
							</div>
							<div class="form-group">
								<input type="password" id="commentParentPassword" name="commentParentPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="패스워드" maxlength="10">
							</div>
							<div class="form-group">
								<button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default">확인</button>
							</div>
						</p> 
						<textarea id="commentParentText" class="form-control col-lg-12" style="width: 100%" rows="4"></textarea>
					</span>
					</td>
				</tr>
			</table>

		</div>
	</div>
</body>
</html>