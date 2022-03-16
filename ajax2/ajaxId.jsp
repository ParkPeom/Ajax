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


	var XMLHttpRequest; // 전역변수 선언
	
	XMLHttpRequest = new XMLHttpRequest();
		
	// onkeyup="requestGet(); 키업에 따라서 실행 "/>
	function requestGet() {
			
		var f = document.myForm;
		
		if(!f.userId) {
			alert("아이디 입력!");
			f.userId.focus();
			return;
		}
		var params = "?userId=" + f.userId.value;
		XMLHttpRequest.open("GET","ajaxId_ok.jsp" + params,true);
		XMLHttpRequest.onreadystatechange = viewMessage; // 돌아올때는 콜백함수
		XMLHttpRequest.send(null);	// get방식일때 null	
	}
	
	// 콜백함수
	function viewMessage() {
		if(XMLHttpRequest.readyState==4) {
			if(XMLHttpRequest.status==200) {
				
				var str = XMLHttpRequest.responseText;
				
				var divE = document.getElementById("resultDIV");
				divE.innerHTML = str; 
			}
		} else {
			// 데이터가 재대로 넘어오지 못하면
			var divE = document.getElementById("resultDIV");
			divE.innerHTML = "<img src='./image/loading.gif' width='15' height='15'/>";
		}
		
	}

</script>


</head>
<body>

<h1>Ajax ID 확인</h1>

<hr/>
<form action="" name="myForm">

<!-- onkeyup="requestGet(); 손가락을 때는순간 requestGet() 호출  -->
아이디: <input type="text" name="userId" onkeyup="requestGet();"/>

</form>
<br/><br/><br/><br/>

<div id="resultDIV" style="color: red;
 border: 1px solid #000000; width: 40%">
</div> 

</body>
</html>