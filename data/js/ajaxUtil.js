
var xmlHttp; // 변수 하나만듬 

// 각각의 웹 브라우저마다 자신들에게 맞는 형태로 개발되어 제공
function createXMLHttpRequest(){
	
	var xmlReq = false; 
	
	if(window.XMLHttpRequest){ //Non-Microsoft browser : 마이크로 소프트사의 브라우저가 아닌경우
		
		xmlReq = new XMLHttpRequest; // 이런식으로 객체 생성하는 방법
		
	} else if(window.ActiveXObject) { // 마이크로 소프트사의 브라우저인 경우
		
		try { //버전 5.0이후 객체생성방법 
			xmlReq = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			//버전 5.0이전 객체생성방법 
			xmlReq = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	return xmlReq; // 웹 서버와의 비동기 통신을 담당하는 자바스크립트 객체
}