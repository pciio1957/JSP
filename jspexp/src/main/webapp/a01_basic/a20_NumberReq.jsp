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
		document.querySelector("h3").innerText="숫자형 데이터 처리";
	}

</script>
</head>
<body>

	<h3 align="center"></h3>
	<form id="frm01" action="a21_numRev.jsp">
		<table>
			<tr><th>첫번째 숫자</th><td><input type="text" name="num01" value=""></td></tr>
			<tr><th>두번째 숫자</th><td><input type="text" name="num02" value=""></td></tr>
			<tr><td colspan="2"><input type="submit" value="합산"></td></tr>
		</table>
	</form>
	
	<%
	
	// 응용) 물건명, 가격, 갯수를 form으로 입력받아 다음페이지에서 
	// 		물건명과 총액을 출력하기 (4조)
	
	%>
	<h2 align="center">물건정보</h2>
	<form id="frm01" action="a21_numRev.jsp">
		<table>
			<tr><th>물건명</th><td><input type="text" name="pname" value=""></td></tr>
			<tr><th>가격</th><td><input type="text" name="price" value=""></td></tr>
			<tr><th>갯수</th><td><input type="text" name="pcnt" value=""></td></tr>
			<tr><td colspan="2"><input type="submit" value="합산"></td></tr>
		</table>
	</form>
</body>
</html>