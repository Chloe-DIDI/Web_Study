<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// Forward11_1.jsp
	
	// 이전 페이지(Send11.html)로부터 데이터(num1, num2, calResult) 수신
	
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String calResult = request.getParameter("calResult");
	
	String result= "";
	if(calResult.equals("1"))		// 더하기
		result = String.format("%d + %d = %d", num1, num2, (num1+num2));
	else if(calResult.equals("2"))	// 빼기
		result = String.format("%d - %d = %d", num1, num2, (num1-num2));
	else if(calResult.equals("3"))	// 곱하기
		result = String.format("%d * %d = %d", num1, num2, (num1*num2));
	else if(calResult.equals("2"))	// 빼기
		result = String.format("%d / %d = %.1f", num1, num2, (num1/(double)num2));	
	
	request.setAttribute("resultStr", result);
	
	//@ <jsp:forward page="Receive11.jsp"></jsp:forward> 요고 대신 사용!
	// check~!!!
	//@ 11이랑 비교해서 이거 두줄 있는 것! 아래 JSP 다 없어도 됨~!(삭제해버림) 자바 코드만 사용하면 됨
	RequestDispatcher dispatcher = request.getRequestDispatcher("Receive11.jsp");
	dispatcher.forward(request, response);
	
	
	/*-------------------------------------------------------------------------
	■■■ 『RequestDispatcher』 인터페이스 ■■■
	
	※ 이 인터페이스는 『forward()』와 『include()』 만 있다.
	//@ 서블릿에서 이거 사용한다면 99.9%가 forward() 사용하려고 쓰는 것....
	 
	※ 처리 과정 및 개념
	   
	   일반적으로 HttpServlet 을 상속받는 클래스... 서블릿
	    
	   이렇게 작성된 클래스 내부에는
	   실제 요청을 서비스하는 『doGet()』 과 『doPost()』 메소드가
	   정의되어 있으며 (service() 메소드가 이들의 상위 메소드)
	   
	   ServletContainer 는 『HttpServlet』의 인스턴스를 생성하고,
	   『init()』 메소드를 실행해 주고,
	   이 메소드에 의해 매핑된 URL에
	   (페이지 요청 방식에 따라) doGet() 과 doPost() 중 선택하여 메소드를 호출해주고(실행시켜주고),
	   Container 가 종료될 때 『destroy()』 메소드를 호출해 주고,
	   관련된 처리 과정이 마무리된다.
	   
	   즉, ServletContainer 가
	   init()    → 처음
	   service() → 중간중간 요청이 있을 때 마다
	   destroy() → 마지막
	   메소드를 호출한다.
	   (절대 우리가 직접 호출하는 것이 아니다~!!!)
	   
	   결국 『HttpServlet』은
	   하나의 인스턴스만 생성되어 멀티 스레딩으로 돌아가게 된다.
	   
	   이렇게 구성되는 『HttpServlet』의 상속된 클래스의 인스턴스는
	   스레드에 안전하게 설계(스레드 세이프티)되어야 하고
	   따라서 스레드에 안전하게 설계하지 않은 경우
	   상위 클래스를 마구 접근하게 되어 에러가 발생할 수 밖에 없다.
	   
	   이와 같은 이유로 환경 설정이나 J2EE 서비스에 관한 내용은
	   『ServletContext』 에서 할 수 있게 된다.
	   (※ ServletContext
			   : 서블릿에 대한 환경, 상태 등을 설정할 수 있는 객체)
	   이 『servletContext』 는 『getServletContext()』로만 받을 수 있다.
	   그렇기 때문에 이 『getServletContext()』는
	   동기화가 제대로 구현되어 있을 것이라고 예측할 수 있다.
	   그 이유는 멀티 스레드에 안전하게 설계(세이프티)되어 있어야
	   우리가 『ServletContext』 의 『setAttribute()』나 『getAttribute()』를
	   스레드 걱정 없이 마음대로 읽고 쓸 수 있기 때문이다.
	   
	   『ServletContext』의 또 다른 커다란 기능 중 하나는
	   다른 서블릿 인스턴스를 가져올 수 있다거나
	   서블릿 환경 설정값을 가져올 수 있는 기능이다.
	   
	   『RequestDispatcher』 역시 그 기능 중의 하나이다.
	   사전적인 의미로는... 요청을 제공하는 도구
	   즉, 요청을 보내주는 인터페이스이다.
	   
	   현재... 요청을 다른 서블릿(혹은 JSP)으로 보내야 하는 상황.
	   그런데, 위에 언급한 바와 같이 서블릿의 인스턴스는 하나만 생성되고
	   이것이 멀티 스레딩으로 돌아가고 있다.
	   
	   그렇기 때문에 새로운 서블릿을
	   그 서블릿을 실행하는 것만으로는 안되고
	   이미 돌아가고 있는 서블릿 인스턴스의 스레드를
	   하나 더 추가해야 한다.
	   이것은 서블릿 개발자가 처리해야 할 영역을 벗어났기 때문에
	   이 일은 『Dispatcher』가 대신 수행해 준다는 것이다.
	   
	   하지만, 이 『Dispatcher』는
	   『HttpServletRequest』, 『HttpServletResponse』 를
	   생성해 줄 수는 없다.
	   그렇기 때문에 『Dispatcher』가 생성해준 새로운 서블릿 스레드를
	   실행시키기 위해 『doGet()』이나 『doPost()』를 호출해야 한다.
	   
	   이와 같은 이유로
	   『dispatcher.forward(request, response);』 구문을 통해
	   request 와 response 를 넘겨주는 것이다.
	   
	-------------------------------------------------------------------------*/
/*@@@@@
	- 자동차 엔진 룸. 보닛... 여기 열면 어케 생겼는지 한번도 본적이 없음.
	- 그사람에게 엔진을 구성하는 주요부품이 어떻게 되었는지 설명하기 쉽지 않음
	- 우리는 때로는 차를 만들고, 차를 때로는 해체하고 해야 함
	- 꼭 알아야하는건 아니지만,,, 알고 한다면, 좀 더 폭넓은 시야를 가지고 개발 가능!
	- 어설프게 상상정도 하면 됨! 그러면 코어에 가까운 모듈 구성할때... 좀더 도움 될 것!
	- 지금은 듣고나서 툭툭 털어도 됨! 나중에 도움 될 거임~!!!
*/
	
	
%>
