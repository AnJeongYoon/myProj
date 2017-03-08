<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="assets/css/jquery.simpleLens.css">
<link rel="stylesheet" type="text/css" href="assets/css/jquery.simpleGallery.css">
<% 
String category = request.getParameter("category");

System.out.println(category);
%>
<div class="main">
	<div class="container">
		<!-- 네비게이션 -->
		<%@ include file="../nav/sub_navi.jsp" %>
		<!-- 네비게이션 -->
		
		<!-- BEGIN SIDEBAR & CONTENT -->
		<div class="row margin-bottom-40">
		  <!-- BEGIN SIDEBAR -->
			<%-- <%@ include file="sidebar.jsp" %> --%>
		  <!-- END SIDEBAR -->
		
		  <!-- BEGIN CONTENT -->
		  <div class="col-md-12">
		    <div class="product-page">
		      <div class="row">
		        <div class="col-md-6 col-sm-6">

<!-- 		          <div class="product-main-image"> -->
<!-- 		            <img src="assets/pages/img/products/model7.jpg" alt="Cool green dress with red bell" class="img-responsive" data-BigImgsrc="assets/pages/img/products/model7.jpg"> -->
<!-- 		          </div> -->

<!-- 		          <div class="product-other-images"> -->
<!-- 		            <a href="assets/pages/img/products/model3.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="assets/pages/img/products/model3.jpg"></a> -->
<!-- 		            <a href="assets/pages/img/products/model4.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="assets/pages/img/products/model4.jpg"></a> -->
<!-- 		            <a href="assets/pages/img/products/model5.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="assets/pages/img/products/model5.jpg"></a> -->
<!-- 		          </div> -->
		          
		          <div class="simpleLens-gallery-container" id="demo-1">
			        <div class="simpleLens-container">
			            <div class="simpleLens-big-image-container">
			                <a class="simpleLens-lens-image" data-lens-image="${info.image_path}${info.image_name}">
			                    <img src="${info.image_path}${info.image_name}" class="simpleLens-big-image">
			                </a>
			            </div>
			        </div>
			        <div class="simpleLens-thumbnails-container product-other-images">
						<c:forEach var="pImg" items="${requestScope.pImg}" >	
				            <a href="#" class="simpleLens-thumbnail-wrapper" data-lens-image="${pImg.image_path}${pImg.image_name}"
				               data-big-image="${pImg.image_path}${pImg.image_name}">
				                <img src="${pImg.image_path}${pImg.image_name}">
				            </a>
			            </c:forEach>
			        </div>
		          </div>
		        </div>
		        <div class="col-md-6 col-sm-6">
		          <h1>${info.pr_product }</h1>
		          <div class="price-availability-block clearfix">
                    <c:if test="${info.pr_status ne 'sale' }">
	                    <div class="price">
	                      <strong><fmt:formatNumber value="${info.pr_price }" pattern="#,###" /><span>원</span></strong>
	                    </div>
                    </c:if>
                    <c:if test="${info.pr_status eq 'sale' }">
	                    <div class="price">
	                      <strong>
	                      	<fmt:parseNumber var="salePrice" integerOnly="true" value="${info.pr_price*((100-info.pr_discount)/100)}" />
	                      	<fmt:formatNumber value="${salePrice }" pattern="#,###" /><span>원</span></strong>
	                      <em><span><fmt:formatNumber value="${info.pr_price }" pattern="#,###" /></span>원</em>
	                    </div>
	                    <div class="availability">
	                      Availability: <strong>In Stock</strong>
	                    </div>
                    </c:if>
                  </div>
		          <div class="description">
		            <p>${info.pr_pro_info }</p>
		          </div>
		          <div class="product-page-options">
