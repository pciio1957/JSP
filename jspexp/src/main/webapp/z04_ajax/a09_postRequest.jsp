 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Front 연습</title>
<link rel="stylesheet" href="${path}/z00_com/a01_com.css">
<style>

table {
	width:70%;
	margin-bottom:20px;
	padding:20px;
}

td {
	text-align:center;	
}

</style>
</head>
<%-- 

#

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

			var xhr = new XMLHttpRequest();

			$("[name=id],[name=pass]").keyup(function(event){
				console.log(event.keyCode);
				
				// 엔터키를 눌렀을 때 처리하도록
				if(event.keyCode == 13) {
					var id = $("[name=id]").val();
					var pass = $("[name=pass]").val();
					var snd = "id=" + id + "&pass=" + pass;
					console.log(snd);
					
					// 비동기 방식
					xhr.open("post", "z10_data.jsp", true);
					
					// 1. post방식일 때 header부분 설정 변경
					xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
					xhr.send(snd);
					xhr.onreadystatechange = function(){
						if(xhr.readyState == 4 && xhr.status == 200) {
							$("div").html(xhr.responseText);
						}
					}
				}
			});
	});
</script>
<body>
	<h2 align="center">비동기 post 방식</h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>패스워드</th><td><input type="text" name="pass" value=""/></td></tr>
	</table>	
	</form>
	<div></div>
	
	
	
	<!-- 응용) a10_postReqExp.jsp 물건명, 가격, 갯수 입력 후 enter 처리
			 z11_data.jsp 물건명 총계 출력 (5조 제출, 나머지 손들기)  -->
</body>
</html>