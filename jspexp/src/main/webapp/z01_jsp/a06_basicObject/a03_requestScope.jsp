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

응용) request 범위로 데이터(물건명, 가격, 갯수)를 설정해서 a04_requestPage.jsp에서 
	데이터를 확인할 수 있도록 처리하기 (5조 제출, 나머지 손들기)

--%>

<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
		
	});
</script>
<body>
	<jsp:forward page="a04_requestPage.jsp"/>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value=""/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="검색" id="btnSelect"/>
		</td></tr>
	</table>	
	</form>
<%

	// request.setAttribute("rqpname", "태블릿");
	// request.setAttribute("rqprice", "100000");
	// request.setAttribute("rqcnt", "2");
	
	request.setAttribute("prod", new Product("사과",3000,2));
	
%>
	
</body>
</html>