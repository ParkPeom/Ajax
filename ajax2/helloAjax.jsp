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

	var XMLHttpRequest; // 비동기 방식으로 서버와 연결해줄수있는 객체 브라우저에 내장
						// 사용자 정의 변수명 
	function ajaxRequest() {
		
		// IE
		//XMLHttpRequest = new ActiveXObject("Msxml2.XMLHTTP"); // 브라우저에따라 객체생성을 한다.
	
		// 크롬 
		XMLHttpRequest = new XMLHttpRequest();	
		XMLHttpRequest.open("GET","helloAjax_ok.jsp",true); // 보내서 처리 , true:비동기방식
		XMLHttpRequest.onreadystatechange = viewMessage; // 갔다가 온 콜백함수(데이터) , readyState 속성이 바뀌었을때 실행할 이벤트 핸들러를 지정한다.
		XMLHttpRequest.send(null); // get방식이기때문에 여기가 null , post일때 변수명=값 넣음
	}
	
	// 콜백함수 : 돌아오고 나면 실행됨
	function viewMessage() {
		
		// 서버에서 응답이 왔을때 실행되는 메소드
		var responseText = XMLHttpRequest.responseText; // 돌아오는 데이터가 text이면 , 돌아오는 데이터가 XML이면 responseXML 
			
		var divE = document.getElementById("printDIV"); // 출력할곳 id 
		
		divE.innerHTML = responseText;  // HTML형식으로 responseText를 출력
	}
</script>
</head>
<body>

<h1>Hello Ajax</h1>

<input type="button" value="클릭" onclick="ajaxRequest();"/>
<br/><br/>
<div id="printDIV" style="border: 1px solid red; width: 50%"></div> <!-- 여기다가 뿌릴것이다.  -->

</body>
</html>