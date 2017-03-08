<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function(){
	$('#tabs > ul > li').click(function (){
		var num = $(this).index();
		
		$('.tabContainer > div').css('display','none');
		$('.tabContainer > div').eq(num).css('display','block');
		
		$('#tabs > ul > li').removeClass("tab_on").addClass("tab_off");
		$('#tabs > ul > li').eq(num).removeClass("tab_off").addClass("tab_on");
	})
});
</script>
    
<div id="tabs">
  <ul>
    <li class="tab_on">About</li>
    <li class="tab_off">인사말</li>
    <li class="tab_off">찾아오시는 길</li>
  </ul>
  <div class="tabContainer">
	  <div id="tabs-1">
	    <p style="background: url(img/logo+fork_width.png) no-repeat; background-position: right bottom;">
	    	맛있는 이태리 레스토랑, YUMYUM! <br>
	    	홈페이지설명설명설명<br>
	    	홈페이지설명설명설명<br>
	    	홈페이지설명설명설명<br>
	    	홈페이지설명설명설명<br>
	    	홈페이지설명설명설명<br>
	    	홈페이지설명설명설명<br>
	    	홈페이지설명설명설명<br>
	    	홈페이지설명설명설명 홈페이지설명설명설명 <br>
	    	홈페이지설명설명설명 홈페이지설명설명설명<br>
	    	홈페이지설명설명설명 홈페이지설명설명설명 <br>
	    	홈페이지설명설명설명 홈페이지설명설명설명<br>
	    	홈페이지설명설명설명 홈페이지설명설명설명 <br>
	    	홈페이지설명설명설명 홈페이지설명설명설명<br>
	    </p>
	  </div>
	  <div id="tabs-2">
	    <p style="background: url(img/logo+fork_width.png) no-repeat; background-position: right bottom;">
	    	맛있는 이태리 레스토랑, YUMYUM!<br>
	    	인사말<br>
	    	인사말인사아니사인사<br>
	    	인사말인사아니사인사<br>
	    	인사말인사아니사인사<br>
	    	인사말인사아니사인사<br>
	    	인사말인사아니사인사<br>
	    	인사말인사아니사인사<br>
	    	인사말인사아니사인사<br>
	    	인사말인사아니사인사<br>
	    	인사말인사아니사인사<br>
	    	인사말인사아니사인사<br>
	    	인사말인사아니사인사<br>
	    	인사말인사아니사인사<br>
	    </p>
	  </div>
	  <div id="tabs-3">
	    <div id="map" style="width:100%; height:400px;"></div>
				<p>주소: 47246 부산 부산진구 동천로 109 (부전동, 삼한골든게이트) 7층 아이티윌</p>
				
				<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=5e70429c9ad2014cc2659566d6a4c40e"></script>
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new daum.maps.LatLng(35.158505,129.062029), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
				
				var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new daum.maps.LatLng(35.158505,129.062029); 
				
				// 마커를 생성합니다
				var marker = new daum.maps.Marker({
				    position: markerPosition
				});
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
				// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
				// marker.setMap(null);    
				</script>
	  </div>
  </div>
</div>