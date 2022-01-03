<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); String cp = request.getContextPath();%>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
제목 : <b>${param.title }</b>
내용 : <b>${param.content }</b>
<%-- 
제목 : <%=title %>
내용 : <%=content %>
 --%>
</body>
</html>