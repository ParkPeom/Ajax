<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	/* 너무왔다가 훅 가버리니까   */
	
	/* 서버가 작업을 하는동안  */
	for(int i=0; i<300; i++) {
		System.out.print("delay.....");
			
	}
%>

Hello Ajax!!!