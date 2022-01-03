<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!-- //@ 넘어온 값으로 DTO 구성... 이걸 몽땅, dto로! 바꾼 속성 이름 없기 때무에 그대로.-->
<jsp:useBean id="dto" class="com.test.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
/* 	//@ 앞에거 보지 말고 해보기!
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	//@ 제목, 작성자, 이메일, 내용 수정하기
	
	// db close
	DBConn.close();
	
	//@ 수정한 페이지로 다시 이동
	response.sendRedirect("http://localhost:8090/WebApp20/Article.jsp?pageNum=1&num=678"); */
	
	//@ 이전 한단계 빼머금!^^ 다시 보기
	// 추가
	String pageNum = request.getParameter("pageNum");
	
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	//@ dao에 dto 넘겨줌
	int result = dao.updateData(dto);
	
	// result 값에 따른 분기 처리 가능
	
	//@ 여기 필요한게 다 있는지 Updated 가서 확인... 다 있지만, 게시물 번호 넘어오는 게 없음! -> Updated 가서 hidden 작성
	
	DBConn.close();
	
	response.sendRedirect(cp + "/List.jsp?num=" + dto.getNum() + "&pageNum=" + pageNum);
	
%>









