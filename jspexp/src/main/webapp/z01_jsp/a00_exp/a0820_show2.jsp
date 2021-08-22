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
# 

--%>
<%

	String ckNames[] = request.getParameterValues("ck");
	if(ckNames != null && ckNames.length > 0) {
		for(Cookie ck:request.getCookies()) {
			for(String name:ckNames) {
				if(ck.getName().equals(name)){
					ck.setMaxAge(0);
					response.addCookie(ck);
				}
			}
		}
		response.sendRedirect("a0820_show.jsp");
	}

%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("예매 내역");
		
		$("#btnPre").click(function(){
			location.href = "a0820exp.jsp";
		});
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	
	<table align="center" class="listTable">
		<tr><th>ck</th><th>영화명</th><th>예약인원</th></tr>
		<% for(Cookie ck:request.getCookies()){ 
				if(!ck.getName().equals("JSESSIONID")) {%>
			<tr><td><input type="checkbox" name="ck" value="<%= URLDecoder.decode(ck.getName(), "utf-8") %>"/></td>
			<td><%= URLDecoder.decode(ck.getName(), "utf-8") %></td><td><%= ck.getValue() %></td></tr>
		<% }} %>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="삭제"/>
			<input type="button" id="btnPre" value="예약하러가기"/>
		</td></tr>
	</table>	
	
</body>
</html>