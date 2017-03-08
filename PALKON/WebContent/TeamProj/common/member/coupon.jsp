<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
    <div class="main signUp">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="../go_main.mr">Home</a></li>
            <li><a href="../mypageMain.mr">Mypage</a></li>
            <li class="active">coupon</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
        	<jsp:include page="Side.jsp"></jsp:include>
          <!-- END SIDEBAR -->
	
          <!-- BEGIN CONTENT -->
         
          <div class="col-md-10 col-sm-9">
            <h1>쿠폰함</h1>
            <div class="content-form-page MP_wrap">
            <span>사용가능 쿠폰 : ${requestScope.total_cp } 개</span>
            <hr>
            <!-- 쿠폰내역 시작 -->
            <div>
            	<table class="Point_table">
            	<tr class="Point_tr">
            		<th class="Point_th">번호</th>
            		<th class="Point_th">쿠폰명</th>
            		<th class="Point_th">쿠폰번호</th>            		
            		<th class="Point_th">쿠폰혜택</th>            		
            		<th class="Point_th">사용가능기간</th>
            		<th class="Point_th">사용일</th>
            	</tr>
            	<c:choose>
            		<c:when test="${!empty requestScope.cp_list }">
	            		<c:forEach var="cp_list" items="${requestScope.cp_list }">
		            	<tr>
		            		<td class="Point_td">${cp_list.ad_cp_no }</td>
		            		<td class="Point_td">${cp_list.cp_content }</td>
		            		<td class="Point_td">${cp_list.cp_regnum}</td>
		            		<c:set var="check" value="${cp_list.cp_check }"/>
		            		<c:choose>
			            		<c:when test="${check eq 'mul' }">
			            			<td class="Point_td">구매금액의 ${cp_list.cp_price }% 할인(${cp_list.cp_limit_price }이상 구매시)</td>
			            		</c:when>	            		
			            		<c:otherwise>
			            			<td class="Point_td">${cp_list.cp_price }원 할인(${cp_list.cp_limit_price }이상 구매시)</td>
			            		</c:otherwise>
		            		</c:choose>
		            		<td class="Point_td">${cp_list.cp_regdate }~${cp_list.cp_duedate}</td>
		            		<c:choose>
		            			<c:when test="${cp_list.cp_usedate eq null }">
		            				<td class="Point_td">사용 가능</td>
		            			</c:when>
		            			<c:when test="${cp_list.cp_usedate eq '기간만료' }">
		            				<td class="Point_td">기간만료</td>
		            			</c:when>
		            			<c:otherwise>
		            				<td class="Point_td">사용함(${cp_list.cp_usedate})</td>
		            			</c:otherwise>
		            		</c:choose>
		            		
		            	</tr>
		            	</c:forEach>           			
            		</c:when>
            		<c:otherwise>
            			<tr>
            				<td class="Point_td" colspan="5">사용 가능한 쿠폰이 없습니다.</td>
            			</tr>
            		</c:otherwise>
            	
            	</c:choose>
	            	        	
            	
            	</table>
            </div>
            <!-- 쿠폰내역 끝  -->
            <!-- 페이징 시작 -->
            <div class="row">              
              <div class="col-md-12 col-sm-12">
                <ul class="point_page_ul pull-right">
                  <li class="point_page_li"><a class="point_page_a" href="/projectTForgit/mypage_coupon.mr?pageNo=${mcp.firstPageNo }"><i class="fa fa-angle-double-left arrow" aria-hidden="true"></i></a></li>
                  <li class="point_page_li"><a class="point_page_a" href="/projectTForgit/mypage_coupon.mr?pageNo=${mcp.prevPageNo }"><i class="fa fa-angle-left arrow" aria-hidden="true"></i></a></li>
                  <c:forEach var="i" begin="${mcp.startPageNo}" end="${mcp.endPageNo}" step="1">
		          	<c:choose>
		                <c:when test="${i eq mcp.pageNo}">
			                <li class="point_page_li">
			                	<span class="point_page_span">
			                		<a class="point_page_a" href="/projectTForgit/mypage_coupon.mr?pageNo=${i }">${i}</a>
			                	</span>
			               	</li>
		               	</c:when>
		                <c:otherwise><li class="point_page_li"><a class="point_page_a" href="/projectTForgit/mypage_coupon.mr?pageNo=${i }">${i}</a></li></c:otherwise>
		            </c:choose>
		          </c:forEach>
                  <li class="point_page_li"><a class="point_page_a" href="/projectTForgit/mypage_coupon.mr?pageNo=${mcp.nextPageNo }"><i class="fa fa-angle-right arrow" aria-hidden="true"></i></a></li>
                  <li class="point_page_li"><a class="point_page_a" href="/projectTForgit/mypage_coupon.mr?pageNo=${mcp.finalPageNo }"><i class="fa fa-angle-double-right arrow" aria-hidden="true"></i></a></li>
                </ul>
              </div>
            </div>
            
            
            <!-- 페이징 끝 -->
            <!-- 쿠폰번호 입력 시작 -->
            <div>
            	<span>쿠폰 등록하기</span>
            	<div>
            		<form action="/projectTForgit/mypage_coupon_reg.mr" method="post" id="cp_form"> 
            		<fieldset class="cp_field">
            			<div class="form-group">        
            			  <div class="col-lg-3 col-md-3 col-sm-3"></div>        
		                  <div class="col-lg-5 col-md-5 col-sm-5 reg_cp_div">
		                    <input type="text" id="cp_Input" name="cp_Input" class="form-control" maxlength="30">                                      
		                  </div>
		                  <div class="col-lg-2 col-md-2 col-sm-2 reg_cp_div">
		                  	<input type="submit" class="btn sbtn cp_btn" value="쿠폰 번호 인증">		
		                  </div>
		                </div> 
            			<p class="cp_p">쇼핑몰에서 발행한 쿠폰번호만 입력해주세요.</p>
            		</fieldset>
            		</form>
            	</div>
            	
            </div>
           
            
            
            <!-- 쿠폰번호 입력 끝 -->
            <!-- 쿠폰 안내 시작 -->
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
			<!-- 쿠폰 안내 끝-->
           </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
       
        
        
        
      </div>
    </div>
     
  

    
    