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
O형 특징 🔥💪<p/>
에너지가 넘침 ⚡ → 활발하고 긍정적인 분위기를 주는 경우가 많음.<p/>
리더십 강함 👑 → 조직을 이끄는 능력이 있고, 주도적인 성향.<p/>
사교성이 좋음 🗣️ → 누구와도 쉽게 어울리고 친해질 수 있음.<p/>
승부욕 강함 🏆 → 경쟁심이 있어서 목표가 생기면 끝까지 해내려고 함.<p/>
쿨하고 대범함 😎 → 작은 일에 연연하지 않고, 쉽게 잊고 넘어감.<p/>
감정 표현이 솔직함 ❤️ → 좋으면 좋고, 싫으면 싫다! 감정을 숨기지 않음.
</body>
</html>