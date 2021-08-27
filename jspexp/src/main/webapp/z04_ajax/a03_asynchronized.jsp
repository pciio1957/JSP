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
		$("#h2Obj").text("비동기 처리 방식").click(function(){
			
			// 1. 객체 생성
			var xhr = new XMLHttpRequest();
			xhr.open("get", "z03_data.txt", true); // 동기방식으로 처리 
			
			// 2. 요청값 및 자원호출 처리
			xhr.send();
			
			// 3. 이벤트 핸들러 정의 (서버에 상태값이 변경되는 이벤트 발생시)
			// 상태값이 계속 바뀌는 경우 비동기 처리 
			xhr.onreadystatechange = function() {
				console.log("서버와 상태값 변경 코드 : " + xhr.readeyState);
				console.log("서버와 결과 변경 http코드 : " + xhr.status);
				// xhr.readyState : 비동기 통신을 하면서 객체가 만들어지는 상태값을 가져온다
				// 0 : 객체생성, 1/2 : 데이터생성준비, 3 : 데이터 일부 받음
				// 4 : 데이터를 완전히 받을 때
				
				// xhr.status : 서버에 요청한 결과값을 받는 코드 (http 결과코드)
				// 200 ~ 299 : 정상처리, 일반적으로 200을 사용
				// 전송이 다 되고 결과 코드도 200일 때 결과값 받기 처리
				if(xhr.readyState == 4 && xhr.status == 200) {
					$("h3").text(xhr.responseText);
				}
			}
			
		});
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	<h3 align="center"> </h3>
	
	
	<!-- 응용) a04_asyncExp.jsp 파일에 z04_data.txt 데이터파일 사용
			사원정보 클릭시 tr안에 사원명, 급여, 부서명을 비동기로 가져오기 (4조 제출, 나머지 손들기) -->
	
</body>
</html>