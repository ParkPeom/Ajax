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

/* js 와 ajax  */

$(document).ready(function() {  // dom이 생성되면 ready 메소드가 실행 
	
	$("#saveButton").click(function(){
		var params = "userId=" + $("#userId").val() + 
			"&userPwd=" + $("#userPwd").val();
		/*  데이터 값  */
		$.ajax({
			type:"POST",
			url:"test4_ok.jsp",
			data:params, /* params를 보냄   */
		
			success:function(args) {
				$("#resultDIV").html(args);
			},
			
			// 데이터 보내기전에 유효성검사 
			
			// true일때 실행된다.
			beforeSend:showRequest,
			error:function(e) {
				alert(e.responseText);
			}
			
			})
		})
	
	function showRequest() {
		
		var flag = true;
		
		if(!$("#userId").val()) {
			alert("아이디입력");
			$("#userId").focus();
			return false;
		}
		
		if(!$("#userPwd").val()) {
			alert("패스워드입력");
			$("#userPwd").focus();
			return false;
		}
		
		return flag;
	}
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