<%@ page contentType="text/html; charset=UTF-8"%>

<%
	//스크립트 릿 영역 → 이전 페이지(Gudan.jsp)로 부터 데이터 수신
	//▼ 리퀘스트 인코딩
	//   이름에 한글이 들어가 있으면 이거 필수적으로 해야함!!
	request.setCharacterEncoding("UTF-8");
		
	// 데이터 수신
	String nameStr = request.getParameter("name"); //-- 텍스트박스로 단일값을 수신,,name 이라는 단일변수에 담김
	String genderStr = request.getParameter("gender"); //-- 라디오버튼으로 단일값 수신
	String majorStr = request.getParameter("major"); //-- 선택상자로 단일값 수신
	String[] hobbyArr = request.getParameterValues("hobby"); //--다중선택이 가능한 선택상자일 경우...『getParameterValues()』로 수신 → 배열 반환

	String gender = "";		// 이건왜 ""비어있는걸로 하는건지
	if(genderStr.equals("M"))
		gender="남자";
	else if(genderStr.equals("F"))
		gender="여자";
	else
		gender="확인불가";	//확인불가는 왜넣는건지
	
	String hobby = "";		
	if(hobbyArr != null)		//배열할때에는 null인지 아닌지 꼭!
								//why? 아무것도 선택안해도 넘길수 있기 때문에 
								// 	   그래서 선택을 했을 경우에만 넘어가게 만들어야 되기 때문에
	{
		for(String item : hobbyArr)
		{
			hobby += " [" + item + "]";
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect_ok.jsp</title>
<link rel="stylesheet" type="text/css" herf="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 03</h1>
	<hr>
	<p> RadioSelect_ok.jsp ○→ RadioSelect.jsp ● 
	
</div>

<div>
	<h2>radio, select 데이터 수신</h2>
		
	<div>
		<h3>수신한 데이터</h3>
		
		<!-- <p>이름 : 이윤서</p> -->
		<p>이름 : <%=nameStr %></p>
		 
		<!-- <p>성별 : F(여자)</p> -->
		<p>성별 : <%=genderStr %>(<%=gender %>)</p>
		
		<!-- <p>전공 : 국문학</p> -->
		<p>전공 : <%=majorStr %></p> 
		
		<!-- <p>취미 : [영화감상] [음악감상] </p> -->
		<p>취미 :<%=hobby %></p>
	</div>
</div>
</body>
</html>