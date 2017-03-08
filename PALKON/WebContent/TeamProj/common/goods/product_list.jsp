<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- length jstl을 쓰기 위해 넣어 줘야 함 -->
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script type="text/javascript">
<!-- 신상품, 구매순... 정렬 하기 -->
 function search(){ 
// 	alert(document.getElementById('keyField').value);
	var keyField = document.getElementById('keyField').value;
	document.getElementById('serkey').value = keyField;
 	document.prosearch.sumbit(); 
} 
 

</script> 


    <div class="title-wrapper">
      <div class="container">
      <div class="container-inner">
	<% String category = request.getParameter("category");
	String count = request.getParameter("count");
	String status = request.getParameter("status");
	
	%>
		<%
			if(category != null){
		
		%>
       		 <h1><span><%=category%></span> CATEGORY</h1>
 		
       		<em class="catetitle"><%=category%> 카테고리입니다.</em>
       	<%  }else{  %>
       			<h1><span><%=status%></span> CATEGORY</h1>
       		<em class="catetitle"><%=status%> 카테고리입니다.</em>

       	<% } %>
      </div>
      </div>
    </div>
 
   
    <div class="main">
      <div class="container">
		<!-- 네비게이션 -->
		<ul class="breadcrumb">
		    <li><a href="../go_main.mr">Home</a></li>
		    <li><a href="#">Store</a></li>
		    <li class="active"><%=category%></li>
		</ul>
		<!-- 네비게이션 -->

        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
<%--           <%@ include file="sidebar.jsp" %> --%>
          <!-- END SIDEBAR -->
          
          <!-- BEGIN CONTENT -->
          <div class="col-md-12">
            <div class="row list-view-sorting clearfix">
              <div class="col-md-2 col-sm-2 list-view">
                <a href="javascript:;"><i class="fa fa-th-large"></i></a>
                <a href="javascript:;"><i class="fa fa-th-list"></i></a>
              </div>
              <div class="col-md-10 col-sm-10">


     		 <form action="../product_search.pr?category=${requestScope.category}&status=${requestScope.status}" method="post" name="prosearch" id="prosearch" >
     		 <input type="hidden" id="serkey" name="serkey">
<%--      		<form action="../product_list.pr" method="post" name="prosearch" id="prosearch" begin="0" step="1" end="${fn:length(requestScope.ProList)}" --%>
                <div class="pull-right">
                  <label class="control-label">상품정렬:</label>
                  <c:set var="key" value="${requestScope.keyField}"/>
                 
                  <select class="form-control input-sm" name="keyField" id="keyField" onchange="submit()">
                    <option value="newpro" name="newpro" <c:if test="${key eq 'newpro'}">selected="selected"</c:if>> 신상품순</option>
                    <option value="highpro" name="highpro" <c:if test="${key eq 'highpro'}">selected="selected"</c:if>>높은가격순</option>
                    <option value="lowpro" name="lowpro" <c:if test="${key eq 'lowpro'}">selected="selected"</c:if>>낮은가격순</option>
                    <option value="namepro" name="namepro" <c:if test="${key eq 'namepro'}">selected="selected"</c:if>>상품명</option>
                    <option value="buypro" name="buypro" <c:if test="${key eq 'buypro'}">selected="selected"</c:if>>구매순</option>
                  </select>
                </div>
                <input type="hidden" value="${Pro.pr_satus}" name="status" id="status">
          	  </form>
            
              </div>
            </div>
            
           
            
            
            
            <!-- BEGIN PRODUCT LIST -->
            <div class="row product-list">
          
              <!-- PRODUCT ITEM START -->
              <c:set var="i" value="0"/>
              <c:forEach var="Pro" items="${requestScope.ProList}" >
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="product-item">
                  <div class="pi-img-wrapper">
                  	<a href="../product_item.pr?pageNum=${pageNum}&pr_pro_code=${Pro.pr_pro_code}&category=<%=category%>">
                    	<img src="assets/img/product/${Pro.image_name}" class="img-responsive" alt="Berry Lace Dress">
                   	</a>
                </div>
                  <h3>
                  	<a href="../product_item.pr?pageNum=${pageNum}&pr_pro_code=${Pro.pr_pro_code}&category=<%=category%>">${Pro.pr_product}</a>
                  </h3>
                  <div class="pi-price">
                  	<c:if test="${Pro.pr_status ne 'sale' }">
	                    <fmt:formatNumber value="${Pro.pr_price }" pattern="#,###" />원
                    </c:if>
                    <c:if test="${Pro.pr_status eq 'sale' }">
	                     <fmt:parseNumber var="salePrice" integerOnly="true" value="${Pro.pr_price*((100-Pro.pr_discount)/100)}" />
	                     <fmt:formatNumber value="${salePrice }" pattern="#,###" />원
	                     <em><fmt:formatNumber value="${Pro.pr_price }" pattern="#,###" />원</em>
                    </c:if>
                  </div>
                  <a class="btn btn-default add2cart">장바구니 담기
	                <!-- 장바구니 담기 클릭 시 가져갈 값 담는 input -->
                  	<input type="hidden" id="pr_pro_code" name="pr_pro_code" value="${Pro.pr_pro_code }">
                  </a>
                  <c:if test="${Pro.pr_status eq 'sale' }">
			       <div class="sticker sticker-sale"></div>
			      </c:if>
			      <c:if test="${Pro.pr_status eq 'new' }">
			       <div class="sticker sticker-new"></div>
			      </c:if>
                  
                </div>
                <c:set var="i" value="${i+1 }"/>
            </div>
            
              </c:forEach>
            </div>
            <!-- END PRODUCT LIST -->
          
            <!-- BEGIN PAGINATOR -->
            <div class="row"> 
      
              <!-- 페이징 -->
              <c:if test="${count!=0}">
              <div class="col-md-8 col-sm-8">
            
                <ul class="pagination pull-right">
                
                 <c:if test="${startPage>pageBlock}">
                  <li><a href="../product_list.pr?pageNum=${startPage-pageBlock}&category=${requestScope.category}">&laquo;</a></li>
                  </c:if>
               
                  <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1" >
                  <li><a href="../product_list.pr?PageNum=${i}&category=${requestScope.category}">${i}</a></li>
                  </c:forEach>
                                    
                  <c:if test="${startPage<pageBlock}">
                  <li><a href="../product_list.pr?PageNum=${startPage+pageBlock}&category=${requestScope.category}">&raquo;</a></li>
                  </c:if>
                  
                </ul>
   
              </div>
              </c:if>
            </div>
            <!-- END PAGINATOR -->
          </div>
          
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>
    
