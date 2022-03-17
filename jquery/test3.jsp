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
<link rel="stylesheet" type="text/css" href="<%=cp %>/data/css/jquery-ui.min.css"/>
<script type="text/javascript" src="<%=cp%>/data/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=cp%>/data/js/jquery-ui.min.js"></script>
<title>Insert title here</title>

<!-- 제이쿼리 UI : 디자인을 하지않아도 디자인이 보인다.  -->
<script type="text/javascript">
	
	$(function() {
	
		$("#dialog").hide(); /* dialog를 기본적으로 숨기고 */
		
		$("#btn1").click(function() { /* btn1버튼을 누르면 dialog 창을 보여준다. */
			$("#dialog").dialog();
		})
	
	$("#btn2").click(function() {
		$("#dialog").dialog({ /* dialog창을 띄울때 내가 원하는 무언가할것이다.  */
			height:240,
			width:300,
			model:true /* 모달 : 앞에 있는 창을 해결해야 넘어간다. */
			})
		})
		
		/* 외부 ex.jsp 띄우기  */
		$("#btn3").click(function() {
			$("<div>").dialog({
				modal:true,
				open:function(){
					$(this).load("ex.jsp") /* this 자기자신을 띄어라  */
				},
				height:400,
				width:400,
				title:"외부 파일 창 띄우기"
			})
		})			
	})

</script>


</head>
<body>
	
<div id="dialog" title="우편번호 검색">
	<p>동을 입력하세요</p>
	<p><input type="text"/></p>
</div>	

<!-- ui가 들어가서 자동으로 적용  -->
<div>
	<input type="button" value="모달리스" id="btn1"/><br/>
	<input type="button" value="모달" id="btn2"/><br/>
	<input type="button" value="창띄우기" id="btn3"/><br/>
</div>
	
	
</body>
</html>