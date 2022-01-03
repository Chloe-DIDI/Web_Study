<!-- MemberInsert -->

<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	// MemberInsert,jsp
	//-- 데이터 입력 처리 페이지
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	MemberDAO dao = null;
	
	try
	{
		dao = new MemberDAO();
		
		// MemberDTO 구성
		MemberDTO member = new MemberDTO();
		member.setName(userName);
		member.setTel(userTel);
		
		// dao 의 add() 메소드 호출 → insert 쿼리문 수행
		dao.add(member);
		
		//insert 액션의 정상 처리여부 확인 후 추가 코드
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
		try
		{
			dao.close();
		}	
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	
	// URL 주소가 기록되어 있는 쪽지를 사용자에게 전달
	// (여기를 찾아가렴~!!!)
	response.sendRedirect("MemberList.jsp");
%>