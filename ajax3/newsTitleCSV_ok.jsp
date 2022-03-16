<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%!
	/* 데이터를 만드는 곳 */

	// db에있는 내용을 select 해서 배열에 너놓는다.
	// 꼭 배열에 너놓지 않고 select 한 내용을 그냥 처리해줘도 된다.
	
	
	// 한사람이 다쓰는게 아니고 기자가 insert시키면 insert된 기사가 여기에 보여지게됨 (한명의 기자의 글이 보여지게됨)
	String[] newsTitle = {
			"[속보aaaaaaa]윤석열 부동산 정책, 집값 '대세 하락' 가속화하나",
			"물가는 뛰고, 경기는 힘 빠지고…韓 경제 스태그플레이션 진입하나",
			"조국사태 교훈? 尹측 靑 인사 추천만, 법무 경찰이 검증",
			"'친문 전력' 김오수 어떡하나…권성동 스스로 거취 정해야",
			"[강준만의 직설] '충성 경쟁'이 대통령을 망친다",
			"코로나 신규확진 40만명대…정부는 감염병 등급 하향",
	};
	// json 처럼 평범한 데이터로 보낼것이다. newsTitleCSV.jsp에 넘기면서 자기만의 약속을 정해줘야함
	
	/*
<!--  %!  클래스에 전역변수로 만들어진다 !를 안쓰면 Service라는 메소드 안에 만들어짐 , 서비스로 들어가면안된다. -->
	<!--  기사와기사 구분은 *  맨앞에 6은 기사의 개수 , 이것을 넘겨주면 코딩을 하나하나 풀어낼것임  -->
	<!--  csv데이터 형식 데이터들이 , 형태로 구분됨 ex)엑셀 -->
	
	<!-- 
		6|윤석열 부동산 정책, 집값 '대세 하락' 가속화하나[2022-03-16 오후02:26]* 
		[물가는 뛰고, 경기는 힘 빠지고…韓 경제 스태그플레이션 진입하나[2022-03-16 오후02:26]*
		...
		코로나 신규확진 40만명대…정부는 감염병 등급 하향[2022-03-16 오후02:26]
	 -->
	 
	<!-- 데이터들을 하나씩 꺼내서 위모양으로 만들것이다.  --> 
*/
%>
<%
	out.print(newsTitle.length + "|"); // 하나만찍힘  6 + |
	
	for(int i=0; i<newsTitle.length; i++) { // 6 , 
		
		out.print(newsTitle[i] + " [" + new Date() + "]");
		
		// 5가 왔을때 5 똑같으면 *를 붙이지 않는다.
		if(i!=(newsTitle.length-1)) {
			out.print("*");
		}
	}
%>