
<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신(MemberScoreSelect.jsp) 로 부터 데이터(sid) 수신
	String sid = request.getParameter("sid");
	String name = "";
	
	int kor = 0;
	int eng = 0;
	int mat = 0;
		
	// name 을 조회하기 위해 dao 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		// 수신한 sid 를 통해 name 및 각 과목 점수 얻어내기
		MemberScoreDTO score = dao.search(sid);
		name = score.getName();
		kor = score.getKor();
		eng = score.getEng();
		mat = score.getMat();
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">


<script type="text/javascript">
	
	// memberScoreSubmit
	function memberScoreSubmit()
	{
		var memberScoreForm = document.getElementById("memberScoreForm");
		
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if (kor.value=="" || isNaN(kor.value) || Number(kor.value) <0 || Number(kor.value) >100)
		{
			korMsg.style.display = "inline";
			kor.focus();
			return;
		}
		
		if (eng.value=="" || isNaN(eng.value) || Number(eng.value) <0 || Number(eng.value) >100)
		{
			engMsg.style.display = "inline";
			eng.focus();
			return;
		}
		
		if (mat.value=="" || isNaN(mat.value) || Number(mat.value) <0 || Number(mat.value) >100)
		{
			matMsg.style.display = "inline";
			mat.focus();
			return;
		}
		
		// form 을 직접 지정하여 submit 액션 수행
		memberScoreForm.submit();	
		
	}// end memberScoreSubmit()
	
	
	// memberScoreReset
	function memberScoreReset()
	{
		var memberScoreForm = document.getElementById("memberScoreForm");
		
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		// form 을 직접 지정하여 reset 액션 수행
		memberScoreForm.reset();
		kor.focus();
	
	}// end memberScoreReset
	
	
</script>


</head>
<body>

<!-- http://localhost:8090/WebApp12/MemberScoreInsertForm.jsp -->
<div>
	<h1>회원 <span style="color: red;">성적</span> 관리
	      및 <span style="color: pink;">수정</span> 페이지</h1>
	<hr>
</div>

<div>
	<a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
	<br><br>
</div>

<br>

<div>
	<!-- 회원 성적 데이터 수정 폼 구성  -->	
				    <!-- MemberScoreUpdate	-------->
	<form action="MemberScoreUpdate.jsp?sid=<%=sid %>" method="post" id="memberScoreForm">
		<table class= "table">
			<tr>
				<th>번호</th>	<!-- 입력하는 값 Ｘ  받아와야하는 값 ○ -->
				<td>
					<%=sid %>
				</td>
				<td></td>
			</tr>
			<tr>
				<th>이름</th> 	<!-- 입력하는 값 Ｘ  받아와야하는 값 ○ -->
				<td>
					<%=name %>
				</td>
				<td></td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="kor" name="kor" class="txtScore"
					value="<%=kor %>">
				</td>
				<td>
					<span class="errMsg" id="korMsg">
						0 ~ 100 사이의 국어 점수를 입력해야 합니다.
					</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="eng" name="eng" class="txtScore"
					value="<%=eng %>">
				</td>
				<td>
					<span class="errMsg" id="engMsg">
						0 ~ 100 사이의 영어 점수를 입력해야 합니다.
					</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="mat" name="mat" class="txtScore"
					value="<%=mat %>">
				</td>
				<td>
					<span class="errMsg" id="matMsg">
						0 ~ 100 사이의 수학 점수를 입력해야 합니다.
					</span>
				</td>
			</tr>
		</table>
		<br>
		<a href="javascript:memberScoreSubmit()"><button type="button">수정하기</button></a>
		<a href="javascript:memberScoreReset()"><button type="button">취소하기</button></a>
		<a href="MemberScoreSelect.jsp"><button type="button">목록으로</button></a>
	</form>
</div>

</body>
</html>