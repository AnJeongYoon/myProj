<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div class="main signUp">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="">mypage</a></li>
            <li class="active">delivery</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
        	<jsp:include page="Side.jsp"></jsp:include>
          <!-- END SIDEBAR -->
	
          <!-- BEGIN CONTENT -->
          <!-- 배송 상단 박스 시작 -->
          <div class="col-md-10 col-sm-9">
            <h1>배송 주소록 관리</h1>
            
            <div class="content-form-page MP_wrap">
            <span>자주 쓰는 배송지를 등록 관리할 수 있습니다.</span>
            <hr>              
           
            <!-- 배송 사용 내역 시작 -->
            <form action="/projectTForgit/mypage_deli_delete.mr" id="deli_form" method="post">
            <div>            	
            	<table class="Point_table">
            	<tr class="Point_tr">
            		<th class="Point_th"><input type="checkbox" id="all_check" name="all_check" onclick="checkboxSelectQue('check')" value="1"></th>
            		<th class="Point_th">배송지명</th>
            		<th class="Point_th">수령인</th>
            		<th class="Point_th">일반전화</th>
            		<th class="Point_th">휴대전화</th>
            		<th class="Point_th">주소</th>
            		<th class="Point_th">수정</th>
            	</tr>
            	<c:choose>
            		<c:when test="${!empty requestScope.De_list  }">
	            		<c:forEach var="list" items="${requestScope.De_list }">
			            	 <tr>
			            	 	<td class="Point_td"><input type="checkbox" value="${list.de_num }" name="check"></td>
			            		<td class="Point_td">${list.de_place_name }</td>
			            		<td class="Point_td">${list.de_name }</td>
			            		<td class="Point_td">${list.de_tel }</td>
			            		<td class="Point_td">${list.de_mobile }</td>
			            		<td class="Point_td">${list.de_addr }</td>			            		
			            		<td class="Point_td"><button class="btn de_modi_btn" type="button" onclick="location.href='/projectTForgit/mypage_deli_Modi.mr?de_num=${list.de_num}'">수정</button></td>
			            		
			            	</tr> 
	            		</c:forEach> 	            	
            		</c:when>
            		<c:otherwise>
	            		<tr>
	            			<td class="Point_td" colspan="7">등록된 주소가 없습니다.</td>
	            		</tr>
            		</c:otherwise>
            		
            	</c:choose>       	          	
            	
            	</table>
            	
            </div>
            <!-- 배송 사용 내역 끝 -->
            <!-- 버튼 시작 -->
            <div class="row">              
              <div class="col-md-12 col-sm-12">              	
              	<div>
              		<input type="button" value="배송지 등록하기" class="btn btn-primary de_btn right" onclick="location.href='/projectTForgit/mypage_deli_insert.mr'">              	
              	</div>
              	<div>
              		<input type="button" id="deli_del_btn" value="선택 주소록 삭제 " class="btn de_btn right">              	
              	</div>
              </div>
            </div>
            </form>
            
            <!-- 버튼 끝 -->
            <!-- 배송 안내 시작 -->
            <div class="xans-element- xans-myshop xans-myshop-head help ">
            	<h3>배송지 주소록 유의사항</h3>
				<div class="content">
        			<ul class="xans-element- xans-myshop xans-myshop-historyinfo">
        				<li class="item1 ">배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다. </li>
        			</ul>
				</div>
			</div>
			<!-- 배송 안내 끝-->
           </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
       
        
        
        
      </div>
    </div>
     
  

    
    