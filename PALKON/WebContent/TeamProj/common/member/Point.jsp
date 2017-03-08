<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div class="main signUp">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="/projectTForgit/go_main.mr">Home</a></li>
            <li><a href="/projectTForgit/mypageMain.mr">Mypage</a></li>
            <li class="active">Point</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
        	<jsp:include page="Side.jsp"></jsp:include>
          <!-- END SIDEBAR -->
	
          <!-- BEGIN CONTENT -->
          <!-- 적립금 상단 박스 시작 -->
          <div class="col-md-10 col-sm-8">
            <h1>적립금</h1>
            <div class="content-form-page MP_wrap">
            <span>${id}님의 적립금 사용 내역입니다.</span>
            <hr>
            <div class="Point_wrap">
             <ul class="Point_ul">
             	<li class="Point_li">
             		<strong class="MP_title"><i class="fa fa-caret-right" aria-hidden="true"></i>총 적립금</strong>
             		<div class="MP_data">${requestScope.total}원</div>
             	</li>
             	<li class="Point_li">
             		<strong class="MP_title"><i class="fa fa-caret-right" aria-hidden="true"></i>사용 가능 적립금</strong>
             		<div class="MP_data">${total-used-will }원</div>
             	</li>
             	<li class="Point_li">
             		<strong class="MP_title"><i class="fa fa-caret-right" aria-hidden="true"></i>사용된 적립금</strong>
             		<div class="MP_data">${requestScope.used }원</div>
             	</li>
             	<li class="Point_li">
             		<strong class="MP_title"><i class="fa fa-caret-right" aria-hidden="true"></i>미가용 적립금</strong>
             		<div class="MP_data">${requestScope.will }원</div>
             	</li>
             	<li class="Point_li">
             		<strong class="MP_title"><i class="fa fa-caret-right" aria-hidden="true"></i>환불 예정 적립금</strong>
             		<div class="MP_data">${requestScope.refund }원</div> 
             	</li>
             	<li class="Point_li">
             		<strong class="MP_title"></strong>
             		<strong class="MP_data"></strong>
             	</li>
             	
             
             </ul>
             </div>
              <!-- 적립금 상단 박스 끝 -->
          
           
            <!-- 적립금 사용 내역 시작 -->
            <div>
            	<table class="Point_table">
            	<tr class="Point_tr">
            		<th class="Point_th">적립일</th>
            		<th class="Point_th">만료일</th>
            		<th class="Point_th">적립금액</th>
            		<th class="Point_th">적립내용</th>
            		<th class="Point_th">관련주문</th>
            	</tr>
            	<c:forEach var="list" items="${requestScope.list }">
            	<tr>
            		<td class="Point_td">${list.pt_regdate }</td>
            		<td class="Point_td">${list.pt_duedate }</td>
            		<td class="Point_td">${list.pt_money }원</td>
            		<td class="Point_td">${list.pt_content }</td>
            		<c:set var="or_num" value="${list.pt_or_num }"/>
            		<c:if test="${or_num eq 0 }">
            			<c:set var="or_num" value=""></c:set>
            		</c:if>
            		<td class="Point_td"><a href="">${or_num }</a></td>
            		
            	</tr>
            	</c:forEach>            	
            	
            	</table>
            </div>
            <!-- 적립금 사용 내역 끝 -->
            <!-- 페이징 시작 -->
            <div class="row">              
              <div class="col-md-12 col-sm-12">
                <ul class="point_page_ul pull-right">
                  <li class="point_page_li"><a class="point_page_a" href="/projectTForgit/myPoint.mr?pageNo=${mpp.firstPageNo }"><i class="fa fa-angle-double-left arrow" aria-hidden="true"></i></a></li>
                  <li class="point_page_li"><a class="point_page_a" href="/projectTForgit/myPoint.mr?pageNo=${mpp.prevPageNo }"><i class="fa fa-angle-left arrow" aria-hidden="true"></i></a></li>
                  <c:forEach var="i" begin="${mpp.startPageNo}" end="${mpp.endPageNo}" step="1">
		          	<c:choose>
		                <c:when test="${i eq mpp.pageNo}">
			                <li class="point_page_li">
			                	<span class="point_page_span">
			                		<a class="point_page_a" href="/projectTForgit/myPoint.mr?pageNo=${i }">${i}</a>
			                	</span>
			               	</li>
		               	</c:when>
		                <c:otherwise><li class="point_page_li"><a class="point_page_a" href="/projectTForgit/myPoint.mr?pageNo=${i }">${i}</a></li></c:otherwise>
		            </c:choose>
		          </c:forEach>
                  <li class="point_page_li"><a class="point_page_a" href="/projectTForgit/myPoint.mr?pageNo=${mpp.nextPageNo }"><i class="fa fa-angle-right arrow" aria-hidden="true"></i></a></li>
                  <li class="point_page_li"><a class="point_page_a" href="/projectTForgit/myPoint.mr?pageNo=${mpp.finalPageNo }"><i class="fa fa-angle-double-right arrow" aria-hidden="true"></i></a></li>
                </ul>
              </div>
            </div>
            
            
            <!-- 페이징 끝 -->
            <!-- 적립금 안내 시작 -->
            <div class="xans-element- xans-myshop xans-myshop-head help ">
            	<h3>적립금 안내</h3>
				<div class="content">
        			<ul class="xans-element- xans-myshop xans-myshop-historyinfo">
        				<li class="item1 ">주문으로 발생한 적립금은 배송완료 후 14일 부터 실제 사용 가능한 적립금으로 전환됩니다. 배송완료 시점으로부터 14일 동안은 미가용 적립금으로 분류됩니다. </li>
						<li class="item2 ">미가용 적립금은 반품, 구매취소 등을 대비한 임시 적립금으로 사용가능 적립금으로 전환되기까지 상품구매에 사용하실 수 없습니다.</li>
						<li class="item3 ">사용가능 적립금(총적립금 - 사용된적립금 - 미가용적립금)은 상품구매 시 바로 사용가능합니다.</li>
					</ul>
				</div>
			</div>
			<!-- 적립금 안내 끝-->
           </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
       
        
        
        
      </div>
    </div>
     

    
    