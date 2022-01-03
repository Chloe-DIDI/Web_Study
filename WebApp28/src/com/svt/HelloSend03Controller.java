package com.svt;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloSend03Controller extends HttpServlet
{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 서블릿 관련 코딩
		
		
		
		// ▶ 여기서 WEB-INF/view/HelloSend03.html 여기에 있는걸로 요청 응답오게한다`!
		// dispatcher.forward(request, response);
		//					  -----------------
		//						여기 있는거 주고 받아온다.
		// HelloSend03.html 로 간다 ~ !!!!
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/HelloSend03.html");
		dispatcher.forward(request, response);
				
	}
	
	
}