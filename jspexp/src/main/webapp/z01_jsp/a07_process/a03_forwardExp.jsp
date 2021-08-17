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

	응용) 물건명:[ ] 가격:[ ] [구매]
	구매한 물건은 @@@ 가격은 @@@ -> jsp include 페이지에서 처리 (a04_sub.jsp)
	(1조 제출, 나머지 손들기)

--%>
<%

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("물건 구매 예제");
	});
</script>
<body>
	<h2 align="center"></h2>

	<form>
		<table align="center" class="listTable">
			<tr><th>물건명</th><td><input type="text" value="" name="pname"/></td></tr>
			<tr><th>가격</th><td><input type="text" value="" name="price"/></td></tr>
			<tr><td colspan="2"><input type="submit" value="구매"/></td></tr>
		</table>
	</form>
	
	<%
		String pname = request.getParameter("pname");
		String price = request.getParameter("price");
		if(pname != null) {
	%>
	
	<%-- jsp:include 지시자에 의해 분리되더라도 query는 공유되기에 js코드에 신경써야한다 --%>
	
	<jsp:include page="a04_sub.jsp" flush="true">
		<jsp:param value="<%= pname %>" name="pname"/>
		<jsp:param value="<%= price %>" name="price"/>
	</jsp:include>
	<% } %>
	
	
</body>
</html>