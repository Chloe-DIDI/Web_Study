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
			//alert("click test");
			
			var params = "name=" + $.trim($("#name").val()) + "&content=" + $.trim($("#content").val());
			
			$.ajax(
			{
				type : "POST"
				, url : "AjaxTest02_ok.jsp"
				, data : params
				//, async : true			//-- 동기 @true(비동기, defaul 값), false(동기)
				, dataType : "xml"			//-- check~!!!
				, success : function(args)
				{
					//alert("success Test");
					
					var out = "";
					out = ">> 게시물 갯수: " + $(args).find("total_dataCount").text() + "<br>";
					
					$(args).find("comment").each(function()		//@ 각각 처리
					{
						var item = $(this);						//@ 객체를 아이템에 담기
						var num = item.attr("num");				//@ item 에 atrribute인 'num'을 찾아라!
						var name = item.find("name").text();
						var content = item.find("content").text();
						//alert("name:" + name + ", content:" + content);
						
						
						out += "<br>======================";
						out += "<br> 번호 : " + num;
						out += "<br> 이름 : " + name;
						out += "<br> 내용 : " + content;
						out += "<br>======================<br>";
					});
					
					$("#resultDiv").html(out);
					
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
				}
				, beforeSend : showRequest
				, error : function(e)
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

<title>AjaxTest02.jsp</title>
</head>
<body>

	<div>
		<h1>jQuery의 ajax() 활용 실습</h1>
		<p>xml control</p>
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