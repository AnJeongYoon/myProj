<!-- 원본 페이지 : shop-checkout.html -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="main signUp">
	<div class="container">
		<div class="col-md-12 col-sm-12">
			<div class="content-form-page">
				<div class="or_wrap">
					<form id="order_form" name="order_form" method="post" action="/projectTForgit/order_payAgree.or">
						<div class="or_content">
							<div class="or_title"><h2>주문서 작성</h2></div>
							<div class="or_orderstep">
								<ul>
									<li>STEP 01 장바구니</li>
									<li class="or_orderstep_on">STEP 02 주문서 작성</li>
									<li>STEP 03 결제완료</li>
									<li>STEP 04 주문완료</li>
								</ul>
							</div>
							<!-- or_orderstep 끝 -->

							<div class="or_benefit">
								<ul>
									<li class="or_benefit_title">혜택정보</li>
									<li class="or_benefit_content">
										<p>${id}님은${mdto.mb_grade }회원이십니다.
										<p>50,000원 이상 구매시 <span class="skyblue">${GR_discountRate }</span>% 를 추가할인 받으 실 수 있습니다.</p>
										<p class="cart_p">가용적립금 : <span class="skyblue">${total_point - used_point }</span>원</p>
										<p class="cart_p">/쿠폰 : <span class="skyblue">${coupon_cnt }</span>개</p>
									</li>
								</ul>
							</div>
							<!-- or_benefit 끝 -->
							<div class="or_controlInfo_1">
								<ul><li>상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</li></ul>
							</div>
							<!-- or_controlInfo 끝 -->

							<div class="or_title">
								<div class="or_title_div1"><h3>국내배송상품 주문내역</h3></div>
								<div class="or_title_div2">
									<p class="or_button">
										<input type="button" class="btn btn-primary btn-height-sm"onclick="javascript:window.history.back();" value="이전 페이지" />
									</p>
								</div>
							</div>

							<div class="or_dv_boardList">
								<table class="or_tbl_boardList">
									<tr>
										<td class="or_thumb" scope="col">이미지</td>
										<td class="or_product" scope="col">상품정보</td>
										<td class="or_price" scope="col">판매가</td>
										<td class="or_quantity" scope="col">수량</td>
										<td class="or_delivery" scope="col">배송구분</td>
										<td class="or_charge" scope="col">배송비</td>
										<td class="or_total" scope="col">합계</td>
									</tr>
									
									<c:set var="i" value="0" />
									<c:choose>
										<c:when test="${!empty cart_list}">
											<c:forEach var="list" items="${requestScope.orderlist }">
												<tr class="xans-record-">
													<td class="cart_td cart_img">
														<a href="../product_item.pr?pr_pro_code=${list.pr_pro_code}">
															<img src="assets/img/product/${list.image_name}" class="img-thumb-cart" alt="Berry Lace Dress">
														</a>
													</td>
													<td class="cart_td">
														<a href="../product_item.pr?pr_pro_code=${list.pr_pro_code}">
															<strong>${list.pr_product }(${list.pr_color })</strong>
														</a>
													</td>
													<td class=cart_td>
														<div>
															<strong><fmt:formatNumber value="${list.pr_price }" pattern="#,###" /></strong>
															<p class="displaynone"></p>
														</div>
													</td>
													<td class="cart_td">
														<input type="hidden" id="sc_pro_code" class="sc_pro_code_${i }" value="${list.pr_pro_code}"> 
														<input type="hidden" id="pr_price" value="${list.pr_price }"> 
														${list.sc_pro_cnt }
													</td>
													<td class="cart_td">기본배송</td>
													<td class="cart_td">0</td>
													<c:set var="OneTotal" value="${list.pr_price*list.sc_pro_cnt }"/>
													<td class="cart_td">
														<strong class="total${i }">
															<fmt:formatNumber value="${OneTotal }" pattern="#,###" />
														</strong>
													</td>
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
								<ul>
									<li>상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</li>
								</ul>
							</div>
							<!-- or_controlInfo 끝 -->
							
							<!-- div 사이 간격 시작 -->
							<div class="or_div_interSpace"></div>
							<!-- div 사이 간격 끝 -->


							<!-- 주문자 정보 입력란 시작 -->
							<div class="or_orderArea">

								<div class="or_title">
									<div class="or_title_div1">
										<h3>주문자 정보</h3>
									</div>

									<div class="or_title_div2">
										<img alt="필수" src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif">
										필수입력사항
									</div>
								</div>

								<div class="or_dv_orderInfo">
									<table border="1" summary="">
										<!-- 국문 쇼핑몰 -->

										<tr>
											<th scope="row">
												주문하시는 분 <img alt="필수" rc="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif">
											</th>
											<td>
												<input readonly="readonly" name="or_sender_name" class="form-control" id="or_sender_name" type="text"
												size="15" placeholder="" value="${mdto.mb_name }" fw-msg="" fw-label="주문자 성명" fw-filter="isFill">
											</td>
										</tr>
										<tr>
											<th scope="row">
												주소 <img alt="필수" src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif">
											</th>
											<td>
												<div class="col-lg-12 log_addr">
													<input readonly="readonly" type="text" id="address1" name="address1" value="${requestScope.addrs[0] }" class="form-control postnum" placeholder="우편번호">
												</div> <br /> 
												<input readonly="readonly" type="text" id="address2" name="address2" class="form-control" placeholder="주소" value="${requestScope.addrs[1] }">
												<span class="grid">기본주소</span><br> 
												<input readonly="readonly" type="text" id="address3" name="address3" class="form-control" placeholder="상세주소" maxlength="30" value="${requestScope.addrs[2] }"> 
												<span class="grid">나머지주소</span>
											</td>
										</tr>
										<tr>
											<th scope="row">
												일반전화 <img alt="필수" src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif">
											</th>
											<td>
												<input readonly="readonly" type="text" id="or_sender_otel" name="or_sender_otel" class="form-control or_tel" value="${requestScope.mdto.mb_tel }" placeholder="'-'없이 입력" maxlength="30" />
											</td>
										</tr>
										<tr>
											<th scope="row">휴대전화</th>
											<td>
												<input readonly="readonly" type="text" id="or_sender_mtel" name="or_sender_mtel" class="form-control or_mobile"
												value="${requestScope.mdto.mb_mobile }" placeholder="'-'없이 입력" required="required" maxlength="30" />
											</td>
										</tr>
										<tr>
											<th scope="row">
												이메일 <img alt="필수" src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif">
											</th>
											<td>
												<input readonly="readonly" type="text"id="or_sender_email" class="form-control or_email"
												value="${requestScope.mdto.mb_email }"name="or_sender_email" required="required" maxlength="50">
											</td>
										</tr>

										<!-- 해외 쇼핑몰 -->

									</table>
								</div>
							</div>
							<!-- 주문자 정보 입력란 끝 -->

							<!-- div 사이 간격 시작 -->
							<div class="or_div_interSpace"></div>
							<!-- div 사이 간격 끝 -->

							<!-- 배송지 정보 입력란 시작 -->
							<div class="or_orderArea">

								<div class="or_title">
									<div class="or_title_div1">
										<h3>배송지 정보</h3>
									</div>

									<div class="or_title_div2">
										<img alt="필수" src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif">
										필수입력사항
									</div>
								</div>

								<div class="or_dv_orderInfo">
									<table border="1" summary="">

										<tr>
											<th scope="row">배송지 선택</th>
											<td>
												<div class="or_addrselect">
													<label>
														<div class="radio">
															<span class="or_sameaddr0 checked">
																<input name="sameaddr" id="sameaddr0" class="radio" type="radio" value="T" fw-msg="" fw-label="1" fw-filter="">
															</span>
														</div> 주문자 정보와 동일
													</label>
													<div>&nbsp;&nbsp;&nbsp;</div>
													<label>
														<div class="radio">
															<span class="or_sameaddr1">
																<input name="sameaddr" id="sameaddr1" class="radio" type="radio" value="F" fw-msg="" fw-label="1" fw-filter="">
															</span>
														</div> 새로운배송지
													</label> 
													<a id="btn_shipp_addr" href="#"
														onclick="window.open('/projectTForgit/order_destinationList.or','주소록 선택','width=1200,height=500, scrollbars=yes'); return false">
														<input type="button" class="btn btn-height-sm" value="주소록 보기" />
													</a>


												</div>
											</td>
										</tr>
									</table>

									<div class="selectaddr0">
										<table>
											<tr>
												<th scope="row">
													받으시는 분 <img alt="필수" src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif">
												</th>
												<td>
													<input name="or_taker_name" class="form-control" id="or_taker_name" type="text" size="15" placeholder=""
													value="${requestScope.mdto.mb_name }" fw-msg="" fw-label="수취자 성명" fw-filter="isFill">
												</td>
											</tr>

											<tr>
												<th scope="row">주소 <img alt="필수" src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"></th>
												<td> 
													<div class="col-lg-8 log_addr">
														<input type="text" id="or_taker_addr1" name="or_taker_addr1" value="${requestScope.addrs[0] }" class="form-control postnum" placeholder="우편번호">
													</div>
													<div class="col-lg-4 log_addr">
														<input type="button" onclick="sample7_execDaumPostcode()" class="form-control postnumfinder" value="주소찾기">
													</div> <br /> 
													<input type="text" id="or_taker_addr2" name="or_taker_addr2" class="form-control" placeholder="주소" value="${requestScope.addrs[1] }"> 
													<span class="grid">기본주소</span><br> 
													<input type="text" id="or_taker_addr3" name="or_taker_addr3" class="form-control" placeholder="상세주소" maxlength="30" value="${requestScope.addrs[2] }"> 
													<span class="grid">나머지주소</span>
												</td>
											</tr>
											<tr>
												<th scope="row">일반전화 <img alt="필수" src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"></th>
												<td>
													<input type="text" id="or_taker_otel" name="or_taker_otel" class="form-control or_tel"
														value="${requestScope.mdto.mb_tel }" placeholder="'-'없이 입력" maxlength="30" />
												</td>
											</tr>
											<tr>
												<th scope="row">휴대전화</th>
												<td>
													<input type="text" id="or_taker_mtel" name="or_taker_mtel" class="form-control or_mobile" value="${requestScope.mdto.mb_mobile }"
														placeholder="'-'없이 입력" required="required" maxlength="30" />
												</td>

											</tr>

										</table>
									</div>

									<div class="selectaddr1 displaynone">
										<table>
											<tr>
												<th scope="row">받으시는 분 <img alt="필수" src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"></th>
												<td>
													<input name="or_taker_name" class="form-control" id="or_taker_name"
														type="text" size="15" placeholder="" value="" fw-msg="" fw-label="수취자 성명" fw-filter="isFill">
												</td>
											</tr>
											<tr>
												<th scope="row">주소 <img alt="필수" src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"></th>
												<td>
													<div class="col-lg-8 log_addr">
														<input type="text" id="or_taker_addr1" name="or_taker_addr1" value="" class="form-control postnum" placeholder="우편번호">
													</div>
													<div class="col-lg-4 log_addr">
														<input type="button" onclick="sample7_execDaumPostcode()" class="form-control postnumfinder" value="주소찾기">
													</div> <br /> 
													<input type="text" id="or_taker_addr2" name="or_taker_addr2" class="form-control" placeholder="주소" value=""> 
													<span class="grid">기본주소</span><br> 
													<input type="text" id="or_taker_addr3" name="or_taker_addr3" class="form-control" placeholder="상세주소" maxlength="30" value=""> 
													<span class="grid">나머지주소</span>
												</td>
											</tr>
											<tr>
												<th scope="row">일반전화 <img alt="필수" src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"></th>
												<td>
													<input type="text" id="or_taker_otel" name="or_taker_otel" class="form-control or_tel" value="" placeholder="'-'없이 입력" maxlength="30" />
												</td>
											</tr>
											<tr>
												<th scope="row">휴대전화</th>
												<td>
													<input type="text" id="or_taker_mtel" name="or_taker_mtel" class="form-control or_mobile" value="" placeholder="'-'없이 입력" required="required" maxlength="30" />
												</td>

											</tr>

										</table>
									</div>

									<table border="1" summary="">
										<tr>
											<th scope="row">배송메시지</th>
											<td>
												<textarea name="or_taker_msg" class="form-control" id="or_taker_msg" maxlength="255" cols="70" rows="5" fw-label="배송 메세지"></textarea>
												<div class="message ">
													<label>
														<!-- <div class="checker">
															<span class="">
																<input name="omessage_autosave[]" id="omessage_autosave0" type="checkbox" value="T" fw-label="배송 메세지 저장">
															</span>
														</div> Q&amp;A 자동저장 -->
													</label>
													<ul>
														<li>배송메시지란에는 배송시 참고할 사항이 있으면 적어주십시오.</li>
														<!-- <li>게시글은 비밀글로 저장되며 비밀번호는 주문번호 뒷자리로 자동 저장됩니다.</li> -->
													</ul>
												</div>
											</td>
										</tr>
									</table>

								</div>
							</div>
							<!-- 배송지 정보 입력란 끝 -->

							<!-- div 사이 간격 시작 -->
							<div class="or_div_interSpace"></div>
							<!-- div 사이 간격 끝 -->

							<!-- 결제 예정 금액 테이블 시작 -->
							<%-- <div class="or_totalArea">

								<div class="or_totalArea">
									<div class="or_estimate">
										<div class="or_title">
											<div class="or_title_div1">
												<h3>결제 예정 금액</h3>
											</div>
										</div>

										<table border="1" summary="">
											<tr>
												<th scope="col">
													<span>총 주문 금액</span>
													<a class="more" onclick="EC_SHOP_FRONT_ORDERFORM_DISPLAY.onDiv('order_layer_detail', event);" href="#none">
														<img alt="내역보기" src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_list.gif">
													</a>
												</th>
												<th scope="col">
													<span>총 </span>
													<span id="total_addsale_text">할인</span>
													<span id="plus_mark"> + </span><span id="total_addpay_text">부가결제</span><span> 금액</span>
												</th>
												<th scope="col">총 결제예정 금액</th>
											</tr>
											<tr>
												<td class="price">
													<div class="box">
														<strong id="total_order_price_view">159,000</strong>원 
														<span class="tail displaynone">
															<span class="tail" id="total_order_price_ref_view"></span>
														</span>
													</div></td>
												<td class="option ">
													<div class="box">
														<strong>-</strong><strong id="total_sale_price_view">1,590</strong>원
														<span class="tail displaynone"><span class="tail" id="total_sale_price_ref_view"></span></span>
													</div>
												</td>
												<td class="total">
													<div class="box">
														<strong>=</strong><strong id="total_order_sale_price_view">157,410</strong>원
														<span class="tail displaynone"><span class="tail" id="total_order_sale_price_ref_view"></span></span>
													</div>
												</td>
											</tr>

										</table>
									</div>

									<!-- div 사이 간격 시작 -->
									<div class="or_div_interSpace"></div>
									<!-- div 사이 간격 끝 -->

									<div class="or_discountList">
										<div class="or_title">
											<div class="or_title_div1">
												<h3>할인 내역</h3>
											</div>
										</div>

										<table border="1" summary="">
											<tr class="total">
												<th scope="row">총 할인금액</th>
												<td><strong id="total_addsale_price_view">1,590</strong>원</td>
											</tr>
											<tr class="displaynone mCouponSelect" style="display: table-row;">
												<th scope="row">쿠폰할인</th>
												<td>
													<a id="btn_coupon_select" href="#none">
														<img alt="쿠폰적용" src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_total_coupon.gif">
													</a>
												</td>
											</tr>
											<!-- 참고 : 쿠폰적용 후 -->
