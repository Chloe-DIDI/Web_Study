<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); String cp = request.getContextPath();%>
<%
	//GetTest03_ok.jsp
	
	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
	String oper = request.getParameter("oper");
	
	String result="";
	
	if(oper.equals("add"))
		result = String.format("%d + %d = %d", su1, su2, (su1+su2));
	else if(oper.equals("sub"))
		result = String.format("%d - %d = %d", su1, su2, (su1-su2));
	else if(oper.equals("mul"))
		result = String.format("%d * %d = %d", su1, su2, (su1*su2));
	else if(oper.equals("div"))
		result = String.format("%d / %d = %2.f", su1, su2, ((double)su1/su2));
%>
<!-- 연산이 어떻게 처리됬든지 ▼ ajax 방식으로 한다면 이것만 적으면 된다 -->
<%=result%>