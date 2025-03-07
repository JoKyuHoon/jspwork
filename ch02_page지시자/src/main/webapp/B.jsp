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
<%=name %>님의 혈액형은 B형입니다.<p/>
B형의 특징 🎨⚡<p/>
자유로운 영혼 😎 → 틀에 얽매이는 걸 싫어함.<p/>
즉흥적 & 감정적 🎢 → 하고 싶은 건 바로 해야 직성이 풀림.<p/>
호불호 확실함 👍👎 → 싫으면 싫고, 좋으면 좋다!<p/>
매력적이고 유머러스함 😆 → 사람들과 잘 어울리고 분위기 메이커 역할.<p/>
한 가지에 몰입하면 끝까지 감 🎯 → 관심 있는 것엔 엄청난 집중력 발휘.<p/>
싫증을 빨리 냄 🏃 → 쉽게 질리고, 변덕이 심할 수도 있음.
</body>
</html>