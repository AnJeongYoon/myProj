<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<%-- <c:set var="content" value="common/main_body.jsp"/> --%>
	<c:set var="content" value="common/main_body.jsp"/>
</c:if>
<c:if test="${content == ''}">
	<c:set var="content" value="common/main_body.jsp"/>
</c:if>





    <div class="main signUp">
      <div class="container">
        
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          
          <!-- BEGIN CONTENT -->
          <!-- 배송 상단 박스 시작 -->
          <div class="col-md-10 col-sm-9">
            <h1>배송 주소록 선택</h1>
            
            <div class="content-form-page MP_wrap">
            <span>등록하신 배송지를 선택하세요.</span>
            <hr>              
           
            <!-- 배송 사용 내역 시작 -->
            <form action="/projectTForgit/mypage_deli_delete.mr" id="deli_form" method="post">
            <div>            	
            	<table class="Point_table">
            	<tr class="Point_tr">
            		<th class="Point_th"><input type="checkbox" id="all_check" name="all_check" onclick="checkboxSelectQue('check')" value="1"></th>
            		<th class="Point_th">배송지명</th>
            		<th class="Point_th">수령인</th>
            		<th class="Point_th">일반전화</th>
            		<th class="Point_th">휴대전화</th>
            		<th class="Point_th">주소</th>
            		
            	</tr>
            	<c:choose>
            		<c:when test="${!empty requestScope.De_list  }">
	            		<c:forEach var="list" items="${requestScope.De_list }">
			            	 <tr>
			            	 	<td class="Point_td"><input type="checkbox" value="${list.de_num }" name="check"></td>
			            		<td class="Point_td">${list.de_place_name }</td>
			            		<td class="Point_td">${list.de_name }</td>
			            		<td class="Point_td">${list.de_tel }</td>
			            		<td class="Point_td">${list.de_mobile }</td>
			            		<td class="Point_td">${list.de_addr }</td>			            		
			            					            		
			            	</tr> 
	            		</c:forEach> 	            	
            		</c:when>
            		<c:otherwise>
	            		<tr>
	            			<td class="Point_td" colspan="7">등록된 주소가 없습니다.</td>
	            		</tr>
            		</c:otherwise>
            		
            	</c:choose>       	          	
            	
            	</table>
            	
            </div>
            <!-- 배송 사용 내역 끝 -->
           
            <div class="col-md-12 col-sm-12 or_destbtn">              	
              	
              	<div>
              		<input type="button" value="취소" class="btn de_btn right" onclick="window.close()" >              	
              	</div>
              	
              	<div>
              		<input type="button" value="배송지 선택" class="btn btn-primary de_btn right" onclick="">              	
              	</div>
              	
            </div>
           
            </form>
            
            <!-- 버튼 끝 -->
            <!-- 배송 안내 시작 -->
            <div class="xans-element- xans-myshop xans-myshop-head help">
            	<h3>배송지 주소록 유의사항</h3>
				<div class="content">
        			<ul class="xans-element- xans-myshop xans-myshop-historyinfo">
        				<li class="item1 ">배송 주소록은 마이페이지에서 등록 및 수정하실 수 있습니다. </li>
        			</ul>
				</div>
			</div>
			<!-- 배송 안내 끝-->
           </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
       
        
        
        
      </div>
    </div>
     
 
 </body>
<!-- END BODY -->
</html>

    
    