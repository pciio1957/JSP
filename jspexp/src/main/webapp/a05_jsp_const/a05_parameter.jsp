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
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
</head>
<%-- 
#요청값 처리
1. get/post 방식에 의해 전달해온 요청값을 처리하는 메소드들
2. 요청값 형식
	페이지?key1=value1&key2=value2&key3=value3;
3. 지원메소드
	1) String value1 = request.getParameter("key1");
		System.out.println("요청값: " + value1);
	
	2) String regs[] = request.getParameterValues("동일한이름의 요청키");
		페이지?buyprod=사과&buyprod=바나나&buyprod=딸기
		String prods[] = request.getParameterValues("buyprod");
		for(String prod:prods) {
			System.out.println(prod);
		}

--%>

<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>구매자명</th><td><input type="text" name="buyer" value=""/></td></tr>
		<tr><th>구매물건1</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>구매물건2</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>구매물건3</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center"><input type="submit" value="구매"/></td></tr>
	</table>	
	</form>
	
	
	<%

	String buyer = request.getParameter("buyer");
	String pnames[] = request.getParameterValues("pname");
	
	%>
	<% if(buyer != null) { %>
	<table align="center" class="listTable">
		<tr><th>구매자명</th><td><%= buyer %></td></tr>
		<% for(int idx=0; idx<pnames.length; idx++) { %>
		<tr><th>구매물건 <%= idx+1 %></th><td><%= pnames[idx] %></td></tr>
		<% } %>
	</table>	
	<% } %>
</body>
</html>