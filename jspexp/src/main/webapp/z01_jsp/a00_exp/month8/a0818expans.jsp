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
# 

--%>
<%

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#title").text("8월 18일 문제풀이");
		
		$("[type=button]").click(function(){
			if($(this).val() == "로그인1") $("[name=page01]").val("a0818_Login.jsp");
			if($(this).val() == "메뉴1") $("[name=page01]").val("a0818_menu1.jsp");
			if($(this).val() == "메뉴2") $("[name=page01]").val("a0818_menu2.jsp");
				
			$("#frm01").submit(); // form을 구분하여 처리하여 요청페이지 처리
		});
		
		$("h2").text("안녕");
		$("h3").text("반갑습니다!");
		$("h2").css("background", "yellow").add("h3").css("color", "navy");
	});
</script>
<body>
	<h2 id="title" align="center"></h2>
	<!--  4번 문제 -->
	<form id="frm01">
		<input type="hidden" name="page01" value=""/>
	</form>
	<p align="center">
	<input type="button" value="로그인" id="btnLogin"/>
	<input type="button" value="메뉴1" id="btnMenu1"/>
	<input type="button" value="메뉴2" id="btnMenu2"/></p>
	
	<% 
	String goPage = request.getParameter("page01");
	System.out.println("포함될 페이지1: " + goPage);
	if(goPage == null || goPage.equals("")) goPage = "a0818_Login.jsp";
	System.out.println("포함될 페이지2: " + goPage);
	%>
	
	<jsp:include page="<%= goPage %>"/>
	
	
	<!--  7번 문제 -->
	<h3 align="center"></h3>
	<h3 align="center"></h3>
	<h3 align="center"></h3>
	<h3 align="center"></h3>
	<h2 align="center"></h2>
	<h2 align="center"></h2>
	<h3 align="center"></h3>
	<h2 align="center"></h2>
	<h3 align="center"></h3>
	<h2 align="center"></h2>
	<h2 align="center"></h2>
	
</body>
</html>