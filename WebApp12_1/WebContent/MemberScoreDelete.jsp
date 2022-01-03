<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberScoreDelete.jsp
	// 데이터 수신(MemberScoreSelect 로 부터...) → sid
	String sid = request.getParameter("sid");
	
	// MemberScoreDAO 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		//리무브메소드 호출하며 sid 삭제하면 끝~!!!!
		dao.remove(sid);
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
	// 변경된 URL을 다시 요청할 수 있도록 안내
	response.sendRedirect("MemberScoreSelect.jsp");
%>









