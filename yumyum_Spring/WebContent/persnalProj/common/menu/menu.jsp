<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../sub_header.jsp" />
<!-- Bootstrap -->
<link href="./css/nomalize.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet">
    
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- Header -->
<a name="about"></a>
<div class="intro-header subImg02">
	<div class="container">

		<div class="row">
			<div class="col-lg-12">
				<div class="intro-message">
					<h1>Menu</h1>
					<h3>얌얌의 맛있는 메뉴입니다.</h3>
					<hr class="intro-divider">
				</div>
			</div>
		</div>

	</div>
	<!-- /.container -->

</div>
<!-- /.intro-header -->

<div class="container menu">
	<div class="content1">
		<h1>얌얌의 인기메뉴, 스테이크!</h1>
		<h4>음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 </h4>

	</div>
	<div class="content2">
		<h1>얌얌의 인기메뉴, 파스타!</h1>
		<h4>음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 </h4>
	</div>
	<div class="content3">
		<h1>얌얌의 인기메뉴, 샐러드!</h1>
		<h4>음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 </h4>

	</div>
	<div class="content4">
		<h1>얌얌의 인기메뉴, 피자!</h1>
		<h4>음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 </h4>

	</div>
	<div class="end"></div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="./js/bootstrap.min.js"></script>
<script src="./js/waypoints.min.js"></script>
<script src="./js/simpleparallax.js"></script>
<script>
 $('.end').waypoint(function(direction) {
   if (direction === 'down') {
     $('#myModal').modal('show')
   }
 }, {
   offset: '100%'
 }).waypoint(function(direction) {
   if (direction === 'up') {
     $('#myModal').modal('hide')
   }
 });

 </script>

<jsp:include page="../sub_footer.jsp" />