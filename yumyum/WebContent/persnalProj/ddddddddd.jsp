<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="js/jquery.slides.min.js"></script>

  <script>
  $(function(){
	  $("#slides").slidesjs({
	    width: 940,
	    height: 350,
		  play: {
	      active: false,
	      effect: "slide",
	      interval: 5000,
	      auto: true,
	      swap: true,
	      pauseOnHover: false,
	      restartDelay: 2500
	    }
	  });
	});
  </script>

<div id="slides">
    <img src="img/food01.jpg">
    <img src="img/food02.jpg">
    <img src="http://placehold.it/940x350">
</div>

</body>
</html>