function formChk() {
	//아이디체크
	var user_id = document.getElementById("user_id");
	var reg_eng = /^[A-za-z]/g;

	if (user_id.value == "") {
		alert("아이디를 입력해주세요.");
		document.getElementById("user_id").focus();
		return false;
	}
	if (!reg_eng.test(user_id.value)) {
		alert("아이디는 영문 대소문자와 숫자만 입력가능합니다.");
		user_id.select();
		return false;
	}
	if (user_id.value.length < 3 || user_id.value.length > 9) {
		alert("아이디는 4자이상 8자리 이하로 입력해주세요.");
		document.getElementById("user_id").focus();
		return false;
	}

	//비번체크
	var userPw = document.getElementById("user_pw");
	var userPwChk = document.getElementById("user_pwChk");

	if (userPw.value == "") {
		alert("비밀번호를 입력해주세요.");
		userPw.focus();
		return false;
	}
	if (userPw.value.length < 3 || userPw.value.length > 15) {
		alert("암호는 3자 이상 15자 이하로 입력해주세요.");
		//	userPw.focus();
		userPw.select();
		return false;
	}

	//비번확인 체크
	if (userPw.value != userPwChk.value) {
		alert("암호가 맞지않습니다.\n다시 확인해 주세요");
		userPwChk.select();

		//확인 암호란 비우기
		//	userPwChk.value="";
		return false;
	}

	//이름체크
	var userName = document.getElementById("user_name");
	var reg_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

	if (userName.value == "") {
		alert("이름을 입력해주세요.");
		userName.focus();
		return false;
	}
	if (userName.value.length < 2 || userName.value.length > 5) {
		alert("이름은 2자 이상 5자 이하로 입력하세요");
		userName.select();
		return false;
	}
	if (!reg_kor.test(userName.value)) {
		alert("이름은 한글만 입력가능합니다.");
		userName.select();
		return false;
	}

	//성별선택
	num_temp = document.all.gender.length;
	for (i = 0; i < num_temp; i++) {
		if (document.all.gender[i].checked == true) {
			break;
		}
	}
	if (i == num_temp) {
		alert("성별을 선택하세요.");
		document.getElementById("gender").focus();
		return false;
	}
	
	//전화번호
	var num_check=/^[0-9]*$/;
	
	if (document.getElementById("phoneNum2").value == "") {
		alert("전화번호를 입력해주세요.");
		document.getElementById("phoneNum2").focus();
		return false;
	}
	if (!num_check.test(document.getElementById("phoneNum2").value)) {
		alert("전화번호는 숫자만 입력가능합니다.");
		document.getElementById("phoneNum2").select();
		return false;
	}
	if (document.getElementById("phoneNum3").value == "") {
		alert("전화번호를 입력해주세요.");
		document.getElementById("phoneNum3").focus();
		return false;
	}
	if (!num_check.test(document.getElementById("phoneNum3").value)) {
		alert("전화번호는 숫자만 입력가능합니다.");
		document.getElementById("phoneNum3").select();
		return false;
	}
	
	
	//주소
	if (document.getElementById("postcode").value == "") {
		alert("우편번호를 입력해주세요.");
		document.getElementById("postcodeBtn").focus();
		return false;
	}
	if (document.getElementById("address").value == "") {
		alert("주소를 입력해주세요.");
		document.getElementById("postcodeBtn").focus();
		return false;
	}
	if (document.getElementById("address2").value == "") {
		alert("상세주소를 입력해주세요.");
		document.getElementById("postcodeBtn").focus();
		return false;
	}
	
	
	//이메일
	if (document.getElementById("email_id").value == "") {
		alert("이메일을 입력해주세요.");
		document.getElementById("email_id").focus();
		return false;
	}
	if(document.joinForm.emailAddr.value == "" || document.joinForm.emailAddr.value == null){
		alert("이메일을 선택해주세요.");
		document.joinForm.emailAddr.focus();
		return false;
	}
}
