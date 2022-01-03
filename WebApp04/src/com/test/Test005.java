/*=======================
 	 Test005.java
 	 - Servlet 실습
 =======================*/

package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test005 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// get 방식의 요청에 대해 호출되어 실행되는 메소드
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// post 방식의 요청에 대해 호출되어 실행되는 메소드
		doGetPost(request, response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	{
		// get 방식의 요청이든 post 방식의 요청이든
		// 모두 처리할 수 있는 사용자 정의 메소드
		
		// request → 요청 객체 → 클라이언트로부터 서버로..
		// request 객체에 대한 세팅 → 인코딩 방식 → 한글 깨짐 방지 처리
		request.setCharacterEncoding("UTF-8");
		
		String Id = request.getParameter("userId");
		String Pwd = request.getParameter("userPwd");
		
		// response → 응답 객체 → 서버로부터 클라이언트로..
		response.setContentType("text/html; charset=UTF-8");
		
		String str = "아이디 : " + Id + ", 패스워드 : " + Pwd;
		
		// 응답을 출력 스트림으로 구성하기 위한 준비
		PrintWriter out = response.getWriter();
		
		// 출력 스트림을 활용해서 페이지 랜더
		out.print("<html>");
		out.print("<head>");
		out.print("<title>");
		out.print("Test005.java");
		out.print("</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<div>");
		out.print("<h1>");
		out.print("서블릿 관련 실습");
		out.print("</h1>");
		out.print("<hr>");
		out.print("</div>");
		out.print("<div>");
		out.print("<h2>");
		out.print("HttpServlet 클래스를 활용한 서블릿 테스트");
		out.print("</h2>");
		out.print("<p>" + str + "</p>");
		out.print("<p>" + "method : " + request.getMethod() + "</p>");
		out.print("<p>");
		out.print("클라이언트 IP Address : " + request.getRemoteAddr());
		out.print("</p>");
		out.print("<p>" + "URI : " + request.getRequestURI() + "</p>");
		out.print("</div>");
		out.print("</body>");
		out.print("</html>");
		
	}
}