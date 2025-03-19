<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, vote.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao" />
<%
	int num = 0;
	if(!(request.getParameter("num") == null || request.getParameter("num").equals("")))
		num = Integer.parseInt(request.getParameter("num"));
	
	
	int sum = vDao.sumCount(num); // count의 합계 가져옴
	ArrayList<VoteItem> vitem = vDao.getView(num); // 각 항목의 count 가져옴
	VoteList vlist = vDao.getOneVote(num); // q를 가져오기 위해
	String q = vlist.getQuestion(); // vlist에서 q를 가져옴
	Random r = new Random();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align="center">
 <table border="1" width="500">
        <tr>
            <th colspan="4">Q : <%= q %></th>
        </tr>
        <tr>
            <td colspan="4">총 투표수 : <%= sum %></td>
         <tr>
         	<td>번호</td>
         	<td>item</td>
         	<td>그래프</td>
            <td>count</td>
         </tr>
        </tr> 
           <%
            // vitem 사용
            for (int i=0; i<vitem.size(); i++) {
                VoteItem v = vitem.get(i);
                String[] item = v.getItem();
                
                // rgb값 추출
                int rgbR = r.nextInt(256); // 0~255 까지 나옴
                int rgbG = r.nextInt(256);
                int rgbB = r.nextInt(256);
                String rgb = "rgb("+ rgbR+", "+rgbG+", "+rgbB+")";
                
                //각 항목이 몇 %에 해당하는지
                int ratio = (int)(Math.ceil((v.getCount() / (double)sum) * 100));  
                
           %>
            <tr>
                <td><%=i+1 %></td>
                <td><%=item[0] %></td>
                <td>
                	<table width="<%=ratio%>" height="15">
                		<tr>
                			<td bgcolor="<%=rgb%>" style="border:none"></td>
                		</tr>
                	</table>
                </td>
                <td><%=v.getCount() %></td>
                
            </tr>
           <%
            }
           %>
    </table>
</div>

</body>
</html>