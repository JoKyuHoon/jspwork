<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <style>
        body {
            background-color: #fcf5fc;
        }
        table {
            border: 1px solid;
            border-collapse: collapse;
            width: 1100px;
            margin: auto;
        }
        th, td {
            border: 1px solid;
            height: 30px;
            padding: 5px;
        }
        th {
            color: white;
            height: 40px;
            font-size: 20px;
            background-color: #8c6791;
        }
    </style>
    <script src="script.js"></script>
    <!-- Daum 주소 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function findAddr() {
            new daum.Postcode({
                oncomplete: function(data) {
                    let roadAddr = data.roadAddress;
                    let jibunAddr = data.jibunAddress;
                    let extraAddr = data.bname ? data.bname : '';

                    document.getElementById("postcode").value = data.zonecode;
                    document.getElementById("addr").value = data.userSelectedType === 'R' ? roadAddr : jibunAddr;
                }
            }).open();
        }
    </script>
</head>
<body>
    <form name="frm" method="post" action="MemberProc.jsp">
        <table>
            <tr>
                <th colspan="3">회원가입</th>
            </tr>
            <tr>
                <td>아이디</td>
                <td>
                    <input name="id" onkeydown="inputIdChk();">
                    <input type="button" value="ID중복확인" onclick="idCheck(this.form.id.value);">
                    <input type="hidden" name="idBtnCheck" value="idUncheck">
                </td>
                <td>영문과 숫자로만 입력하세요</td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="pwd"></td>
                <td>특수기호, 영문, 숫자가 각 1개 이상 포함, 8자 이상</td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" name="repwd"></td>
                <td>위의 비밀번호를 다시 입력하세요</td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input name="name"></td>
                <td>한글로 입력하세요</td>
            </tr>
            <tr>
                <td>성별</td>
                <td>
                    <input type="radio" name="gender" value="1" checked> 남
                    <input type="radio" name="gender" value="2"> 여
                </td>
                <td>성별을 선택하세요</td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input name="birthday"></td>
                <td>6글자로 입력 (예: 980315)</td>
            </tr>
            <tr>
                <td>E-mail</td>
                <td><input type="email" name="email" size="40"></td>
                <td>예: email@naver.com</td>
            </tr>
            <tr>
                <td>우편번호</td>
                <td>
                    <input name="zipcode" id="postcode" readonly>
                    <input type="button" value="우편번호 찾기" onclick="findAddr();">
                </td>
                <td>우편번호를 검색하세요</td>
            </tr>
            <tr>
                <td>주소</td>
                <td>
                    <input name="address" id="addr" size="60" readonly><br>
                    <input name="detail_address" id="detailAddr" placeholder="상세주소 입력">
                </td>
                <td>상세주소를 입력하세요 (선택)</td>
            </tr>
            <tr>
                <td>취미</td>
                <td>
                    <input type="checkbox" name="hobby" value="인터넷" checked> 인터넷
                    <input type="checkbox" name="hobby" value="여행"> 여행
                    <input type="checkbox" name="hobby" value="게임"> 게임
                    <input type="checkbox" name="hobby" value="영화"> 영화
                    <input type="checkbox" name="hobby" value="운동"> 운동
                </td>
                <td>취미를 선택하세요</td>
            </tr>
            <tr>
                <td>직업</td>
                <td>
                    <select name="job">
                        <option value="0" selected>선택하세요</option>
                        <option value="회사원">회사원</option>
                        <option value="공무원">공무원</option>
                        <option value="의사">의사</option>
                        <option value="법조인">법조인</option>
                        <option value="학생">학생</option>
                        <option value="교수">교수</option>
                        <option value="기타">기타</option>
                    </select>
                </td>
                <td>직업을 선택하세요</td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <input type="button" value="회원가입" onclick="inputCheck();">
                    <input type="reset" value="다시쓰기">
                    <input type="button" value="로그인">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
