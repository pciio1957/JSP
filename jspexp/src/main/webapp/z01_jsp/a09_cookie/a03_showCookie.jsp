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

	// 쿠키 삭제
	// 1. check한 쿠키값이 넘어온다 
	String ckNames[] = request.getParameterValues("ck");
	if(ckNames != null && ckNames.length>0) {
		// 2. 저장되어있는 쿠키값 
		for(Cookie ck:request.getCookies()) {
			// 3. 삭제할 쿠키이름 
			for(String cnm:ckNames) {
				// 4. 기존 쿠키값과 삭제로 요청되어 온 쿠키값 비교
				if(ck.getName().equals(cnm)) {
					// 5. 해당하는 쿠키는 유효기간을 0으로 지정, 
					// 		client에 response 객체로 전달
					ck.setMaxAge(0);
					response.addCookie(ck);
				}
			}
		}
		// 6. 서버단에서 페이지를 전환하여 변경된 쿠키값 확인
		response.sendRedirect("a03_showCookie.jsp");
	}
%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("저장된 쿠키 확인");
		$("h3").text("쿠키만들러가기").click(function(){
			location.href = "a02_cookieMake.jsp";
		});
	});
</script>
<body>
	<h2 align="center"></h2>
	<h3 align="center"></h3>
	
	<form method="post">
		<table align="center" class="listTable">
			<tr><th>ck</th><th>쿠키이름</th><th>쿠키값</th></tr>
			<% for(Cookie ck:request.getCookies()) { %>
				<tr>
					<td>
						<input type="checkbox" 
							name="ck" value="<%= URLDecoder.decode(ck.getName(), "utf-8") %>"/>
					</td>
					<td>
						<%= URLDecoder.decode(ck.getName(), "utf-8") %>
					</td>
					<td>
						<%= URLDecoder.decode(ck.getValue(), "utf-8") %>
					</td>
					</tr>
			<% } %>
			<tr><td colspan="3" style="text-align:center;">
				<input type="submit" value="쿠키삭제"/>
			</td></tr>
		</table>	
	</form>
</body>
</html>