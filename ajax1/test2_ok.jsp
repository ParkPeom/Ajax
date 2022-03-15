<%@ page contentType="text/xml; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
		
	
%>

<!-- 여기 자체를 xml로 보내고 싶다면 위에서 text/xml  사용자에게 보내주는 형태는 xml 형태  -->
<!-- 이 데이터를 받아서 파싱해서 출력할것이다.  -->
<!--  태그 , 속성(Attribute) - attr -->
<root>
	<status>권장도서</status>
	<record id="1">
		<subject><%=subject %></subject>
		<content><%=content %></content>
	</record>
	<record id="2">
		<subject>도깨비</subject>
		<content>유인나</content>
	</record>
</root>				

