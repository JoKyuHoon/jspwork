<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="script.js" charset="UTF-8"></script>
<title>Insert title here</title>
</head>
<body>

	<table border="1" align="center">
	<form method="post" action="memberProc.jsp">
		<tr>
			<th colspan="2">회 원 가 입</th>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input name="id"></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<td>패스워드 확인</td>
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
			<td>생년월일</td>
			<td>
				<input name="birthday">
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input name="email">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="회원가입" onclick="inputCheck();">&emsp;
				<input type="reset" value="초기화">
			</td>
		</tr>
	</form>

	</table>
</body>
</html>