<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		String name = request.getParameter("name1");
		String color = request.getParameter("color");
		if(color.equals("etc")) {
			color = "green";
		}
		
		String koColor="";
		/*
		switch(color) {
		case "blue" : 
			koColor = "파란색";
			break;
		case "black" : 
			koColor = "검정색";
			break;
		case "red" : 
			koColor = "빨강색";
			break;
		case "green" : 
			koColor = "초록색";
		}
		*/
		
		if (color.equals("blue")) {
		    koColor = "파란색";
		} else if (color.equals("black")) {
		    koColor = "검정색";
		} else if (color.equals("red")) {
		    koColor = "빨간색";
		} else {
		    koColor = "초록색";
		}

	%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=color%>">
	<b><%=name %></b>님이 좋아하는 색상은 <b><%=koColor %></b>입니다.
</body>
</html>