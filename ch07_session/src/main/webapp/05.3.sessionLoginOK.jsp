<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idkey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Session 로그인</h2>
	<b><%=id %>님이 로그인하였습니다.</b>
	<a href="05.4.sessionLogout.jsp">로그아웃</a>
</body>
</html>