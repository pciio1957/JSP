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
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("5번 문제 풀이");
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	
	<h3 align="center">영화 예매 시스템</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>영화제목</th><td><input type="text" name="title" value=""/></td></tr>
		<tr><th>분류</th>
			<td>
				<select name="kind" style="width:100%">
					<option>일반</option>
					<option>3D</option>
					<option>4D</option>
				</select>
			</td>
		</tr>
		<tr><th>금액</th><td><input type="text" name="pay" value=""/></td></tr>
		<tr><th>관람갯수</th><td><input type="text" name="cnt" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="예매"/>
		</td></tr>
	</table>	
	</form>
	
	<%
	
	String title = request.getParameter("title");
	String kind = request.getParameter("kind");
	String pay = request.getParameter("pay");
	String cnt = request.getParameter("cnt");
	
	System.out.println(title);
	System.out.println(kind);
	System.out.println(pay);
	System.out.println(cnt);
	
	if(title != null) {
		
		response.addCookie(new Cookie(URLEncoder.encode(title, "utf-8"), cnt));
		response.sendRedirect("a0820_show.jsp");
	}
	
	%>

</body>
</html>