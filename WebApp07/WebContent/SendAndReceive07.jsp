<%-- 
// 내가 작성한 코드
<%@page import="java.util.Calendar"%> --%>

<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%-- 
// 내가 작성한 코드
<%
	
	Calendar rightNow = Calendar.getInstance();
	int y = rightNow.get(Calendar.YEAR);
%> --%>
<%
	// 자기 자신 페이지로부터 데이터 수신 후 처리하는 부분
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	// Calendar 객체 생성
	//java.util.Calendar cal = java.util.Calendar.getInstance();
	Calendar cal = Calendar.getInstance();
	
	// 현재 년, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);			//-- 2021
	int nowMonth = cal.get(Calendar.MONTH)+1;		//-- 10
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);	//-- 21
	
	// 표시할 달력의 년, 월 구성 → 페이지 최초 요청을 감안한 코드
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	// 페이지 최초 요청이 아닐 경우
	// → Line 5~6 에서 수신한 데이터로 표시할 달력의 년, 월 구성
	if (sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	// 확인한 날짜로 년도 select option 구성 -------------------------
	//<option value="2011">2011</option>
	//<option value="2012">2012</option>
	//<option value="2013">2013</option>
	//				  :
	//<option value="2021" selected="selected">2021</option>
	//				  :
	//<option value="2029">2029</option>
	//<option value="2030">2030</option>
	//<option value="2031">2031</option>
	
	
	//@ 선택한 년도 기준으로 위 10개, 아래 10개 볼수 있도록... 옵션 계속 바뀔수 있도록!
	//@ 그러니까 nowYear이 아니라 selectYear인 것
	String yOptions = "";
	for (int year=(selectYear-10); year<=(selectYear+10); year++)
	{	
		// 관찰1.
		//yOptions += "<option value='" + year + "'>" + year + "</option>";
		
		// 관찰2.
		//if(year == nowYear)
		//	yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		//else
		//	yOptions += "<option value='" + year + "'>" + year + "</option>";
		
		// 상황1. 페이지 최초 요청 → sYear 는 null / 현재 년도와 옵션이 같을 때 → selected (○)
		// 상황2. 페이지 최초 요청이 아닐 때 → sYear 는 null 아님 / 선택된 년도와 옵션이 같을 때 → selected (○)
		// 상황3. 나머지 → selected (Ⅹ)
		
		//@ 처음에는 2021 선택되어 있어야 함(selected). 하지만, 계속 2021 선택되어있기만 하면 안됨!
		//@ 그니까 상황 분기가 3개로 나누어짐...
		if(sYear==null && year==nowYear)
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		else if(sYear!=null && Integer.parseInt(sYear)==year)
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		else
			yOptions += "<option value='" + year + "'>" + year + "</option>";
		//@ 홑따옴표 위치 주의! ""를 넣으려고 양쪽에 '' 넣은 것....
	}
	
	// ------------------------ 확인한 날짜로 년도 select option 구성
	
	// 확인한 날짜로 월 select option 구성 ---------------------------------
	//<option value="1">1</option>
	//<option value="2">2</option>
	//<option value="3">3</option>
	//            :
	//<option value="10" selected="selected">10</option>
	//<option value="11">11</option>
	//<option value="12">12</option>
	
	String mOptions = "";
	for (int month=1; month<=12; month++)
	{
		// 상황1. 페이지 최초 요청 → sMonth 는 null / 현재 월과 옵션값이 같을 때 → selected (○)
		// 상황2. 페이지 최초 요청 아닐 때 → sMonth 는 null 아님 / 선택된 월과 옵션값이 같을 때 → selected (○)
		// 상황3. 나머지 → selected (Ⅹ)
		if(sMonth==null && month==nowMonth)
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		else if(sMonth!=null && Integer.parseInt(sMonth)==month)
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		else
			mOptions += "<option value='" + month + "'>" + month + "</option>";
	}
	
	// ----------------------------------- 확인한 날짜로 월 select option 구성
	
	// 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산
	// (만년달력)
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	if (selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
		months[1] = 29;
	
	// 총 날 수 누적 변수
	int nalsu;
	
	// 요일 항목 배열 구성
	String[] weekNames = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	// 현재 년도 → 입력받은 년도의 이전 년도까지의 날 수 계산
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 현재 월 → 입력받은 월의 이전 월까지의 날 수 추가
	for (int i=0; i<selectMonth-1; i++)
		nalsu += months[i];
	
	nalsu++;	// +1
	// ----------- 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산
	
	int week = nalsu%7;						//-- 요일 변수
	int lastDay = months[selectMonth-1];	//-- 마지막 날짜 변수
	
	
	// 달력 그리기 ---------------------------------------------------------
	String calStr = "";
	calStr += "<table border='1'>";
	calStr += "<tr>";
	for (int i=0; i<weekNames.length; i++)
	{
		if(i==0)
			calStr += "<th style='color:red;'>" + weekNames[i] + "</th>";
		else if(i==6)
			calStr += "<th style='color:blue;'>" + weekNames[i] + "</th>";
		else
			calStr += "<th>" + weekNames[i] + "</th>";
	}
	calStr += "</tr>";
	
	calStr += "<tr>";
	
	// 빈 칸 공백 td 발생
	for(int i=1; i<=week; i++)
	{
		calStr += "<td></td>";
	}
	
	// 날짜 td 발생
	for(int i=1; i<=lastDay; i++)
	{
		week++;		//-- 날짜 구성이 이루어질 때 마다 요일 1씩 증가
		
		//calStr += "<td>" + i + "</td>";
		
		if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0)
			calStr += "<td class='nowSat'>" + i + "</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1)
			calStr += "<td class='nowSun'>" + i + "</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay)
			calStr += "<td class='now'>" + i + "</td>";
		else if(week%7==0)
			calStr += "<td class='sat'>" + i + "</td>";
		else if(week%7==1)
			calStr += "<td class='sun'>" + i + "</td>";
		else
			calStr += "<td>" + i + "</td>";
		
		if (week%7==0)
			calStr += "</tr><tr>";
	}
	
	// 빈 칸 공백 td 발생
	for(int i=0; i<=week; i++, week++)
	{
		if(week%7==0)
			break;
		
		calStr += "<td></td>";
	}
	
	if(week%7!=0)
		calStr += "</tr>";
	
	calStr += "</table>";
	// ------------------------------------------------------- 달력 그리기
	//@ 스트링빌더, 스트링버퍼 사용해서 쓰는게 줄이는 거...
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	td {text-align: right;}
	td.nowSat {background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun {backgroung-color: aqua; font-weight: bold; color: red;}
	td.now {background-color: aqua; font-weight: bold;}
	td.sat {color: blue;}
	td.sun {color: red;}
</style>

<script type="text/javascript">
/* 
	function formChange(obj)
	{
		obj.submit();
	}
	
	
	var yearStr = documentgetElementById("year").value;
	var monthStr = documentgetElementById("month").value;
	
	var year = parseInt(yearStr);
	var month = parseInt(monthStr);
	
	if (year < 1 || month < 1 || month > 12)
	{
		alert("입력한 년 또는 월이 유효하지 않습니다.");
		return;
	}
	
	var total = 0;
	
	total = (year-1)*365 + parseInt((year-1)/4) - parseInt((year-1)/100) + parseInt((year-1)/400);
	
	var m = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	for (var i=0; i<month-1; i++)
	{
		total += m[i];
	}
	total++;
	
	if (month >=3 && (year%4==0 && year%100!=0 || year%400==0))
	{
		total++;
	}
	
	var lastDay = m[month-1];
		
		if (month==2 && (year%4==0 && year%100!=0 || year%400==0))
		{
			lastDay = 29;
		}	
 */
 
 	function formCalendar(obj)
	{
		obj.submit();	
	}
 
</script>

<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 07
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	   - 연도 구성은 현재 년도를 기준으로 이전 10년, 이후 10년으로 구성한다.
	   //@ 캘린더 클래스도 쓰고, 만년달력도 쓰고... 섞어서 써보면 됨
	   
	   - 월 구성은 1월 부터 12월 까지로 구성한다.
	   
	   [ 2021 ▼ ] 년 [  10 ▼ ] 월
	   
	   ------------------------
	   ------------------------
	   
	   - 연도 select 나 월 select 의 내용 변화 시
	     해당 연 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	    
	   - 사용자 최초 요청 주소는 
	     http://localhost:8090/WebApp07/SendAndReceive07.jsp 로 한다.
	     
	  ○ SendAndReceive07.jsp
 -->



<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>
<br>

<%-- 
// 내가 작성한 코드
<div>
	<form method="post">
		<select id="year" name="year">
		<option>==년도==</option>
		<option value="0"><%=y %></option>
		<!--@ 여기서 어떻게 이전 10년, 이후 10년을 보여주지.....???  -->
		</select>년 
		
		<select id="month" name="month" onchange="formChange(this.form)">
			<option>==월==</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
		</select>월
	</form>
</div>
<div>
	<h2>수신된 데이터, 올해는: <%=y %>년</h2>
</div>
 --%>

<div>
	<!-- form 의 action 속성 값 생략 → 요청 페이지 / 데이터의 수신처는 자기 자신 -->
	<form action="" method="post">
		<select id="year" name="year" onchange="formCalendar(this.form)">
			<!-- <option>2021</option> -->
			<!-- @ 요기 수정... -> 수정 완료-->
			<%= yOptions %>
		</select> 년
		<select id="month" name="month" onchange="formCalendar(this.form)">
			<!-- <option>10</option> -->
			<%=mOptions %>
		</select> 월
	</form>
</div>
<br>

<div>
	<!-- 달력을 그리게 될 지점 -->
	<%=calStr %>
</div>


</body>
</html>