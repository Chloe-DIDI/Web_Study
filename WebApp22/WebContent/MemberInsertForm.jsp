<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
    request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">
</head>
<body>
<div>
	<h1>회원 명단 출력</h1>
	<hr>
</div>

<div>

	<!-- 이름, 전화번호, 주소 * 5명 분 -->
	<!-- submit 액션 처리 -->

	<form action="MemberInsert.jsp" method="post">
		
		<c:forEach var="member" begin="1" end="5" step="1">
			이　　름 : <input type="text" class="txt" name="name"><br>
			전화번호 : <input type="text" class="txt" name="tel"><br>
			주　　소 : <input type="text" class="txt" name="addr"><br><br>
		</c:forEach> 
		
		<button type="submit" class="btn" style="width: 300px; background-color:ivory; color:pink; font-style:italic; font-size: 18pt;">입력</button>
	</form>
	
</div>

</body>
</html>