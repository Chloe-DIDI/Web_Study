<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Testsession01_ok.jsp 페이지에서 되돌려 보내면서
	// session 의 userId 에 superman 을, userName 에 이찬호를 
	// 담아서 보낸 상황
	String userId = (String)session.getAttribute("userId");
	String userName = (String)session.getAttribute("userName");
	//-- 『session.getAttribute("userId");』는 
	//	 Object 타입을 반환하므로
	//   String 타입으로 변환하는 과정 필요
	
	// 추가 ~ !!!
	// 세션 시간 변경 ---------------------------------------------
	
	// ※ 세션 기본 시간은 1800초.
	
	session.setMaxInactiveInterval(20);
	//-- 세션이 유지되는 시간을 20초로 변경하여 설정한 상태
	//   이로 인해...
	//   로그인 후 20초 뒤에 새로고침하면 로그아웃 처리된 것을 확인.
	
	// ----------------------------------------------- 세션 시간 변경
	
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">
	function sendIt()
	{
		//확인
		//alert("함수 호출 확인");
		
		// 새로운 방식으로 풀이 ◀ 강사님이 잘 보라고 함~!
		//@ document 의 name	------------------
		//@ f = form 객체					     ↓
		var f = document.myForm;
						//------ 네임 → 도큐먼트에 네임 부여한 것
		//alert(f);
		
		//@ userId = name
		//@ userId.value = name 의 value
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
	<h1>세션 처리 - 로그인</h1>
	<hr>
</div>

<div>
		<table>
		<tr>
			<td>
			
			
				<%
				if(userId==null)
				{
				%>
				<form action="TestSession01_ok.jsp" method="post" name="myForm">
					<table>
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" name="userId"
								class="txt" style="width: 150px;">
							</td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td>
								<!-- <input type="password"> -->
								<input type="text" name="userPwd"
								class="txt" style="width: 150px;">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" class="btn"
								style="width: 100%;"
								onclick="sendIt()">로그인</button>
							</td>
						</tr>
					</table>
				</form>
				<%
				}
				else
				{
				%>
				
				<h2><%=userName %>(<%=userId %>)님 환영합니다.</h2>
				<h2>이제, 일정관리와 친구관리 서비스를 이용할 수 있습니다.</h2>
				<br>
				<p>
					<a href="Logout.jsp">
						<button type="button" class="btnMenu btn01" 
						style="width: 200px;">로그아웃</button>
					</a>
				</p>

				
				<%
				}
				%>
				
			</td>
		</tr>
	</table>
	
</div>


</body>
