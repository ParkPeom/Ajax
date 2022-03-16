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
		
		/* hideNewsDiv(); */ // 실행할때안보임 마우스올리면보임 
		
		// newsTitleCSV_ok.jsp메소드 
		sendRequest("newsTitleCSV_ok.jsp",null,displayNewsTitle,"GET"); // 데이터는없다  , 이데이터를 넘기면 아작스가 움직임
		
		setTimeout("newsTitle()",3000); // 3초 
	
	}
	
	// 콜백함수
	function displayNewsTitle() {
		
		if(httpRequest.readyState==4) {
			if(httpRequest.status==200) {
				
				var csvStr = httpRequest.responseText;
				
				
				// alert(csvStr); 테스트출력
			
				var csvArray = csvStr.split("|"); // |구분하여 배열에 넣음
				
				var countStr = csvArray[0]; //0번째값
				
				// alert(countStr); 
				
				if(countStr==0) {
					alert("뉴스가 없습니다");
					return;
				}
				
				var csvData = csvArray[1];
				//alert(csvData);
				
				var newsTitleArray = csvData.split("*"); // *모양으로 구분하면 6개의 데이터가 들어간다.
				//alert(newsTitleArray.length); // 배열개수
				
				var html ="";
				html += "<ol>";
				
				for(var i=0;i<newsTitleArray.length;i++) {
					
					var newsTitle = newsTitleArray[i];
					html += "<li>" + newsTitle + "</li>";
				}
				html += "</ol>";
				//alert(html);
				var newsDiv = document.getElementById("newsDiv");
				
				// 이제 뿌려주면 됨
				newsDiv.innerHTML = html;
				
			} else { // status가 200이 아니면 
				
				var newsDiv = document.getElementById("newsDiv");
				newsDiv.innerHTML = httpRequest.status  + " : 에러발생 ";
			
				newsDiv.setAttribute("class","newsError"); // class 에 위에만든 .newsError 적용 
			}
		}
	}
	
	// 자동으로 실행되게끔 
	window.onload = function() {
		newsTitle();
	}
	
	// 뉴스 보임 
	function showNewsDiv(){
		var newsDiv = document.getElementById("newsDiv"); // 객체만듬
		newsDiv.style.display="block"; //보는건 block
	}
	
	// 뉴스 숨김
	function hideNewsDiv(){
		var newsDiv = document.getElementById("newsDiv"); // 객체만듬
		newsDiv.style.display="none"; // 안보이는건 none		
	}
	
</script>

</head>
<body>

<h2>헤드라인뉴스</h2>
<hr/>
<br/>
<!--onmouseover="showNewsDiv();" onmouseout="hideNewsDiv();" :  실행할때안보임 마우스올리면보임  -->
<!-- display: block; 화면을 보여주겠다   -->
<div style="display: block; border: 3px solid; width:50%; margin:0 auto;">
뉴스보기</div>

<div id="newsDiv" class="news">
	
		
</div>

</body>
</html>