<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   
   // 자기 자신 페이지로부터 데이터 수신 후 처리하는 부분
   String numStr = request.getParameter("num");
   String yearStr = request.getParameter("year");
   String monthStr = request.getParameter("month");
   
   int num=0;
   
   try
   {
      num = Integer.parseInt(numStr);      
   }
   catch(Exception e)
   {
      System.out.println(e.toString());
   }   

   // Calender 객체 생성
   Calendar cal = Calendar.getInstance();
   
   // 현재 연, 월, 일 확인
   int nowYear = cal.get(Calendar.YEAR);
   int nowMonth = cal.get(Calendar.MONTH)+1;
   int nowDay = cal.get(Calendar.DAY_OF_MONTH);
   
   // 화면 구성
   // 1. 아무것도 안 건드린 경우 -> 지금 년도와 지금 날짜 나옴
   int selectYear = nowYear;
   int selectMonth = nowMonth;
   
   // 2. ◀▶ 건드린 경우
   if(yearStr != null || monthStr != null)
   {
      selectYear = Integer.parseInt(yearStr);
      selectMonth = Integer.parseInt(monthStr);
      selectMonth += num;
      
      if(selectMonth <=0)
      {
         selectYear--;
         selectMonth=12;
      }
      else if(selectMonth >= 13)
      {
         selectYear++;
         selectMonth=1;
      }
   }
   
   /*
   // 2-1) ◀ 사용하는 경우
    // 2-1-1) 월이 2~12월인 경우: 월에서 -1 하기
    // 2-1-2) 월이 1월인 경우: 년도에서 -1 후 12월 출력
   
   // 2-2) ▶ 사용하는 경우
    // 2-2-1) 월이 1~11월인 경우: 월에서 +1 하기
    // 2-2-2) 월이 12월인 경우: 년도에서 +1 후 1월 출력
    */
   
    
    
    
   //----------------------------- 
   // 만년달력 그리기!
   
   
   // 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산
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
   
   nalsu++;
   
   // 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산
   int week = nalsu%7;
   int lastDay = months[selectMonth-1];
   
   
   // 달력 그리기~!!!
   String calStr = "";
   calStr += "<table border='1'>";
   calStr += "<tr>";
   for (int i=0; i<weekNames.length; i++)
   {
      if(i==0)
         calStr += "<th style='color:red;'>" + weekNames[i] + "</th>";
      else if(i==6)
         calStr += "<th style='color:purple;'>" + weekNames[i] + "</th>";
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
      week++;
      
      //calStr += "<td>" + i + "</td>";
      if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0)
         calStr += "<td class='nowSat'>" + i + "</td>";
      if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1)
         calStr += "<td class='nowSun'>" + i + "</td>";
      else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay)
         calStr += "<td class='now'>" + i + "</td>";
      else if(week%7 == 0)
         calStr += "<td class='sat'>" + i + "</td>";
      else if(week%7 == 1)
         calStr += "<td class='sun'>" + i + "</td>";
      else
         calStr += "<td>" + i + "</td>";      
      
      
      if(week%7==0)
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
      calStr +="</tr>";

   calStr += "</table>";

%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
   td {text-align: right;}
   td.nowSat {background-color: orange; font-weight: bold; color: purple;}
   td.nowSun {backgroung-color: orange; font-weight: bold; color: red;}
   td.now {background-color: orange; font-weight: bold;}
   td.sat {color: purple;}
   td.sun {color: red;}
   a {text-decoration: none;}
</style>

<script type="text/javascript">

/*    function calenderRun(num)
   {
      alert("캘린더 함수 호출 확인");
      // 이거 누르면 .... 줄어들고 늘어나게....
      
      selectMonth += num;
      //submit..................
   } 
*/

   function callsubmit(obj)
   {
      obj.submit();
   }
   
</script>


</head>
<body>

<!-- 
   ○ 데이터 송수신 실습 08
      - 달력을 출력하는 JSP 페이지를 구성한다.
      - 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
      - 단, submit 버튼 없이 이벤트 처리를 한다.
      - 전송한 내용을 수신해서 출력해주는 형태의 단독 페이지로 구성한다.
      
      ◀ 2021년 10월 ▶
       
       ---------------------------
       ---------------------------
       
       - 『◀』 이나 『▶』 클릭 시
         해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
         //@ 2021년 12월에서 ▶ 누르면 2022년 1월로 가게...!
         //@ 2021년 1월에서  ◀ 누르면 2020년 12월로 가게...!
         //@ ◀▶ 그냥 링크로 잡기. a 태그로 잡으면 클릭 된다고 함
         
       - 사용자 최초 요청 주소는
         http://localhost:8090/WebApp07/SendAndReceive08.jsp 로 한다.
      
   ○ SendAndReceive08.jsp
   
      //@ 이거 다 한다면 2021년 10월을 텍스트 박스로도 바꿀수 있을 듯...
      //@ 이거 나중에 같이 안 풀고 파이널 팀원들 내에서 풀 것임!
      
 -->

<div>
   <h1>데이터 송수신 실습 08</h1>
   <hr>
</div>
<br>

<%-- <div>
   <form action="" method="post">
      <!-- <a onclick="calenderRun(-1)">◀</a> -->
      <!-- 2021년 10월 -->
      <%=selectYear %>년 <%=selectMonth %>월
      <a onclick="calenderRun(1)">▶</a>
   </form>
</div>
<br> --%>

<div>
   <form>
      <!-- ▒ 06 GET 방식과 POST 방식.txt -->
      <!-- <a href="http://URL?키=값&키=값"> -->
      <!-- 변수..안댐.. -->
      
      <a href="SendAndReceive08.jsp?num=-1&year=<%=selectYear %>&month=<%=selectMonth %>">◀️</a>
         <%=selectYear %>년 <%=selectMonth %>월
      <a href="SendAndReceive08.jsp?num=1&year=<%=selectYear %>&month=<%=selectMonth %>">▶️</a>
   </form>
</div>
<br>


<div>
   <!-- 달력을 그리게 될 지점 -->
   <%=calStr %>
   num(◀▶) : <%=num %>
</div>

</body>
</html>
