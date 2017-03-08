<%@page import="review.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="title-wrapper">
  <div class="container">
  <div class="container-inner">
	<h1><span>REVIEW</span></h1>
	<em class="catetitle">리뷰 게시판입니다.</em>
  </div>
  </div>
</div>


<div class="main">
	<div class="container">
		<div class="board_wrap">
			<!-- 게시판 목록 -->
			
			<table class="board">
			
				<colgroup>
	     			<col width="5%">
	     			<col width="10%">
	     			<col width="40%">
	     			<col width="10%">
	     			<col width="10%">
	     		</colgroup>
	     		<tr>
	     			<th>번호</th>
	     			<th>상품정보</th>
	     			<th>제목</th>
	     			<th>작성자</th>
	     			<th>작성일</th>
	     		</tr>

	     		<c:choose>
	     		<c:when test="${!empty reviewList }">
	     		<c:forEach var="list" items="${requestScope.reviewList}">
	     		
	     		<tr onclick="location.href='../review_content.bo?num=${list.rv_num}&pageNum=${pageNum}&rv_pro_code=${list.rv_pro_code}'">
	     			<td>${list.rv_num}</td>
	     			
	     			<c:if test="${sessionScope.rvinfo ne '0'}">
	     			
	     			<td class="pro_image">
	     				<a href="../product_item.pr?pr_pro_code=${list.rv_pro_code}">
	     					<img src="${list.image_path }${list.image_name}" class="itemImgSize" alt="Berry Lace Dress">
	     					${list.rv_pro_code }
	     				</a>
	     			</td>
	     			
	     			 </c:if>
	     			
	     			<td class="title">${list.rv_title}<a href="../review_content.bo?pageNum=${pageNum}&pr_pro_code=${rvinfo.pr_pro_code}" style="color: inherit;"></a></td>
	     			<td>${list.rv_id}</td>
	     			<td>${list.rv_date}</td>

	     		</tr>
	     		</c:forEach>
	     		</c:when>
	     		<c:otherwise>
	     		<tr>
	     			<td colspan="6">등록된 게시물이 없습니다.</td>
	     		</tr>
	     		</c:otherwise>
	     		</c:choose>
			</table>
			<!-- 게시판 목록 -->
			
			<!-- 검색 -->
			<div class="boardBtn">
	     		<form action="noticeSearch.jsp" name="search" method="post">
		     		<select id="searchField" name="searchField">
		     			<option value="subject">제목</option>
		     			<option value="user_name">작성자</option>
		     			<option value="user_id">아이디</option>
		     		</select>
		     		<input type="text" id="searchText" class="btn btn-default" name="searchText" />
		     		<input type="button" id="searchBtn" class="btn btn-default" name="searchBtn" value="검색" onclick="" />
		     		
		     		
		     	</form>
	     	</div>
	     	<!-- 검색 -->
	     	
	     	 <!-- BEGIN PAGINATOR -->
            <div class="row"> 
      
             <!-- BEGIN PAGINATOR -->
            <div class="row"> 
      
              <!-- 페이징 -->
              <c:if test="${count!=0}">
              <div class="col-md-8 col-sm-8">
            
                <ul class="pagination pull-right">
                
                 <c:if test="${startPage>pageBlock}">
                  <li><a href="/projectTForgit/review_list.bo?pageNum=${startPage-pageBlock}">&laquo;</a></li>
                  </c:if>
               
                  <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1" >
                  <li><a href="/projectTForgit/review_list.bo?PageNum=${i}">${i}</a></li>
                  </c:forEach>
                                    
                  <c:if test="${startPage<pageBlock}">
                  <li><a href="/projectTForgit/review_list.bo?PageNum=${startPage+pageBlock}">&raquo;</a></li>
                  </c:if>
                  
                </ul>
   
              </div>
              </c:if>
            </div>
            <!-- END PAGINATOR -->
		</div>
	</div>
</div>