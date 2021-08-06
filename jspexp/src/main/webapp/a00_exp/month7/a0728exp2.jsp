<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a01_start.*"
    import="jspexp.z02_vo.*"
    import="java.util.*"
%>
   
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
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
		document.querySelector("h3").innerText="영화예매 결과";
	}

</script>
</head>
<body>

<%

boolean isValid = true;
String mname = request.getParameter("mname");
String mpersonS = request.getParameter("mperson");
String mpriceS = request.getParameter("mprice");
String mtime = request.getParameter("mtime");

// 마지막 데이터로 입력확인,, 
if(mname == null) mname = "";
if(mpersonS == null) mpersonS = "0";
if(mpriceS == null) mpriceS = "0";		
if(mtime == null) {
	mtime = "";
	isValid = false;
	
} else {
	
	int mperson = 0;
	if(mpriceS != null) 
		Integer.parseInt(mpersonS); //  이렇게 조건으로 처리도 가능
	int mprice = Integer.parseInt(mpriceS);
	
	int sum = mperson * mprice;

%>

	<h3 align="center"></h3>
		<table>
			<tr><th>영화제목</th><td><%= mname %></td></tr>
			<tr><th>상영시간</th><td><%= mtime %></td></tr>
			<tr><th>입장인원</th><td><%= mperson %></td></tr>
			<tr><th>총 비용</th><td><%= sum %></td></tr>
		</table>
	<% } %>
	
	
<script>

	var isValid = <%= isValid %>;
	if(!isValid) {
		alert("현재 페이지는 입력 후 처리되는 페이지입니다");
		location.href="a0728exp.jsp";
	}
</script>
</body>
</html>