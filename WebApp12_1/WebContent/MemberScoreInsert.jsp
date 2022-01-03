<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberScoreInsert.jsp
	
/* 	String sid = request.getParameter("sid");
	
	int kor = Integer.parseInt(request.getParameter("kor"));	
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	MemberScoreDAO dao = new MemberScoreDAO();

	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		MemberScoreDTO score = new MemberScoreDTO();
		score.setSid(sid);
		score.setKor(kor);
		score.setEng(eng);
		score.setMat(mat);
		
		dao.add(score);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터베이스 연결 종료
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	response.sendRedirect("MemberScoreSelect.jsp"); */
	
	// 이전 페이지로부터 데이터 수신
	String sid = request.getParameter("sid");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");

	// MemberScoreDAO 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();

	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// 수신된 데이터로 MemberScoreDTO 구성 → add() 메소드의 매개변수
		MemberScoreDTO score = new MemberScoreDTO();
		score.setSid(sid);
		score.setKor(Integer.parseInt(kor));
		score.setEng(Integer.parseInt(eng));
		score.setMat(Integer.parseInt(mat));
		
		// dao 의 add() 메소드 호출 → 데이터 입력(insert 수행)
		dao.add(score);
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터베이스 연결 종료
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 새로운 페이지 요청할 수 있도록 안내
	response.sendRedirect("MemberScoreSelect.jsp");
	
	//@@@ 이전 페이지에서 sid값 넘겨주도록 하기!
	//<form action="MemberScoreInsert.jsp?sid=<%=sid 
	//%
	//>" method="post" id="memberScoreForm"> -> MemberScoreInsertForm에서 이부분으로 넘겨받을 수 있음!
%>



