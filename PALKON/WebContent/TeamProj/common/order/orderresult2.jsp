<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="main signUp">
		<div class="container">
			<div class="col-md-12 col-sm-12">
				<div class="content-form-page">
					<div class="or_wrap">

						<div class="or_content">

							<div class="or_title">
								<div class="or_title_div1">
									<h3>주문리스트</h3>
								</div>
								
							</div>


							<div class="or_dv_boardList">
								<table class="or_tbl_boardList">
									<tr>
										
										<td class="or_total" scope="col">주문번호</td>
										<td class="or_thumb" scope="col">이미지</td>
										<td class="or_product" scope="col">상품정보</td>
										<td class="or_price" scope="col">판매가</td>
										<td class="or_quantity" scope="col">수량</td>
										<td class="or_delivery" scope="col">배송구분</td>
										<td class="or_charge" scope="col">배송비</td>
										
									</tr>
									
									<c:set var="i" value="0" />
									<c:choose>
										<c:when test="${!empty cart_list}">
											<c:forEach var="list" items="${requestScope.orderlist }">
												<tr class="xans-record-">
													
													<!-- 주문번호 -->
													<td class="cart_td">
														<strong class="total${i }">
															${OneTotal }
														</strong>
													</td>
													
													<!-- 이미지 -->
													<td class="cart_td cart_img">
														<a href="../product_item.pr?pr_pro_code=${list.pr_pro_code}">
															<img src="assets/img/product/${list.image_name}" class="img-thumb-cart" alt="Berry Lace Dress">
														</a>
													</td>
													
													<!-- 상품정보 -->
													<td class="cart_td">
														<a href="../product_item.pr?pr_pro_code=${list.pr_pro_code}">
															<strong>${list.pr_product }(${list.pr_color })</strong>
														</a>
													</td>
													
													<!-- 판매가 -->
													<td class=cart_td>
														<div>
															<strong><fmt:formatNumber value="${list.pr_price }" pattern="#,###" /></strong>
														</div>
													</td>
													
													<!-- 수량 -->
													<td class="cart_td">
														<input type="hidden" id="sc_pro_code" class="sc_pro_code_${i }" value="${list.pr_pro_code}"> 
														<input type="hidden" id="pr_price" value="${list.pr_price }"> 
														${list.sc_pro_cnt }
													</td>
													
													<!-- 배송구분 -->
													<td class="cart_td">기본배송</td>
													
													<!-- 배송비 -->
													<td class="cart_td">0</td>
													<c:set var="OneTotal" value="${list.pr_price*list.sc_pro_cnt }"/>
													
												</tr>
												<c:set var="i" value="${i+1 }" />
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="9" class="cart_td">주문리스트에 담긴 상품이 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
									
								</table>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>