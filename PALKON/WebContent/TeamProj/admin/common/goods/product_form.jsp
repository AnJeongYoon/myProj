<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>

$(function(){
	
	$("#adminbtn").click(function() {
		
		var regcode = /^[a-z]{2}\d{6}$/;//제품 코드 영문2자 숫자6자리 유효성
		var orgcode= /^[a-z]{1}\d{5}[a-z]{2}$/; // 제조자코드 영문1 숫자5 영문2 유효성
		
		
		var incode =$('#procode').val();//제품코드 value값 가져오기 
		var orgincode =$('#orgincode').val(); //제조자 코드 value값 가져오기
		
		var sale = $('input:radio[name="prosale"]:checked').val();//sale check 여부
		var saleprice =$('#discnt').val();//sale value값 가져오기
		
		 if(!$("#procode").val()){
			 alert("제품코드를 입력하세요");
			 $("#procode").focus();
			 return false;
			 
		 }else if(regcode.test(incode)!=true){
			 alert("제품코드가 유효하지 않습니다.");
			 //alert(regcode.test(incode));
			 $("#procode").focus();
			 return false;
			 
		 }else if(!$("#orgincode").val()){
			 alert("제조사코드를 입력하세요");
			 $("#orgincode").focus();
			 return false;
			 
		 }else if(orgcode.test(orgincode)!=true){
			 alert("제조사코드가 유효하지 않습니다.");
			 alert(orgcode.test(orgincode));
			 $("#orgincode").focus();
			 return false;
			 
		 }
		 
		 else if(!$("#proname").val()){
			 alert("상품명을 입력하세요");
			 $("#proname").focus();
			 return false;
		 }else if(!$("#probrand").val()){
			 alert("브랜드를 입력하세요");
			 $("#probrand").focus();
			 return false;
			 
		 }else if(!$("#proprice").val()){
			 alert("가격을 입력하세요");
			 $("#proprice").focus();
			 return false;
			 
		 }else if(!$("#procolor").val()){
			 alert("제품색상을 입력하세요");
			 $("#procolor").focus();
			 return false;
			 
		 }else if(!$("#prostock").val()){
			 alert("재고를 입력하세요");
			 $("#prostock").focus();
			 return false;
			 
		 }else if(!$("#prorgin").val()){
			 alert("원산지를 입력하세요");
			 $("#prorgin").focus();
			 return false;
		 }else if(!$("#procolor").val()){
			 alert("색상을 입력하세요");
			 $("#procolor").focus();
			 return false;
			 
		 }else if(!$("#promt").val()){
			 alert("상품소재를 입력하세요");
			 $("#promt").focus();
			 return false;
			 
		 }else if(!$("#prolength").val()){
			 alert("가방길이를 입력하세요");
			 $("#prolength").focus();
			 return false;
			 
		 }else if(!$("#proinfo").val()){
			 alert("상품정보를 입력하세요");
			 $("#proinfo").focus();
			 return false;
			 
		 }else if(sale==="sale"){
			 
			 if(!$('#discnt').val()){
				 alert("할인율을 입력하세요");
				 $("#discnt").focus();
				 return false;
			}
			
		 }
		 
	});//click 끝

}); 

 </script>

          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> 관리자 상품 등록</h3>

          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  
		    <form class="form-horizontal style-form" action="/projectTForgit/AdminProAction.ad" method="post" id="adminPro" name="adminPro">
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">제품코드</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control round-form" id="procode" name="procode">
                                  
                                  <span class="help-block">[Catergoy] BackPack:BP, Cross:CR, BriefCase:BF
                                  							           
                                  </span>
                              </div>
                              
                          </div>
                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">제조사코드</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control round-form" maxlength="8" id="orgincode" name="origincode">
                                  
                                  <span class="help-block">제품코드(8자리) 예) P00000GN   
                                  </span>
                              </div>
                              
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">상품명</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control round-form" id="proname" name="proname">
                                  <span class="help-block">제품코드와 동일</span>

                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">카테고리</label>
                              <div class="col-sm-10">
                                  	<select class="form-control cate" id="procate" name="procate">
						  			  <option value="backpack" selected="selected">BackPack[BP]</option> 
 									  <option value="cross">Cross [CR]</option> 
									  <option value="briefcase">Briefcase [BF]</option>
									</select> 	
                              </div>
                          </div>
                          
                            <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label" >브랜드</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control round-form" id="probrand" name="probrand">

                              </div>
                          </div>
                          
                            <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">가격</label>
                              <div class="col-sm-10">
                                  <input type="number" class="form-control round-form" id="proprice" name="proprice">
                              </div>
                             </div> 
                             
                             <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">세일 / PreOrder / NEW / None</label>
                              <div class="col-sm-10">
							    <input type="radio" id="prosale" name="prosale" value="sale"> 
							    &nbsp;Sale &nbsp; <input id="discnt" name="discnt" type="number" size="10" class="form-control round-form sale"> 
							    % &nbsp;&nbsp;&nbsp;&nbsp;
							    <input type="radio" id="prosale" name="prosale" value="preorder">&nbsp; Preorder
							    &nbsp;&nbsp;&nbsp;&nbsp;
							    <input type="radio" id="prosale" name="prosale" value="new">&nbsp; New
							     &nbsp;&nbsp;&nbsp;&nbsp;
							    <input type="radio" id="prosale" name="prosale" value="none" checked>&nbsp; None
							  </div>
                         	</div>
                          
                            <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-addabel">재고</label>
                              <div class="col-sm-10">
                                  <input type="number" class="form-control round-form" name="prostock" id="prostock">
                              </div>
                          </div>
                          
                           <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">원산지</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control round-form" name="prorgin" id="prorgin">
                              </div>
                          </div>
                          
                          
                            <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">색상</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control round-form" name="procolor" id="procolor"> 
                                  <span class="help-block"> [Color] Navy: NY, Brown: BR, BLACK: BL, Yellow: YL, White: WH.. 
                                  </span>
                              </div>
                          </div>
                          
                            <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">상품소재</label>
                              <div class="col-sm-10">
                                   <input type="text" class="form-control round-form" name="promt" id="promt">
                              </div>
                          </div>
                          
                           <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">가방길이</label>
                              <div class="col-sm-10">
                                <input type="number" class="form-control round-form" name="prolength" id="prolength">
                              </div>
                          </div>
                          
                            <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">상품정보</label>
                              <div class="col-sm-10">
                                  <textarea class="form-control info" rows="10" name="proinfo" id="proinfo"></textarea>
                              </div>
                          </div>
                          
                            <div class="form-group">
							  <label class="col-sm-2 col-sm-2 control-label">상품이미지</label>
							    <div class="col-sm-10">
							    <input type="file" class="imgfile" name="proimg" id="proimg">
							  </div>
						  </div>
                          
                           <div class="form-group radi">
							  <label class="col-sm-2 col-sm-2 control-label"> 게시여부</label>
							    <div class="col-sm-10">
							    <input type="radio" name="proab" id="proab" value="y" checked>&nbsp;  Y
							    &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;
							    <input type="radio" name="proab" id="proab" value="n">&nbsp;  N
							  </div>
						  </div>
						  
						<div class="form-group reg">
						  <input type="submit" value="등록하기" class="btn btn-theme reg1" name="adminbtn" id="adminbtn">
						  <input type="reset" value="리셋" class="btn btn-theme reg2" >
                  		</div>
                  		
                      </form> <!-- form 끝 -->
                  </div> <!-- form-panel -->
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->

		</section> 

      <!--main content end-->
