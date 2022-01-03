<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   //결과값 변수
   String str = "";
   
   //데이터 베이스 연결
   Connection conn = DBConn.getConnection();

   //쿼리문 준비 (select)
   String sql = "SELECT SID,NAME,KOR,ENG,MAT"
            + ", (KOR+ENG+MAT) AS TOT"
            + ", (KOR+ENG+MAT)/3 AS AVG"
            + " FROM TBL_SCORE ORDER BY SID";
   
   //작업객체 생성 및 준비된 쿼리문 생성
   Statement stmt = conn.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
   
   //결과 ResultSet에 대한 처리 -> 반복문 구성
   str += "<table class='table'>";
   str += "<tr>";
   str += "<th>번호</th>";
   str += "<th>이름</th>";
   str += "<th>국어점수</th>";
   str += "<th>수학점수</th>";
   str += "<th>영어점수</th>";
   str += "<th>총점</th>";
   str += "<th>평균</th>";
   str += "</tr>";
   
   while(rs.next())
   {
      str += "<tr>";
      str += "<td>" + rs.getString("SID") + "</td>";
      str += "<td>" + rs.getString("NAME") + "</td>";
      str += "<td class='txtNum'>" + rs.getString("KOR") + "</td>";
      str += "<td class='txtNum'>" + rs.getString("ENG") + "</td>";
      str += "<td class='txtNum'>" + rs.getString("MAT") + "</td>";
      str += "<td class='txtNum'>" + rs.getString("TOT") + "</td>";
      str += "<td class='txtNum'>" + String.format("%.1f", rs.getDouble("AVG")) + "</td>";
      str += "</tr>";   
   }
   
   str += "</table>";
   
   rs.close();
   stmt.close();
   DBConn.close();
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
   .txtNum {text-align: right;}
   .errMsg {font-size: small; color: red; display: none;}
   
</style>
<script type="text/javascript">
   function formcheck()
   {
      //확인 
      //alert("함수 호출 확인");
      
      var uName = document.getElementById("userName");
      var uKor = document.getElementById("ScoreKor");
      var uEng = document.getElementById("ScoreEng");
      var uMat = document.getElementById("ScoreMat");
      
      var nameMsg = document.getElementById("nameMsg");
      var korMsg = document.getElementById("korMsg");
      var engMsg = document.getElementById("engMsg");
      var matMsg = document.getElementById("matMsg");
      
      nameMsg.style.display = "none";
      korMsg.style.display = "none";
      engMsg.style.display = "none";
      matMsg.style.display = "none";
      
      if(uName.value == "")
      {
         nameMsg.style.display="inline";
         uName.focus();
         return false;
      }
      
      if(uKor.value == "" || isNaN(uKor.value) 
            || Number(uKor.value)<0 || Number(uKor.value)>100)
      {
         korMsg.style.display="inline";
         uKor.focus();
         return false;
      }
      if(uEng.value == "" || isNaN(uEng.value) 
            || Number(uEng.value)<0 || Number(uEng.value)>100)
      {
         engMsg.style.display="inline";
         uEng.focus();
         return false;
      }
      if(uMat.value == "" || isNaN(uMat.value) 
            || Number(uMat.value)<0 || Number(uMat.value)>100)
      {
         matMsg.style.display="inline";
         uMat.focus();
         return false;
      }
      
      return true;
      
   }

</script>
</head>
<body>

<!-- 
   ○ WebApp09
   
      - 여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
        총점과 평균을 계산하여 출력해줄 수 있는 프로그램을 구현
      - 리스트 출력 시 번호 오름차순 정렬하여 출력할 수 있도록 한다.
      - 데이터베이스 여동하여 처리
         (TBL_SCORE, SCORESEQ 활용)
      - 즉 성적 처리 프로그램을 데이터베이스 연동하여 JSP로 구성
      
      데이터베이스 연결 및 데이터 처리
      ------------------------------------------------------------------
      성적 처리
      
      이름(*)      [ textbox ] -> 이름 입력 확인
      국어점수      [ textbox ] -> 0 ~ 100 사이의 정수가 입력되었는지 확인
      영어점수      [ textbox ] -> 0 ~ 100 사이의 정수가 입력되었는지 확인
      수학점수      [ textbox ] -> 0 ~ 100 사이의 정수가 입력되었는지 확인
      
      < 성적 추가 > -> button
      
      번호     이름    국어점수 영어점수 수학점수  총점   평균
      1     이다영   	90        80      70     xxx   xx.x
      2     윤유동   	80        70      60     xxx   xx.x
      3     최수지   	70        60      50     xxx   xx.x
      
   ○ WebApp09_scott.sql
   ScoreList.jsp
   ScoreInsert.jsp
   com.util.DBConn.java
   
 -->
 
 <div>
    <h1>데이터베이스 연결 및 데이터 처리</h1>
    <hr>
 </div>
 
 <div>
    <!--입력 폼 구성 -->
    <p>성적 입력</p>
    <form action="ScoreInsert.jsp" method="post" onsubmit="return formcheck()">	<!-- 입력을 할때는 post방식으로 하는것이 좋다 -->
       <table class="table">
          <tr>
             <th>이름(*)</th>
             <td>
                <input type="text" id="userName" name="userName" class="txt">
                <span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
             </td>
          </tr>
          <tr>
             <th>국어점수</th>
             <td>
                <input type="text" id="ScoreKor" name="ScoreKor" class="txt">
                <span class="errMsg" id="korMsg">0 ~ 100 사이의 정수가 입력</span>
             </td>
          </tr>
          <tr>
             <th>영어점수</th>
             <td>
                <input type="text" id="ScoreEng" name="ScoreEng" class="txt">
                <span class="errMsg" id="engMsg">0 ~ 100 사이의 정수가 입력</span>
             </td>
          </tr>
          <tr>
             <th>수학점수</th>
             <td>
                <input type="text" id="ScoreMat" name="ScoreMat" class="txt">
                <span class="errMsg" id="matMsg">0 ~ 100 사이의 정수가 입력</span>
             </td>
          </tr>
          <tr>
             <td colspan="2" style="text-align: left;">
                <input type="submit" value="성적 추가" class="btn"
                style="width: 30%; height: 50px; font-weight: bold; align-content: center;">
             </td>
          </tr>
       </table>
    </form>
 </div>
 
 
 <div>
    <!-- 리스트 구성 -->
    <p>성적 정보 리스트</p>
    <%=str %>
 </div>

</body>
</html>