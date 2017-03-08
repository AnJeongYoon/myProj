<!-- 원본 페이지 : shop-checkout.html -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="main signUp">
<div class="container">
<div class="col-md-12 col-sm-12">            
<div class="content-form-page">
<div class="or_wrap">
<form action="" id="cart_form" method="post">
<div class="or_content">
	<div class="or_title">
		<h2>장바구니</h2>
	</div>
	<div class="or_orderstep">
		<ul>
			<li class="or_orderstep_on" >STEP 01 장바구니</li>
			<li>STEP 02 주문서 작성</li>
			<li>STEP 03 결제완료</li>
			<li>STEP 04 주문완료</li>
		</ul>
	</div> <!-- or_orderstep 끝 -->
	
	<div class="or_benefit">
		<ul>
			<li class="or_benefit_title">혜택정보</li>
			<li class="or_benefit_content">
			<p>${id }님은 ${mdto.mb_grade } 등급 회원이십니다.</p>
			<p>50,000원 이상 구매시 (${GR_discountRate }%)를 추가할인 받으 실 수 있습니다.</p>
			<p class="cart_p">가용적립금 : 
				<span class="skyblue">
					<fmt:formatNumber value="${total_point - used_point }" pattern="#,###" />
				</span>원 
			</p>
			<p class="cart_p">/쿠폰 : <span class="skyblue">${coupon_cnt }</span>개</p>			
			</li>
		</ul>
	</div> <!-- or_benefit 끝 -->

	<div class="or_title">
		<div class="or_title_div1"><h3>일반상품 ${fn:length(requestScope.cart_list) }개</h3></div>
        <div class="or_title_div2"><p class="or_button">
        </p>
        </div>
    </div>
	
	<c:set var="all_check_val" value="${requestScope.all_check }"/>
	<c:if test="${empty all_check_val }">
		<c:set var="all_check_val" value="1"/>
	</c:if> 
	<div class="or_dv_boardList">
		<table class="or_tbl_boardList">
			<tr>
				<th class="cart_th" >이미지</th>
				<th class="cart_th" >상품정보</th>
				<th class="cart_th" >판매가</th>
				<th class="cart_th cart_th_qty" >수량</th>
				<th class="cart_th" >적립금</th>
				<th class="cart_th" >배송구분</th>
				<th class="cart_th" >배송비</th>
				<th class="cart_th" >합계</th>
			
				<th class="cart_th " scope="col">
<%-- 					<input type="hidden" id="checked" value="${checked }"> --%>
<!-- 					<input type="checkbox" id="all_check"  -->
<%-- 						name="all_check"  onclick="all_check_cart('check')" value="${all_check_val }" --%>
<%-- 						<c:if test="${all_check_val eq 2}">checked="checked"</c:if>> --%>
						
				</th>
			</tr>
			
			
			<c:set var="i" value="0"/>
			<c:choose>
			<c:when test="${!empty cart_list}">
			<c:forEach var="list" items="${requestScope.cart_list }">
			
			<tr class="xans-record-">	
				
				<td class="cart_td cart_img">
					<a href="../product_item.pr?pr_pro_code=${list.pr_pro_code}">
                    	<img src="assets/img/product/${list.image_name}" class="img-thumb-cart" alt="Berry Lace Dress">
                   	</a>
				</td>
				<td class="cart_td">
					<a href="../product_item.pr?pr_pro_code=${list.pr_pro_code}"><strong>${list.pr_product }(${list.pr_color })</strong></a>
				<td class=cart_td>
					<div>
						<strong><fmt:formatNumber value="${list.pr_price }" pattern="#,###" /></strong>
						<p class="displaynone"></p>
					</div>
				</td>
				<td class="cart_td">
					<input type="hidden" id="sc_pro_code" class="sc_pro_code_${i }" value="${list.pr_pro_code}">
					<input type="hidden" id="pr_price" value="${list.pr_price }">
					<c:choose>
						<c:when test="${list.sc_pro_cnt>10}">
						<div class="quantity_cnt_div">
							<input type='text' class='quantity_input' id='quantity_input_${i }' value="${list.sc_pro_cnt }">
							<input type='button' class='quantity_button btn' value='변경' id='quantity_button_${i }' onclick="insert_count(${i})">
						</div>
						</c:when>
						<c:otherwise>
						<div class="quantity_cnt_div">	
							<select class="quantity_select" id="quan_select_${i }" name="quan_select" data-i="${i }">
								<c:forEach var="j" begin="1" end="9" step="1">
									<c:choose>
										<c:when test="${j eq list.sc_pro_cnt }">
											<option selected="selected" value="${j }">${j }</option>
										</c:when>						
										<c:otherwise>
											<option value="${j }">${j }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>							
								<option value="10">10+</option>
							</select>
							</div>
						</c:otherwise>						
					</c:choose>		
				</td>
				<td class="cart_td">-</td>
				<td class="cart_td">기본배송</td>
				<td class="cart_td">0</td>
				<c:set var="OneTotal" value="${list.pr_price*list.sc_pro_cnt }"/>
				<td class="cart_td">
					<strong class="total${i }">
						<fmt:formatNumber value="${OneTotal }" pattern="#,###" />
					</strong>
				</td>
							
				<td class="cart_td">					
					<a onclick="del_cart_top('${list.sc_num }')" class="del-goods">&nbsp;</a>
				</td>
				
			</tr>
			<c:set var="i" value="${i+1 }"/>
			
			</c:forEach>		
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="9" class="cart_td">장바구니에 담긴 상품이 없습니다.</td>
				</tr>
			</c:otherwise>
			</c:choose>			
			<%-- <c:set var="total" value="${requestScope.total}"/> --%>
			
			<tr>
				<td class="or_sumprice" colspan="9">
					<div class="or_sumprice_left">
						<strong class="type">[기본배송]</strong>
					</div>
					<c:set var="alltotal" value="0"/>
					<c:forEach var="list" items="${sessionScope.cart_list }">	
						<c:set var="OneTotal" value="${list.pr_price*list.sc_pro_cnt}"/>
						<c:set var="alltotal" value="${alltotal+OneTotal }"/>
					</c:forEach>
					<div class="or_sumprice_right">
						상품구매금액 <strong><fmt:formatNumber value="${alltotal}" pattern="#,###" /></strong> +
						배송비 <span id="or_domestic_ship_fee">0</span>
						<span class="or_discount_fee">
							<fmt:parseNumber var="salePrice" integerOnly="true" value="${alltotal * (GR_discountRate * 0.01) }" pattern="#,###" />
							- 상품할인금액 <fmt:formatNumber value="${salePrice }" pattern="#,###" />
						</span> = 합계 : 
						<strong class="or_total_fee">
							<fmt:formatNumber value="${list.pr_price }" pattern="#,###" />
							<span class="or_domestic_ship_fee_sum" id="or_domestic_ship_fee_sum">
								<fmt:formatNumber value="${alltotal - discountPrice }" pattern="#,###" />
							</span>원
						</strong>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	
	
	
	
	<div class="or_controlInfo_2">
		<ul >
			<li>상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</li>
     	</ul>
	</div> <!-- or_controlInfo 끝 -->
	
	<div class="or_btnArea">	
        <div class="or_btnArea_left">
            <input type="button" id="or_orderlist_reg_btn" value="주문하기 " class="btn btn-primary btn-height-sm" 
            	onclick="location.href='../order_orderform_direct.or?or_page_code=fromTopSPC&or_pro_code='">
  		</div>
	</div>
	</form>
</div>
</div>
</div>
</div>
</div>