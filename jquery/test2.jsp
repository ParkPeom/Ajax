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
	
$(function(){

	$("#btnOK").click(function() { /* btnOK를 클릭하면 함수를 실행해라 */
		
	   var msg = $("#userName").val() /* userName의 value값 읽어와라 */
	
	   msg += "\r\n" + $("input:radio[name=gender]:checked").val() /* input 박스중에 radio라는 곳에 name이 gender의 값을 가져와라 checked되어있는 값의 value를 읽어와라  */
	
	   msg += "\r\n" + $("#hobby").val().join("|") /* hobby값을 가져올때  |구분하여 가져와라 */   
	
	   alert(msg)
	})

})	
	
	
	/* form이 없을때 id로 접근 (JavaScript) */
	function result() {

		var msg = document.getElementById("userName").value /* 하나의 요소에 id값으로 찾아간다  */
		
		alert(msg)
	}


</script>


</head>
<body>

<!-- css에서 id로 적으면 제이쿼리로 읽어낸다. id는 고유이름 -->
이름: <input type="text" id="userName"/><br/>
성별: <input type="radio" id="gender1" value="M" name="gender">남자
<input type="radio" id="gender2" value="F" name="gender">여자<br/><br/>

취미: <select id="hobby" multiple="multiple">
	<option value="여행">여행</option>
	<option value="영화">영화</option>
	<option value="운동">운동</option>
	<option value="게임">게임</option> 
</select>

<br/><br/>

jQuery: <input type="button" value="확인" id="btnOK"/><br/>
Javascript: <input type="button" value="확인" onclick="result();"/><br/>


</body>
</html>