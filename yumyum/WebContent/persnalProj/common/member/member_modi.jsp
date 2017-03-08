<%@page import="java.util.Calendar"%>
<%@page import="member.memberBean"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	MemberDao dao = new MemberDao();
	String user_id = (String)session.getAttribute("user_id");	

	//세션값이 있으면 회원정보 수정 가능
	if(user_id != null){
		
	memberBean mBean = dao.getMember(user_id);
	
	String[] numArray = mBean.getPhoneNum1().split("-");
	String[] birthArray = mBean.getBirthY().split("-");
	String[] emailArray = mBean.getEmail_id().split("@");
%> 
<jsp:include page="../sub_header.jsp" />
    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header subImg06">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>My Info</h1>
                        <h3>회원정보를 수정할 수 있습니다.</h3>
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

	<div class="container">
	<div class="joinWrap">
	<h1>회원정보수정</h1>
		<div class="joinForm">
		<form action="modiProc.jsp" method="post" name="joinForm">
		<input type="hidden" name="user_id" value="<%=user_id%>" />
			<h3>내 정보</h3>
			<table align="center" id="modiTable">
			<colgroup>
     			<col width="15%">
     			<col width="50%">
     		</colgroup>
				<tr>
					<td>아이디 </td>
					<td><%=user_id %><span>* 아이디는 수정 할 수 없습니다.</span></td>
				</tr>
				<tr>
					<td>비밀번호 </td>
					<td><input type="password" id="user_pw" name="user_pw" placeholder="6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요." /></td>
				</tr>
				<tr>
					<td>비밀번호 확인 </td>
					<td><input type="password" id="user_pwChk" name="user_pwChk" placeholder="비밀번호를 한번 더 입력하세요." /></td>
				</tr>
				<tr>
					<td>이름 </td>
					<td><input type="text" id="user_name" name="user_name" placeholder="2자 이상 5자 이하로 입력하세요." value="<%=mBean.getUser_name()%>" /></td>
				</tr>
				<tr>
					<td>성별 </td>
					<td>
						<input type="radio" id="gender" name="gender" value="남" style="vertical-align: bottom;" <% if(mBean.getGender().equals("남")){ %> checked="checked" <% }%> />남 &nbsp;&nbsp;
						<input type="radio" id="gender" name="gender" value="여" style="vertical-align: bottom;" <% if(mBean.getGender().equals("여")){ %> checked="checked" <% }%> />여
					</td>
				</tr>
				<tr>
					<td>생년월일 </td>
					<td>
						<select id="birthY" name="birthY" value="<%=birthArray[0]%>">
							<option value="<%=birthArray[0]%>"><%=birthArray[0]%></option>
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
						<select id="birthM" name="birthM" value="<%=birthArray[1]%>">
							<option value="<%=birthArray[1]%>"><%=birthArray[1]%></option>
							<% for (int i = 01; i <= 12; i++) { %>
					      	<option value="<%=i%>"><%=i%></option>
					      	<% } %>
						</select>월&nbsp;
						<select id="birthD" name="birthD" value="<%=birthArray[2]%>">
							<option value="<%=birthArray[2]%>"><%=birthArray[2]%></option>
							<% for (int i = 01; i <= 31; i++) { %>
					      	<option value="<%=i%>"><%=i%></option>
					      	<% } %>
						</select>일
					</td>
				</tr>
				<tr>
					<td>전화번호 </td>
					<td>
						<select id="phoneNum1" name="phoneNum1">
							<option value="<%=numArray[0]%>"><%=numArray[0]%></option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
						</select>&nbsp;&nbsp;-&nbsp;
						<input type="text" id="phoneNum2" name="phoneNum2" value="<%=numArray[1]%>" />&nbsp;&nbsp;-&nbsp;
						<input type="text" id="phoneNum3" name="phoneNum3" value="<%=numArray[2]%>" />
					</td>
				</tr>
				<tr>
					<td>주소 </td>
					<td>
						<input type="text" id="postcode" name="postcode" placeholder="우편번호" onclick="execDaumPostcode()" readonly="readonly" value="<%=mBean.getPostcode()%>">
						<input type="button" id="postcodeBtn" name="postcodeBtn" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="address" name="address" placeholder="주소" onclick="execDaumPostcode()" readonly="readonly" value="<%=mBean.getAddress()%>"><br>
						<input type="text" id="address2" name="address2" placeholder="상세주소" value="<%=mBean.getAddress2()%>" />
					</td>
				</tr>
				<tr>
					<td>이메일주소 </td>
					<td>
						<input type="text" id="email_id" name="email_id" value="<%=emailArray[0] %>" style="vertical-align: bottom;" />&nbsp;@&nbsp;
						<select class="emailAddr" name="emailAddr" id="emailAddr">
							<option value="<%=emailArray[1] %>"><%=emailArray[1] %></option>
							<option value="">직접입력</option> <!-- !!!!!!!스크립트!!!!!! -->
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" id="joinBtn" value="수정" onclick="return formChk();" />
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
<%
	} else {
		%>
		<script>
		alert("로그인 후 이용할 수 있습니다."); 
		location.href="../login/login.jsp";
		</script>
		<%
	}
%>