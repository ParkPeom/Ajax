<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//String protocol = request.getProtocol(); // 프로토콜 확인	
	//System.out.print(protocol); HTTP/1.1

	
	// 클라이언트의 ajax캐쉬를 삭제하는 명령어
	// 클라이언트가 처리한 결과를 자기가 가지고 있다. ajax만들어진 페이지를 가면 캐쉬가 쌓이게 되면서 충돌이 일어나므로 캐쉬내용을 지움 
	
	if(request.getProtocol().equals("HTTP/1.1")){
		response.setHeader("Cache-Control", "no-cache");
	}

%>

<%

	String greeting = request.getParameter("greeting"); // 데이터가 넘어옴
	
	// 처리하는 시간 필요
	for(int i=0;i<3500;i++){
	
	System.out.print("처리중....");
	
	}
%>

<!-- greeting 를 보낸다.  responseText; -->
<%="Server:" + greeting %>