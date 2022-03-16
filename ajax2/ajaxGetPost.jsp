<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	var XMLHttpRequest; // 객체를 전역변수로 만듬
	
	
	
function getXMLHttpRequest() {
		
		/* 크롬인지 브라우저인지 알아서 객체 생성  */	
	if(window.ActiveXObject) {
	
		try {
			//IE5.0이후버전
			XMLHttpRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			//IE5.0이전버전
			XMLHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");				
			
			}
		
		} else { // NON-IE 크롬
		
			XMLHttpRequest = new XMLHttpRequest();
		}
		
	}
	
	function ajaxRequestGet() {
		
		/* myForm 에 있는 greting */
		var data = document.myForm.greeting.value;
		
		if(data==""){
			alert("데이터 입력!");
			document.myForm.greeting.focus();
			return;
		}
		
		//Get방식 : 한글이 깨짐 
		XMLHttpRequest.open("GET","ajaxGetPost_ok.jsp?greeting="+ data , true);
		XMLHttpRequest.onreadystatechange = viewMessage;
		XMLHttpRequest.send(null); 
	}
	
		function ajaxRequestPost() {
			
			var data = document.myForm.greeting.value;
			
			if(data==""){
				alert("데이터 입력!");
				document.myForm.greeting.focus();
				return;
			}
			
			XMLHttpRequest.open("POST","ajaxGetPost_ok.jsp",true); // post방식으로 보냄 
			
			XMLHttpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
					 // post방식일때 application/x-www-form-urlencoded 를 써줘야함 
			
			XMLHttpRequest.onreadystatechange = viewMessage;
			XMLHttpRequest.send("greeting=" + data);

		}
		
		
	function viewMessage() {
		
		var divE = document.getElementById("printDiv"); // 폼 밖에 있어서 getElementById 객체 받아옴 
	
		/* readyState 0 : 객체생성 , readyState 1 : 정보설정 , readyState 2 : send메소드로 요청 , readyState 3 : 서버에서 응답오기 시작 , readyState 4 : 서버 응답 완료 */
		
		if(XMLHttpRequest.readyState==1||
				XMLHttpRequest.readyState==2||
				XMLHttpRequest.readyState==3){
			
			divE.innerHTML = 
				"<image src='./image/processing.gif' width='50' height='50'/>";
		} else if(XMLHttpRequest.readyState==4){
			// 4면 정상적으로 실행됨
			divE.innerHTML = XMLHttpRequest.responseText;
		}
		
		
	}
		// post방식에도 /* 크롬인지 브라우저인지 알아서 객체 생성  이 필요 
		// 그래서 getXMLHttpRequest() 위에서 브라우저에 따라 객체 생성	
		// 폼이 로딩이 될때 함수실행 - 함수는 getXMLHttpRequest(); 실행  - 브라우저에 의해서 XMLHttpRequest를 생성 , 
		
		
	//body가 로딩될 때(창이 열릴때) getXMLHttpRequest() 호출
	window.onload = function () {
		getXMLHttpRequest(); 
	}

		
</script>

</head>
<body>

<h1>AjaxGetPost</h1>
<hr/>

<form action="" name="myForm"> <!-- from 에서 method="post" enctype="application/x-www-form-urlencoded" post방식으로 보낼때 내장되어있어서 아쟉스에서 보낼때 위에 적어줘야함  -->
<input type="text" name="greeting"/>
<input type="button" value="Get전송" onclick="ajaxRequestGet();">
<input type="button" value="Post전송" onclick="ajaxRequestPost();">
</form>

<div id="printDiv" style="border: 1px solid blue; width: 50% "></div>
	
</body>
</html>