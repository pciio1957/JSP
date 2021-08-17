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
		document.querySelector("h3").innerText="시작";
	}

</script>
</head>
<%-- 
#쿠키 설정
0. 서버와 클라이언트의 대화
1. 결과로 특정한 데이터를 클라이언트에 저장할 때 : 쿠키
2. 결과로 특정한 데이터를 서버에 저장할 때 : 세션
3. 서버 클라이언트
	클라이언트 ===(request)==> 서버
			<==(response)== 
			
4. 쿠키는 response 객체로 전달받아 -> 클라이언트(브라우저)에 저장
5. 세션은 request 객체로 전달받아 -> 서버에 저장

--%>
<%
Cookie c1 = new Cookie("name", "himan");
response.addCookie(c1); //서버에 클라이언트(브라우저)에 쿠키값을 전달하여 저장처리
Cookie c2 = new Cookie("age", "25");
response.addCookie(c2); //서버에 클라이언트(브라우저)에 쿠키값을 전달하여 저장처리
Cookie c3 = new Cookie("loc", "seoul");
response.addCookie(c3); //서버에 클라이언트(브라우저)에 쿠키값을 전달하여 저장처리


// 응용) a10_cookie.jsp를 통해 쿠키를 한글 제외, pname, price, cnt로 저장
// a11_prodCookie.jsp를 통해 쿠키를 확인하기 (2조)
%>
<body>
	<h3 align="center"></h3>
	<a href="a10_showCookie.jsp">저장된 쿠키값 확인하러가기</a>	
	
</body>
</html>