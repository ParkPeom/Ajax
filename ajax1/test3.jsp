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
<script type="text/javascript" src="<%=cp%>/data/js/jquery-3.1.1.min.js"></script>
<title>Insert title here</title>

<script type="text/javascript">
/* 순수 제이쿼리로 주고받음  */
$(document).ready(function() { // dom이 생성되면 ready 메소드가 실행 
	
	$("#saveButton").click(function(){
			
		/* 값을 읽어낸다.  */
		var value1 = $("#userId").val();
		var value2 = $("#userPwd").val();
		
		/* post방식으로 보내기  */
		// "test3_ok.jsp",{userId:value1,userPwd:value2} 로 보내서 , function(args) 콜백함수 
		$.post("test3_ok.jsp",{userId:value1,userPwd:value2},function(args){  // userId 변수 에 value1데이터를 넣는다.
			
			
			$("#resultDIV").html(args); // resultDIV에 뿌려준다. 
		}) 
	})
	
	// 지우기 버튼 눌렀을시 
	$("#clearButton").click(function(){
		$("#resultDIV").empty();
	});
})

</script>
</head>
<body>

아이디: <input type="text" id="userId"/><br/>
패스워드: <input type="text" id="userPwd"/><br/>

<!-- button이란 태그는 submit기능을 가지고 있다.  -->
<button id="saveButton">전송</button>
<button id="clearButton">지우기</button>
<br/><br/>
<div id="resultDIV"></div>
</body>
</html>