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
<title>HelloReceive03.jsp</title>
</head>
<body>

<div>
	<h1>결과 수신 페이지</h1>
	<h2>HelloReceive03.jsp</h2>
	<hr>
</div>

<div>
	<!-- 컨트롤러로부터 수신한 결과 -->
	<ul>
		<form>
		 <!-- 여기에 있는 firstName, lastName 은 입력 되는 값 ! 
		 	 값을 가져오기--> 
		 	 
		 	<!-- ◈이렇게 적으면 되고 -->
			<li>First Name : ${param.firstName }</li>
			<li>Last Name : ${param.lastName }</li>

<%-- 
			<li>First Name : ${firstName }</li>
			<li>Last Name : ${lastName }</li>
 --%>			
		</form>
	</ul>
</div>

</body>
</html>