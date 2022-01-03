<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
	// JsonTest02_ok.jsp
	
	 String name = request.getParameter("name");
   String content = request.getParameter("content");
   
   // 반환해 줄 쿼리 스트링
   String result = "";

	
	// JSON 데이터(→ 배열 형태로 구성)
	// [{"이름1":"값1", "이름2":"값2", "이름3":"값3"}, {"이름1":"값1", "이름2":"값2", "이름3":"값3"}]
	
	// {"num":"1","name":"최현정","content":"내용"},  
	// {"num":"2","name":"최현정","content":"내용"},  
	// {"num":"3","name":"최현정","content":"내용"},  
	// {"num":"4","name":"최현정","content":"내용"},  
	// {"num":"5","name":"최현정","content":"내용"}

	//					  ↓
	
	// [{"num":"1","name":"최현정","content":"내용"}  
	//  {"num":"2","name":"최현정","content":"내용"},  
	//  {"num":"3","name":"최현정","content":"내용"},  
	//  {"num":"4","name":"최현정","content":"내용"},  
	//  {"num":"5","name":"최현정","content":"내용"},]
	
	//					  ↓
	
	// [{"num":"1","name":"최현정","content":"내용"},  
	//  {"num":"2","name":"최현정","content":"내용"},  
	//  {"num":"3","name":"최현정","content":"내용"},  
	//  {"num":"4","name":"최현정","content":"내용"},  
	//  {"num":"5","name":"최현정","content":"내용"}]
			
	
	for (int n=1; n<=5; n++)   // 1 2 3 4 5
   {
      StringBuffer sb = new StringBuffer();
      
      // JsonTest01_ok.jsp 의 내용 복사&붙여넣기
      sb.append("{\"num\":\"" + n + "\"");
      sb.append(",\"name\":\"" + name + "\"");
      sb.append(",\"content\":\"" + content + "\"}, ");   // 『, 』 붙여주기
      
      result += sb.toString();
   }
   
   // 마지막 『, 』 탈락(콤마, 공백)
   result = result.substring(0, result.length()-2);
   
   // 배열 형태로 만들어진 JSON
   result = "[" + result + "]";
   
   
   out.println(result);

	
%>