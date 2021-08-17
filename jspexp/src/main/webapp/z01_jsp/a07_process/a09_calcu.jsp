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
	응용) 계산기 숫자1[ ] 숫자2[ ] 연산자 [select]
		a09_calcu.jsp
		a10_plus.jsp  @@ + @@ = @@
		a11_minus.jsp  @@ - @@ = @@
		a12_multi.jsp  @@ * @@ = @@
		a13_divide.jsp  @@ / @@ = @@
		(2조 제출, 나머지 손들기)
--%>
<%
	String operator = request.getParameter("operator");
%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("계산기 예제");
		
		$("[name=operator]").change(function(){
			$("form").submit();
		});
	});
</script>
<body>

	<% if(operator != null && !operator.equals("")) { %>
	<jsp:forward page="<%= operator %>"/>
	<% } %>

	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>숫자1</th><td><input type="text" name="num01" value="0"/></td></tr>
		<tr><th>숫자2</th><td><input type="text" name="num02" value="0"/></td></tr>
		<tr><th>연산자</th><td>
			<select name="operator">
				<option value="">연산자선택</option>
				<option value="a10_plus.jsp">+</option>
				<option value="a11_minus.jsp">-</option>
				<option value="a12_multi.jsp">*</option>
				<option value="a13_divide.jsp">/</option>
			</select>
		</td></tr>
	</table>	
	</form>

</body>
</html>