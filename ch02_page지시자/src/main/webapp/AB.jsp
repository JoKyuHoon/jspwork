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
<%=name %>님의 혈액형은<%=blood%>입니다.<p/>
AB형 특징 🧠✨<p/>
이해하기 어려운 4차원 🤯 → 감정과 사고방식이 독특해서 예측 불가!<p/>
이성적이면서도 감성적 ⚖️ → 상황에 따라 논리적이기도 하고 감정적이기도 함.<p/>
다양한 면모를 가짐 🎭 → 혼자 있을 땐 조용하지만, 사람들과 있을 땐 활발할 수도 있음.<p/>
자기만의 기준이 확실함 🚦 → 남들이 뭐라 해도 자신만의 스타일을 유지함.<p/>
인간관계 선택적 🧐 → 아무하고나 친해지지 않고, 맞는 사람하고만 친하게 지냄.<p/>
센스 있고 창의적 🎨 → 독창적인 아이디어와 감각이 뛰어남.
</body>
</html>