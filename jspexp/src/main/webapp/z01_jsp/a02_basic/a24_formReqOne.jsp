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
	<form id="frm01">
		<table>
			<tr><th>물건 가격</th><td><input type="text" name="price" value=""></td></tr>
			<tr><th>물건 갯수</th><td><input type="text" name="cnt" value=""></td></tr>
			<tr><td colspan="2"><input type="submit" name="ck" value="총계"></td></tr>
		</table>
	</form>
	
	<%--
	
	#
	1. 초기 화면에 나타날 내용
	2. 요청값에서 처리할 내용
	3. 요청값이 초기화면/요청되었을 때 데이터를 구분해서 어떤 처리가 필요한지 생각 후 코딩
		1) 요청값이 초기화면에 데이터 확인
			null일때는 초기 화면 


	--%>
	
	<%
	
	String priceS = request.getParameter("price");
	String cntS = request.getParameter("cnt");
	System.out.println("가격 : " + priceS);
	System.out.println("갯수 : " + cntS);
	
	
	if(priceS == null) { // 초기화면
		priceS = "0";  // 에러가 발생하지 않게 처리 
	}
	
	if(cntS == null) { // 초기화면
		cntS = "0"; // 에러가 발생하지 않게 처리 
	}

	int price = Integer.parseInt(priceS);
	int cnt = Integer.parseInt(cntS);
	
	%>
	
	<% if(priceS != null) { %>
		<h2 align="center"><%= price * cnt %></h2>
	<% } %>
	
	
	<h2 align="center">결과</h2>
	<form id="frm02">
		<table>
			<tr><th>물건 가격</th><td><%= priceS %></td></tr>
			<tr><th>물건 갯수</th><td><%= cntS %></td></tr>
		</table>
	</form>
</body>
</html>