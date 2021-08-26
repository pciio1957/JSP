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

응용) a02_syncExp.jsp 파일을 만들고 z02_data.txt (물건정보) 파일을 이용하여
			h2 클릭시 물건정보를 가져와서 출력하기 (3조 제출, 나머지 손들기)

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("ajax 비동기 응용문제").click(function(){
			var xhr = new XMLHttpRequest();
			alert(xhr + "객체가 만들어졌습니다!");
			
			// 마지막 동기/비동기는 true로 하면 안나옴 
			xhr.open("get", "z02_data.txt", false);
			
			xhr.send(); 
			
			// var data = xhr.responseText;
			// $("h3").text("받은 데이터: " + data);
			// 데이터가 html로 작성되었다면 렌더링을 위해 html 사용
			$("h3").html(xhr.responseText);
		});
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	<h3 align="center"> </h3>	
	
</body>
</html>