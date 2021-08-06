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
		document.querySelector("h3").innerText="Post방식 전송";
	}

</script>
</head>
<%-- 
# 

--%>

<body>
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	
	
<%

String ename = request.getParameter("ename");

%>

	<table>
		<tr><th>사원명</th><td><%= ename %></td></tr>
	</table>	
	
	
	
	<%--
	
	응용) post방식을 이용해 구매할 도서명 가격 갯수를 입력하여 출력하기  (3조)
	
	--%>
	
	<% 
		String bname = request.getParameter("bname");
		String bprice = request.getParameter("bprice");
		String bcnt = request.getParameter("bcnt");
		
		if(bname == null) {
	%>
	
	<h2 align="center">도서 정보 입력</h2>
	<form id="frm02" method="post">
	<table>
		<tr><th>도서명</th><td><input type="text" name="bname" value=""/></td></tr>
		<tr><th>도서가격</th><td><input type="text" name="bprice" value=""/></td></tr>
		<tr><th>도서수</th><td><input type="text" name="bcnt" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="구매"/></td></tr>
	</table>	
	</form>
	
	<% } else { %>
	<br><br><br>
	<table>
		<tr><th>도서명</th><td><%= bname %></td></tr>
		<tr><th>도서가격</th><td><%= bprice %></td></tr>
		<tr><th>도서수</th><td><%= bcnt %></td></tr>		
		<tr><th>총가격</th><td><%= Integer.parseInt(bcnt) * Integer.parseInt(bprice) %></td></tr>		
	</table>
	<% } %>
</body>
</html>