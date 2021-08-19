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
	width:50%;
	margin-bottom:20px;
	padding:20px;
}

td {
	text-align:center;
}

</style>
</head>
<%-- 

 응용) 쿠키 생성하고 확인하는 페이지 작성하기 
	a04_buyBook.jsp (구매할 도서 - 구매처리 - 쿠키에 담기) 도서명, 가격
	a05_CartBook.jsp (현재 카트에 도서 담기)  (5조 제출, 나머지 손들기) 

--%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("도서 장바구니");
		
		$("h3").click(function(){
			location.href = "a04_buyBook.jsp";
		});
	});
</script>
<body>
	<h2 align="center"></h2>
	
	<%
	
	String bkNames[] = request.getParameterValues("delCk");
	if(bkNames != null && bkNames.length>0) {
		for(Cookie ce:request.getCookies()) {
			for(String str:bkNames) {
				if(ce.getName().equals(str)) {
					ce.setMaxAge(0);
					response.addCookie(ce);
				}
			}
		}
		response.sendRedirect("a05_CartBook.jsp");
	}
	
	%>

	<form method="post">
	<table align="center" class="listTable">
		<tr><th>ck</th><th>도서명</th><th>도서가격</th></tr>
		<% for(Cookie bk:request.getCookies()){
			
				if(!URLDecoder.decode(bk.getName(), "utf-8").equals("JSESSIONID")) {%>
		<tr>
			<td>
				<input type="checkbox" name="delCk" value="<%= URLDecoder.decode(bk.getName(), "utf-8") %>"/>
			</td>
			<td>
				<%= URLDecoder.decode(bk.getName(), "utf-8") %>
			</td>
			<td>
				<%= URLDecoder.decode(bk.getValue(), "utf-8") %>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="submit" value="삭제하기"/>
			</td>
		</tr>
		<% }} %>
	</table>	
	</form>
	
	<h3 align="center"> 도서 구매하러 가기 </h3>
	
</body>
</html>