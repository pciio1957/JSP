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
		document.querySelector("h3").innerText="물건정보 입력";
	}

</script>
</head>
<body>


	<!--  
	
	응용) a16_formReq.jsp를 통해서 물건명 가격 갯수를 입력해서 전송하는 순간
	a17_rev.jsp를 통해서 위 데이터를 전송받게 처리하기 (2조) 
	-->
	<h3 align="center"></h3>
	<form id="frm01" action="a17_rev.jsp">
		<table>
			<tr><th>물건명</th><td><input type="text" name="pname" ></td></tr>
			<tr><th>가격</th><td><input type="text" name="price" ></td></tr>
			<tr><th>갯수</th><td><input type="text" name="pcnt"></td></tr>
			<tr><td colspan="2"><input type="submit" value="입력하기"></td></tr>
		</table>
	</form>
	
	
	
	
</body>
</html>