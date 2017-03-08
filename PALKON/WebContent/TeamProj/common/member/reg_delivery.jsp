<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="main signUp">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="">mypage</a></li>
            <li class="active">delivery</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
        	<jsp:include page="Side.jsp"></jsp:include>
          <!-- END SIDEBAR -->
	
          <!-- BEGIN CONTENT -->
          <div class="col-md-10 col-sm-9">
            <h1>배송지 등록</h1>
            <div class="content-form-page">
              <form action="/projectTForgit/mypage_deli_reg.mr" method="post" class="form-horizontal form-without-legend" id="form">
				<div class="form-group">
                  <label class="col-lg-2 control-label" for="de_place_name">배송지명</label>
                  <div class="col-lg-9">
                    <input type="text" id="de_place_name" name="de_place_name" class="form-control" required="required" maxlength="15">
                    <div class="console"></div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="de_name">수령인</label>
                  <div class="col-lg-9">
                    <input type="text" id="de_name" name="de_name" class="form-control" required="required">
                  </div>
                </div>
                <div class="form-group">
					<label class="col-lg-2 control-label" for="address">주소</label>
					<div class="col-lg-9">
						<div class="address_wrap">	
							<div class="col-lg-8 log_addr">					
								<input type="text" id="address1" name="address1" class="form-control postnum" placeholder="우편번호">
							</div>
							<div class="col-lg-4 log_addr">	
								<input type="button" onclick="sample6_execDaumPostcode()"class="form-control postnumfinder" value="우편번호 찾기">
							</div>							
						</div>						
						<input type="text" id="address2" name="address2" class="form-control" placeholder="주소">
						<input type="text" id="address3" name="address3" class="form-control" placeholder="상세주소" maxlength="30">						
	                </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="de_mobile">휴대전화</label>
                  <div class="col-lg-9">
                    <input type="text" id="de_mobile" name="de_mobile" class="form-control" placeholder="'-'없이 입력" maxlength="13" onkeyup="hypen('de_mobile')" required="required" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="tel">전화번호</label>
                  <div class="col-lg-9">
                    <input type="text" id="de_tel" name="de_tel" class="form-control" placeholder="'-'없이 입력" maxlength="13" onkeyup="hypen('de_tel')" required="required"/>
                  </div>
                </div>
                
				
				
                
               <!--  <div class="form-group">
                  <label class="col-lg-2 control-label">Checkboxes</label>
                  <div class="col-lg-8 checkbox-list">
                    <label>
                      <input type="checkbox"> Checkbox 1
                    </label>
                    <label>
                      <input type="checkbox"> Checkbox 2
                    </label>
                    <label>
                      <input type="checkbox" disabled> Disabled
                    </label>
                  </div>
                </div> -->
              
                <div class="row">
                  <div class="col-lg-8 col-md-offset-2 padding-left-0 padding-top-20">
                   	<input type="submit" class="btn btn-primary de_btn" value="등록">
                 	<button class="btn " onclick="history.back()">취소</button>                  
                  </div>
                </div>
              </form>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>


<!-- 이거 common으로 옮기면 작동 안함 -->

    