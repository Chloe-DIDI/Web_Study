<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	$(function()
	{
		$("#sendBtn").click(function()
		{
			//alert("sendBtn test");
			
			// data 구성
			var params = "name=" + $.trim($("#name").val()) + "&content=" + $.trim($("#content").val());
			
			// check~!!!
			// jQuery 의 ajax() 함수 사용(호출)
			$.ajax(
			{
				//@ 아래의 값들은 순서가 바뀌어도 상관 없음(이름: 값 순으로 제이슨 형태로 들어가기 때문에)
				//@ 디폴트로 들어간 값들은 빼도 무방
				type : "POST"					// "GET"
				, url : "AjaxTest01_ok.jsp"
				, data : params
				, success : function(args)		// 받아온 값을 매개변수로 받아서 처리해줄 동작(기능) (cf. 콜백)
				{								// @ success 에서는, type/url/data 을 통해 반환되는 값을 매개변수로 쓴다.
					$("#resultDiv").html(args);
					
					$("#name").val("");
					$("#content").val("");
					$("#name").val();
				}
				, beforeSend : showRequest		// true, false → 유효성 검사 등 (@사전에 확인할 거 없음! 그냥 보내!)
												// @ 외부 함수를 불러오는 것도 가능 (ex. showRequest → ()를 붙이지 않는다!)
				, error : function(e)			// 에러 발생 시 처리해줄 동작(기능)
				{
					alert(e.responseText);
				}						
			});			
			
		});
	});
	
	function showRequest()
	{
		if(!$.trim($("#name").val()))
		{
			alert("이름을 입력해야 합니다.");
			$("#name").focus();
			
			return false;
		}
		
		if(!$.trim($("#content").val()))
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			
			return false;
		}
		
		return true;
	}
	
	
	
	
</script>


<title>AjaxTest01.jsp</title>
</head>
<body>

	<div>
		<h1>jQuery의 ajax() 활용 실습</h1>
		<hr />
	</div>

	<div>
		이름:
		<input type="text" id="name" class="txt" />
		<br /> 내용
		<textarea id="content" rows="3" cols="50"></textarea>
		<br /> <br />
		
		<input type="button" value="등록하기" id="sendBtn" />
	</div>
	
	<div id="resultDiv">
	</div>


</body>
</html>