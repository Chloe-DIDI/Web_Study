/*====================
  HelloReceive02.java
=====================*/

package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloReceive02 extends HttpServlet
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
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		/*
		 * // 서블릿 관련 코딩
		 * 
		 * request.setCharacterEncoding("UTF-8"); String firstName =
		 * request.getParameter("firstName"); String lastName =
		 * request.getParameter("lastName");
		 * 
		 * response.setContentType("text/html; charset=UTF-8");
		 * 
		 * PrintWriter out = response.getWriter();
		 * 
		 * String title = "최종 결과 수신 페이지"; String subTitle = "HelloReceive02.java";
		 * String docType = "<!DOCTYPE html>";
		 * 
		 * 
		 * out.print(docType + "\n" + "<html>\n" + "<head><title>" + title +
		 * "</title></head>\n" + "<body>\n" + "<div><h1>" + title + "</h1>" + "<h2>" +
		 * subTitle + "</h2><hr></div>\n" + "<div>\n" + "<ul>\n" +
		 * "<li><b>First Name : </b>" + firstName + "</li>\n" +
		 * "<li><b>Last Name : </b>" + lastName + "</li>\n" + "</ul>\n" + "</div>\n" +
		 * "</body>\n" + "</html>");
		 */
		
		// 서블릿 관련 코딩
		
				response.setContentType("text/html; charset=UTF-8");
				request.setCharacterEncoding("UTF-8");
				String firstName = request.getParameter("firstName"); 
				String lastName = request.getParameter("lastName");
				
				PrintWriter out = response.getWriter();
				String title = "결과 수신 페이지";
				String subTitle = "HelloReceive02.java";
				
				String docType = "<!DOCTYPE html>";
				
				out.print(docType + "\n"
						+ "<html>\n"
						+ "<head><title>" + title + "</title></head>\n"
				        + "<body>\n"
				        + "<div><h1>" + title + "</h1>"
				        + "<h2>" + subTitle + "</h2><hr></div>\n"
				        + "<div>\n"
				        + "<ul>\n"
				        + "<li><b>First Name : </b>" + firstName + "</li>\n"
				        + "<li><b>Last Name : </b>" + lastName + "</li>\n"
				        + "</ul>\n"
				        + "</div>\n"
				        + "</body>\n"
						+ "</html>");
	}
	
}