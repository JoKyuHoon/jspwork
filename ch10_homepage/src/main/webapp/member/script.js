function inputIdChk() {
	frm.idBtnCheck.value = "idUncheck";
}


function idCheck(id) {
	frm.idBtnCheck.value = "idCheck";
	if(id == "") {
		alert("아이디를 입력하세요");
		frm.id.focus();
		return;
	}
	url = "idCheck.jsp?id="+id;
	window.open(url, "IDCheck", "width=300, height=150");
}

function inputCheck() {
	if(frm.idBtnCheck.value == "idUncheck") {
		alert("아이디 중복체크를 해주세요");
		return;
	}
	if(frm.pwd.value == "") {
		alert("비밀번호를 입력하세요");
		frm.pwd.focus();
		return;
	}
	if(frm.pwd.value != frm.repwd.value) {
		alert("비밀번호가 다릅니다")
		frm.repwd.focus();
		return;
	}
	if(frm.name.value =="") {
		alert("이름을 입력하세요");
		frm.name.focus();
		return;
	}
	frm.submit(); // 회원가입 button이기 때문에 반드시 해줘야 서버로 넘어감.
}