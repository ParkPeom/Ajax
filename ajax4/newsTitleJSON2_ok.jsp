<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%!
/* db에서 가져온 데이터 라고 생각해본다. */	

String[] newsTitle = {
		"[속보]윤석열 부동산 정책, 집값 '대세 하락' 가속화하나",
		"물가는 뛰고, 경기는 힘 빠지고…韓 경제 스태그플레이션 진입하나",
		"조국사태 교훈? 尹측 靑 인사 추천만, 법무 경찰이 검증",
		"'친문 전력' 김오수 어떡하나…권성동 스스로 거취 정해야",
		"[강준만의 직설] '충성 경쟁'이 대통령을 망친다",
		"코로나 신규확진 40만명대…정부는 감염병 등급 하향",
};

String[] newsPublisher = {
		
		"중앙","CNN","한국","JTBC","KBS","MBC"
};

%>
<!-- 데이터 이니까 {} 중괄호 있어야됨  -->

{
	"count":<%=newsTitle.length %>,
	"titles":[
	
	<!-- 일반적인 데이터를 json 형태로 만듬  -->
<% 	
	for(int i=0; i<newsTitle.length;i++) {
		out.print("{");
		out.print("headline:\""+newsTitle[i] + "\""); /*  { 헤드라인 만듬  */
		out.print(",");
		out.print("publisher:\""+newsPublisher[i] + "\"");
		out.print("}"); 
		
		/* 계속 만드는데 마지막에 , 안오게함   */
		if(i!=(newsTitle.length-1)) {
			out.print(",");
		}
	}
%>
	]
}