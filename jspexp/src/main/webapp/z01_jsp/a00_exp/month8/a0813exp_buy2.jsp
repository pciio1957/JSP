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

table {
	margin-bottom:20px;
	padding:20px;
}

</style>
</head>
<%-- 
# 

--%>
<%
	// 숫자 데이터는 Wrapper 클래스로 가져올 수 있다
	int point = (Integer) session.getAttribute("pay");
	point -= 10;
	session.setAttribute("pay", point);
%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("구매페이지 (20차감)");
	});
</script>
<body>
	<h2 align="center"></h2>
	<h3 align="center">구매 후 현재 포인트 : <%= point %></h3>
	<h3 align="center" onclick="location.href='a0813exp_buy1.jsp'">물건 구매 페이지1 이동</h3>
	<h3 align="center" onclick="location.href='a0813exp.jsp'">초기포인트 설정</h3>
	
</body>
</html>