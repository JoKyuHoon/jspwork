<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idkey");
	if(id != null) {
%>
	<script>
		alert("로그인 되어 있습니다.");
		location.href="05.3.sessionLoginOK.jsp";
	</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="05.2.sessionLoginProc.jsp" method="post">
	<table border="1">
		<tr>
			<td colspan="2" align="center"><h2>Session Login</h2></td>
		</tr>
		<tr>
			<td width="50px" align="center">ID</td>
			<td><input name="userid" required></td>
		</tr>
		<tr>
			<td align="center">PW</td>
			<td><input type="password" name="userpw" required></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="LOGIN">&emsp;
				<input type="reset" value="초기화">
			</td>
		</tr>
	</table>
</form>
</body>
</html>