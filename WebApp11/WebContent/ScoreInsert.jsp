<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ScoreInsert.jsp
	// 이전 페이지로부터 데이터 수신
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("userName");
	String kor = request.getParameter("userKor");
	String eng = request.getParameter("userEng");
	String mat = request.getParameter("userMat");
	
	ScoreDAO dao = null;
	int result = 0;
	try
	{
		// 데이터베이스 연결
		dao = new ScoreDAO();
		
		ScoreDTO dto = new ScoreDTO();
		dto.setName(name);
		dto.setKor(kor);
		dto.setEng(eng);
		dto.setMat(mat);
		
		result = dao.add(dto);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 리다이렉팅
	response.sendRedirect("ScoreList.jsp");
	
%>