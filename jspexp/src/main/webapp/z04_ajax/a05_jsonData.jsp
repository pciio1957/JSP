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

#ajax로 json 데이터 로딩
1. 서버단에 있는 핵심 json 형식의 데이터를 ajax로 가져오는 것을 말한다
2. ajax처리 json 데이터 필수 형식
	1) {속성:속성값}, [{속성:속성값..}]
	2) 웹 서비스상 json형식은 다음과 같은 형식을 준수하여야 
		정상적으로 객체화하여 사용할 수 있다
	3) 형식 ★★ ajax사용시 반드시 지켜야한다!
		{"속성":"문자열데이터", "속성":숫자형/boolean형 데이터}
		속성은 반드시 ""(쌍따옴표) 사이에 입력해야한다
		문자열 데이터도 반드시 "" 사이에 입력해야한다
		
		cf) '' 사이에 입력하거나 따옴표없이 입력하는 것은 정상적인 처리가 되지않음
			숫자형/boolean형 데이터는 반드시 ""나 '' 따옴표없이 그대로 처리해야한다
			
3. responseText로 받은 데이터는 문자열형 json데이터이기 때문에 
	객체로 사용하기 위해서는 eval('(' + xhr + ')') 형식의 eval함수를 이용해야한다
	JSON.parse(xhr)객체 함수 이용
	-> 네트워크로 전달되어 온 데이터는 문자열형이므로 객체로 변환하여 사용할 수 있다.
		eval('(' + xhr + ')') 함수, JSON.parse(xhr)
	
	cf) json객체로 서버에서 전달해오면 html화면을 구현된 내용을 처리하는 것보다 
		복잡하고 유효성체트를 해야하는 단점이 있지만 서버에서 오는 데이터에 대한 
		부담을 줄여주기때문에 보다 빠르고 효율적으로 처리할 수 있는 장점을 가지고 있다

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("json 데이터 ajax 로딩").click(function(){
			
			var xhr = new XMLHttpRequest();
			
			xhr.open("get", "z05_data.txt", true);
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200) {
					
					// 1. json 문자열을 객체로 변경
					var p01 = eval('(' + xhr.responseText +')');
					console.log(p01);
					$("td").eq(0).text(p01.name);
					$("td").eq(1).text(p01.age);
					$("td").eq(2).text(p01.loc);
				}
			};
			
			// 데이터를 서버로 보냄
			xhr.send();
		});
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	
	<table align="center" class="listTable">
		<tr><th>이름</th><th>나이</th><th>위치</th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>
	
	
	<!--  응용) z06_data.txt에 구매정보를 json형태로 선언후 
			a06_buyList.jsp에 구매정보를 테이블로 리스트 처리하기 
			(5조 제출, 나머지 손들기) -->
	
	
</body>
</html>