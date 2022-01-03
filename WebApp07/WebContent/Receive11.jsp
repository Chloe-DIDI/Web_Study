<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Forward11.jsp)로 부터 데이터(resultStr) 수신
	//                                         -----------
	//                                         setAttribute()
	
	String resultStr = (String)request.getAttribute("resultStr");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive11.jsp</title>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 11</h1>
	<hr>
</div>

<div>
	<h2>연산 결과 : <%=resultStr %></h2>
</div>

</body>
</html>