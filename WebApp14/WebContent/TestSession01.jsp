<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String userName = (String)session.getAttribute("userName");	
	session.setMaxInactiveInterval(100);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">
	function sendIt()
	{	
		// 테스트 
		//alert("함수");
		
		
		var f = document.forms[0];
		//alert(f);
		
		if(!f.userName.value)
		{
			alert("이름 입력~!!");
			f.userName.focus();
			return;
		}
		
		if(!f.userTel.value)
		{
			alert("전화번호 입력~!!");
			f.userTel.focus();
			return;
		}
		
		f.submit();
		
	}
</script>

</head>
<body>

<!-- 
		○ TestSession01 에서 TestSession02 로
		   이름과 생일을 입력받아 전송
		   TestSession02 에서 TestSession03 으로
		   아이디와 패스워드를 입력받고
		   앞에서 전달받은 이름과 전화번호를 함께 전송
		   TestSession03 에서 전달받은 이름, 전화번호, 아이디, 패스워드 출력
		   
		   01→→→→→→→→→→→→ 02→→→→→→→→→→→→→→ 03
		   이름, 생일				  아이디, 패스워드			     이름, 전화번호, 아이디, 패스워드
		   입력						  입력							 출력
		   			- getParameter						- getAttribute
		   ※ 즉, 01 에서 02 로 넘겨줄 땐 getParameter
		      02 에서 03 으로 넘겨줄 땐 getParameter 와 getAttribute 로 세션 활용
		      01 에서 03 으로 넘겨줄 수 없기 때문에 세션에 저장
		      
		   ※ session 외에 hidden 태그를 이용한 정보 전달 가능
 -->

<div>
	<form action="TestSession02.jsp" method="post">
		<table class="table">
			<tr>
				<td>
					<th>이름</th>
				</td>
				<td>
					<input type="text" name="userName" size="10">
				</td>
			</tr>
			<tr>
				<td>
					<th>전화번호</th>
					<td>
						<input type="text" name="userTel" size="10">
					</td>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" onclick="sendIt()"
					style="width: 400px; height: 40px; font-size: 17pt;"
					>다음 페이지로 전송</button>
				</td>
				<td>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>