<!-- 											<tr class="mCouponModify" style="display: none;"> -->
<!-- 												<th scope="row">쿠폰할인</th> -->
<!-- 												<td><span class="mTotalCouponDiscount">0원</span> <a -->
<!-- 													id="eCouponModify" href="#none"><img alt="수정" -->
<!-- 														src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_total_modify.gif"></a> -->
<!-- 													<div class="coupon" id="divCpnView" style="display: none;"> -->
<!-- 														<span id="txt_cpn_contents"></span> <span -->
<!-- 															id="txt_cpn_price"></span> <span id="txt_cpn_attr_D"></span> -->
<!-- 														<span id="txt_cpn_attr_M"></span> <span -->
<!-- 															id="txt_cpn_attr_C"></span> -->
<!-- 													</div> -->
<!-- 													<div class="couponArea" id="divCpn" style="display: none;"></div> -->
<!-- 												</td> -->
<!-- 											</tr> -->
											<!-- //참고 -->
											<tr>
												<th scope="row">추가할인금액</th>
												<td>
													<span class="grid">
													<span id="total_benefit_price_view">1,590</span>원</span> 
													<a onclick="EC_SHOP_FRONT_ORDERFORM_DISPLAY.onDiv('order_layer_addsale', event);" href="#none">
														<img alt="내역보기" src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_list.gif">
													</a>
												</td>
											</tr>

										</table>
									</div>

									<!-- div 사이 간격 시작 -->
									<div class="or_div_interSpace"></div>
									<!-- div 사이 간격 끝 -->

									<div class="or_extrafee">

										<div class="or_title">
											<div class="or_title_div1">
												<h3>부가결제 내역</h3>
											</div>
										</div>

										<table class="option" border="1" summary="">
											<tr class="total">
												<th scope="row">총 부가결제금액</th>
												<td><strong id="total_addpay_price_view">0</strong>원</td>
											</tr>

											<!-- 적립금 -->

											<tr>
												<th scope="row">적립금</th>
												<td>
													<p>
														<input name="input_mile" class="form-control" id="input_mile" type="text" size="10" placeholder="" value="" fw-msg="" fw-label="적립금" fw-filter=""> 원
														(총 사용가능 적립금 : <strong class="point">${total_point - used_point }</strong>원)
													</p>
													<ul class="info">
														<li>적립금은 최소 0 이상일 때 결제가 가능합니다.</li>
														<li id="mileage_max_unlimit">최대 사용금액은 제한이 없습니다.</li>
														<li class="displaynone" id="mileage_max_limit">1회 구매시 적립금 최대 사용금액은 입니다.</li>
														<li>적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면 주문이 완료됩니다.</li>
													</ul>
												</td>
											</tr>

										</table>
									</div>

								</div>

							</div> --%>
							<!-- 결제 예정 금액 테이블 끝 -->

							<!-- div 사이 간격 시작 -->
							<div class="or_div_interSpace"></div>
							<!-- div 사이 간격 끝 -->

							<!-- 결제 수단 테이블 시작 -->

							<div class="or_payArea">
								<div class="or_payMethod">
									<div class="or_title">
										<div class="or_title_div1">
											<h3>결제수단</h3>
										</div>
									</div>
									<div class="or_payMethodSelect">
										<label>
											<div class="radio">
												<span class="or_paymethod0 checked">
													<input name="or_paymethod" id="or_paymethod0" class="radio" type="radio" value="무통장입금" fw-msg="" fw-label="1" fw-filter="">
												</span>
											</div> 무통장 입금
										</label>

										<!--<div>&nbsp;&nbsp;&nbsp;</div>

										 <label>
					          				 <div class="radio">
					          					 <span class="or_paymethod1">
					          					 	<input name="sameaddr" id="sameaddr1" class="radio" type="radio" value="카드결제" fw-msg="" fw-label="1" fw-filter="">
					          					 </span>
					          				 </div> 카드 결제
					       				</label> -->
									</div>

									<div class="or_payMethodwrap1 ">
										<div class="or_payMethodwrap1 col-lg-9 col-md-9 col-sm-12">
											<!-- 무통장입금 -->
											<table id="payment_input_cash" style="display: table;" border="1" summary="">
												<tr>
													<th scope="row">입금자명</th>
													<td>
														<input name="or_payername" class="form-control" id="or_payername" type="text" size="15" maxlength="20"
															placeholder="" value="" fw-msg="" fw-label="무통장 입금자명" fw-filter="">
													</td>
												</tr>

												<tr>
													<th scope="row">입금은행</th>
													<td>
														<select name="or_bankinfo" class="form-control" id="or_bankinfo" fw-label="무통장 입금은행">
															<option value="-1">::: 입금은행 선택 :::</option>
															<option value="bank_01:0123456789:홍길동:농협:www.nonghyup.com">농협0123456789홍길동</option>
															<option value="bank_02:0987654321:홍길동:우리은행:www.wooribank.com/">우리은행0987654321홍길동</option>
														</select>
