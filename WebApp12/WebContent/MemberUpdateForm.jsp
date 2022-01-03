<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(MemberSelect.jsp)로부터 데이터(sid) 수신
	
	String sid = request.getParameter("sid");
	String name = "";
	String tel = "";
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		//데이터베이스 연결
		dao.connection();
		
		MemberDTO member = dao.searchMember(sid);
		name = member.getName();
		tel = member.getTel();
		
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
<title>MemberUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">

	function memberSubmit()
	{
		// 확인
		//alert("함수 호출 확인");
		
		var memberForm = document.getElementById("memberForm");
		
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		if(uName.value == "")
		{
			nameMsg.style.display = "inline";
			uName.focus();
			return;
			//@ 함수 종료
		}
		
		// form 을 직접 지정하여 submit 액션 수행
		memberForm.submit();
		
	}
	
	function memberReset()
	{
		// 확인
		//alert("함수 호출 확인");
	
		var memberForm = document.getElementById("memberForm");
		var uName = document.getElementById("uName");		
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		// form 을 직접 지정하여 reset 액션 수행
		memberForm.reset();
		
		uName.focus();
		
	}
	
	
	
</script>

</head>
<body>

<div>
	<h1>회원 <span style="color: red;">명단</span> 관리
	      및 <span style="color: red;">수정</span> 페이지</h1>
	<hr>
</div>

<div>
	<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
</div>

<div>
	<!-- 회원 데이터 수정 폼 구성 -->
<!-- 	<form action="MemberUpdate.jsp" method="post" id="memberForm"> -->
	<form action="MemberUpdate.jsp?sid=<%=sid %>" method="post" id="memberForm">
<%-- 		<input type="hidden" value="<%=sid %>"> --%>
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="uName" name="uName"
					value="<%=name%>">
				</td>
				<td>
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="uTel" name="uTel"
					value="<%=tel%>">
				</td>
				<td>
				</td>
			</tr>
		</table>
		<br>
		<a href="javascript:memberSubmit()"><button type="button">수정하기</button></a>
		<a href="javascript:memberReset()"><button type="button">취소하기</button></a>
		<a href="MemberSelect.jsp"><button type="button">목록으로</button></a>
		
		<!--@ 찬호님 코드!  -->
		<%-- <input type="hidden" name="sid" value="<%=sid%>"> --%>
	</form>
</div>










</body>
</html>