<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<a class="site-logo" href="../go_main.mr">
		<img src="assets/img/logo2.png" alt="Metronic Shop UI">
	</a> 
	<a href="javascript:void(0);" class="mobi-toggler">
		<i class="fa fa-bars"></i>
	</a>

	<!-- BEGIN CART -->
	<%@ include file="../cart/header-cart.jsp" %>
	<!--END CART -->

	<!-- BEGIN NAVIGATION -->
	<div class="header-navigation">
		<ul>
			<li><a href="index.jsp?content=common/about/about.jsp"> About </a></li>
			<li><a href="../product_sale.pr?status=sale"> SALE</a></li>
			<li><a href="../product_list.pr?category=briefcase">BriefCase</a></li>
			<li><a href="../product_list.pr?category=backpack">BackPack</a></li>
			<li> <a href="../product_list.pr?category=cross">Cross</a></li>
			<li> <a href="../product_sale.pr?status=preorder">Pre-Order</a></li>
			<li class="dropdown"> 
				<a class="dropdown-toggle" data-toggle="dropdown" data-target="#" target="_blank" >Board</a>
				<ul class="dropdown-menu">
					<li><a href="../notice_list.no">Notice</a></li>
					<li><a href="../qna_list.br">FAQ&A</a></li>
					<li><a href="../review_list.bo">Review</a></li>
				</ul>
			</li>

			<!-- BEGIN TOP SEARCH -->
			<li class="menu-search"><span class="sep"></span><i class="fa fa-search search-btn"></i>
				<div class="search-box">
					<form action="#">
						<div class="input-group">
							<input type="text" placeholder="Search" class="form-control">
							<span class="input-group-btn">
								<button class="btn btn-primary" type="submit">Search</button>
							</span>
						</div>
					</form>
				</div></li>
			<!-- END TOP SEARCH -->
		</ul>
	</div>
	<!-- END NAVIGATION -->
	</div>
