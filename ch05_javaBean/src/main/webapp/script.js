function inputCheck() {
    let id = document.getElementsByName("id")[0].value;
    let pw = document.getElementsByName("pw")[0].value;
    let repw = document.getElementsByName("repw")[0].value;
    let name = document.getElementsByName("name")[0].value;
    let birthday = document.getElementsByName("birthday")[0].value;
    let email = document.getElementsByName("email")[0].value;

    if (id === "") {
        alert("아이디를 입력하세요.");
        return;
    }

    if (pw === "") {
        alert("비밀번호를 입력하세요.");
        return;
    }

    if (repw === "") {
        alert("비밀번호 확인을 입력하세요.");
        return;
    }

    if (pw !== repw) {
        alert("비밀번호가 일치하지 않습니다.");
        return;
    }

    if (name === "") {
        alert("이름을 입력하세요.");
        return;
    }

    if (email === "") {
        alert("이메일을 입력하세요.");
        return;
    }

    alert("회원가입이 완료되었습니다!");

    // form을 사용하지 않고 GET 방식으로 이동 (데이터 전달)
    location.href = `memberProc.jsp?id=${id}&pw=${pw}&name=${name}&email=${email}`;
}

