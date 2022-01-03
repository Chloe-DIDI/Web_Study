<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신(num1 과 num2 는 형 변환)
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String op = request.getParameter("op");
	
	String result = "";
	if(op.equals("+"))
		result = String.valueOf(num1+num2);
	else if(op.equals("-"))
		result = String.valueOf(num1-num2);
	else if(op.equals("*"))
		result = String.valueOf(num1*num2);
	else if(op.equals("/"))
	{	
		//result = String.valueOf(num1/num2);
		//result = String.valueOf(num1/(double)num2);
		result = String.format("%1.f", num1/(double)num2); 
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {color: blue; font-weight: bold; font-size: 15pt;}
</style>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 03</h1>
	<hr>
</div>

<div>
	입력하신 <span><%=num1 %></span>과 <span><%=num2 %></span>의 연산 결과는
	<span><%=result %></span> 입니다.
</div>

</body>
</html>