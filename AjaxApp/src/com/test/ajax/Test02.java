/*====================
     Test02.java
=====================*/

package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test02 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		process(request, response);
	}
	
	// 사용자 정의 메소드
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 서블릿 관련 코딩
		
		// 데이터 수신
		int n1 = Integer.parseInt(request.getParameter("n1"));
		int n2 = Integer.parseInt(request.getParameter("n2"));
		
		// 로직 처리(연산 처리)
		int result = n1 + n2;
		
		// 반환할 결과값 준비
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test02OK.jsp");
		//@ 에이젝스 뷰. 컨트롤러 수행내용을 에이젝스에게 전달.... 이쪽가보면 원하는 데이터 만들어놨으니 가져가!
		//@ "Test02OK.jsp" 요게 뷰패이지.... Test02Ok: 에이젝스가 컨트롤한 뷰 페이지
		//@ 냉장고 앞에 붙여놓은 포스트잇.... "이거 꺼내 먹어!" 그게 뷰임!
		dispatcher.forward(request, response);
		
	}
}