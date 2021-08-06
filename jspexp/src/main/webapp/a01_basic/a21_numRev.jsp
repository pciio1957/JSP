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
		document.querySelector("h3").innerText="시작";
	}

</script>
</head>
<body>

	<%
	
	String num01S = request.getParameter("num01");
	String num02S = request.getParameter("num02");
	
	if(num01S == null) num01S = "0";
	if(num02S == null) num02S = "0";
	
	int num01 = Integer.parseInt(num01S);
	int num02 = Integer.parseInt(num02S);
	
	int sum = num01 + num02;
	

	
	%>

	<h2 align="center"><%= num01 %> + <%= num02 %> = <%= sum %></h2>
	
	

	<%
	
	String pname = request.getParameter("pname");
	String priceS = request.getParameter("price");
	String pcntS = request.getParameter("pcnt");
	
	
	if(priceS == null) priceS = "0";
	if(pcntS == null) pcntS = "0";
	
	int price = Integer.parseInt(priceS);
	int cnt = Integer.parseInt(pcntS);
	
	int tot = price * cnt;
	%>
	
	<form>
		<table>
			<tr><th>물건명</th><td><%= pname %></td></tr>
			<tr><th>가격</th><td><%= price %></td></tr>
			<tr><th>갯수</th><td><%= cnt %></td></tr>
			<tr><th>총계</th><td><%= tot %></td></tr>
		</table>
	</form>
	
</body>
</html>