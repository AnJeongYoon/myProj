<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Bootstrap -->
<link href="./css/nomalize.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet">
    
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
    
<div class="content1_main">
	<h1>얌얌의 인기메뉴, 스테이크!</h1>
	<h4>음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 </h4>
</div>
<div class="content2_main">
	<h1>얌얌의 인기메뉴, 파스타!</h1>
	<h4>음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 </h4>
</div>
<div class="content3_main">
	<h1>얌얌의 인기메뉴, 샐러드!</h1>
	<h4>음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 </h4>
</div>
<div class="content4_main">
	<h1>얌얌의 인기메뉴, 피자!</h1>
	<h4>음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 음식설명 </h4>
</div>
<div class="end"></div>


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