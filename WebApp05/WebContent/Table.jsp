<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table.jsp</title>
</head>
<body>


<div>
	<h1>JSP 데이터 송수신 실습 05</h1>
	<hr>
	<p>Table.jsp ● → Table_ok.jsp ○ </p>
</div>


<div>
	<form action="Table_ok.jsp" method="post">
		<table class="table">
			<tr>
				<th>가로</th>
				<td>
					<input type="text" name="su1" class="txt">
				</td>
			</tr>
			<tr>
				<th>세로</th>
				<td>
					<input type="text" name="su2" class="txt">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn control" 
					style="width: 400px">결과확인</button>
				</td>
			</tr>
		</table>
	</form>
</div>


</body>
</html>