<!-- 		            <div class="pull-left"> -->
<!-- 		              <label class="control-label">사이즈:</label> -->
<!-- 		              <select class="form-control input-sm"> -->
<!-- 		                <option>L</option> -->
<!-- 		                <option>M</option> -->
<!-- 		                <option>S</option> -->
<!-- 		              </select> -->
<!-- 		            </div> -->
		            <div class="pull-left">
		              <label class="control-label">소재: ${info.pr_material }</label>
		            </div>
		            <div class="pull-left">
		              <label class="control-label">색상: ${info.pr_color }</label>
		            </div>
		          </div>
		          <div class="product-page-options" style="border-top: none; padding-top: 0;">
		          	<div class="pull-left">
		              <label class="control-label">가로*세로*폭: ${info.pr_size }</label>
		            </div>
		            <div class="pull-left">
		              <label class="control-label">끈길이: ${info.pr_length }</label>
		            </div>
		          </div>
		          <div class="product-page-options" style="border-top: none; padding-top: 0;">
		          	<div class="pull-left">
		              <label class="control-label">코드: ${info.pr_pro_code }</label>
		            </div>
		            <div class="pull-left">
		              <label class="control-label">원산지: ${info.pr_orgin }</label>
		            </div>
		            <div class="pull-left">
		              <label class="control-label">브랜드: ${info.pr_brand }</label>
		            </div>
		          </div>
		          <div class="product-page-cart">
		            <div class="product-quantity">
		                <input id="product-quantity" type="text" value="1" readonly class="form-control input-sm">
		            </div>
		            <button class="btn btn-primary add2cart" type="submit">장바구니 담기
		             <!-- 장바구니 페이지 이동시 가져갈 값 // 주문하기 페이지 이동시 가져갈 값 -->
		            <input type="hidden" id="pr_pro_code" name="pr_pro_code" value="${info.pr_pro_code }">
		            </button>
<!-- 		            <button class="btn btn-primary addtoorderform" type="button">바로 주문하기 -->
<%-- 		             <input type="hidden" id="or_pro_code" name="pr_pro_code" value="${info.pr_pro_code }"> --%>
<!-- 		            </button> -->
		          </div>
		          <div class="review">
		            <c:if test="${reviewCnt ne 0}">
		            	<div class="rateit" data-rateit-value="${AvgReviewScore }" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
		            </c:if>
		            <c:if test="${reviewCnt eq 0}">
		            	<div>해당 상품에 대한 별점이 없습니다. 리뷰에서 별점을 입력해주세요^^</div>
		            </c:if>
		            <a href="/projectTForgit/review_list.bo?pr_pro_code=${info.pr_pro_code}">리뷰 ${reviewCnt }개</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		            <c:choose>
		            	<c:when test="${id==null}">
		            		<a onclick="plz_login()">리뷰쓰기</a>
		            	</c:when>
		            	<c:otherwise>
		            		<a href="../review_write.bo?pr_pro_code=${info.pr_pro_code}">리뷰쓰기</a>
		            	</c:otherwise>
		            </c:choose>
		          </div>
		          <input type="hidden" id="rv_pro_code" name="pr_pro_code" value="${info.pr_pro_code}">
		          <!-- <ul class="social-icons">
		            <li><a class="facebook" data-original-title="facebook" href="javascript:;"></a></li>
		            <li><a class="twitter" data-original-title="twitter" href="javascript:;"></a></li>
		            <li><a class="googleplus" data-original-title="googleplus" href="javascript:;"></a></li>
		            <li><a class="evernote" data-original-title="evernote" href="javascript:;"></a></li>
		            <li><a class="tumblr" data-original-title="tumblr" href="javascript:;"></a></li>
		          </ul> -->
		        </div>
		
		        <div class="product-page-content">
		          <ul id="myTab" class="nav nav-tabs">
		            <li><a href="#Description" data-toggle="tab">상품설명</a></li>
<!-- 		            <li><a href="#Information" data-toggle="tab">상품상세설명</a></li> -->
		            <li class="active"><a href="#Reviews" data-toggle="tab">리뷰 (${reviewCnt })</a></li>
		          </ul>
		          
		          <div id="myTabContent" class="tab-content">
		            <div class="tab-pane fade" id="Description">
		              <p>
			              <c:if test="${infoImg eq '' }">상세이미지가 없습니다. 관리자에게 문의하세요.</c:if>
			              <c:if test="${infoImg ne '' }"><img src="${infoImg }"></c:if>
		              </p>
		            </div>
		            
