<%@page import="com.test.ScoreDTO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   StringBuffer result = new StringBuffer();
   String count = "<span id='memberCount'>전체 인원 수 : ";
   
   ScoreDAO dao = null;
   try
   {
      // 데이터베이스 연결
      dao = new ScoreDAO();
      
      // 전체 인원 수 조회
      count += dao.count()+"명</span>";
      
      // 전체 DB 조회
      result.append("<table class=table>");
      result.append("<tr><th>번호</th><th>이름</th>"
         +"<th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th></tr>");
      
      for (ScoreDTO dto : dao.lists())
      {
         result.append("<tr>");
         result.append("<td>"+dto.getSid()+"</td>");
         result.append("<td>"+dto.getName()+"</td>");
         result.append("<td>"+dto.getKor()+"</td>");
         result.append("<td>"+dto.getEng()+"</td>");
         result.append("<td>"+dto.getMat()+"</td>");
         result.append("<td>"+dto.getTot()+"</td>");
         result.append("<td>"+dto.getAvg()+"</td>");
         result.append("</tr>");
      }
      result.append("</table>");
      
   }
   catch(Exception e)
   {
      System.out.println(e.toString());
   }
   finally
   {
      try
      {
         // 데이터베이스 연결 종료
         dao.close();
      }
      catch(Exception e)
      {
         System.out.println(e.toString());
      }
   }

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
   .record {text-align: center;}
   input {width: 200px; border-radius: 6px;}
   button {width: 200px; height: 50px; font-family: 맑은 고딕; font-weight: bold; align-content: center;}
   .errMsg {font-size: small; color: red; display: none;}
</style>
<script type="text/javascript">
   function check()
   {
      var userName = document.getElementById("userName");
      var userKor = document.getElementById("userKor");
      var userEng = document.getElementById("userEng");
      var userMat = document.getElementById("userMat");
      
      var nameMsg = document.getElementById("nameMsg");
      var korMsg = document.getElementById("korMsg");
      var engMsg = document.getElementById("engMsg");
      var matMsg = document.getElementById("matMsg");
      
      nameMsg.style.display = "none";
      korMsg.style.display = "none";
      engMsg.style.display = "none";
      matMsg.style.display = "none";
      
      if (userName.value=="")
      {
         nameMsg.style.display = "inline";
         userName.focus();
         return false;
      }
      
      if (userKor.value=="" || isNaN(userKor.value) || Number(userKor.value)<0 || Number(userKor.value)>100)
      {
         korMsg.style.display = "inline";
         userKor.focus();
         return false;
      }
      
      if (userEng.value=="" || isNaN(userEng.value) || Number(userEng.value)<0 || Number(userEng.value)>100)
      {
         engMsg.style.display = "inline";
         userEng.focus();
         return false;
      }
      
      if (userMat.value=="" || isNaN(userMat.value) || Number(userMat.value)<0 || Number(userMat.value)>100)
      {
         matMsg.style.display = "inline";
         userMat.focus();
         return false;
      }
      
      return true;
   }
</script>
</head>
<body>
<div>
   <h1>실습 - DAO, DTO 활용</h1>
   <hr>
</div>

<div>
   <form action="ScoreInsert.jsp" method="post" onsubmit="return check();">
      <table class="table" id="input">
         <tr>
            <th width="250px">이름(*)</th>
            
            <td>   
               <input type="text" id="userName" name="userName" class="txt">
               <span id="nameMsg" class="errMsg">이름을 입력해주세요.</span>
             </td>

         </tr>
         
         <tr>
            <th width="250px">국어점수</th>
            <td>
               <input type="text" id="userKor" name="userKor" class="txt">
               <span id="korMsg" class="errMsg">0 ~ 100 사이의 점수를 입력하세요.</span>
            </td>
         </tr>
         <tr>
            <th width="250px">영어점수</th>
            <td>
               <input type="text" id="userEng" name="userEng" class="txt">
               <span id="engMsg" class="errMsg">0~100 사이의 숫자를 입력해주세요</span>
            </td>
         </tr>
         <tr>
            <th width="250px">수학점수</th>
            <td>
               <input type="text" id="userMat" name="userMat" class="txt">
               <span id="matMsg" class="errMsg">0~100 사이의 숫자를 입력해주세요</span>
            </td>
         </tr>
         <tr>
            <td colspan="3">
               <button type="submit" id="btnAdd" class="btn">성적 추가</button>
            </td>
         </tr>
      </table>
   </form>
</div>

<div><%=count %></div>
<div><%=result %></div>

</body>
</html>