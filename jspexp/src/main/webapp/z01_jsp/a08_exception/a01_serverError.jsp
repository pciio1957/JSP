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
<%-- 
#에러처리
1. 페이지별 에러처리
 - 에러 페이지 지정 : errorPage = "예외발생시 보여줄 에러페이지"
 - 에러 페이지 작성 : isErrorPage = "true", exception.getMessage(),
 				exception.printStackTrace()
 
2. 웹서버 전체적으로 에러 지정
	web.xml
	1) 에러코드별(http)로 에러지정
	<error-page>
		<error-code>에러코드</error-code>
		<location>에러페이지 uri</location>
	</error-page>

--%>
<%
String s = null;
int nums[] = new int[5];
nums[5] = 1;

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
<body>
	
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="검색"/>
		</td></tr>
	</table>	
	</form>
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>