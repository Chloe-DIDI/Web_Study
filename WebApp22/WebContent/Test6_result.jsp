<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
    request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test6_result.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) forEach문을 이용한 자료구조 활용 실습</h1>
	<hr>
</div>

<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<th>나이</th>
		</tr>
		
		<!-- 컬렉션 객체 출력용 반복문 구성 -->
		<%-- 『<c:forEach var="변수" items="컬렉션"></c:forEach>』 --%>
		<c:forEach var="dto" items="${lists }">
		<tr>
			<td align="center">${dto.name }</td>	
			<td align="center">${dto.age }</td>
		</tr>
			
		</c:forEach>
		
	</table>
</div>


</body>
</html>