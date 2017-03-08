<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> 주문내역 리스트</h3>
		  		<div class="row mt">
			  		<div class="col-lg-12">
                      <div class="content-panel">
                      <h4><i class="fa fa-angle-right"></i> 나의 주문 내역</h4>
                          <section id="unseen">
                            <table class="table table-bordered table-striped table-condensed">
                              <thead>
                              <tr>
                                  <th>주문아이디</th>
                                  <th>주문번호</th>
                                  <th class="numeric">주문날짜</th>
                                  <th class="numeric">운송장번호</th>
                                  <th class="numeric">보내는 사람</th>
                                  <th class="numeric">보내는 주소</th>
                                  <th class="numeric">보내는 사람 전화번호</th>
                                  <th class="numeric">보내는 사람 폰번호 </th>
                                  <th class="numeric">보내는 사람 이메일</th>
                                  <th class="numeric">받는 사람</th>
                                  <th class="numeric">받는사람 주소</th>
                                  <th class="numeric">받는 사람 전화번호</th>
                                  <th class="numeric">받는 사람 폰번호</th>
                                  <th class="numeric">받는 사람 메세지</th>
                                  <th class="numeric">총 금액 </th>
                                  <th class="numeric">쿠폰 사용내역</th>
                                  <th class="numeric">할인받은금액</th>
                                  <th class="numeric">결제한사람</th>
                                  <th class="numeric">은행정보</th>
                              </tr>
                              </thead>
                              <tbody>
                              <c:choose>
                              <c:when test="${!empty HistoryList }">
                              <c:forEach var="historyList" items="${requestScope.HistoryList }">
                              <tr>
                                  
                                  <td class="numeric">${historyList.or_id }</td>
                                  <td class="numeric">${historyList.or_num }</td>
                                  <td class="numeric">${historyList.or_date }</td>
                                  <td class="numeric">${historyList.or_invoice }</td>
                                  <td class="numeric">${historyList.or_sender_name }</td>
                                  <td class="numeric">${historyList.or_sender_addr }</td>
                                  <td class="numeric">${historyList.or_sender_otel }</td>
                                  <td class="numeric">${historyList.or_sender_mtel }</td>
                                  <td class="numeric">${historyList.or_sender_email }</td>
                                  <td class="numeric">${historyList.or_taker_addr }</td>
                                  <td class="numeric">${historyList.or_taker_otel }</td>
                                  <td class="numeric">${historyList.or_taker_mtel }</td>
                                  <td class="numeric">${historyList.or_taker_msg }</td>
                                  <td class="numeric">${historyList.or_totalprice }</td>
                                  <td class="numeric">${historyList.or_usingcoupon }</td>
                                  <td class="numeric">${historyList.or_realpayprice }</td>
                                  <td class="numeric">${historyList.or_payername }</td>
                                  <td class="numeric">${historyList.or_bankinfo }
                              </tr>
                             
                              </c:forEach>
                              </c:when>
                               <c:otherwise>
                               <tr>
                               	<td colspan="19">등록된 게시물이 없습니다.</td>
                               </tr>
                               </c:otherwise>
                              
                              </c:choose>
                              </tbody>
                          </table>
                          </section>
                  </div><!-- /content-panel -->
               </div><!-- /col-lg-4 -->			
		  	</div><!-- /row -->