<%@page import="review.ReviewDTO"%>
<%@page import="review.ReviewDAO"%>
<%@page import="Product.prodDTO"%>
<%@page import="java.util.List"%>
<%@page import="Product.prodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	//신상 리스트
	prodDAO pDao = new prodDAO();
	List<prodDTO> NewItemList = pDao.getNewItemList();
	request.setAttribute("NewItemList", NewItemList);

	//리뷰 내용
	ReviewDAO rDao = new ReviewDAO();
	List<ReviewDTO> MainReviewContent = rDao.getMainReviewContent();
	request.setAttribute("MainReviewContent", MainReviewContent);
	
	//모든상품 리스트
	List<prodDTO> AllItemList = pDao.getAllItemList();
	request.setAttribute("AllItemList", AllItemList);

%>

	<!-- BEGIN SLIDER -->
	<%@ include file="main_slider.jsp" %>
	<!-- END SLIDER -->
	
	<div class="main">
		<div class="container">
		<!-- BEGIN SALE PRODUCT & NEW ARRIVALS -->
			<div class="row margin-bottom-40">
				<!-- BEGIN NEW PRODUCT -->	
				<div class="col-md-12 sale-product">
					<h2>New Arrivals</h2>
					<div class="owl-carousel owl-carousel5">
					<c:forEach var="NewItemList" items="${requestScope.NewItemList}" >	
						<div class="product-item">
							<div class="pi-img-wrapper">
								<a href="../product_item.pr?pr_pro_code=${NewItemList.pr_pro_code}">
									<img src="${NewItemList.image_path }${NewItemList.image_name}" class="img-responsive">
								</a>
							</div>
							<h3> <a href="shop-item.html">${NewItemList.pr_product }</a> </h3>
							<div class="pi-price"><fmt:formatNumber value="${NewItemList.pr_price}" pattern="#,###" />원</div>
							<a href="javascript:;" class="btn btn-default add2cart">장바구니담기</a>
							<c:if test="${NewItemList.pr_status eq 'sale' }">
					        	<div class="sticker sticker-sale"></div>
					        </c:if>
					        <c:if test="${NewItemList.pr_status eq 'new' }">
					        	<div class="sticker sticker-new"></div>
					        </c:if>
						</div>
					</c:forEach>
					</div>
				</div>
				<!-- END NEW PRODUCT -->
			</div>
			<!-- END SALE PRODUCT & NEW ARRIVALS -->

			<!-- BEGIN SIDEBAR & CONTENT -->
			<div class="row margin-bottom-40 ">
				<!-- BEGIN CONTENT -->
				<div class="col-md-12 col-sm-12">
					<h2>Reviews</h2>
					<div class="owl-carousel owl-carousel3">
					<c:forEach var="MainReview" items="${requestScope.MainReviewContent}" >
						<div class="mainReview_wrap">
							<div class="ReviewContent">
								<div class="reviewImg"><img src="${MainReview.image_path }${MainReview.image_name}" /></div>
								<div class="reviewContent">
									<h2>${MainReview.rv_title }</h2>
									<div class="rateit" data-rateit-value="${MainReview.rv_score }" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
									<p>${MainReview.rv_content }</p>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
				<!-- END CONTENT -->
			</div>
			<!-- END SIDEBAR & CONTENT -->

			<!-- BEGIN TWO PRODUCTS & PROMO -->
			<div class="row margin-bottom-35 ">
				<!-- BEGIN TWO PRODUCTS -->
				<div class="col-md-12 col-sm-7">
					<h2>All Items</h2>	
					<div class="row product-list">
					<c:forEach var="AllItemList" items="${requestScope.AllItemList}" >
						<div class="col-md-3 col-sm-6 col-xs-12">
							<div class="product-item">
								<div class="pi-img-wrapper">
									<a href="../product_item.pr?pr_pro_code=${AllItemList.pr_pro_code}">
										<img src="${AllItemList.image_path }${AllItemList.image_name}" class="img-responsive">
									</a>
								</div>
								<h3> <a href="../product_item.pr?pr_pro_code=${AllItemList.pr_pro_code}">${AllItemList.pr_product }</a> </h3>
								<div class="pi-price"><fmt:formatNumber value="${AllItemList.pr_price}" pattern="#,###" />원</div>
								<a href="javascript:;" class="btn btn-default add2cart">장바구니담기</a>
								<c:if test="${AllItemList.pr_status eq 'sale' }">
						        	<div class="sticker sticker-sale"></div>
						        </c:if>
						        <c:if test="${AllItemList.pr_status eq 'new' }">
						        	<div class="sticker sticker-new"></div>
						        </c:if>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
				<!-- END TWO PRODUCTS -->
				<!-- BEGIN PROMO -->
<!-- 				<div class="col-md-6 shop-index-carousel"> -->
<!-- 					<div class="content-slider"> -->
<!-- 						<div id="myCarousel" class="carousel slide" data-ride="carousel"> -->
<!-- 							Indicators -->
<!-- 							<ol class="carousel-indicators"> -->
<!-- 								<li data-target="#myCarousel" data-slide-to="0" class="active"></li> -->
<!-- 								<li data-target="#myCarousel" data-slide-to="1"></li> -->
<!-- 								<li data-target="#myCarousel" data-slide-to="2"></li> -->
<!-- 							</ol> -->
<!-- 							<div class="carousel-inner"> -->
<!-- 								<div class="item active"> -->
<!-- 									<img src="assets/pages/img/index-sliders/slide1.jpg" class="img-responsive" alt="Berry Lace Dress"> -->
<!-- 								</div> -->
<!-- 								<div class="item"> -->
<!-- 									<img src="assets/pages/img/index-sliders/slide2.jpg" class="img-responsive" alt="Berry Lace Dress"> -->
<!-- 								</div> -->
<!-- 								<div class="item"> -->
<!-- 									<img src="assets/pages/img/index-sliders/slide3.jpg" class="img-responsive" alt="Berry Lace Dress"> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- END PROMO -->
			</div>
			<!-- END TWO PRODUCTS & PROMO -->
		</div>
	</div>