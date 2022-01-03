<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); String cp = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GetTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">
   .txtNum
   {
      width: 100px;
      text-align: right;
   }
   
   #result
   {
 		color : red;
 		font-weight: bold;  
   }
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	// ○ 『$.get(url, data, callBack)』
	//		- 매개변수로 전달받은 URL 을 사용하여 서버에 대한  GET 요청을 전송한다.
	
	$(function()
	{
		$("#sendButton").click(function()
		{
			// alert("함수 = 버튼 확인");
			
			var su1 = $("#su1").val();
			var su2 = $("#su2").val();
			var oper = $("#oper").val();
			
			//check~! {속성이름:속성값}
			$.get("GetTest01_ok.jsp"
		     	, {	 su1: su1
				,    su2:su2
				,    oper:oper
				  
				}, function(args)
				{
					$("#result").html(args);
				});
			//data → { 이름 : 값, 이름 : 값 ...}
				
			//$.get("GetTest01_ok.jsp", {su1:su1}, function(args){$("#result").html(args)});
			//$.get("요청 URL", {이름:속성값}, function(넘겨받은값){$(선택자).html(넘겨받은값)});
			
		
		});
	});
</script>
</head>
<body>

<div>
	<h1>jQuery의 get() 함수 활용 실습</h1>
	<hr>
</div>

<div>
   <input type="text" id="su1" class="txt txtNum">
   
   <select id="oper">
      <option value="add">덧셈</option>
      <option value="sub">뺄셈</option>
      <option value="mul">곱셈</option>
      <option value="div">나눗셈</option>
   </select>
   
   <input type="text" id="su2" class="txt txtNum">
   
   <input type="button" value=" = " id="sendButton" class="btn">
</div>
<br>

<!--      ▼ 이 result 가 위에 result -->
<div id="result">
</div>
<br>

<div>
   <input type="radio" name="rdo">rd1
   <input type="radio" name="rdo">rd2
</div>
<br>

<div>
   <input type="text">
</div>


</body>
</html>