<!-- 		            <div class="tab-pane fade" id="Information"> -->
<!-- 		              <table class="datasheet"> -->
<!-- 		                <tr> -->
<!-- 		                  <th colspan="2">상품상세설명</th> -->
<!-- 		                </tr> -->
<!-- 		                <tr> -->
<!-- 		                  <td class="datasheet-features-type">가로*세로*폭</td> -->
<!-- 		                  <td>21 cm * 15 cm * 5 cm</td> -->
<!-- 		                </tr> -->
<!-- 		                <tr> -->
<!-- 		                  <td class="datasheet-features-type">소재</td> -->
<!-- 		                  <td>소가죽(Cow Leather)</td> -->
<!-- 		                </tr> -->
<!-- 		                <tr> -->
<!-- 		                  <td class="datasheet-features-type">끈길이</td> -->
<!-- 		                  <td>45 cm</td> -->
<!-- 		                </tr> -->
<!-- 		              </table> -->
<!-- 		            </div> -->
		            
		            <!-- START ReviewBoard -->
		            <div class="tab-pane fade in active" id="Reviews">
		            	<c:if test="${reviewCnt eq '0'}">
							<p>해당 상품에 대한 리뷰가 없습니다. 첫번째 리뷰를 작성해 주세요^^</p>
						</c:if>
						<c:if test="${reviewCnt ne '0'}">
							<c:forEach var="reviewList" items="${requestScope.reviewContentList}" >
							<div class="review-item clearfix">
								<div class="review-item-submitted">
									<strong>${reviewList.rv_name }</strong>
									<div class="rateit" data-rateit-value="${reviewList.rv_score }" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
								</div>
								<div class="review-item-content">
									<strong>${reviewList.rv_title}</strong>
									<p>${reviewList.rv_content }</p>
								</div>
							</div>
							</c:forEach>
							<a href="/projectTForgit/review_list.bo"><input type="button" class="moreReview" value="> 리뷰 더 보기" /></a>
						</c:if>
					
						<!-- BEGIN FORM-->
<!-- 						<form action="#" class="reviews-form" role="form"> -->
<!-- 							<h2>리뷰쓰기</h2> -->
<%-- 							<% if(session.getAttribute("id") != null){ %> --%>
<!-- 							<div class="form-group"> -->
<%-- 								<label for="name">아이디  <span><%=session.getAttribute("id") %></span></label>  --%>
<!-- 								<label> </label> -->
<!-- 							</div> -->
<!-- 							<div class="form-group"> -->
<!-- 								<label for="review">내용 <span class="require">*</span></label> -->
<!-- 								<textarea class="form-control" rows="8" id="review"></textarea> -->
<!-- 							</div> -->
<!-- 							<div class="form-group"> -->
<!-- 								<label for="email">별점</label> <input type="range" value="4" step="0.25" id="backing5"> -->
<!-- 								<div class="rateit" data-rateit-backingfld="#backing5" data-rateit-resetable="false" data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div> -->
<!-- 							</div> -->
<!-- 							<div class="padding-top-20"> -->
<!-- 								<button type="submit" class="btn btn-primary">등록</button> -->
<!-- 							</div> -->
<%-- 							<% } else { %> --%>
<!-- 							<div class="form-group"> -->
<!-- 								<label>로그인 후 리뷰를 작성할 수 있습니다.</label> -->
<!-- 								<input type="button" id="loginBtn" value="로그인" onclick="layer_open('layer2');return false;" />  -->
<!-- 							</div> -->
<%-- 							<% } %> --%>
<!-- 						</form> -->
						<!-- END FORM-->
					</div>
		            <!-- ReviewBoard END -->
		          </div>
		        </div>
		        
				<c:if test="${info.pr_status eq 'sale' }">
		        	<div class="sticker sticker-sale"></div>
		        </c:if>
		        <c:if test="${info.pr_status eq 'new' }">
		        	<div class="sticker sticker-new"></div>
		        </c:if>
		      </div>
		    </div>
		  </div>
		  <!-- END CONTENT -->
		</div>
		<!-- END SIDEBAR & CONTENT -->
		
		<!-- BEGIN SIMILAR PRODUCTS -->
		<div class="row margin-bottom-40">
		  <div class="col-md-12 col-sm-12">
		    <h2>인기상품</h2>
		    <div class="owl-carousel owl-carousel4">
		        <c:forEach var="popularList" items="${requestScope.popularList}" >	
		        <div class="product-item">
		            <div class="pi-img-wrapper">
		            <img src="${popularList.image_path}${popularList.image_name}" class="img-responsive" alt="Berry Lace Dress">
<!-- 		            <div> -->
<!-- 		              <a href="assets/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a> -->
<!-- 		              <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a> -->
<!-- 		            </div> -->
		          </div>
		          <h3><a href="shop-item.html">${popularList.pr_product}</a></h3>
		          <div class="pi-price"><fmt:formatNumber value="${popularList.pr_price}" pattern="#,###" /></div>
		          <a href="javascript:;" class="btn btn-default add2cart">장바구니 담기</a>
		          <c:if test="${popularList.pr_status eq 'sale' }">
		        	<div class="sticker sticker-sale"></div>
		          </c:if>
		          <c:if test="${popularList.pr_status eq 'new' }">
		        	<div class="sticker sticker-new"></div>
		          </c:if>
		        </div>
	            </c:forEach>
		    </div>
		  </div>
		</div>
		<!-- END SIMILAR PRODUCTS -->
		</div>
	</div>