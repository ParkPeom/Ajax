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

<style type="text/css">

.news {

	font-size: 10pt;
	display: block; /* 화면을 보여주겠다  none은 숨기는것 */
	margin: 0 auto;
	background: yellow;
	color: blue;
	border: 1px dashed black;
	width: 50%;

}

.newsError {

	font-size: 10pt;
	display: block; /* 화면을 보여주겠다  none은 숨기는것 */
	margin: 0 auto;
	background: orange;
	color: red;
	border: 1px dashed black;
	width: 50%;
}

</style>
<script type="text/javascript" src="<%=cp%>/data/js/httpRequest.js"></script>

<script type="text/javascript">

	function newsTitle() {
		
		// 보냄 
		sendRequest("newsTitleJSON2_ok.jsp",null,displayNewsTitle,"GET");
	}
	
	
	// 콜백함수 
	function displayNewsTitle() {
		
		
		if(httpRequest.readyState==4) {
			if(httpRequest.status==200) {
				
				// json 데이터 받음 
				var jsonStr = httpRequest.responseText; 
				
				// alert(jsonStr);
				
				// eval은 변수를 javascript의 함수처럼 사용하는 명령어
				// 객체화 해서 집어넣는다.
				// jsonStr 내용을 객체화 해서 jsonObject에 넣는다.(돔객체로바꿈)
				var jsonObject = window.eval('(' + jsonStr + ')');
				// alert(jsonObject);
				// alert(jsonObject.count); // 객체화 했기때문에 접근할수있다. 6 
				// alert(jsonObject.titles[2].publisher); // 한국
				
				var count = jsonObject.count;
				
				if(count>0){
					var htmlData = "<ol>";
					for(var i=0; i<jsonObject.titles.length;i++){
						// 데이터 꺼냄
						var publisherStr = jsonObject.titles[i].publisher;
						var headlineStr = jsonObject.titles[i].headline;
					
						htmlData += "<li>" + headlineStr + " [" +
							publisherStr + "]</li>";
					}
					htmlData += "</ol>";
					var newsDiv = document.getElementById("newsDiv");
					newsDiv.innerHTML = htmlData;
				}
			}
		}
	}
	window.onload = function() {
		newsTitle();
	}
</script>
</head>
<body>

<h1>헤드라인 뉴스</h1>
<hr/>
<br/>
<div style="width: 50%; margin: 0 auto;">뉴스보기</div>

<div id="newsDiv" class="news"></div>
</body>
</html>