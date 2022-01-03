<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Logout.jsp
	
	session.removeAttribute("userId");
	session.removeAttribute("userPwd");
	session.removeAttribute("usreName");
	//-- 세션의 사용자 아이디와 패스워드와 이름 삭제
	
	session.invalidate();
	//-- 기존 세션에 저장되어 있는 모든 항목을 제거하고 세션을 초기화.
	
	// 로그인 페이지 다시 요청할 수 있도록 안내
	response.sendRedirect("TestSession01.jsp");
%>