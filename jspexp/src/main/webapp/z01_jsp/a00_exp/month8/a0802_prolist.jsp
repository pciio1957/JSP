<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z01_database.*"
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
<%-- 
# 

--%>
<%

a01_Dao dao = new a01_Dao();
ArrayList<Product> pList = new ArrayList<Product>();
pList = dao.getProList();

%>
<body>
	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		<% for(Product p:pList) { %>
		<tr><th>물건명</th><td><input type="text" name="pname" value="<%= p.getName() %>"/></td></tr>
		<tr><th>가격</th><td><input type="text" name="pice" value="<%= p.getPrice() %>"/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt" value="<%= p.getCnt() %>"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<% } %>
	
</body>
</html>