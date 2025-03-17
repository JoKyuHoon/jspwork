<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	body {background-color : #fcf5fc;}
</style>
</head>
<body>
<% if(id != null) { %>
	<b><%=id %>님 환영합니다</b>
	<a href="logout.jsp">로그아웃</a>
<% } else { %>

<form action="loginProc.jsp" method="post">
	<table align="center">
		<tr>
			<td colspan="2" align="center"><h2>로그인</h2></td>
		</tr>
		<tr>
			<td width="50px" align="center">ID</td>
			<td><input name="id" required></td>
		</tr>
		<tr>
			<td align="center">PW</td>
			<td><input type="password" name="pwd" required></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="LOGIN">&emsp;
				<input type="button" value="회원가입" onclick="location.href='member.jsp'">
			</td>
		</tr>
	</table>
</form>
<% } %>
</body>
</html>