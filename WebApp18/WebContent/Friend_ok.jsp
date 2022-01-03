<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ob" class="com.test.FriendDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!--  반복문 필요(다중 선택으로 넘어온 결과값을 출력하기 위한 처리) -->
<%
	String str = "";
    if(ob.getIdelType() != null)
    {
    	for(String temp : ob.getIdelType())
    		str += temp + " ";
    	
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>등록 수신결과 확인</h1>
</div>

<div>
	<!-- 내용 -->
	<h2>이름: <%=ob.getName() %></h2>
	<h2>나이 : <%=ob.getAge() %></h2>
	<h2>성별 : <%=ob.getGender() %></h2>
	<h2>이상형 : <%=str %></h2>
</div>


<%-- 
<div>
	<h2>작성된 내용 확인</h2>
	<h3>이름 : <%=ob.getName() %></h3>
	<h3>나이 : <% if(ob.getAge() == null)
				{
				%>
				<%= 0%>
			
				<%
				}
				else
				{
				%>
					<%=ob.getAge() %>
				<%
				}
				%>	
	</h3>
			
	<h3>성별 :  <% if(ob.getGender() == null)
				{
				%>
				<%= 0%>
			
				<%
				}
				else
				{
				%>
					<%=ob.getGender() %>
				<%
				}
				%>				
	
	</h3>
	<h3>이상형 : 
				<% for(String n : ob.getIdelType()) 
				{
				%>
					<%=n %>
				<%					
				}
				%>
				
	</h3>
</div>
 --%>


</body>
</html>