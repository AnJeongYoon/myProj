<%@page import="java.util.Calendar"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    
<!--
	1. 약관 동의시 회원정보 입력 스크립트
	2. 생년월일, 이멜주소(직접입력) 스크립트
	3. id중복체크
-->
<jsp:include page="../sub_header.jsp" />
    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header subImg06">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>Join Us</h1>
                        <h3>회원가입을 하면 다양한 서비스를 즐길 수 있습니다.</h3>
                        <hr class="intro-divider">
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.intro-header -->

<script type="text/javascript" src="../../js/register.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="../../js/execDaumPostcode.js"></script>
<script>
function appendYear(){
	var date = new Date();
	var year = date.getFullYear();
	var selectValue = document.getElementById("birthY");
	var optionIndex = 0;

	for(var i=year-100;i<=year;i++){
			selectValue.add(new Option(i+"년",i),optionIndex++);                        
	}
}


function appendMonth(){
	var selectValue = document.getElementById("birthM"); 
	var optionIndex = 0;

	for(var i=1;i<=12;i++){
			selectValue.add(new Option(i+"월",i),optionIndex++);
	}
}


function appendDay(){
	var selectValue = document.getElementById("birthD");
	var optionIndex = 0;

	for(var i=1;i<=31;i++){
			selectValue.add(new Option(i+"일",i),optionIndex++);
	}
} 

//회원약관 동의
function agree_check(value) {
	if(value == 1) {
		$('.joinForm').css("display","block");
	} else {
		$('.joinForm').css("display","none");
	}
}

//이메일 직접입력
function email_check(value) {
	if(value == "emailWrite") {
		$('#emailWrite').css("display","block");
	} else {
		$('#emailWrite').css("display","none");
	}
}

//아이디체크
function idChk() {
	if (document.getElementById("user_id").value == "") {
		alert("아이디를 입력해주세요.");
		document.getElementById("user_id").focus();
		return false;
	}

	var fid = document.joinForm.user_id.value;

	window.open("idChk.jsp?userid="+fid, "", "width=400, height=200");
}
</script>

	<div class="container">
	<div class="joinWrap">
	<h1>회원가입</h1>
		<div class="agreeWrap">
			<h3>약관동의</h3>
			<div class="agree">
				<textarea rows="15" cols="79" readonly="readonly">회원약관</textarea>
				<div class="agreeBtn">
					<input type="radio" id="agreeBtn1" name="agreeBtn" value="1" onchange="agree_check(this.value); return false;" />약관에 동의합니다.
					<input type="radio" id="agreeBtn2" name="agreeBtn" value="0" onchange="agree_check(this.value); return false;" />약관에 동의하지 않습니다.
				</div>
			</div>
		</div>
	
		<div class="joinForm" style="display: none;">
		<div class="displayNone"></div>
		<form action="joinProc.jsp" method="post" name="joinForm">
			<h3>회원정보</h3>
			<span>* 모든 사항은 필수 입력사항입니다.</span>
			<table align="center">
			<colgroup>
     			<col width="15%">
     			<col width="50%">
     		</colgroup>
				<tr>
					<td><span>* </span>아이디 </td>
					<td>
						<input type="text" id="user_id" name="user_id" placeholder="3~8자 영문 대 소문자, 숫자를 사용하세요." />
						<input type="button" id="user_idChk" name="user_idChk" value="ID중복확인" onclick="idChk();" style="vertical-align: bottom;" />
					</td>
				</tr>
				<tr>
					<td><span>* </span>비밀번호 </td>
					<td><input type="password" id="user_pw" name="user_pw" placeholder="6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요." /></td>
				</tr>
				<tr>
					<td><span>* </span>비밀번호 확인 </td>
					<td><input type="password" id="user_pwChk" name="user_pwChk" placeholder="비밀번호를 한번 더 입력하세요." /></td>
				</tr>
				<tr>
					<td><span>* </span>이름 </td>
					<td><input type="text" id="user_name" name="user_name" placeholder="2자 이상 5자 이하로 입력하세요." /></td>
				</tr>
				<tr>
					<td><span>* </span>성별 </td>
					<td>
						<input type="radio" id="gender" name="gender" value="남" style="vertical-align: bottom;" />남 &nbsp;&nbsp;
						<input type="radio" id="gender" name="gender" value="여" style="vertical-align: bottom;" />여
					</td>
				</tr>
				<tr>
					<td><span>* </span>생년월일 </td>
					<td>
						<select id="birthY" name="birthY">
							<% 
							Calendar currentCalendar = Calendar.getInstance();
							//현재 날짜 구하기
							String nowYear = Integer.toString(currentCalendar.get(Calendar.YEAR));
							int year = Integer.parseInt(nowYear) - 50;
							for (int i = Integer.parseInt(nowYear); i > year; i--) { 
							%>
					      	<option value="<%=i%>"><%=i%></option>
					      	<% } %>
						</select>년&nbsp;
						<select id="birthM" name="birthM">
							<% for (int i = 01; i <= 12; i++) { %>
					      	<option value="<%=i%>"><%=i%></option>
					      	<% } %>
						</select>월&nbsp;
						<select id="birthD" name="birthD">
							<% for (int i = 01; i <= 31; i++) { %>
					      	<option value="<%=i%>"><%=i%></option>
					      	<% } %>
						</select>일
					</td>
				</tr>
				<tr>
					<td><span>* </span>전화번호 </td>
					<td>
						<select id="phoneNum1" name="phoneNum1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
						</select>&nbsp;&nbsp;-&nbsp;
						<input type="text" id="phoneNum2" name="phoneNum2" />&nbsp;&nbsp;-&nbsp;
						<input type="text" id="phoneNum3" name="phoneNum3" />
					</td>
				</tr>
				<tr>
					<td><span>* </span>주소 </td>
					<td>
						<input type="text" id="postcode" name="postcode" placeholder="우편번호" onclick="execDaumPostcode()"  readonly="readonly">
						<input type="button" id="postcodeBtn" name="postcodeBtn" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="address" name="address" placeholder="주소" onclick="execDaumPostcode()" readonly="readonly"><br>
						<input type="text" id="address2" name="address2" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<td><span>* </span>이메일주소 </td>
					<td>
						<input type="text" id="email_id" name="email_id" style="vertical-align: bottom;" />&nbsp;@&nbsp;
						<select class="emailAddr" name="emailAddr" id="emailAddr" onchange="email_check(this.value); return false;">
							<option value="" selected="selected">선택하세요.</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="emailWrite">직접입력</option> <!-- !!!!!!!스크립트!!!!!! -->
						</select>
						<span id="emailWrite" style="display: none;">
							<input type="text" name="email_default" id="email_default" value="" size="50"/>
						</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" id="joinBtn" value="회원가입" onclick="return formChk();" />
						<input type="reset" id="resetBtn" value="다시입력" onclick="" />
						<input type="button" id="cancelBtn" value="취소" onclick="history.go(-1);" />
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	</div>

<jsp:include page="../sub_footer.jsp" />