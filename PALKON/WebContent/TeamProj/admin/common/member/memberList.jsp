<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	

<section class="wrapper">
	<h3>
		<i class="fa fa-angle-right"></i>회원관리
	</h3>
	<div class="row mt">
		<div class="col-lg-12">
			<div class="content-panel">
				<div class="ad_mem_sub">
					<div class="ad_mem_sub_title left">
						<h4>
							<i class="fa fa-angle-right"></i>현재 회원 : 총 ${total_member }명
						</h4>
					</div>
					<div class="ad_mem_sub_title right">
						<form class="form-inline" action="/projectTForgit/ad_mem_list.am" id="ad_mem_search" method="post" onsubmit="return false">
		                   	<select id="search_select">
		                   		<option value="mb_name" <c:if test="${searchSelect eq 'mb_name' }">selected="selected"</c:if>>이름</option>
		                   		<option value="mb_id" <c:if test="${searchSelect eq 'mb_id' }">selected="selected"</c:if>>아이디</option>
		                   		<option value="mb_tel" <c:if test="${searchSelect eq 'mb_tel' }">selected="selected"</c:if>>전화</option>
		                   		<option value="mb_mobile" <c:if test="${searchSelect eq 'mb_mobile' }">selected="selected"</c:if>>휴대폰</option>		                   		
		                   	</select>
		                   	<label class="sr-only" for="exampleInputEmail2">검색어입력</label>
	                        <input type="text" class="form-control" id="searchMember" placeholder="검색어" 
	                        <c:if test="${!empty searchMember }">
		                    value="${searchMember }"
		                    </c:if>>
		                    
		                        <!-- <input type="submit" value="검색"> -->     
		                    
		                	<button onclick="search()" class="btn btn-theme">검색</button>
		                </form>				
					</div>
				</div>
				<section id="unseen">
					<input type="hidden" value="${sort }" id="th_color">
					<input type="hidden" value="${asc }" id="asc">
					<input type="hidden" value="${page.pageSize }" id="SpageSize">
					<table class="table table-bordered table-striped table-condensed">
						<tr>
							<th class="numeric12"><input type="checkbox" id="all_check" onclick="checkboxSelectQue('check')" class="ad_mem_check" value="1"></th>							
							<th class="numeric13">								
								<c:choose>
									<c:when test="${asc eq 'desc' && sort eq 'mb_id' }">
									<span class="sort" data-val="mb_id" data-asc="asc" data-size="${page.pageSize }">아이디
										<i class='fa fa-caret-down' aria-hidden='true'></i>
									</span>	
									</c:when>
									<c:otherwise>
									<span class="sort" data-val="mb_id" data-asc="desc" data-size="${page.pageSize }">아이디
										<i class='fa fa-caret-up' aria-hidden='true'></i>
									</span>										
									</c:otherwise>
								</c:choose>															
							</th>
							<th class="numeric15">
								<c:choose>
									<c:when test="${asc eq 'desc' && sort eq 'mb_status' }">
									<span class="sort" data-val="mb_status" data-asc="asc" data-size="${page.pageSize }">상태
										<i class='fa fa-caret-down' aria-hidden='true'></i>
									</span>	
									</c:when>
									<c:otherwise>
									<span class="sort" data-val="mb_status" data-asc="desc" data-size="${page.pageSize }">상태
										<i class='fa fa-caret-up' aria-hidden='true'></i>
									</span>										
									</c:otherwise>
								</c:choose>		
							</th>
							<th class="numeric1">
								<c:choose>
									<c:when test="${asc eq 'desc' && sort eq 'mb_name' }">
									<span class="sort" data-val="mb_name" data-asc="asc" data-size="${page.pageSize }">이름
										<i class='fa fa-caret-down' aria-hidden='true'></i>
									</span>	
									</c:when>
									<c:otherwise>
									<span class="sort" data-val="mb_name" data-asc="desc" data-size="${page.pageSize }">이름
										<i class='fa fa-caret-up' aria-hidden='true'></i>
									</span>										
									</c:otherwise>
								</c:choose>							
							</th>
							<th class="numeric2">
								<c:choose>
									<c:when test="${asc eq 'desc' && sort eq 'mb_addr' }">
									<span class="sort" data-val="mb_addr" data-asc="asc" data-size="${page.pageSize }">주소
										<i class='fa fa-caret-down' aria-hidden='true'></i>
									</span>	
									</c:when>
									<c:otherwise>
									<span class="sort" data-val="mb_addr" data-asc="desc" data-size="${page.pageSize }">주소
										<i class='fa fa-caret-up' aria-hidden='true'></i>
									</span>										
									</c:otherwise>
								</c:choose>		
							</th>
							<th class="numeric3">
								<c:choose>
									<c:when test="${asc eq 'desc' && sort eq 'mb_tel' }">
									<span class="sort" data-val="mb_tel" data-asc="asc" data-size="${page.pageSize }">전화
										<i class='fa fa-caret-down' aria-hidden='true'></i>
									</span>	
									</c:when>
									<c:otherwise>
									<span class="sort" data-val="mb_tel" data-asc="desc" data-size="${page.pageSize }">전화
										<i class='fa fa-caret-up' aria-hidden='true'></i>
									</span>										
									</c:otherwise>
								</c:choose>	
							</th>
							<th class="numeric4">
								<c:choose>
									<c:when test="${asc eq 'desc' && sort eq 'mb_mobile' }">
									<span class="sort" data-val="mb_mobile" data-asc="asc" data-size="${page.pageSize }">휴대폰
										<i class='fa fa-caret-down' aria-hidden='true'></i>
									</span>	
									</c:when>
									<c:otherwise>
									<span class="sort" data-val="mb_mobile" data-asc="desc" data-size="${page.pageSize }">휴대폰
										<i class='fa fa-caret-up' aria-hidden='true'></i>
									</span>										
									</c:otherwise>
								</c:choose>	
							</th>
							<th class="numeric5">
								<c:choose>
									<c:when test="${asc eq 'desc' && sort eq 'mb_email' }">
									<span class="sort" data-val="mb_email" data-asc="asc" data-size="${page.pageSize }">이메일
										<i class='fa fa-caret-down' aria-hidden='true'></i>
									</span>	
									</c:when>
									<c:otherwise>
									<span class="sort" data-val="mb_email" data-asc="desc" data-size="${page.pageSize }">이메일
										<i class='fa fa-caret-up' aria-hidden='true'></i>
									</span>										
									</c:otherwise>
								</c:choose>
							</th>
							<th class="numeric6">
								<c:choose>
									<c:when test="${asc eq 'desc' && sort eq 'mb_gender' }">
									<span class="sort" data-val="mb_gender" data-asc="asc" data-size="${page.pageSize }">성별
										<i class='fa fa-caret-down' aria-hidden='true'></i>
									</span>	
									</c:when>
									<c:otherwise>
									<span class="sort" data-val="mb_gender" data-asc="desc" data-size="${page.pageSize }">성별
										<i class='fa fa-caret-up' aria-hidden='true'></i>
									</span>										
									</c:otherwise>
								</c:choose>
							</th>
							<th class="numeric7">
								<c:choose>
									<c:when test="${asc eq 'desc' && sort eq 'mb_brith_date' }">
									<span class="sort" data-val="mb_brith_date" data-asc="asc" data-size="${page.pageSize }">생년월일
										<i class='fa fa-caret-down' aria-hidden='true'></i>
									</span>	
									</c:when>
									<c:otherwise>
									<span class="sort" data-val="mb_brith_date" data-asc="desc" data-size="${page.pageSize }">생년월일
										<i class='fa fa-caret-up' aria-hidden='true'></i>
									</span>										
									</c:otherwise>
								</c:choose>
							</th>
							<th class="numeric8">
								<c:choose>
									<c:when test="${asc eq 'desc' && sort eq 'mb_join_date' }">
									<span class="sort" data-val="mb_join_date" data-asc="asc" data-size="${page.pageSize }">가입일
										<i class='fa fa-caret-down' aria-hidden='true'></i>
									</span>	
									</c:when>
									<c:otherwise>
									<span class="sort" data-val="mb_join_date" data-asc="desc" data-size="${page.pageSize }">가입일
										<i class='fa fa-caret-up' aria-hidden='true'></i>
									</span>										
									</c:otherwise>
								</c:choose>
							</th>
							<th class="numeric9">
								<c:choose>
									<c:when test="${asc eq 'desc' && sort eq 'mb_last_login' }">
									<span class="sort" data-val="mb_last_login" data-asc="asc" data-size="${page.pageSize }">최근 로그인
										<i class='fa fa-caret-down' aria-hidden='true'></i>
									</span>	
									</c:when>
									<c:otherwise>
									<span class="sort" data-val="mb_last_login" data-asc="desc" data-size="${page.pageSize }">최근 로그인
										<i class='fa fa-caret-up' aria-hidden='true'></i>
									</span>										
									</c:otherwise>
								</c:choose>
							</th>
							<th class="numeric10">
								<c:choose>
									<c:when test="${asc eq 'desc' && sort eq 'mb_buy_cnt' }">
									<span class="sort" data-val="mb_buy_cnt" data-asc="asc" data-size="${page.pageSize }">구매횟수
										<i class='fa fa-caret-down' aria-hidden='true'></i>
									</span>	
									</c:when>
									<c:otherwise>
									<span class="sort" data-val="mb_buy_cnt" data-asc="desc" data-size="${page.pageSize }">구매횟수
										<i class='fa fa-caret-up' aria-hidden='true'></i>
									</span>										
									</c:otherwise>
								</c:choose>
							</th>
							<th class="numeric11">
								<c:choose>
									<c:when test="${asc eq 'desc' && sort eq 'mb_grade' }">
									<span class="sort" data-val="mb_grade" data-asc="asc" data-size="${page.pageSize }">등급
										<i class='fa fa-caret-down' aria-hidden='true'></i>
									</span>	
									</c:when>
									<c:otherwise>
									<span class="sort" data-val="mb_grade" data-asc="desc" data-size="${page.pageSize }">등급
										<i class='fa fa-caret-up' aria-hidden='true'></i>
									</span>										
									</c:otherwise>
								</c:choose>
							</th>	
							<th class="numeric14">관리하기 </th>						
						</tr>
												
						<c:set var="i" value="0"/>
						<c:forEach var="list" items="${requestScope.mem_list }">
						
						<tr>						
						
							<td data-title="Code" class="numeric12" ><input type="checkbox" id="check${i }" value="${list.mb_num }"name="check" class="ad_mem_check"></td>
							<td data-title="Company" class="numeric13">${list.mb_id }</td>
							<td class="numeric numeric15">${list.mb_status }</td>							
							<td class="numeric numeric1">${list.mb_name }</td>
							<td class="numeric numeric2">${list.mb_addr }</td>
							<td class="numeric numeric3">${list.mb_tel }</td>
							<td class="numeric numeric4">${list.mb_mobile }</td>
							<td class="numeric numeric5">${list.mb_email }</td>
							<td class="numeric numeric6">${list.mb_gender }</td>
							<td class="numeric numeric7">${list.mb_brith_date }</td>
							<td class="numeric numeric8">${list.mb_join_date }</td>
							<td class="numeric numeric9">${list.mb_last_login }</td>
							<td class="numeric numeric10">${list.mb_buy_cnt }</td>
							<td class="numeric numeric11">${list.mb_grade }</td>
							<td>
								
								<button class="btn btn-success btn-xs conf_btn"><i class="fa fa-check"></i></button>
                               	<button class="btn btn-primary btn-xs mod_btn"><i class="fa fa-pencil"></i></button>
                               	<button class="btn btn-danger btn-xs del_btn" id="ad_mem_del_btn${i }" data-i="${list.mb_id }"><i class="fa fa-trash-o "></i></button>                            
							</td>							
							
						</tr>
						
						<c:set var="i" value="${i+1 }"/>
						</c:forEach>
						
					</table>
					
				</section>
				<!-- 페이징 시작 -->
				<div class="row">              
	              <div class="col-md-12 col-sm-12">
	              	<div class="left col-md-4 ad_mem_page_div">		              	    
	              		<select class="ad_mem_page_select" id="pageSize">
	              			<option value="10" <c:if test="${page.pageSize eq '10' }">selected="selected"</c:if>>10개씩 보기</option>
	              			<option value="20" <c:if test="${page.pageSize eq '20' }">selected="selected"</c:if>>20개씩 보기</option>
	              			<option value="30" <c:if test="${page.pageSize eq '30' }">selected="selected"</c:if>>30개씩 보기</option>
	              			<option value="40" <c:if test="${page.pageSize eq '40' }">selected="selected"</c:if>>40개씩 보기</option>
	              			<option value="50" <c:if test="${page.pageSize eq '50' }">selected="selected"</c:if>>50개씩 보기</option>
	              		</select>
	              		<button type="button" onclick="ad_del_mem()" class="btn btn-danger ad_mem_del_btn">선택회원 차단</button>
	              		    	
	              	
	              	</div>
	                <ul class="point_page_ul pull-right">
	                  <li class="point_page_li"><a class="point_page_a" href="/projectTForgit/ad_mem_list.am?pageNo=${page.firstPageNo }&asc=${asc}&sort=${sort}&pageSize=${page.pageSize}&searchMember=${searchMember}&searchSelect=${searchSelect}"><i class="fa fa-angle-double-left arrow" aria-hidden="true"></i></a></li>
	                  <li class="point_page_li"><a class="point_page_a" href="/projectTForgit/ad_mem_list.am?pageNo=${page.prevPageNo }&asc=${asc}&sort=${sort}&pageSize=${page.pageSize}&searchMember=${searchMember}&searchSelect=${searchSelect}"><i class="fa fa-angle-left arrow" aria-hidden="true"></i></a></li>
	                  <c:forEach var="i" begin="${page.startPageNo}" end="${page.endPageNo}" step="1">
			          	<c:choose>
			                <c:when test="${i eq page.pageNo}">
				                <li class="point_page_li">
				                	<span class="point_page_span">
				                		<a class="point_page_a" href="/projectTForgit/ad_mem_list.am?pageNo=${i }&asc=${asc}&sort=${sort}&pageSize=${page.pageSize}&searchMember=${searchMember}&searchSelect=${searchSelect}">${i}</a>
				                	</span>
				               	</li>
			               	</c:when>
			                <c:otherwise><li class="point_page_li"><a class="point_page_a" href="/projectTForgit/ad_mem_list.am?pageNo=${i }&asc=${asc}&sort=${sort}&pageSize=${page.pageSize}&searchMember=${searchMember}&searchSelect=${searchSelect}">${i}</a></li></c:otherwise>
			            </c:choose>
			          </c:forEach>
	                  <li class="point_page_li"><a class="point_page_a" href="/projectTForgit/ad_mem_list.am?pageNo=${page.nextPageNo }&asc=${asc}&sort=${sort}&pageSize=${page.pageSize}&searchMember=${searchMember}&searchSelect=${searchSelect}"><i class="fa fa-angle-right arrow" aria-hidden="true"></i></a></li>
	                  <li class="point_page_li"><a class="point_page_a" href="/projectTForgit/ad_mem_list.am?pageNo=${page.finalPageNo }&asc=${asc}&sort=${sort}&pageSize=${page.pageSize}&searchMember=${searchMember}&searchSelect=${searchSelect}"><i class="fa fa-angle-double-right arrow" aria-hidden="true"></i></a></li>
	                </ul>
	              </div>
	            </div>
	            <!-- 페이징 끝 -->
			</div>
			<!-- /content-panel -->
		</div>
		<!-- /col-lg-4 -->
	</div>
	<!-- /row -->

	

</section>
<!--/wrapper -->
