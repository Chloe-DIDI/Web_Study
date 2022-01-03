<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 내가 작성한 코드
	//String resultStr = (String)request.getParameter("resultStr");
	// 이전 페이지(Redirect12.html)로부터 데이터(num1, num2, op, str) 수신
	// → 직접 Redirect12.jsp 로 부터 데이터를 넘겨받는 것이 아니라
	//    클라이언트가 새로운 요청을 하는 과정에서 넘긴 값을 수신하게 되는 개념
	
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String op = request.getParameter("op");
	String str = request.getParameter("str");
	
	//@ 특수문제 get방식으로 넘길땐 조심! get방식으로는 잘 전달안되는경우 많음
	//@ 특수문자는 get으로 안 넘기는게 좋음...
	if(op.equals("1"))
		op = "+";
	else if(op.equals("2"))
		op = "-";
	else if(op.equals("3"))
		op = "*";
	else if(op.equals("4"))
		op = "/";
	
	String strResult = String.format("%s %s %s = %s", num1, op, num2, str);
	
	//@ 모든 브라우저는 게으르게 설계되어 있음....
	//@ 브라우저 갔다왔다 몇 번씩 함! 우리눈에 시각적으로 보이지 않는 밖에서.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive12.html</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 12</h1>
	<hr>
</div>

<!--@ 내가 작성한 코드 -->
<%-- 	<h2>연산 결과 : <%=resultStr %></h2> --%>

<!--@ 클라이언트가 받아서 다시 넘겨준 값!  -->
<div>
	<h2>연산 결과 : <%=strResult %></h2>
</div>

</body>
</html>



