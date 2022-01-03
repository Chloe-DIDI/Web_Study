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
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	$(function()
	{
		$("#sendBtn").click(
				function()
				{
					//alert("sendBtn test");

					// data 구성
					var params = "title=" + $.trim($("#title").val())
							+ "&content=" + $.trim($("#content").val());

					// check~!!!
					// jQuery 의 ajax() 함수 사용(호출)
					$.ajax(
					{
						/* [내가 해결] */
						/*
						type : "POST"
						, url : "AjaxTest03_ok.jsp"
						, data : params
						//, async : true			//-- 동기 @true(비동기, defaul 값), false(동기)
						, dataType : "xml"			//-- check~!!!
						, success : function(args)
						{
							//alert("success Test");
							
							var out = "";
							$(args).find("records").each(function()
							{
								var item = $(this);
								
								var id = item.attr("id");
								var title = item.find("title").text();
								var content = item.find("content").text();
								
								out += "<br>>> id=" + id ;
								out += "<br> - title = " + title;
								out += "<br> - content = " + content;
								out += "<br>";
							});
							
							$("#resultDiv").html(out);
							
							$("#title").val("");
							$("#content").val("");
							$("#title").focus();
						}
						, beforeSend : showRequest
						, error : function(e)
						{
							alert(e.responseText);
						}
						*/

						/* [함께 해결] */
						type : "POST"
						, url : "AjaxTest03_ok.jsp"
						, data : params
						, dataType : "xml"			//-- check~!!!
						, success : function(xml)
						{
							$(xml).find("status").each(function()
							{
								var status = $(this).text();
								//alert(status);
							});
							
							var str = "";

							$(xml).find("records").each(function()
							{
								var recods = $(this);
								
								var id = recods.attr("id");
								var title = recods.find("title").text();
								var content = recods.find("content").text();
								
								str += ">> id = " + id ;
								str += "<br>- title = " + title;
								str += "<br>- content = " + content;
								str += "<br><br>";
							});
							
							$("#resultDiv").html(str);
							
							$("#title").val("");
							$("#content").val("");
							$("#title").focus();
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
		var flag = true;
		
		if (!$.trim($("#title").val()))
		{
			alert("제목을 입력해야 합니다.");
			$("#title").focus();

			flag = false;
		}

		if (!$.trim($("#content").val()))
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();

			flag = false;
		}

		return flag;
	}
</script>


<title>AjaxTest04.jsp</title>
</head>
<body>

	<div>
		<h1>jQuery의 ajax() 활용 실습</h1>
		<hr />
	</div>

	<div>
		이름: <input type="text" id="title" class="txt" /> <br /> 
		내용: <input type="text" id="content" class="txt">
		<br /> <br /> 
		
		<input type="button" value="등록하기" id="sendBtn" />
	</div>
	<br><br>

	<div id="resultDiv"></div>


</body>
</html>