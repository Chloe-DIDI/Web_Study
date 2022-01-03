<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%><%
	// AjaxTest03_ok.jsp

	String name = request.getParameter("name");
	String content = request.getParameter("content");

	response.setContentType("text/xml");
	
%><?xml version="1.0" encoding="UTF-8"?>
<root>
	<status>true</status>
	<records id="1">
		<title>${param.title }1</title>
		<content>${param.content }1</content>
	</records>
	<records id="2">
		<title>${param.title }1</title>
		<content>${param.content }1</content>
	</records>
</root>