<%@page import="com.test.MemberDAO"%>
<%@page import="com.test.MemberDTO"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberDAO dao = new MemberDAO();
/* 	
	try
	{
		dao.connection();
		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th><th>전화번호</th><th>회원관리</th>");
		
		for(MemberDTO member : dao.lists())
		{
			str.append("<tr>");
			//str.append("<td class='record'>" + score.getSid() + "</td>");
			str.append("<td class='record'>" + member.getSid() + "</td>");
			str.append("<td class='record'>" + member.getName() + "</td>");
			str.append("<td class='record'>" + member.getTel() + "</td>");
			str.append("</tr>");
		}
		
		str.append("</table>");
		
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
	} */
	
		try
	   {
	      dao.connection();
	      
	      //memberCount += dao.count() + "명</p>";
	      
	      str.append("<div>");
	      str.append("<table class='table'>");
	      str.append("<tr>");
	      str.append("<th style='width: 50px;'>번호</th>");
	      str.append("<th style='width: 100px;'>이름</th>");
	      str.append("<th style='width: 150px;'>전화번호</th>");
	      str.append("<th style='width: 200px;'>회원관리</th>");
	      str.append("</tr>");
	   
	      for( MemberDTO member : dao.lists())
	      {
	         str.append("<tr>");
	         str.append("<td>"+ member.getSid() + "</td>");
	         str.append("<td>"+ member.getName() + "</td>");
	         str.append("<td>"+ member.getTel() + "</td>");
	         str.append("<td>");
	         str.append("<a href='MemberUpdateForm.jsp?sid=" + member.getSid() + "'>");
	         str.append("<button type='button' class='btn01'>수정</button></a>");
             str.append("<a href='javascript:memberDelete("+member.getSid()+", \"" +member.getName()+"\")'>");
             str.append("<button type='button' class='btn01'>삭제</button></a>");
	         str.append("</td>");
	         str.append("</tr>");
	      }
	      
	      str.append("</table>");
	      str.append("</div>");
	      
	   }
	   catch(Exception e)
	   {
	      System.out.println(e.toString());
	   }
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberSelect.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">
	function memberDelete(sid, name)
	{
	   var res = confirm("번호 : " + sid + ", 이름 : " + name + "\n이 회원의 정보를 삭제하시겠습니까?");
	   
	   //alert(res);
	   //-- confirm 창은 true(확인) 또는 flase(취소)를 반환
	   
	   if (res)
		   	  window.location.href="MemberDelete.jsp?sid=" + sid;	  
	}
</script>
</head>
<body>

<div>
	<h1>회원 <span style="color: red;">명단</span> 관리 및 출력 페이지</h1>
	<hr>
</div>

<div>
	<a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
	<a href="MemberInsertForm.jsp"><button type="button">신규 회원 등록</button></a>
</div>

<div>
	<!-- 리스트 출력 -->
<!--  <table class="table">
		<tr>
			<th style="width: 50px;">번호</th>
			<th style="width: 100px;">이름</th>
			<th style="width: 150px;">전화번호</th>
			<th style="width: 200px;">회원관리</th>
		</tr>
		<tr>
			<td>1</td>
			<td>둘리</td>
			<td>010-1111-1111</td>
			<td>
				<a><button type="button" class="btn01">수정</button></a>
				<a><button type="button" class="btn02">삭제</button></a>
			</td>
		</tr>
		<tr>
			<td>2</td>
			<td>또치</td>
			<td>010-1212-3434</td>
			<td>
				<a><button type="button" class="btn01">수정</button></a>
				<a><button type="button" class="btn02">삭제</button></a>
			</td>
		</tr>
	</table>  -->
	<%=str.toString() %>
</div>


</body>
</html>