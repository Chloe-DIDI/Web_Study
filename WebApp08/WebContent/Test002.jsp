<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 결과값 변수
	String str = "";

	//데이터베이스 연결
	Connection conn = DBConn.getConnection();
	//                ▲ 희안하게 dbc라고해야지 추천뜨고 DBC라고하면 안뜸;;
	 
	//쿼리문 준비 (select)
	String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
	
	//작업 객체 생성 및 준비된 쿼리문 수행
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	str += "<table class='table'>";
	str += "<tr>";
	str += "<th id='numTitle'>번호</th>";
	str += "<th id='nameTitle'>이름</th>";	
	str += "<th id='telTitle'>전화번호</th>";
	str += "</tr>";
	
	while(rs.next())
	{
		str += "<tr>";
		str += "<td class='list'>" + rs.getString("SID") + "</td>";
		str += "<td class='list'>" + rs.getString("NAME") + "</td>";
		str += "<td class='list'>" + rs.getString("TEL") + "</td>";
		str += "</tr>";
	}
	
	str += "</table>";
	
	rs.close();
	stmt.close();
	DBConn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test002.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	#numTtile {width: 50px;}
	#nameTtile {width: 100px;}
	#telTtile {width: 160px}
	.list {text-align: center;}
	input {width: 200px;}
	button {width: 208px; height: 50px; font-weight: bold;}
	.errMsg{font-size:small; color:red; display: none;}
</style>
<script type="text/javascript">
	function formCheck()
	{
		// 확인
		//alert("함수호출확인");
		var uName = document.getElementById("userName");
		var nMsg = document.getElementById("nameMsg");
		
		nMsg.style.display = "none";
		
		if (uName.value == "")
		{
			nMsg.style.display = "inline";
			return false;
		}
		
		return true; 
		
	}
	
</script>
</head>
<body>
<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>

<div>
	<!-- 데이터 입력 _ 폼구성-->
	<form action="MemberInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>									  <!-- 누르면 formCheck 함수 호출 -->
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="userTel" name="userTel">
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<button type="submit" id="btnAdd" class="btn">데이터 추가</button>
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	
	<div>
		<!-- 처리 결과 -->
		<%=str %>
	</div>
	
</div>
</body>
</html>