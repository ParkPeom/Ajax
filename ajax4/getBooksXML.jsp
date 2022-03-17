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

<script type="text/javascript" src="<%=cp%>/data/js/httpRequest.js"></script>

<script type="text/javascript">

	function getBookList() {
			
		sendRequest("books.xml",null,displayBookList,"GET");  // 아쟉스는 _ok로 보냈는데 , xml은 books.xml를 만들어놔서 소스가 books.xml이다. 바로 접근가능
		// null 넘어오는데이터가없고 , 콜백함수 , get방식으로 보냄
	}
	// 콜백함수 
	function displayBookList() {
		
		if(httpRequest.readyState==4) {
			if(httpRequest.status==200) {
				
				// 전달받은 XML을 DOM객체를 넣음
				var Document = httpRequest.responseXML; // XML를 반환받을때는 responseXML
				//alert(Document);
				
				// DOM 객체에서 Element추출
				var booksE = Document.documentElement;
				
				// book의 갯수 호출
				var bookNL = booksE.getElementsByTagName("book"); // <book> : 태그  태그이름으로 찾는다.
				//alert(bookNL.length + "개"); // books.xml에서 <book>이 4개이므로 
							
				// 전체데이터
				var html = "";
				html += "<ol>";
				
				for(var i=0; i<bookNL.length;i++){ // 4 <bookNL배열
					
					var bookE = bookNL.item(i); // var f = document.myForm 과 같은개념
					// ★ ITEM은 머지
					
					
					// title를 읽어낸다.겨울왕국이 0 firstChild 자식노드 값을가져옴 
					var titleStr = bookE
						.getElementsByTagName("title")
						.item(0)
						.firstChild // 겨울왕국
						.nodeValue; 
						
					var authorStr = bookE
						.getElementsByTagName("author")
						.item(0)
						.firstChild // 디즈니 
						.nodeValue;
					
					html += "<li>"
						+ titleStr 
						+ "&nbsp;&nbsp;&nbsp;"
						+ authorStr + "</li>";
				}
				
				html += "</ol>";	
				document.getElementById("bookDiv").innerHTML = html; // 한번에 써줄수있다.
				
			}
		}
	}
	
	window.onload = function() {
		getBookList();
	}

</script>

</head>
<body>

<h1 id="list">Book List</h1>	
<hr/>
<div id="bookDiv" style="display: block; margin: 0 auto;"></div>

</body>
</html>