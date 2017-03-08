<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="main">
	<div class="container">
		<!-- BEGIN SIDEBAR & CONTENT -->
		<div class="row margin-bottom-40">
		  <!-- BEGIN CONTENT -->
		  <div class="col-md-12 col-sm-12">
		    <h1>장바구니 목록</h1>
		    <div class="goods-page">
		      <div class="goods-data clearfix">
		        <div class="table-wrapper-responsive">
		        <table summary="Shopping cart">
		          <tr>
		            <th class="goods-page-image">제품사진</th>
		            <th class="goods-page-description">내용</th>
		            <th class="goods-page-ref-no">Ref No</th>
		            <th class="goods-page-quantity">수량</th>
		            <th class="goods-page-price">상품가격</th>
		            <th class="goods-page-total" colspan="2">총가격</th>
		          </tr>
		          <tr>
		            <td class="goods-page-image">
		              <a href="javascript:;"><img src="assets/pages/img/products/model3.jpg" alt="Berry Lace Dress"></a>
		            </td>
		            <td class="goods-page-description">
		              <h3><a href="javascript:;">제품명</a></h3>
		              <p><strong>Item 1</strong> - 색상: Green; 사이즈: S</p>
		              <em>주문내용 상세보기???</em>
		            </td>
		            <td class="goods-page-ref-no">
		              javc2133
		            </td>
		            <td class="goods-page-quantity">
		              <div class="product-quantity">
		                  <input id="product-quantity" type="text" value="1" readonly class="form-control input-sm">
		              </div>
		            </td>
		            <td class="goods-page-price">
		              <strong><span>$</span>47.00</strong>
		            </td>
		            <td class="goods-page-total">
		              <strong><span>$</span>47.00</strong>
		            </td>
		            <td class="del-goods-col">
		              <a class="del-goods" href="javascript:;">&nbsp;</a>
		            </td>
		          </tr>
		          <tr>
		            <td class="goods-page-image">
		              <a href="javascript:;"><img src="assets/pages/img/products/model4.jpg" alt="Berry Lace Dress"></a>
		            </td>
		            <td class="goods-page-description">
		              <h3><a href="javascript:;">제품명</a></h3>
		              <p><strong>Item 1</strong> - 색상: Green; 사이즈: S</p>
		              <em>More info is here</em>
		            </td>
		            <td class="goods-page-ref-no">
		              javc2133
		            </td>
		            <td class="goods-page-quantity">
		              <div class="product-quantity">
		                  <input id="product-quantity2" type="text" value="1" readonly class="form-control input-sm">
		              </div>
		            </td>
		            <td class="goods-page-price">
		              <strong><span>$</span>47.00</strong>
		            </td>
		            <td class="goods-page-total">
		              <strong><span>$</span>47.00</strong>
		            </td>
		            <td class="del-goods-col">
		              <a class="del-goods" href="javascript:;">&nbsp;</a>
		            </td>
		          </tr>
		        </table>
		        </div>
		
		        <div class="shopping-total">
		          <ul>
		            <li>
		              <em>총 제품 가격</em>
		              <strong class="price"><span>$</span>47.00</strong>
		            </li>
		            <li>
		              <em>배송비</em>
		              <strong class="price"><span>$</span>3.00</strong>
		            </li>
		            <li class="shopping-total-price">
		              <em>총 주문가격</em>
		              <strong class="price"><span>$</span>50.00</strong>
		            </li>
		          </ul>
		        </div>
		      </div>
		      <button class="btn btn-default" type="submit">쇼핑 계속하기 <i class="fa fa-shopping-cart"></i></button>
		      <button class="btn btn-primary" type="submit">Checkout <i class="fa fa-check"></i></button>
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
		      <div>
		        <div class="product-item">
		          <div class="pi-img-wrapper">
		            <img src="assets/pages/img/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
		            <div>
		              <a href="assets/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
		              <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
		            </div>
		          </div>
		          <h3><a href="shop-item.html">상품명</a></h3>
		          <div class="pi-price">$29.00</div>
		          <a href="javascript:;" class="btn btn-default add2cart">장바구니 담기</a>
		          <div class="sticker sticker-new"></div>
		        </div>
		      </div>
		      <div>
		        <div class="product-item">
		          <div class="pi-img-wrapper">
		            <img src="assets/pages/img/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
		            <div>
		              <a href="assets/pages/img/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
		              <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
		            </div>
		          </div>
		          <h3><a href="shop-item.html">상품명2</a></h3>
		          <div class="pi-price">$29.00</div>
		          <a href="javascript:;" class="btn btn-default add2cart">장바구니 담기</a>
		        </div>
		      </div>
		      <div>
		        <div class="product-item">
		          <div class="pi-img-wrapper">
		            <img src="assets/pages/img/products/k3.jpg" class="img-responsive" alt="Berry Lace Dress">
		            <div>
		              <a href="assets/pages/img/products/k3.jpg" class="btn btn-default fancybox-button">Zoom</a>
		              <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
		            </div>
		          </div>
		          <h3><a href="shop-item.html">상품명3</a></h3>
		          <div class="pi-price">$29.00</div>
		          <a href="javascript:;" class="btn btn-default add2cart">장바구니 담기</a>
		        </div>
		      </div>
		      <div>
		        <div class="product-item">
		          <div class="pi-img-wrapper">
		            <img src="assets/pages/img/products/k4.jpg" class="img-responsive" alt="Berry Lace Dress">
		            <div>
		              <a href="assets/pages/img/products/k4.jpg" class="btn btn-default fancybox-button">Zoom</a>
		              <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
		            </div>
		          </div>
		          <h3><a href="shop-item.html">상품명4</a></h3>
		          <div class="pi-price">$29.00</div>
		          <a href="javascript:;" class="btn btn-default add2cart">장바구니 담기</a>
		          <div class="sticker sticker-sale"></div>
		        </div>
		      </div>
		      <div>
		        <div class="product-item">
		          <div class="pi-img-wrapper">
		            <img src="assets/pages/img/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
		            <div>
		              <a href="assets/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
		              <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
		            </div>
		          </div>
		          <h3><a href="shop-item.html">상품명5</a></h3>
		          <div class="pi-price">$29.00</div>
		          <a href="javascript:;" class="btn btn-default add2cart">장바구니 담기</a>
		        </div>
		      </div>
		      <div>
		        <div class="product-item">
		          <div class="pi-img-wrapper">
		            <img src="assets/pages/img/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
		            <div>
		              <a href="assets/pages/img/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
		              <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
		            </div>
		          </div>
		          <h3><a href="shop-item.html">Berry Lace Dress6</a></h3>
		          <div class="pi-price">$29.00</div>
		          <a href="javascript:;" class="btn btn-default add2cart">장바구니 담기</a>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- END SIMILAR PRODUCTS -->
		</div>
	</div>