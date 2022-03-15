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

<!-- 보내는 곳 -->
<script type="text/javascript">
/* js + 제이쿼리안에(에이잭스)   */
	$(function() {
	
		$("#sendButton").click(function(){
		
			var params = "subject=" + $("#subject").val() +
			"&content=" + $("#content").val();
			
			/*  제이쿼리에 아작스로 만들것이다 */
			
			/* js안에 ajax */
			$.ajax({
				type:"POST", /* post 방식으로 보냄   */
				url:"test2_ok.jsp",  
				data:params,  /* 데이터는 params에 있다 */
				dataType:"xml",  /*  돌아오는 데이터 타입은 xml */
									/* 갔다가 돌오았을때 실행하는 콜백함수  */
				success:function(args) {   /* xml 데이터를 받는다 그것이 사용자 정의 args로 받으면 됨  */
				
					/* 성공했을때는 여기에 코딩을 갔다왔을때 처리 작업 */	
					/* 예쁘게 디자인을 한다느것 : 파싱한다. */	
				  $(args).find("status").each(function(){  /*  each는 반복문 root를 반복해서 찾는다. */
					 alert($(this).text());  /*  status찍어봐라 */
				  });
				
					var str ="";
					// each는 반복작업 
					$(args).find("record").each(function() {
						var id = $(this).attr("id"); /* 레코드에 있는 속성 아이디를 찾아라  */
						var subject = $(this).find("subject").text(); 
						var content = $(this).find("content").text();
						
						str += "id=" + id +
								",subject=" + subject + 
								",content=" + content + "<br/>";
					});
					$("#resultDIV").html(str); /* str를 넣어라 */ 
				},
				
				
				// 데이터를 보내기전에 무언가를 할때 
				beforeSend:showRequest, /* 돌아왔을때 실행  */
				error:function(e) {
					/* 에러가 나면 */
					alert(e.responseText); /* 에러메시지를 나한테 출력 */
				}
			});
		});
	
});
// 가기전에 해야하는 작업 

function showRequest() {
	
	var flag = true;
	
	if(!$("#subject").val()){ // subject에 value가 없으면
		alert("제목을 입력하세요!");
		$("#subject").focus();
		return false; // false값이 보내면 실행안함 
	}
	
	
	if(!$("#content").val()){ // subject에 value가 없으면
		alert("내용을 입력하세요!");
		$("#content").focus();
		return false; // false값이 보내면 실행안함 
	}
	return flag;
}


//-->
</script>
</head>
<body>

제목: <input type="text" id="subject"/><br/>
내용: <input type="text" id="content"/><br/>
<input type="button" id="sendButton" value="보내기"/><br/>

<div id="resultDIV"></div>


</body>
</html>