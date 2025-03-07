<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String id = request.getParameter("id");
    String pw = request.getParameter("pw");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Forward Tag</h1>
	귀하의 id : <%=id %><br>
	귀하의 pw : <%=pw %>
</body>
</html>