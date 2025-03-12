<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center" width=100%>
	<form method="post" action="MemberProc.jsp">
		<tr>
			<th colspan="3">회 원 가 입</th>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input name="id"><input type="button" value="ID중복확인"></td>
			<td>영문과 숫자로만 입력</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td>
				<input type="password" name="repw">
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input name="name">
			</td>
		</tr>
			<tr>
			<td>성별</td>
			<td>
				남<input type="radio" name="gender">
				여<input type="radio" name="gender">
			</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
				<input name="birthday">
			</td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td>
				<input name="email">
			</td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td>
				<input name="zipcode">
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input name="address"><br>
				<input name="dtailaddress">
			</td>
		</tr>
			<tr>
			<td>취미</td>
			<td>
				<input type="checkbox" name="">인터넷
				<input type="checkbox" name="">여행
				<input type="checkbox" name="">게임
				<input type="checkbox" name="">영화
				<input type="checkbox" name="">운동
				
			</td>
		</tr>
		
		<tr>
			<td>직업</td>
			<td>
				<select name="job">
			<option value="">선택하세요</option>
		 	<option value=""></option>
		 	<option value=""></option>
		 	<option value=""></option>
		 	<option value=""></option>
				 </select><br><br>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="회원가입" onclick="inputCheck();">&emsp;
				<input type="reset" value="다시쓰기">
				<input type="submit" value="로그인">
			</td>
		</tr>
	</form>

	</table>
</body>
</html>