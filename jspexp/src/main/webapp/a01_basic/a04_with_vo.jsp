<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a01_start.A01_Movie"
%>
   
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();

	
	// 응용) A02_Entertainer 클래스를 생성하고 연예인이름, 생년월일, 분야
	// 속성을 설정하고 a05_with_vo.jsp에 출력하기 (4조)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 외부 CSS 설정 호출 -->
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript">
	window.onload = function() {
		document.querySelector("h3").innerText="시작";
	}

</script>
</head>
<body>
	<% 	A01_Movie m = new A01_Movie("블랙위도우", 1000, "2021.07.22");
		
	%>
	<h3></h3>
	<table>
		<tr><th>영화제목</th><td><%= m.getTitle() %></td></tr>
		<tr><th>관객수</th><td><%= m.getVisitCnt() %></td></tr>
		<tr><th>개봉일</th><td><%= m.getOpenDate() %></td></tr>
		<tr><th></th><td></td></tr>
	</table>
</body>
</html>