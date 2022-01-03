<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 접속자 수 처리
	int n = 0;

	// application: 포함(내장) 되어있는 객체
    String count = (String)application.getAttribute("count");
    
    if(count != null)
   		n = Integer.parseInt(count);
    
    n++;
    application.setAttribute("count", Integer.toString(n));
    
    // 실제 접속자의 주소 처리(콘솔 창을 통해 확인)
    String realPath = application.getRealPath("/");
    application.log("접속자 : " + request.getRemoteAddr());
    
    
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestApplication.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
</head>
<body>

<!-- http://211.238.142.150:8090/WebApp15/TestApplication.jsp -->

<div>
	<h1>Application 을 활용한 접속자 수 체크</h1>
	<hr>
</div>

<div>
	<h2>총 접속자 : <%=n %></h2>
	<h2>웹 서버 실제 경로 : <%=realPath %></h2>
</div>

</body>
</html>