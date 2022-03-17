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
<title>Ajax 방명록</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/data/css/style.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">

	$(function(){
			
		listPage(1); /* 1페이지를 호출한다.  */
		
	});
	
	$(document).ready(function(){
		
		$("#sendButton").click(function() {
			
			var params = "name=" + $("#name").val()
					    + "&email=" + $("#email").val()
					    + "&content=" + $("#content").val();
		$.ajax({
			type:"POST",
			/* 가상의 주소를 적어줌 */
			url:"<%=cp%>/guest/created.action", 
			data:params,
			
			success:function(args) { /* 함수성공하면 데이터는 args로 들어옴  그러면 listData에 뿌려줘야함*/ 
			
				$("#listData").html(args);

				/* null로 바꿔줘야지 데이터가 지워진다.  */
				/* 아작스는 새로고침이 안되기 때문에  */
				/* 코딩으로 삭제해줘야한다. */
				$("#name").val("");
				$("#email").val("");
				$("#content").val("");
				$("#name").focus();
			},
			
			
			beforeSend:showRequest, // false가 오면 실행안됨 true가 와야 실행된다.
			
			//갔다와서 에러가 나면
			error:function(e) {
				alert(e.responseText);
			
				}
			});
		});
	});		
	function showRequest() {
		/* 제이쿼리 함수 양쪽의 공백을 제거  */
		var name = $.trim($("#name").val()); // name의 값을 양쪽공백 제거후 name에 넣음 		
		var email = $.trim($("#email").val()); // name의 값을 양쪽공백 제거후 name에 넣음 		
		var content = $.trim($("#content").val()); // name의 값을 양쪽공백 제거후 name에 넣음 		
		
		if(!name) {
			alert("\n이름을 입력하세요");
			$("#name").focus();
			return false;
		}
		
		
		if(!email) {
			alert("\n이메일을 입력하세요");
			$("#email").focus();
			return false;
		}
		
		if(!content) {
			alert("\n내용을 입력하세요");
			$("#content").focus();
			return false;
		}
		
		if(content.length>=200) {
			alert("\n내용은 200자 까지만 가능합니다.");
			$("#content").focus();
			return false;
		}
		
		
		
		// 다 체크해서 통과했으면 true가 돌아가야지 계속 실행됨 
		return true; 
		
	}

	function listPage(page){ // 1 이 오게됨
		
	}
	
	function deleteData(num,page) {
		
	}

</script> 

</head>
<body>

<br/><br/>
<table width="700" border="2" cellpadding="0" cellspacing="0"
 bordercolor="#e6d4a6" style="margin: auto;">
 	<tr height="40">
 		<td style="padding-left: 20px;"><b>방명록</b></td>
 	</tr>
</table>

	<!-- 겉모습 만듬  -->
	<br/><br/>
	
<table width="700" border="0" cellpadding="0" cellspacing="0" style="margin : auto;">
	
<tr>
<!-- colsplan 4칸합침 선  -->
	<td width="600" colspan="4" height="3" bgcolor="#e6d4a6"></td>
</tr>	

<tr>
	<td width="60" height="30" bgcolor="#eeeeee" align="center">작성자</td>
	<td width="240" height="30" style="padding-left: 10px;">
		<input type="text" id="name" size="35" maxlength="20" class="boxTF"/>
	</td>	

	<td width="60" height="30" bgcolor="#eeeeee" align="center">이메일</td>
	<td width="240" height="30" style="padding-left: 10px;">
		<input type="text" id="email" size="35" maxlength="50" class="boxTF"/>
	</td>	
</tr>
<tr>	
	<td width="600" colspan="4" height="1" bgcolor="#e6d4a6"></td>
</tr>	

<tr>
	<td width="60" height="30" bgcolor="#eeeeee" align="center">내용</td>
	<td width="540" colspan="3" style="padding-left: 10px;">
		<textarea rows="3" cols="90" class="boxTA"
		style="height: 50px;" id="content"></textarea>
	</td>	
</tr>
<tr>	
	<td width="600" colspan="4" height="1" bgcolor="#e6d4a6"></td>
</tr>	

<tr>
	<td width="600" colspan="4" height="30" align="right"
	style="padding-right: 15px;">
	<input type="button" value="등록하기" class="btn2" id="sendButton"/> <!-- 제이쿼리로 읽어내기 위해서 id  -->
	</td>
</tr>	
</table>		
	
<br/>
<span id="listData" style="display: none;"></span>	 <!--  none 안보임  -->
</body>
</html>