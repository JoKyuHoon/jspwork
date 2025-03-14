<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch09_vote.*, java.util.*" %>
<jsp:useBean id="vDao" class="ch09_vote.VoteDao"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>투표</title>
<style>

	* {margin: 0 auto;}
	div {width: 600px;}
	h2, h5{text-align: center;}
	.m30{margin-top: 30px;}
	div a {
    text-decoration: none; /* 밑줄 제거 */
    color: black;
    cursor: pointer; /* 마우스 포인터를 손가락 모양으로 변경 */
    
    
	  }
</style>
</head>
<body>
<div>
	<h2 class="m30">투표 프로그램</h2>
	<hr>
	
	<h5 class="m30">설 문 폼</h5>
	<jsp:include page="voteForm.jsp" />
	<hr>
	
	<h5 class="m30">설문 리스트</h5>
	<table class="table table-striped">
		<tr align="center">
			<th>번호</th>
			<th>제목</th>
			<th>시작일~종료일</th>
		</tr>
	<%
		ArrayList<VoteList> alist = vDao.getList();
		for(int i=0; i<alist.size(); i++) {
			VoteList vlist = alist.get(i);
			int num = vlist.getNum();
			String question = vlist.getQuestion();
			String sdate = vlist.getSdate().substring(0, 10);
			String edate = vlist.getEdate().substring(0, 10);
			out.print("<tr>");
			out.print("		<td> " + (alist.size()-i) + "</td>");
			out.print("		<td><a href='voteList.jsp?num=" + num + "'>" + question + "</a></td>");
			out.print("		<td>" + sdate + "~" + edate +"</td>");
			out.print("</tr>");
		}
	%>
		
		<tr>
			<td colspan="3"><button type="button" class="btn btn-success" onclick="location.href='voteInsert.jsp'">설문 작성하기</button></td>
		</tr>
	</table>
</div>
	
</body>
</html>