<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div class="main signUp">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="../go_main.mr">Home</a></li>
            <li><a href="../mypageMain.mr">Mypage</a></li>
            <li class="active">Mypage</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
        	<jsp:include page="Side.jsp"></jsp:include>
          <!-- END SIDEBAR -->
	
          <!-- BEGIN CONTENT -->
          <div class="col-md-10 col-sm-9">
            <h1>마이페이지</h1>
            <div class="content-form-page MP_wrap">
            <span>${id}님 환영합니다</span>
            
            <hr>
             <ul class="MP_ul">
             	<li class="MP_li">
             		<strong class="MP_title">가용 적립금<input class="btn btn-primary mileage_btn" type="button" onclick="location.href='/projectTForgit/myPoint.mr'" value="조회"></strong>
             		<strong class="MP_data">${total-used }원</strong>
             	</li>
             	<li class="MP_li">
             		<strong class="MP_title">사용 적립금</strong>
             		<strong class="MP_data">${requestScope.used }원</strong>
             	</li>
             	<li class="MP_li">
             		<strong class="MP_title">총 적립금</strong>
             		<strong class="MP_data">${requestScope.total }원</strong>
             	</li>
             	<li class="MP_li">
             		<strong class="MP_title">구매 횟수</strong>
             		<strong class="MP_data">${requestScope.mdto.mb_buy_cnt }</strong>
             	</li>
             	<li class="MP_li">
             		<strong class="MP_title">등급</strong>
             		<strong class="MP_data">${requestScope.mdto.mb_grade }</strong>
             	</li>
             	<li class="MP_li">
             		<strong class="MP_title">최근 로그인</strong>
             		<strong class="MP_data">${requestScope.mdto.mb_last_login }</strong>
             	</li>
             	<li class="MP_li">
             		<strong class="MP_title">보유한 쿠폰<input class="btn btn-primary mileage_btn" type="button" onclick="location.href='/projectTForgit/mypage_coupon.mr'" value="보기"></strong>
             		<strong class="MP_data">${requestScope.total_cp }개</strong>
             	</li>
             	<li class="MP_li">
             		<strong class="MP_title">사용한 쿠폰</strong>
             		<strong class="MP_data">${requestScope.used_cp }개</strong>
             	</li>
             	
             	
             
             </ul>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>
     
  <div id="instaPics" style="height: 250px;"></div> 
    <!-- BEGIN BRANDS -->
<!--     <div class="brands"> -->
<!--       <div class="container"> -->
<!--             <div class="owl-carousel owl-carousel6-brands"> -->
<!--               <a href="shop-product-list.html"><img src="assets/pages/img/brands/canon.jpg" alt="canon" title="canon"></a> -->
<!--               <a href="shop-product-list.html"><img src="assets/pages/img/brands/esprit.jpg" alt="esprit" title="esprit"></a> -->
<!--               <a href="shop-product-list.html"><img src="assets/pages/img/brands/gap.jpg" alt="gap" title="gap"></a> -->
<!--               <a href="shop-product-list.html"><img src="assets/pages/img/brands/next.jpg" alt="next" title="next"></a> -->
<!--               <a href="shop-product-list.html"><img src="assets/pages/img/brands/puma.jpg" alt="puma" title="puma"></a> -->
<!--               <a href="shop-product-list.html"><img src="assets/pages/img/brands/zara.jpg" alt="zara" title="zara"></a> -->
<!--               <a href="shop-product-list.html"><img src="assets/pages/img/brands/canon.jpg" alt="canon" title="canon"></a> -->
<!--               <a href="shop-product-list.html"><img src="assets/pages/img/brands/esprit.jpg" alt="esprit" title="esprit"></a> -->
<!--               <a href="shop-product-list.html"><img src="assets/pages/img/brands/gap.jpg" alt="gap" title="gap"></a> -->
<!--               <a href="shop-product-list.html"><img src="assets/pages/img/brands/next.jpg" alt="next" title="next"></a> -->
<!--               <a href="shop-product-list.html"><img src="assets/pages/img/brands/puma.jpg" alt="puma" title="puma"></a> -->
<!--               <a href="shop-product-list.html"><img src="assets/pages/img/brands/zara.jpg" alt="zara" title="zara"></a> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
    
    
    <!-- END BRANDS -->
 

    