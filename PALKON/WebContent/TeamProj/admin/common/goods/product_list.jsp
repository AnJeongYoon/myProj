<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> 상품목록</h3>
              <div class="row mt">
                  <div class="col-md-12">
                      <div class="content-panel">
                      	<form action="../../admin_goodsList.ad" method="post">
                          <table class="table table-striped table-advance table-hover">
                          <h4><i class="fa fa-angle-right"></i> 정렬을 원하는 순서대로 선택하세요.</h4>
	                          <colgroup>
				     			  <col width="10%">
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
                                  <th><i class="fa fa-bullhorn"></i> 상품명</th>
                                  <th>
                                  	<i class=" fa fa-asterisk"></i> 상태
                                  	<c:set var="status" value="${requestScope.status}"/>                 
					                <select class="form-control input-sm" name="status" id="status" onchange="submit(); return false;">
					                  <option value="default" name="default" <c:if test="${status eq 'null' || status eq 'default'}">selected="selected"</c:if>>선택하기</option>
					                  <option value="sale" name="sale" <c:if test="${status eq 'sale'}">selected="selected"</c:if>>SALE</option>
					                  <option value="preorder" name="preorder" <c:if test="${status eq 'preorder'}">selected="selected"</c:if>>Pre-Order</option>
					                  <option value="new" name="new" <c:if test="${status eq 'new'}">selected="selected"</c:if>>NEW</option>
					                </select>
                                  </th>
                                  <th class="hidden-phone">
                                  	<i class="fa fa-inbox"></i> 카테고리
                                  	<c:set var="category" value="${requestScope.category}"/>	                 
					                <select class="form-control input-sm" name="category" id="category" onchange="submit(); return false;">
					                  <option value="default" name="default" <c:if test="${category eq 'null' || status eq 'default'}">selected="selected"</c:if>>선택하기</option>
					                  <option value="briefcase" name="briefcase" <c:if test="${category eq 'briefcase'}">selected="selected"</c:if>>briefcase</option>
					                  <option value="backpack" name="backpack" <c:if test="${category eq 'backpack'}">selected="selected"</c:if>>backpack</option>
					                  <option value="cross" name="cross" <c:if test="${category eq 'cross'}">selected="selected"</c:if>>cross</option>
					                </select>
                                  </th>
                                  <th>
                                  	<i class="fa fa-money"></i> 가격
                                  	<c:set var="orderby" value="${requestScope.orderby}"/>
					                <select class="form-control input-sm" name="orderby" id="orderby" onchange="submit(); return false;">
					                  <option value="default" name="default" <c:if test="${orderby eq 'null' || status eq 'default'}">selected="selected"</c:if>>선택하기</option>
					                  <option value="pr_price desc" name="pr_price desc" <c:if test="${orderby eq 'pr_price desc'}">selected="selected"</c:if>>가격높은순</option>
					                  <option value="pr_price asc" name="pr_price asc" <c:if test="${orderby eq 'pr_price asc'}">selected="selected"</c:if>>가격낮은순</option>
					                </select>
                                  </th>
                                  <th>
                                  	<i class=" fa fa-cubes"></i> 재고		                 
					                <select class="form-control input-sm" name="orderby" id="orderby" onchange="submit(); return false;">
					                  <option value="default" name="default" <c:if test="${orderby eq 'null' || status eq 'default'}">selected="selected"</c:if>>선택하기</option>
					                  <option value="pr_stock desc" name="pr_stock desc" <c:if test="${orderby eq 'pr_stock desc'}">selected="selected"</c:if>>재고많은순</option>
					                  <option value="pr_stock asc" name="pr_stock asc" <c:if test="${orderby eq 'pr_stock desc'}">selected="selected"</c:if>>재고적은순</option>
					                </select>
                                  </th>
                                  <th>
                                  	<i class=" fa fa-shopping-cart"></i> 판매수		                 
					                <select class="form-control input-sm" name="orderby" id="orderby" onchange="submit(); return false;">
					                  <option value="default" name="default" <c:if test="${orderby eq 'null' || status eq 'default'}">selected="selected"</c:if>>선택하기</option>
					                  <option value="pr_buy_cnt desc" name="pr_buy_cnt desc" <c:if test="${orderby eq 'pr_buy_cnt desc'}">selected="selected"</c:if>>판매량 많은순</option>
					                  <option value="pr_buy_cnt asc" name="pr_buy_cnt asc" <c:if test="${orderby eq 'pr_buy_cnt desc'}">selected="selected"</c:if>>판매량 적은순</option>
					                </select>
                                  </th>
                                  <th>
                                  	<i class=" fa fa-calendar"></i> 등록일자<!-- 기간선택하기 -->
                                  </th>
                                  <th><i class=" fa fa-edit"></i> 관리</th>	
                              </tr>
                              </thead>
                              <tbody>
                              <c:if test="${count ne '0' }">
	                              <c:forEach var="pGoodsList" items="${requestScope.pGoodsList}" >
	                              <tr>
	                                  <td><a href="basic_table.html#">${pGoodsList.pr_product }</a></td>
	                                  <td>
	                                  	<c:if test="${pGoodsList.pr_status eq 'sale'}" >
	                                  	<span class="label label-info label-mini">SALE</span>
	                                  	</c:if>
	                                  	<c:if test="${pGoodsList.pr_status eq 'preorder'}" >
	                                  	<span class="label label-warning label-mini">Pre-Order</span>
	                                  	</c:if>
	                                  	<c:if test="${pGoodsList.pr_status eq 'new'}" >
	                                  	<span class="label label-danger label-mini">NEW</span>
	                                  	</c:if>
	                                  </td>
	                                  <td class="hidden-phone">${pGoodsList.pr_category }</td>
	                                  <td><fmt:formatNumber value="${pGoodsList.pr_price }" pattern="#,###" />원 </td>
	                                  <td>${pGoodsList.pr_stock }개</td>
	                                  <td>${pGoodsList.pr_buy_cnt }개</td>
	                                  <td>${pGoodsList.pr_reg_date }</td>
	                                  <td>
	                                      <button class="btn btn-success btn-xs" title="확인" onclick="location.href=''"><i class="fa fa-check"></i></button>
	                                      <button class="btn btn-primary btn-xs" title="수정" onclick=""><i class="fa fa-pencil"></i></button>
	                                      <button class="btn btn-danger btn-xs" title="삭제" onclick=""><i class="fa fa-trash-o "></i></button>
	                                  </td>
	                              </tr>
	                              </c:forEach>
                              </c:if>
                              <c:if test="${count eq '0' }">
                              	<tr><td colspan="8" style="text-align: center;">상품이 없습니다.</td></tr>
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