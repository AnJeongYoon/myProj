<%@page import="Product.prodDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="top-cart-block">
	<div class="top-cart-info">		
		<c:set var="alltotal" value="0"/>
		<c:forEach var="list" items="${sessionScope.cart_list }">	
			<c:set var="OneTotal" value="${list.pr_price*list.sc_pro_cnt}"/>
			<c:set var="alltotal" value="${alltotal+OneTotal }"/>
		</c:forEach>
		<c:if test="${!empty total }">
			<c:set var="alltotal" value="${total }"/>
		</c:if>
		<a href="javascript:void(0);" class="top-cart-info-count"> ${fn:length(sessionScope.cart_list) } items</a> 
		<a href="javascript:void(0);" class="top-cart-info-value"><fmt:formatNumber value="${alltotal }" pattern="#,###" /></a>
	</div>
	<i class="fa fa-shopping-cart"></i>

	<div class="top-cart-content-wrapper">
		<div class="top-cart-content">
			<ul class="scroller" style="height: 250px;">
			<c:set var="i" value="0"/>
			<c:choose>
			<c:when test="${!empty cart_list}">
			<c:forEach var="list" items="${sessionScope.cart_list }">
				<li>
					<a href="../product_item.pr?pr_pro_code=${list.pr_pro_code}">
                    <img src="assets/img/product/${list.image_name}" alt="Berry Lace Dress" width="37" height="34">
                   	</a>
					<span class="cart-content-count">x ${list.sc_pro_cnt }</span> 
					<a href="../product_item.pr?pr_pro_code=${list.pr_pro_code}"><strong>${list.pr_product }(${list.pr_color })</strong></a> 
					<em><fmt:formatNumber value="${list.pr_price*list.sc_pro_cnt }" pattern="#,###" />원</em> 
				</li>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<li>
					장바구니에 담긴 상품이 없습니다.
				</li>
			</c:otherwise>
			
			</c:choose>	
			</ul>
			<div class="text-right">
				<a href="/projectTForgit/order_cart.or" class="btn btn-primary">장바구니 보기</a> 
<!-- 				<a href="/projectTForgit/order_orderform_direct.or?or_page_code=fromTopSPC" class="btn btn-primary">바로 주문하기</a> -->
				
			</div>
		</div>
	</div>
</div>