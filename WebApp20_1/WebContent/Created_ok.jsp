<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	// Created_ok.jsp
	
	// 이전 페이지로부터 데이터 수신 -> 위 부분에서 알아서 해 줌
	/*
	String subject = request.getParameter("subject");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	*/
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 게시물 현재 상태의 최대값 얻어오기
	int maxNum = dao.getMaxNum();
	
	// 게시물 번호 최대값에 1을 더해서 set 하는 과정 → dto 에 추가
	dto.setNum(maxNum+1);
	
	// IP Address 확인
	// → request.getRemoteAddr(); → 클라이언트(브라우저)의 IP Address 확인
	dto.setIpAddr(request.getRemoteAddr());
	
	dao.insertData(dto);
	//@ ctrl 누르고 누르면 해당 함수로 감
	
	//dao.insertData(dto);
	//@ 아이걸 두번씀 ㅠㅠㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
	
	DBConn.close();
	
	response.sendRedirect("List.jsp");
	
	//@ 뭘 작성할지 모르겠다면, 이전거 보기보다 한글로 쓰기... 그리고 같이 풀어볼때 맞춰보기
	//@ 여기 왠지 모르겠는데 exception 에러가 떴었음.... 확인해보기 dao.insertData(dto); 이거두번씀^^...
	//@ java.sql.SQLRecoverableException: 접속 종료 근데 이거뜨는데  ^^,,ㅠㅠ 확인해보기 -> 이제 안뜨는 거같기도?
%>

 <%-- 
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"></jsp:setProperty>

<%
   Connection conn = null;
   BoardDAO dao = null;
   

      // ○ 데이터 베이스 연결 및 DAO 객체 생성
      conn = DBConn.getConnection();
      dao = new BoardDAO(conn);
      
      // ○ DTO 객체에 값 추가 입력
      // maxNum 확인
      int maxNum = dao.getMaxNum();
      dto.setNum(maxNum + 1);
      
      // IP Address 확인
      // → request.getRemoteAddr(); → 클라이언트(브라우저)의 IP Address 확인
      String ipAddr = request.getRemoteAddr();
      dto.setIpAddr(ipAddr);
      
      // ○ DTO 객체 추가
      dao.insertData(dto);
      
  	DBConn.close();

   response.sendRedirect("List.jsp");
   
%> --%>