<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MyData"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
    request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// Test6.jsp
	//-- 사용자 정의 데이터타입을 취하는 자료구조 생성
	
	List<MyData> lists = new ArrayList<MyData>();
	
	MyData ob = new MyData("서승균", 15);
	lists.add(ob);
	
	ob = new MyData("김미화", 13);
	lists.add(ob);
	
	ob = new MyData("장진하", 8);
	lists.add(ob);
	
	ob = new MyData("윤유동", 11);
	lists.add(ob);
	
	ob = new MyData("김진령", 17);
	lists.add(ob);
	
	ob = new MyData("손범석", 85);
	lists.add(ob);
	
	request.setAttribute("lists", lists);	
%>

<jsp:forward page="Test6_result.jsp"></jsp:forward>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test6.jsp</title>
</head>
<body>

</body>
</html>