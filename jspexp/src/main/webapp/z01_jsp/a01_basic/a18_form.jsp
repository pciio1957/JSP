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

	<h3 align="center"></h3>
	<form id="frm01" action="a19_rev.jsp">
		<table>
			<tr><th>도서명</th><td><input type="text" name="bname"></td></tr>
			<tr><th>저자</th><td><input type="text" name="bwriter"></td>
			<td rowspan="2"><input type="submit" name="save" value="입력하기"></td></tr>
		</table>
	</form>
</body>
</html>