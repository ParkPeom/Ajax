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


<!-- data/js log.js,member.js  자바스크립트 클래스,메소드 정의한걸 가져옴   -->
<script type="text/javascript" src="<%=cp%>/data/js/log.js"></script>
<script type="text/javascript" src="<%=cp%>/data/js/member.js"></script>

<script type="text/javascript">
	
	function memberClass() {
		
		//1.member.js없이 실행
		var object1 = {}; // 객체를 만드는 방법 json방법
		object1.id = "suzi";
		object1.name = "배수지";
		
		log("log1:" + object1.id + ", " + object1.name); // log(msg)
		
		//2.member.js없이 실행
		var object2 = new Object(); // new로 객체를 만들수있다.
		object2.id="inna";
		object2.name="유인나";
		
		log("log2:" + object2.id + ", " + object2.name);

		//3.Member 클래스 객체
		var member = new Member("insun","정인선","서울");
		log("member1: " + member.id + ", " + member.name + ", " + member.addr);
	
		//4.setter 로 객체 만듬 
		member.setValue("suzin","경수진","옥탑방");
		log("member2: " + member.id + ", " + member.name + ", " + member.addr);
		
		
		// 5.getter로 호출
		var memberInfo = member.getValue(); // suzin,경수진,옥탑방을 memberInfo에 넣는다
		log("member.getValue(): " +memberInfo);
		
		
	}
	window.onload = function() {
		memberClass();
	}

</script>


</head>
<body>

<h1>JavaScript 클래스 사용 </h1>
<hr/>

<div id="console"></div> <!-- log.js 의 console에 출력  -->

</body>
</html>