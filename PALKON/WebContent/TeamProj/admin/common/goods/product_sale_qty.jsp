<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function() {
	$('#saleChk').click(function(){
		if ($("input:checkbox[id='saleChk']").is(':checked') == true) {
			$('.discount').css('display', 'block');
			alert("1");
		} else {
			$('.discount').css('display', 'none');
			alert("2");
		}	
	})
});


function search(){ 
 	alert(document.getElementById('keyField').value);
	var keyField = document.getElementById('keyField').value;
	document.getElementById('serkey').value = keyField;
 	document.prosearch.sumbit(); 
} 
</script>
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> 세일 및 재고관리</h3>
          	
              <div class="row mt">
                  <div class="col-md-12">
                      <div class="content-panel">
                      	<form action="" method="post">
                      	<input type="hidden" id="serkey" name="serkey">
                      	
                          <table class="table table-striped table-advance table-hover">
	                          <colgroup>
				     			  <col width="10%">
				     			  <col width="10%">
				     			  <col width="10%">
				     			  <col width="10%">
				     			  <col width="10%">
				     			  <col width="10%">
				     			  <col width="10%">
				     		  </colgroup>
                              <thead>
                              <tr>
                                  <th><i class="fa fa-image"></i> 이미지</th>
                                  <th><i class="fa fa-bullhorn"></i> 상품명</th>
                                  <th><i class="fa fa-cubes"></i> 재고관리</th>
                                  <th class="hidden-phone"><i class="fa fa-inbox"></i> 세일여부</th>
                                  <th class="hidden-phone"><i class="fa fa-inbox"></i> 할인율(%)</th>
                                  <th><i class=" fa fa-calendar"></i> 등록일자</th>
                                  <th><i class=" fa fa-edit"></i> 관리</th>
                              </tr>
                              </thead>
                              <tbody>
                              <c:if test="${count ne '0' }">
	                              <c:forEach var="qtyList" items="${requestScope.qtyList}" >
	                              <tr>
	                                  <td>
	                                  	<a href="basic_table.html#">
	                                  		<img alt="" src="../${qtyList.image_path }${qtyList.image_name }" style="width: 100px; height: 100px;">
	                                  	</a>
	                                  </td>
	                                  <td><a href="basic_table.html#">${qtyList.pr_product }</a></td>
	                                  <td class="hidden-phone">
	                                  	<div class="product-quantity">
							                <input id="product-quantity" type="text" value="${qtyList.pr_stock  }" class="form-control input-sm">
							            </div>
	                                  	
	                                  </td>
	                                  <td class="hidden-phone">
	                                  	<input type="checkbox" name="saleChk" id="saleChk" value="saleChk" <c:if test="${qtyList.pr_status eq 'sale'}">checked="checked"</c:if> />
	                                  </td>
	                                  <td>
	                                  	<input type="text" id="product-quantity" class="form-control input-sm discount" value="${qtyList.pr_discount }">
	                                  </td>
	                                  <td>${qtyList.pr_reg_date }</td>
	                                  <td>
	                                      <button class="btn btn-success btn-xs" title="상품정보보기" onclick="location.href=''"><i class="fa fa-check"></i></button>
	                                      <button class="btn btn-primary btn-xs" title="수정" onclick=""><i class="fa fa-pencil"></i></button>
	                                      <button class="btn btn-danger btn-xs" title="삭제" onclick=""><i class="fa fa-trash-o "></i></button>
	                                  </td>
	                              </tr>
	                              </c:forEach>
                              </c:if>
                              <c:if test="${count eq '0' }">
                              	<tr>
	                                  <td>상품이 없습니다.</td>
	                            </tr>
                              </c:if>
                              </tbody>
                          </table>
                         </form>
                      </div><!-- /content-panel -->
                      
		            <!-- BEGIN PAGINATOR -->
		            <div class="row"> 
		              <c:if test="${count!=0}">
		              <div class="col-md-12 col-sm-12">
		                <ul class="pagination pull-right">
							<c:if test="${startPage>pageBlock}">
								<li>
									<a href="../../admin_goodsList.ad?pageNum=${startPage-pageBlock}&category=${requestScope.pr_category}">&laquo;</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1" >
								<li>
									<a href="../../admin_goodsList.ad?PageNum=${i}&category=${requestScope.pr_category}">${i}</a>
								</li>
							</c:forEach>    
							<c:if test="${startPage<pageBlock}">
								<li>
									<a href="../../admin_goodsList.ad?PageNum=${startPage+pageBlock}&category=${requestScope.pr_category}">&raquo;</a>
								</li>
							</c:if>
		                </ul>
		              </div>
		              </c:if>
		            </div>
		            <!-- END PAGINATOR -->
                  </div><!-- /col-md-12 -->
              </div><!-- row -->
		</section>