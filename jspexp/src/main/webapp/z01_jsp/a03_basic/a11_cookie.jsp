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
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>

</style>
<script type="text/javascript">
	window.onload = function() {
		document.querySelector("h3").innerText="쿠키 응용문제";
	}

</script>
</head>
<%-- 
# 

--%>
<%

// 응용) a10_cookie.jsp를 통해 쿠키를 한글 제외, pname, price, cnt로 저장
// a11_prodCookie.jsp를 통해 쿠키를 확인하기 (2조)

Cookie ck1 = new Cookie("pname", "computer");
Cookie ck2 = new Cookie("price", "10000000");
Cookie ck3 = new Cookie("cnt", "2");

response.addCookie(ck1);
response.addCookie(ck2);
response.addCookie(ck3);

%>
<body>
	<h3 align="center"></h3>
	<a href="a11_prodCookie.jsp" align="center">쿠키 확인</a>
</body>
</html>