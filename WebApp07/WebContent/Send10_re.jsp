<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Send10.jsp)로부터 넘어온 데이터(userName) 수신
	// ①
	request.setCharacterEncoding("UTF-8");
	String userName = request.getParameter("userName");
	
	
	// 이 페이지에서 수행한 추가 작업
	// ②
	request.setAttribute("message", "반갑습니다.");
	//-- request 객체의 key(message)의 값 안에
	//   "반갑습니다."를 value 로 넣는 작업 수행
	
	// ※ 리다이렉트
	// ③
	response.sendRedirect("Receive10.jsp");
	//@ 미화가 승균이 주소 찍어서 찬호에게 응답.
	//@ 찬호는 내가 미화가 아니라 승균이 찾아갔다는걸 암.(찾아간게 찬호니까!)
	//@ (미화로부터는 볶음밥이 아니라 주소를 받음.)
	//@ 미화로부터의 거래는 1차적으로 끝.
	//@ 미화에게 요구한 볶음밥 세부 주문은 소멸...(볶음밥에 양파는 넣고, 당근과 소세지는 빼고, 밥 고슬고슬하게...)
	//@ 그러니까 승균이 입장에서는 난 주문받은거 없는데? 하고 null 보여줄 수밖에 없음!!
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10_re.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>

<div>
	<h2>리다이렉트</h2>
</div>

<div>
<!--@ 보충... -> 보충 완료! -->
	<p>이름 : <%=userName %></p>
</div>


</body>
</html>