<!-- 														<p class="grid "> -->
<!-- 															<a id="btn_bank_go" href="#none"> -->
<!-- 																<img alt="은행사이트 바로가기 " src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_bank.gif"> -->
<!-- 															</a> -->
<!-- 														</p> -->
														<div class="or_payHelp" id="pg_paymethod_info" style="display: block;">
															<p id="pg_paymethod_info_shipfee" style="display: block;">
																최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.
															</p>
														</div>
													</td>
												</tr>

												<!-- 무통장입금, 카드결제, 휴대폰결제, 실시간계좌이체 -->

												<!-- 
						
						<tr>
							<th scope="row">현금영수증<br>발행
							</th>
							<td>
								<div class="or_cashreceipttype">
									<label>
	                     				 <div class="radio">
	                     					 <span class="or_cashreceipttype0 checked"><input name="or_cashreceipttype" id="or_cashreceipttype0" class="radio" type="radio" value="개인" fw-msg="" fw-label="1" fw-filter=""></span>
	                     				 </div> 개인
	                  				</label>
									
									<label>
	                     				 <div class="radio">
	                     					 <span class="or_cashreceipttype1"><input name="or_cashreceipttype" id="or_cashreceipttype1" class="radio" type="radio" value="사업자" fw-msg="" fw-label="1" fw-filter=""></span>
	                     				 </div> 사업자
	                  				</label>
									
									<label>
	                     				 <div class="radio">
	                     					 <span class="or_cashreceipttype2"><input name="or_cashreceipttype" id="or_cashreceipttype2" class="radio" type="radio" value="신청안함" fw-msg="" fw-label="1" fw-filter=""></span>
	                     				 </div> 신청안함
	                  				</label>
								</div>
								
								<div class="mobile" id="cashreceipt_mobile_display_area">
									<strong>휴대전화 : </strong> <select
										name="cashreceipt_user_mobile[]"
										class="form-control"
										id="cashreceipt_user_mobile1" fw-msg=""
										fw-label="현금영수증 개인-핸드폰 번호"
										fw-filter="isNumber&amp;isFill&amp;isMobile" fw-alone="N">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
									 - <input name="cashreceipt_user_mobile[]"
										class="form-control" id="cashreceipt_user_mobile2" type="text" maxlength="4"
										value="" fw-msg="" fw-label="현금영수증 개인-핸드폰 번호"
										fw-filter="isNumber&amp;isFill&amp;isMobile" fw-alone="N">
									 - <input name="cashreceipt_user_mobile[]"
										class="form-control" id="cashreceipt_user_mobile3" type="text" maxlength="4"
										value="" fw-msg="" fw-label="현금영수증 개인-핸드폰 번호"
										fw-filter="isNumber&amp;isFill&amp;isMobile" fw-alone="N">
								</div>
								<div class="regno" id="cashreceipt_regno_display_area"
									style="display: none;">
									<strong>사업자등록번호 : </strong> <input name="cashreceipt_reg_no"
										id="cashreceipt_reg_no" type="text" value="" fw-msg=""
										fw-label="현금영수증 사업자 번호" fw-filter="">
									<p class="grid">입력 시 '-' 없이 숫자만 입력하세요.</p>
								</div></td>
						</tr>
 -->
											</table>

										</div>

										<!-- 최종결제금액 -->
										<div class="or_payMethodwrap2 col-lg-3 col-md-3 col-sm-12">
											<h4>
												<strong id="current_pay_name">무통장 입금</strong> 
												<span>최종결제 금액</span>
											</h4>
											<p class="or_total_fee">
												<span class="or_domestic_ship_fee_sum" id="or_domestic_ship_fee_sum">
														<strong><fmt:formatNumber value="${alltotal - discountPrice }" pattern="#,###" /></strong>
												</span>원
												
												<input type="hidden" name="or_totalprice" id="or_totalprice" value="${alltotal}"/>
												<input type="hidden" name="or_realpayprice" id="or_realpayprice" value="${alltotal - discountPrice }"/>
												
												
												
											</p>

											<div class="or_paymentAgreewrap" id="chk_purchase_agreement">
												<input name="chk_purchase_agreement" id="chk_purchase_agreement0" type="checkbox" value="T" fw-label="구매진행 동의"> 
													<label for="chk_purchase_agreement0">구매진행에 동의합니다.</label>
											</div>
											<div class="or_div_paymentAgree">
												<input type="button" id="or_btn_payAgree" class="btn btn-primary" value="결제 하기" onclick="fnSubmit()" />
											</div>

											<script type="text/javascript">
											function fnSubmit(){
												/* alert("dddd"); 잘 실행됨*/
												$("#order_form").submit();
											}
											</script>

											<!--<div class="mileage">
												 <p> <strong>총 적립예정금액</strong><span id="mAllMileageSum" style="display: inline;">0원</span> </p>
												<ul>
													<li><strong>상품별 적립금</strong><span id="mProductMileage">0원</span> </li>
													<li><strong>회원 적립금</strong><span id="mMemberMileage">0원</span> </li>
													<li><strong>쿠폰 적립금</strong><span id="mCouponMileage">0원</span> </li>
												</ul>
											</div> -->
										</div>
									</div>

								</div>
								<!-- 결제 수단 테이블 끝 -->

								<!-- div 사이 간격 시작 -->
								<div class="or_div_interSpace"></div>
								<!-- div 사이 간격 끝 -->
								
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
