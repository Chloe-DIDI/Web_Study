<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">
	function sendIt()
	{
		var f = document.myForm;
		
		if(!f.name.value)
		{
			alert("이름 쫌~!!!");	
			f.name.focus();
			return;
		}
		
		f.submit();
	}
</script>

</head>
<body>

<div>
	<h1>데이터 입력</h1>
	<hr>
</div>

<!-- FriendDTO.java -->
<!-- Friend_ok.jsp -->

<div>
	<form action="Friend_ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" class="txt" name="name">
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="text" class="txt" name="age">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label>
						<input type="radio" name="gender" id="male" value="남자">
						남자
					</label>
					<label>
						<input type="radio" name="gender" id="male" value="여자">
						여자
					</label>
				</td>
			</tr>
			<tr>
				<th>이상형</th>
				<td>
					<label>
						<input type="checkbox" name="idelType" id="t1" value="권현빈">
						권현빈
					</label>
					<label>
						<input type="checkbox" name="idelType" id="t2" value="서강준">
						서강준
					</label>
					<label>
						<input type="checkbox" name="idelType" id="t3" value="송지효">
						송지효
					</label>
					<label>
						<input type="checkbox" name="idelType" id="t4" value="조인성">
						조인성
					</label>
					<label>
						<input type="checkbox" name="idelType" id="t5" value="강동원">
						강동원
					</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="sendIt()" class="btn"
					style="width: 100%; font-size: 16pt;">
					입력
					</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>