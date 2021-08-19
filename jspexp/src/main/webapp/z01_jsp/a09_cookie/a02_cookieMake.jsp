<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"
    import = "java.net.*"     
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
<link rel="stylesheet" href="<%=path%>/z00_com/a01_com.css">
<style>

table {
	margin-bottom:20px;
	padding:20px;
}

</style>
</head>
<%-- 
#쿠키(Cookie)
1. 쿠키는 웹 브라우저가 보관하고 있는 데이터로서 웹 서버에 요청을 보낼 때 함께 전송된다.
2. 동작 방식 
	1) 쿠키 생성 : 웹서버 -> 브라우저(쿠키저장소)
		response.addCookie(new Cookie(name, value));
	2) 쿠키 저장 : 브라우저의 쿠키 저장소에 저장 처리
	3) 쿠키 전송 : 브라우저 -> 웹 서버 (요청객체를 통해 전달)
		request.getCookies();
	
3. 쿠키의 구성
	1) 구성요소
		- 이름 : 각각의 쿠키를 구별하는 데 사용되는 이름
		- 값 : 쿠키의 이름과 관련된 값
		- 유효시간 : 쿠키의 유지 시간
		- 도메인 : 쿠키를 전송할 도메인
		- 경로 : 쿠키를 전송할 요청 경로 
	2) 쿠키 이름의 제약 (특수문자와 한글 처리)
		- 쿠키의 이름은 아스키 코드의 알파벳과 숫자만을 포함할 수 없다
		- 콤마, 세미콜론, 공백 등의 문자는 포함할 수 없다.
		- $로 시작할 수 없다. 

--%>
<%
	// 1. 쿠키 생성하기
	Cookie cookie = new Cookie("cookie01", "strawberryTaste");
	response.addCookie(cookie);
	
%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("쿠키 생성하기");
	});
</script>
<body>
	<%
	
	   // a02_cookieMake.jsp : 쿠키 요청값 생성 페이지
	   // a03_showCookie.jsp : 쿠키 확인 페이지

	String ckName = request.getParameter("ckName");
	String ckValue = request.getParameter("ckValue");
	
	
	if(ckName != null) {
		//Cookie c1 = new Cookie(ckName, ckValue);
		Cookie c2 = new Cookie(URLEncoder.encode(ckName, "utf-8"), URLEncoder.encode(ckValue, "utf-8"));
		response.addCookie(c2);
		// response.sendRedirect("이동할 페이지") : 서버단에서 페이지 이동 처리 
		response.sendRedirect("a03_showCookie.jsp");
	}
	
	%>

	<h2 align="center"></h2>
	<form>
		<table align="center" class="listTable">
			<tr><th>쿠키이름</th><td><input type="text" name="ckName" value=""/></td></tr>
			<tr><th>쿠키값</th><td><input type="text" name="ckValue" value=""/></td></tr>
			<tr><td colspan="2" style="text-align:center"><input type="submit" value="쿠키만들기"/></td></tr>
		</table>
	</form>	
	
	
	<!--  응용) 쿠키 생성하고 확인하는 페이지 작성하기 
		a04_buyBook.jsp (구매할 도서 - 구매처리 - 쿠키에 담기) 도서명, 가격
		a05_CartBook.jsp (현재 카트에 도서 담기)  (5조 제출, 나머지 손들기) 
	-->
	
	
</body>
</html>