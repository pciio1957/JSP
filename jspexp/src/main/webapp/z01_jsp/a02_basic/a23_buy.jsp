<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a01_start.*"
    import="jspexp.z02_vo.*"
    import="jspexp.z02_vo.Product"
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
	
	// 1. data 할당해오기
	String pnameS = request.getParameter("pname");
	String priceS = request.getParameter("price");
	String pcntS = request.getParameter("pcnt");
	
	if(pnameS == null) pnameS=""; 
	if(priceS == null) priceS = "0";
	if(pcntS == null) pcntS = "0";
	
	String pname = pnameS;
	int price = Integer.parseInt(priceS);
	int cnt = Integer.parseInt(pcntS);
	
	int tot = price * cnt;
	
	// 2. vo객체에 할당처리하기 
	Product prod = new Product(pname, price, cnt);
	%>

	<h3 align="center"></h3>
	<form id="frm01">
		<table>
			<tr><th>물건명</th><td><%= prod.getName() %></td></tr>
			<tr><th>가격</th><td><%= prod.getPrice() %></td></tr>
			<tr><th>갯수</th><td><%= prod.getCnt() %></td></tr>
			<tr><th>구매총계</th><td><%= prod.getPrice() * prod.getCnt() %></td></tr>
		</table>
	</form>
</body>
</html>