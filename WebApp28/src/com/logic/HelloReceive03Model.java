package com.logic;



import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloReceive03Model
{

	public String actionCount(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	{
		String result = "";
		
		request.setCharacterEncoding("UTF-8");
		
		//◈ 이렇게 작성하면 HelloReceive03 여기에서 짝을 찾아야대
		// 파라미터를 이렇게 적으면 
		request.getParameter("firstName"); 
		request.getParameter("lastName");
		
		//▦ 이렇게 작성하면 HelloReceive03 여기에서
		/*
		 * String firstName = request.getParameter("firstName"); 
		 * String lastName = request.getParameter("lastName");
		 * 
		 * // 적재 이걸로 불러온다 앞에 잇는게이름이고 뒤는값 request.setAttribute("firstName", firstName);
		 * request.setAttribute("lastName", lastName);
		 */
		
		result = "WEB-INF/view/HelloReceive03.jsp";	
		
		
		return result;
	}

}