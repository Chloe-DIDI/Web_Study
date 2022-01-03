<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// Redirect12.jsp
	
	/*  
	// 내가 작성한 코드
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String calResult = request.getParameter("calResult");
	
	String result= "";
	if(calResult.equals("1"))
		result = String.format("%d plus %d = %d", num1, num2, (num1+num2)); //@-- 더하기표시가 안나옴....왜지,,,??
	if(calResult.equals("2"))
		result = String.format("%d - %d = %d", num1, num2, (num1-num2));
	if(calResult.equals("3"))
		result = String.format("%d * %d = %d", num1, num2, (num1*num2));
	if(calResult.equals("4"))
		result = String.format("%d / %d = %.1f", num1, num2, (num1/(double)num2));
	
	request.setAttribute("result", result);
	
	//response.sendRedirect("Receive12.jsp");
	response.sendRedirect("Receive12.jsp?resultStr=" + result);
	*/
	
	// 이전 페이지(Send12.html)로부터 데이터(num1, num2, calResult) 수신
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String op = request.getParameter("calResult");
	
	
	// 연산 처리
	String str = "";
	if(op.equals("1"))
		str += String.format("%d", (num1+num2));
	else if(op.equals("2"))
		str += String.format("%d", (num1-num2));
	else if(op.equals("3"))
		str += String.format("%d", (num1*num2));
	else if(op.equals("4"))
		str += String.format("%.1f", (num1/(double)num2));
	
	//@ 리다이렉트는...
	//@ 특정주소로 얘 전달해줄게 넌 가만히있어.. 가 아님!
	//@ 주소 줄테니 새롭게 네가 전달해!
	
	// check~!!!
	// 결과 데이터 재전송~!!! → sendRedirect() 메소드 사용
	// ※ response 객체의 주요 메소드 중 하나인
	//   『sendRedirect(String location)』
	//   : 지정된 URL(location)로 요청을 재전송한다.
	//@ 이렇게 안 한다면 넘겨받을수 없음 현재는! Receive12는 위 num1,2,op값 받지 않음
	//@ 김부장 찾아서, 암호를 뭘 대! 이거임... 내가 주소 줄테니, 이리로 가 니가 원하는 사람 찾을수있을 거.
	//@ 이사람이 이렇게 말하면 이렇게, 저렇게말하면 저렇게 말해! 그럼 어 알았어, 하고 해당 값들 넘겨줌
	response.sendRedirect("Receive12.jsp?num1="+num1+"&num2="+num2+"&op="+op+"&str="+str);
%>

<!--@ 이내용 필요 없음! 싹다 지워도 됨  -->
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html> -->
