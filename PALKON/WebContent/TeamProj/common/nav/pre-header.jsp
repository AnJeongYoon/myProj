<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 쿠키 처리할 부분  -->

<!-- 쿠키 처리할 부분 끝-->
<script>
window.onload = function initpath(){
	//alert(location.pathname + location.search);
	document.getElementById("path").value = location.pathname + location.search;
	document.getElementById("path2").value = location.pathname + location.search;
} 
</script> 
<div class="container">
	<div class="row">
		<!-- BEGIN TOP BAR LEFT PART -->
		<div class="col-md-6 col-sm-6 additional-shop-info"></div>
		<!-- END TOP BAR LEFT PART -->
		<!-- BEGIN TOP BAR MENU -->
		<div class="col-md-6 col-sm-6 additional-nav">
			<ul class="list-unstyled list-inline pull-right">
			<c:set var="id" value="${sessionScope.id }"/>	
			<c:set var="admin" value="admin"/>
			<c:choose>
				<c:when test="${id==null }">					
					<li><a href="" onclick="layer_open('layer2');return false;">로그인</a></li>
					<li><a href="/projectTForgit/SignUp.mr">회원가입</a></li>
					<li><a onclick="plz_login()">주문내역</a></li>
					<li><a onclick="plz_login()">마이페이지</a></li>
				</c:when>
				<c:when test="${id!=null }">
					<c:choose>
						<c:when test="${sessionScope.mb_status eq '관리자' }">
							<li><a href="">${id }님 환영합니다.</a></li>
							<li><a href="/projectTForgit/go_admin.mr">관리자페이지</a></li>				
							<li><a onclick="logout2.submit()">로그아웃</a></li>							
						</c:when>	
						<c:otherwise>
							<li><a href="">${id }님 환영합니다.</a></li>
							<li><a href="/projectTForgit/my_order_history.or">주문내역</a></li>
							<li><a href="/projectTForgit/mypageMain.mr">마이페이지</a></li>
							<li><a onclick="logout2.submit()">로그아웃</a></li>						
						</c:otherwise>
					</c:choose>				
				</c:when>
						
			</c:choose>		
			
			</ul>
		</div>
		<!-- END TOP BAR MENU -->
		<form action="/projectTForgit/Logout.mr" method="post" id="logout2">
			<input type="hidden" id="path2" name="path2">	
				
		</form>
	</div>
</div>
<input type="hidden" id="sessionInput" name="sessionInput" value="${sessionScope.id }"> 
<%@ include file="/TeamProj/common/login/login.jsp" %>

 	
 	