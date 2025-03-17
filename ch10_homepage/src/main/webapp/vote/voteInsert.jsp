<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"></script>
<title>설문 작성</title>
<style>
	* {margin: 0 auto;}
	div {width: 600px;}
	h2{text-align: center;}
	.m30{margin-top: 30px;}
</style>
</head>
<body>
 <div>
	<h2 class="m30">투표 프로그램</h2>
	<hr>
	
	<h5 class="m30">설문작성</h5>
	<hr>
	<form action="voteInsertProc.jsp" method="post">
		<table class="table table-striped">
			<tr>
				<td width="10%">질문</td>
				<td colspan="2"><input name='item' class='form-control' placeholder='입력' aria-label='Username' aria-describedby='addon-wrapping'></td>
			</tr>
			<tr>
			<!--
	 			<td>1:<input name="item"></td>
				<td>2:<input name="item"></td>
			</tr>
			<tr>
				
				<td>3:<input name="item"></td>
				<td>4:<input name="item"></td>
			</tr>
			<tr>
				
				<td>5:<input name="item"></td>
				<td>6:<input name="item"></td>
			</tr>
			<tr>
				
				<td>7:<input name="item"></td>
				<td>8:<input name="item"></td>
			</tr> 
-->
				<td rowspan="7">항목</td>
				<%
				for(int i=1; i<=4; i++) {
					
					out.print("<td>" + /*(i*2-1) +*/ "<input name='item' class='form-control' placeholder='입력' aria-label='Username' aria-describedby='addon-wrapping'></td>");
					out.print("<td>" + /*i*2 +*/ "<input name='item' class='form-control' placeholder='입력' aria-label='Username' aria-describedby='addon-wrapping'></td>");
					out.print("</tr>");
					if(i<4){
					out.print("<tr>");
					}
					
				}
				%>
				<tr>
					<td>시작일</td>
					<td>
						<select name="sdateY" class="form-select-sm" aria-label="Default select example">
						<%
						for(int i=2025; i<=2035; i++){
							out.print("<option value='" + i + "'>" + i + "</option>");
						}
						%>
						</select>년	
						
					
					<select name="sdateM" class="form-select-sm" aria-label="Default select example">
						<%
						for(int i=1; i<=12; i++){
							out.print("<option value='" + i + "'>" + i + "</option>");
						}
						%>
						</select>월
					
				
					<select name="sdateD" class="form-select-sm" aria-label="Default select example">
						<%
						for(int i=1; i<=31; i++){
							out.print("<option value='" + i + "'>" + i + "</option>");
						}
						%>

						</select>일	
					</td>			
				</tr>
				<tr>
					<td>종료일</td>
					<td>
						<select name="edateY" class="form-select-sm" aria-label="Default select example">
						<%
						for(int i=2025; i<=2035; i++){
							out.print("<option value='" + i + "'>" + i + "</option>");
						}
						%>
						</select>년	
						
					
					<select name="edateM" class="form-select-sm" aria-label="Default select example">
						<%
						for(int i=1; i<=12; i++){
							out.print("<option value='" + i + "'>" + i + "</option>");
						}
						%>
						</select>월
					
				
					<select name="edateD" class="form-select-sm" aria-label="Default select example">
						<%
						for(int i=1; i<=31; i++){
							out.print("<option value='" + i + "'>" + i + "</option>");
						}
						%>
						</select>일	
					</td>			
				</tr>
				<tr>
					<td>이중답변</td>
					<td>
						<input type="radio" name="type" value="1" checked>yes
						<input type="radio" name="type" value="0">no
					</td>
					
				</tr>
				
				<tr>
					<td colspan="3" align="center">
						<input type="submit" class="btn btn-success" value="작성하기">&emsp;
						<input type="reset" class="btn btn-secondary" value="다시쓰기">&emsp;
						<input type="button"  class="btn btn-success" value="목록보기" onclick="location.href='voteList.jsp'">
					</td>
				</tr>
		</table>
	</form>
</body>
</html>