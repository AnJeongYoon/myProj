<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<!--
Template: Metronic Frontend Freebie - Responsive HTML Template Based On Twitter Bootstrap 3.3.4
Version: 1.0.0
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase Premium Metronic Admin Theme: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="ko">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
<meta charset="utf-8">
<!-- 상대경로를 절대경로로 변경  : forward시 css로딩 안되던 문제 해결-->
<base href="${pageContext.request.contextPath}/TeamProj/"> 


<title>Metronic Shop UI</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta content="Metronic Shop UI description" name="description">
<meta content="Metronic Shop UI keywords" name="keywords">
<meta content="keenthemes" name="author">

<meta property="og:site_name" content="-CUSTOMER VALUE-">
<meta property="og:title" content="-CUSTOMER VALUE-">
<meta property="og:description" content="-CUSTOMER VALUE-">
<meta property="og:type" content="website">
<meta property="og:image" content="-CUSTOMER VALUE-">
<!-- link to image for socio -->
<meta property="og:url" content="-CUSTOMER VALUE-">


<link rel="shortcut icon" href="favicon.ico">

<!-- Fonts START -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">
<!--- fonts for slider on the index page -->
<!-- Fonts END -->

<!-- Global styles START -->
<link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Global styles END -->

<!-- Page level plugin styles START -->
<link href="assets/pages/css/animate.css" rel="stylesheet">
<link href="assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
<link href="assets/plugins/owl.carousel/assets/owl.carousel.css" rel="stylesheet">
<!-- Page level plugin styles END -->

<!-- SubPage plugin styles START -->
<link href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css"><!-- for slider-range -->
<link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<link href="assets/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
<!-- SubPage plugin styles END -->
<!-- Theme styles START -->
<link href="assets/pages/css/components.css" rel="stylesheet">
<link href="assets/pages/css/slider.css" rel="stylesheet">
<link href="assets/pages/css/style-shop.css" rel="stylesheet" type="text/css">
<link href="assets/corporate/css/style.css" rel="stylesheet">
<link href="assets/corporate/css/style-responsive.css" rel="stylesheet">
<link href="assets/corporate/css/themes/red.css" rel="stylesheet" id="style-color">
<link href="assets/corporate/css/custom.css" rel="stylesheet">
<!-- Theme styles END -->

<!-- Datepicker START -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Datepicker END -->

<!-- 우리가 넣는 css, js -->
<script type="text/javascript" src="assets/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="assets/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<link href="assets/css/common.css?ver=8" rel="stylesheet">
<script src="assets/js/common.js?ver=6" type="text/javascript"></script>
<!-- 우리가 넣는 css, js -->

</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">

<c:set var="content" value="${param.content }" />

<c:if test="${content == null}">
	<c:set var="content" value="common/main_body.jsp"/>
</c:if>
<c:if test="${content == ''}">
	<c:set var="content" value="common/main_body.jsp"/>
