
<%@page import="java.util.List"%>
<%@page import="Notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.pagging {
    border: 1px solid #d7d5d5;
    margin: 0px;
}
.pagging li strong {
    width: 6%;
    padding-left: 15px;
    border-right: 1px solid #e9e9e9;
    font-weight: normal;
}
.pagging li strong, .pagging li a {
    float: left;
    padding: 10px;
}
.pagging li a{
	text-decoration: none;
	color: #000;
}
.pagging li {
    overflow: hidden;
    padding: 0 20px;
    border-bottom: 1px solid #e9e9e9;
    line-height: 140%;
    color: #353535;
}
.pagging #prev{background: url("http://img.echosting.cafe24.com/skin/base_ko_KR/board/ico_move_prev.gif") no-repeat 0 15px;}
.pagging #next{background: url("http://img.echosting.cafe24.com/skin/base_ko_KR/board/ico_move_next.gif") no-repeat 0 15px;}

</style>
</head>
<%


NoticeDTO nd=(NoticeDTO)request.getAttribute("nd");
String pageNum=(String)request.getAttribute("pageNum");
String id=(String)session.getAttribute("id");
NoticeDTO backList=(NoticeDTO)request.getAttribute("backList");
NoticeDTO goList=(NoticeDTO)request.getAttribute("goList");




%>

<body>
	<div class="main">
		<div class="container">
			<div class="boardView">
				<table class="table table-condensed">
					<tr>
						<th width="10%">제목</th>
						<td width="40%"><%=nd.getNotice_subject() %></td>
						<th>작성일</th>
						<td><%=nd.getDate() %></td>
					</tr>
					<tr>
						<th>글쓴이</th>
						<td><%=nd.getNotice_name() %> <span style='float: right'></td>
						<th>조회수</th>
						<td><%=nd.getReadcount() %></span></td>
					</tr>
					<tr>
						<td colspan="5" class="content"><%=nd.getNotice_content() %></td>
					</tr>
				</table>
			</div>
			
			<div class="boardBtn2">
				<input type="button" id="listBtn" name="listBtn" value="목록" onclick="location.href='../notice_list.no?pageNum=<%=pageNum%>'" />
				<% if(id!=null){ %>
				<input type="button" id="updateBtn" name="updateBtn" value="수정" onclick="location.href='../notice_update.no?num=<%=nd.getNotice_num()%>&pageNum=<%=pageNum%>'" />
				<input type="button" id="deleteBtn" name="deleteBtn" value="삭제" onclick="location.href='../notice_delete.no?num=<%=nd.getNotice_num()%>&pageNum=<%=pageNum%>'" />
				<% } %>
			</div>
			
			<div class="pagging">
				<ul>
				<c:if test="${num-1 ne '0'}">
					<li>
						<strong id="prev">이전글</strong>
						
						<a href="../notice_content.no?num=<%=nd.getNotice_num()-1%>&pageNum=<%=pageNum%>"><%=backList.getNotice_subject() %></a>
					</li>
				</c:if>
				
				
				 <c:if test="${num < count}">
					<li>
						<strong id="next">다음글</strong>
						<a href="../notice_content.no?num=<%=nd.getNotice_num()+1%>&pageNum=<%=pageNum%>"><%=goList.getNotice_subject() %></a>
					</li>
				</c:if> 
				</ul>
				
			</div>
			

		</div>
	</div>
</body>
</html>