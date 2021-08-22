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
		$("#h2Obj").text("${id}님 로그인 중...");
		
		$("#regBtn").click(function(){
			$("[name=proc]").val("insert");
			$("form").submit();
		});
		$("#uptBtn").click(function(){
			$("[name=proc]").val("update");
			$("form").submit();
		});		
	
	});
	
	// 세션 설정이 되어있지않을 때 
	if("${id}"==""){
		alert("로그인이 필요합니다.\n로그인 페이지 이동")
		location.href="a06_login.jsp";
	}else{ 
		if("${param.proc}"=="insert") alert("등록처리수행");
		if("${param.proc}"=="update") alert("수정처리수행");
	}
	
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	
	<form id="frm01">
		<input type="hidden" name="proc"/>
	<table align="center" border>
		<tr><td style="text-align:center">
			<input type="button" id="regBtn" value="등록"/>
			<input type="button" id="uptBtn" value="수정"/>
		</td></tr>
	</table>	
	</form>
	
</body>
</html>