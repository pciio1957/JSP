<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z01_database.*"
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
<%-- 
# 

--%>
	<form id="frm02">
	<table>
		<tr><th colspan="2">놀이공원 입장료 : 50000</th></tr>
		<tr><th>나이</th><td><input type="text" name="age" value=""/></td></tr>
		<tr><th>인원</th><td><input type="text" name="cnt" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="입장료계산"/></td></tr>
	</table>
	</form>
	
	
<%

String ageS = request.getParameter("age");
String cntS = request.getParameter("cnt");

if(ageS == null) ageS = "0";
if(cntS == null) cntS = "0";

if(ageS != null) {
	int age = Integer.parseInt(ageS);
	int cnt = Integer.parseInt(cntS);
	
	double sale = 50000;
	
	if(age > 60 || age < 8) {
		sale = 50000 * 0.7;
	} else if (age < 14) {
		sale = 50000 * 0.8;
	} else if(age < 19) {
		sale = 50000 * 0.9;
	} 
	
	int tot = (int) sale * cnt;

%>

<table>
<tr><th>계산된 입장료 금액</th></tr>
<tr><td><%= tot %></td></tr>
</table>


<% } %>
</body>
</html>