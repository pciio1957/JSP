<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Front 연습</title>
<link rel="stylesheet" href="<%=path%>/z00_com/a01_com.css">
<style>

table {
	margin-bottom:20px;
	padding:20px;
}

</style>
</head>
<%-- 

#filter callback 함수
1. 형식
	$("선택자").filter(function(index, 단위객체){
		return 조건(boolean);
	}).속성메소드(속성, 속성값);

# not("선택자")
1. 해당 선택자의 반대되는 경우를 filter하여 선택처리한다.	

--%>
<%

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("Filter 함수 처리");
		
		// li 전체 객체 중 3번째 객체마다 초록색 지정, 나머지는 핑크로 지정
		$("li").filter(function(index, element){
			// 기본 배경 색상 처리, element : 단위객체 를 말함
			$(element).css("background", "pink");
			return index%3 == 2;
		}).css("background", "green");
		
		
		// 응용문제
		$("span").filter(function(idx, element2){
			$(element2).css("background","yellow");
			return idx%3 == 2;
		}).css("background","red").text("꽝!");
		
		// 짝수행이 아닌 경우 글자색 파란색 지정
		$("li").not(":even").css("color", "blue");
		
		// 3배수 객체가 아닌 경우 글자색 지정
		$("li").not(function(index, element3){
			return index%3 == 2;
		}).css("color", "orange");
	});
</script>
<body>
	<h2 align="center"></h2>

	<ul>
		<% for(int cnt=1;cnt<=10;cnt++) { %>
		<li>아이템_<%= cnt %> </li>
		<% } %>
	</ul>	
	
	<!--   
	
	응용) span을 활용하여 1~20까지 출력(기본 배경색 노랑색)하되
		3단위마다 꽝!이라는 표시와 함께 배경색을 빨강색으로 처리 (3조 제출, 나머지 손들기)
	-->
	
	<% for(int x=1; x<=20; x++) { %>
	<span align="center"> 내용_<%= x %></span>
	<% } %>
	
</body>
</html>