<%@ page contentType="text/html; charset=UTF-8"%>
<%
   // 이전 페이지로(Send05.html)부터 넘어온 데이터(dan) 수신
   
   String dan = request.getParameter("dan");
   int nDan = 0;
   String result = "";
   
   try
   {
      nDan = Integer.parseInt(dan);

      for(int i=1; i<=9; i++)
      {
         result += String.format("%d * %d = %d<br>", nDan, i, (nDan*i));
      }
      
   }
   catch(Exception e)
   {
      System.out.println(e.toString());
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive.jsp</title>
</head>
<body>


<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>
<div>
	<h2>구구단 출력</h2>
	<p><%=result %></p>
</div>


</body>
</html>