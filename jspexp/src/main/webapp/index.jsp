<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>드디어 backend단 시작</h2>
	<h2><%= "hello jsp" %></h2>
	<h3>${'hello jsp'}</h3>



<%-- 

validation disable
	// <%= > :  expression 형태로 jsp의 코드 출력 java코드 + html
	// jsp 주석 : front-end단 출력 안됨 
	// el 태그로 jsp에서 내부적으로 java 소스코드로 변환해주기 때문에 효과적으로 script 코드 처리 가능


 --%>

<!-- html 주석 : front-end단에 출력됨 -->

</body>
</html>