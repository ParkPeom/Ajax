<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	
	/* 넘어오는 데이터  */
	
	String userId = request.getParameter("userId");
	
	String str = "";
	
	// null 이아니면 실행
	if(!userId.equals("")) {
		
		for(int i=0; i<50000; i++) {
			System.out.print("delay");
		}
		
		if(userId.startsWith("suzi")){ // 아이디를 읽어왔으면 나중에 db에서 select 해오면 된다.
 			
			str = userId + "는 유효한 아이디 입니다.";
		} else {
			str = userId + "는 유효한 아이디가 아닙니다.";			
		}
	}
	
%>
<!-- 처리하고 str를 돌려줌 -->
<%=str%>  