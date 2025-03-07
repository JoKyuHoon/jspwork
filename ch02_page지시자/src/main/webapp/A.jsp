<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String name = request.getParameter("name");
	String blood = request.getParameter("bloodType");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=name %>님의 혈액형은 <%=blood%>형입니다.<p/>
A형의 특징 🧐🎯</p>
신중함 😌 → 결정을 내리기 전에 깊이 고민함.</p>
완벽주의 성향 🎯 → 꼼꼼하고 세세한 부분까지 신경 씀.</p>
책임감 강함 ✅ → 맡은 일은 끝까지 해내려 함.</p>
예의 바름 🙇‍♂️ → 남을 배려하고 매너를 중시함.</p>
감정을 잘 숨김 🤐 → 속마음을 쉽게 드러내지 않음.</p>
소심할 수도 있음 😅 → 상처를 잘 받고 걱정이 많음.
</body>
</html>