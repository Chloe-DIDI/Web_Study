<%@ page contentType="text/html; charset=UTF-8"%>
<%

	//○ 이전 페이지로(TestSession01.jsp)부터 데이터(userName, userTel) 수신
	
	//-- 한글 깨짐 방지처리
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	//추가~!!!
	session.setAttribute("userName", userName);
	session.setAttribute("userTel", userTel);
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">
	function sendIt()
	{
		var f = document.forms[0];
		
		if(!f.userId.value)
		{
			alert("아이디 입력~!!!");
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value)
		{
			alert("패스워드 입력~!!!");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
		
	}
</script>

</head>
<body>

<div>
	<h1>아이디와 패스워드(TestSession02.jsp)</h1>
	<hr>
</div>

<div>
	<form action="TestSession03.jsp" method="post">
		<table class="table">
			<tr>
				<td>
					<th>아이디</th>
				</td>
				<td>	
					<input type="text" name="userId" size="10">
				</td>
			</tr>
			<tr>
				<td>
					<th>패스워드</th>
				</td>
				<td>	
					<input type="text" name="userPwd" size="10">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" onclick="sendIt()"
					style="width: 400px; height: 40px; font-size: 17pt;"
					>다음 페이지로 전송</button>
				</td>
			</tr>
		</table>
	</form>
	
</div>

</body>
</html>