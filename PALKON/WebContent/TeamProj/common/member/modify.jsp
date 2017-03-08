<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="main signUp">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="">mypage</a></li>
            <li class="active">Modify</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
        	<jsp:include page="Side.jsp"></jsp:include>
          <!-- END SIDEBAR -->
	
       	   <!-- BEGIN CONTENT -->
        	<div class="col-md-10 col-sm-9">
            <h1>회원정보 수정</h1>
            <div class="content-form-page">
              <form action="../ModifyConfrim.mr" method="post" class="form-horizontal form-without-legend" id="form">
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="id">아이디<span class="require">*</span></label>
                  <div class="col-lg-9">
                    <input type="text" id="id" name="id" value="${requestScope.mdto.mb_id }" readonly="readonly" class="form-control" required="required" maxlength="15">
                    <div class="console"></div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="pass">비밀번호<span class="require">*</span></label>
                  <div class="col-lg-9">
                    <input type="password" id="pass" name="pass" placeholder="비밀번호를 입력해주세요" class="form-control" onkeyup="passCheck()">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="passCheck">비밀번호 확인<span class="require">*</span></label>
                  <div class="col-lg-9">
                    <input type="password" id="passCheck" name="passCheck" class="form-control" placeholder="비밀번호 확인" required="required" onkeyup="passCheck()" maxlength="30">
                    <div id="empty" class="empty"></div>                    	
                  </div>
                </div>
              
           		<div class="form-group">
                  <label class="col-lg-2 control-label" for="email">이메일<span class="require">*</span></label>
                  <div class="col-lg-9 email_box">                  	
                   	 <input type="text" id="email" class="form-control" value="${requestScope.mdto.mb_email }" name="email" required="required" maxlength="50">                                        
                  </div>	       
	            </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="mobile">휴대전화 <span class="require">*</span></label>
                  <div class="col-lg-9">
                    <input type="text" id="mobile" name="mobile" class="form-control" value="${requestScope.mdto.mb_mobile }" placeholder="'-'없이 입력" required="required" maxlength="13" onkeyup="hypen('mobile')"/>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="tel">전화번호</label>
                  <div class="col-lg-9">
                    <input type="text" id="tel" name="tel" class="form-control" value="${requestScope.mdto.mb_tel }" placeholder="'-'없이 입력" maxlength="13" onkeyup="hypen('tel')"/>
                  </div>
                </div>
                <div class="form-group">
					<label class="col-lg-2 control-label" for="name">이름</label>
					<div class="col-lg-9">
						<input type="text" class="form-control" id="name" name="name" value="${requestScope.mdto.mb_name }" placeholder="이름을 입력해주세요" maxlength="20" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label" for="name">주소</label>
					<div class="col-lg-9">
						<div class="address_wrap">	
							<div class="col-lg-8 log_addr">					
								<input type="text" id="address1" name="address1" value="${requestScope.addrs[0] }"class="form-control postnum" placeholder="우편번호">
							</div>
							<div class="col-lg-4 log_addr">	
								<input type="button" onclick="sample6_execDaumPostcode()"class="form-control postnumfinder" value="주소찾기">
							</div>							
						</div>						
						<input type="text" id="address2" name="address2" class="form-control" placeholder="주소" value="${requestScope.addrs[1] }">
						<input type="text" id="address3" name="address3" class="form-control" placeholder="상세주소" maxlength="30" value="${requestScope.addrs[2] }">						
	                </div>
                </div>
                
                <div class="form-group">
                  <label class="col-md-2 control-label">성별</label>
                  <div class="col-md-8">
                    <select class="form-control" id="gender" name="gender">
                  		<option value="none">선택해주세요</option>
                  		<%-- <c:set var="gender" value="${requestScope.list[7] }" />
                  		<c:if test="${gender=='male'}">
							<option value="male" selected="selected">남</option>							
						</c:if>
						<c:if test="${gender=='female'}">							
							<option value="female" selected="selected">여</option>
						</c:if>
					 --%>
						<c:choose>
							<c:when test="${requestScope.mdto.mb_gender eq 'male'}">
								<option value="male" selected="selected">남</option>		
								<option value="female">여</option>
							</c:when>
							<c:otherwise>
								<option value="male">남</option>		
								<option value="female" selected="selected">여</option>								
							</c:otherwise>
						</c:choose>
						
                    </select>
                  </div>
                </div>
                <div class="form-group">
					<label class="col-lg-2 control-label" for="yyyy">생년월일</label>
					<div class="col-lg-9">
						<input type="text" value="${requestScope.mdto.mb_brith_date }" class="form-control" id="yyyy" name="yyyy" placeholder="생년월일" maxlength="20" />
					</div>
				</div>
				
				 <input type="hidden" name="join_date" id="join_date" value="${requestScope.mdto.mb_join_date }">
				<input type="hidden" name="last_login" id="last_login" value="${requestScope.mdto.mb_last_login }">
                <input type="hidden" name="buy_cnt" id="buy_cnt" value="${requestScope.mdto.mb_buy_cnt}">
                <input type="hidden" name="grade" id="grade" value="${requestScope.mdto.mb_grade }">
                
                <input type="hidden" name="checknum" id="checknum">
				
                
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
                    <button class="btn btn-primary" onclick="modycheck()">회원정보 수정하기</button>
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
<script type="text/javascript">
/*Datepicker 시작-------------------------------------------------------------------------------------------------------------*/
var $j = $.noConflict(true);
$j("#yyyy").datepicker({
  showOn: "focus", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
  buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지, 적용안함
  buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
  changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
  nextText: '다음 달', // next 아이콘의 툴팁.
  prevText: '이전 달', // prev 아이콘의 툴팁.
  numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
  stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
  yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
  showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
  currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
  closeText: '닫기',  // 닫기 버튼 패널
  dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
  showAnim: "slide", //애니메이션을 적용한다.						 
  showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
  dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
});
/*Datepicker 끝-------------------------------------------------------------------------------------------------------------*/

</script>

    