</c:if>

	<!-- BEGIN TOP BAR -->
	<div class="pre-header">
		<%@ include file="common/nav/pre-header.jsp" %>
	</div>
	<!-- END TOP BAR -->

	<!-- BEGIN HEADER -->
	<div class="header">
		<%@ include file="common/nav/header.jsp" %>
	</div>
	<!-- Header END -->

	<!-- BEGIN Content -->
	<jsp:include page="${content }" />
	<!-- Content END -->

	<!-- BEGIN FOOTER -->
	<div class="footer">
		<div class="container">
			<div class="row">
				<!-- BEGIN COPYRIGHT -->
				<div class="col-md-4 col-sm-4 padding-top-10">2015 © Keenthemes. ALL Rights Reserved.</div>
				<!-- END COPYRIGHT -->
				<!-- BEGIN PAYMENTS -->
				<div class="col-md-4 col-sm-4">
					<ul class="list-unstyled list-inline pull-right">
						<li><img src="assets/corporate/img/payments/western-union.jpg" alt="We accept Western Union" title="We accept Western Union"></li>
						<li><img src="assets/corporate/img/payments/american-express.jpg" alt="We accept American Express" title="We accept American Express"></li>
						<li><img src="assets/corporate/img/payments/MasterCard.jpg" alt="We accept MasterCard" title="We accept MasterCard"></li>
						<li><img src="assets/corporate/img/payments/PayPal.jpg" alt="We accept PayPal" title="We accept PayPal"></li>
						<li><img src="assets/corporate/img/payments/visa.jpg" alt="We accept Visa" title="We accept Visa"></li>
					</ul>
				</div>
				<!-- END PAYMENTS -->
				<!-- BEGIN POWERED -->
				<div class="col-md-4 col-sm-4 text-right">
					<p class="powered">
						Powered by: <a href="http://www.keenthemes.com/">KeenThemes.com</a>
					</p>
				</div>
				<!-- END POWERED -->
			</div>
		</div>
	</div>
	<!-- END FOOTER -->

	<!-- BEGIN fast view of a product -->
	<div id="product-pop-up" style="display: none; width: 700px;">
		<div class="product-page product-pop-up">
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-3">
					<div class="product-main-image">
						<img src="assets/pages/img/products/model7.jpg" alt="Cool green dress with red bell" class="img-responsive">
					</div>
					<div class="product-other-images">
						<a href="javascript:;" class="active"><img alt="Berry Lace Dress" src="assets/pages/img/products/model3.jpg"></a>
						<a href="javascript:;"><img alt="Berry Lace Dress" src="assets/pages/img/products/model4.jpg"></a> 
						<a href="javascript:;"><img alt="Berry Lace Dress" src="assets/pages/img/products/model5.jpg"></a>
					</div>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-9">
					<h2>Cool green dress with red bell</h2>
					<div class="price-availability-block clearfix">
						<div class="price">
							<strong><span>$</span>47.00</strong> <em>$<span>62.00</span></em>
						</div>
						<div class="availability">
							Availability: <strong>In Stock</strong>
						</div>
					</div>
					<div class="description">
						<p>Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed
							nonumy nibh sed euismod laoreet dolore magna aliquarm erat
							volutpat Nostrud duis molestie at dolore.</p>
					</div>
					<div class="product-page-options">
						<div class="pull-left">
							<label class="control-label">Size:</label> 
							<select class="form-control input-sm">
								<option>L</option>
								<option>M</option>
								<option>XL</option>
							</select>
						</div>
						<div class="pull-left">
							<label class="control-label">Color:</label> 
							<select class="form-control input-sm">
								<option>Red</option>
								<option>Blue</option>
								<option>Black</option>
							</select>
						</div>
					</div>
					<div class="product-page-cart">
						<div class="product-quantity">
							<input id="product-quantity" type="text" value="1" readonly name="product-quantity" class="form-control input-sm">
						</div>
						<button class="btn btn-primary" type="submit">Add to cart</button>
						<a href="shop-item.html" class="btn btn-default">More details</a>
					</div>
				</div>

				<div class="sticker sticker-sale"></div>
			</div>
		</div>
	</div>
	<!-- END fast view of a product -->

	<!-- Load javascripts at bottom, this will reduce page load time -->
	<!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
	<!--[if lt IE 9]>
    <script src="assets/plugins/respond.min.js"></script>  
    <![endif]-->
	<script src="assets/plugins/jquery.min.js" type="text/javascript"></script>
	<script src="assets/plugins/jquery-migrate.min.js" type="text/javascript"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/corporate/scripts/back-to-top.js" type="text/javascript"></script>
	<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"  type="text/javascript"></script>
	<!-- END CORE PLUGINS -->

	<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
	<script src="assets/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script>
	<!-- pop up -->
	<script src="assets/plugins/owl.carousel/owl.carousel.min.js" type="text/javascript"></script>
	<!-- slider for products -->
	<script src='assets/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script>
	<!-- product zoom -->
	<script src="assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script>
	<!-- Quantity -->
    <script src="assets/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
    <!-- ItemScore -->
    
    <!-- 다음 주소 --> 
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<script src="assets/corporate/scripts/layout.js" type="text/javascript"></script>
	<script src="assets/pages/scripts/bs-carousel.js" type="text/javascript"></script>
	<script type="text/javascript">
        jQuery(document).ready(function() {
            Layout.init();    
            Layout.initOWL();
            Layout.initImageZoom();
            Layout.initTouchspin();
            Layout.initTwitter();
        });
    </script>
    
    <!-- 이미지 상세보기 스크립트 -->
	<script type="text/javascript" src="assets/js/jquery.simpleGallery.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.simpleLens.min.js"></script>
	
	<!-- END PAGE LEVEL JAVASCRIPTS -->
	
	
</body>
<!-- END BODY -->
</html>