<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a01_start.*"
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

function insertFrm() {
	if(confirm("등록합니다")){
		location.href = "a0729_2_memberInsert.jsp";
	}
}
</script>
</head>
<%-- 
# 

--%>
<%

A05_PreparedDao dao = new A05_PreparedDao();
ArrayList<Member> memList = new ArrayList<Member>();
memList = dao.getMemList();

%>
<body>
	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		<tr><td colspan="2"><input type="button" onclick="insertFrm()" value="등록"/></td></tr>
	</table>	
	</form>
	<table>
		<tr><th>아이디</th><th>패스워드</th><th>이름</th>
		<th>권한</th><th>포인트</th></tr>
		<% for(Member mem:dao.getMemList()) { %>
		<tr ondblclick="detail('<%= mem.getId() %>')"><td><%= mem.getId() %></td>
		<td><%= mem.getPw() %></td>
		<td><%= mem.getName() %></td>
		<td><%= mem.getName() %></td>
		<td><%= mem.getName() %></td></tr>
		<% } %>	
	</table>	
<script>
function detail(id) {
	location.href="a0802_memDetail.jsp?id=" + id;
}
</script>
</body>
</html>