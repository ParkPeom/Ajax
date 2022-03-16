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

	var XMLHttpRequest;
	
	XMLHttpRequest = new XMLHttpRequest(); // 객체생성
	
	function printClientTime(){
		
		var clientTimeSpan = document.getElementById("clientTimeSpan"); // span id="clientTimeSpan" 읽어와서 객체 만듬
		
		var now = new Date(); // 월분일시분초 보여줌
		
		
		var timeStr = now.getFullYear() + "년 "
			+ (now.getMonth() + 1) + "월 "
			+ now.getDate() + "일 "
			+ now.getHours() + "시 "
			+ now.getMinutes() + "분 "
			+ now.getSeconds() + "초";
		
		/* _ok 안함 그냥 자기시간 띄운거다  */
		 clientTimeSpan.innerHTML = timeStr;
		// 시간 바꾸기
		// 자기자신을 1초마다 다시실행
		setTimeout("printClientTime()",1000);
	}
		
	function requestTime() {
		// clock_ok.jsp로 감 
		
		XMLHttpRequest.open("GET","clock_ok.jsp",true);
		XMLHttpRequest.onreadystatechange = printServerTime; // 콜백함수
		XMLHttpRequest.send(null);
		
		setTimeout("requestTime()",1000); // 1초마다 불러오면 된다.
		
	}
	
	// 얘로 돌아옴
	function printServerTime() {
	
		if(XMLHttpRequest.readyState==4) {
			if(XMLHttpRequest.status==200) {
				
				
				
				var serverTimeSpan =
					document.getElementById("serverTimeSpan"); // id를 객체만듬 innerHtml 하기위해 
				
				serverTimeSpan.innerHTML = XMLHttpRequest.responseText;	
			}
		}
		
	}
	//body가 로딩될 때(창이 열릴때) printClientTime() 호출
	window.onload = function() {
		printClientTime();
		requestTime(); 
	}
</script>

</head>
<body>
<h1>Clock</h1>
<br/>
<hr/>

1. 현재 클라이언트 시간은<b><span id="clientTimeSpan"></span></b> 입니다<br/>
2. 현재 서버 시간은<b><span id="serverTimeSpan"></span></b> 입니다<br/>


</body>
</html>