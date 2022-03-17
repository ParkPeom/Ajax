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

<script type="text/javascript" src="<%=cp%>/data/js/jquery-3.1.1.min.js"></script>

<script type="text/javascript">


	/* <body onload=sendIt()> */
	/* 자바스크립트에서는 자료형이 없다 
	변수 onload에 함수를 넣었다 */
	/* window.onload = function() {
		alert("환영!!")
	}
	
	window.onload = function() {
		alert("진짜환영!!")
	} */

	/* 순수한자바스크립트는 진짜환영이 안보이고 JQuery는 진짜환영이 보인다.  */
	$(document).ready(function(){
		alert("환영")
	})
	
	$(document).ready(function(){
		alert("진짜환영")
	})
	
	
	/* 위문장을 아래문장으로 함축시킬수있다. */
	
	$(function(){
		$(document.body).css("background","pink");
	})
	
	/* body에 삽입 */
	$(function(){
		$("<div><p>제이쿼리</p></div>").appendTo("body");
	})
</script>
</head>
<body>
</body>
</html>