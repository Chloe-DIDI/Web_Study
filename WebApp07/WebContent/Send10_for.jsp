<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Send10.jsp)로부터 넘어온 데이터(userName) 수신
	// ①
	request.setCharacterEncoding("UTF-8");
	String userName = request.getParameter("userName");
	
	// 이 페이지에서 수행한 추가 작업
	// ②
	request.setAttribute("message", "안녕하세요.");
	//-- request 객체의 key(message)의 값 안에
	//   "반갑습니다."를 value 로 넣는 작업 수행
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10_for.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>

<div>
	<h2>포워드</h2>
</div>

<div>
	<p>이름 : <%=userName %></p>
	<!-- ③ -->
	<jsp:forward page="Receive10.jsp"></jsp:forward>
	<!--@ 위에서도 쓸수 있지만, 지금은 이해도 떨어지기 때문에 여기서 액션태그 활용해서 포워드 시키는 것... -->
	<!--@ 포워드는 내부적으로 건냄... 미화, 승균이가 같은 주방에 있음.
		  미화가 내가 짜장면만드느라 바쁘니까 볶음밥 승균이 니가 만들어!
	      주문은 미화가, 실제 만든건 승균이가. 찬호 입장에서는 미화가 만든건지 승균이가 만든건지 모름.
	      내가 주문 미화한테 했으니까 미화가 했겠지...생각.
	      찬호는 세부 주문 내용을 승균이에게 다시 전달할 필요 없음! (볶음밥에 양파는 넣고, 당근과 소세지는 빼고, 밥 고슬고슬하게...)
	      이미 아는 상태~!!! -->
</div>

</body>
</html>