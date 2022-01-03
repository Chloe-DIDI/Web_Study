
<!-- 
	jsp 주석문은 jsp 처리단계에서 처리되고 html주석은 html 처리단계에서 처리된다?
	f12 누르면 보이고 안보이고? -->
	
	<!-- html 주석문 -->
	<%-- jsp 주석문 --%>



<%@ page contentType="text/html; charset=UTF-8"%>
 
<%
	//스크립트 릿 영역 → 이전 페이지(Gudan.jsp)로 부터 데이터 수신
	request.setCharacterEncoding("UTF-8");
		
	
	// 데이터 수신
	String danStr = request.getParameter("dan"); 
	   
	int n = 0;   
	//String str = "";
	//@ 이렇게 str에 넣어서 한번에 보여줘도 상관없음!
	
	try
	{
	   n = Integer.parseInt(danStr);
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
<title>Gugudan_ok.jsp</title>
<link rel="stylesheet" type="text/css" herf="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
	<p>Gugudan.jsp ○ → Gugudan_ok.jsp ●</p>
</div>

<div>
	<h2>구구단 출력</h2>
</div>

<%-- 	
	<%for(int i=1; i<=9; i++)
	  {%>
		  <%=n %> * <%=i %> = <%=(n*i) %><br>	 
	<%}%> 
--%>

<%
    
	for(int i=1; i<=9; i++)
	{
		out.print(n + " * " + i + " = " + (n*i) + "<br>");
	}
%>





</body>
</html>