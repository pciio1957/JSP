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

#jstl의 반복문 처리
1. 기본 형식
	<c:forEach var="cnt" begin="시작변수" end="마지막변수" step="증감단위"/>
		<h2>${cnt}</h2>
	</c:forEach>
	
	- for문과 비교
	<% for(int cnt=시작변수; cnt<=마지막변수; cnt++(증감단위)) { %>
		<h2><%= cnt %> </h2>
	<% } %>
	
2. 기타 옵션
	<c:forEach var="cnt" items="${배열형 데이터}" varStatud="sts"/>
		<h2>%{sts.index}
		
	1) varStatus = "sts"
		${sts.index} : 반복문에서 0부터 시작하는 index를 출력
		${sts.count} : 반복문에서 1부터 시작하는 카운트 출력
		${sts.first} : boolean을 첫번째 값인지 여부를 나타냄
		${sts.last} : boolean으로 마지막 값인지 여부를 나타냄 

	int index = 0;
	int count = 1;
	boolean first = false;
	boolean last = false;
	for(String str:array) {
		if(index == 0) {
			first = true;
		}
		
		if(count == array.length) {
			last = true;
		}
		
		index++;
		count++;	
	}
--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

	});
</script>
<body>
	<h2 align="center">jstl의 반복문</h2>
	<br><br>
	
	<h3 align="center">1~15까지 출력</h3>
	<c:forEach var="cnt" begin="1" end="15">
		<span>${cnt } </span>
	</c:forEach>
	
	<h3 align="center">20~50까지 출력</h3>
	<c:forEach var="cnt2" begin="20" end="50" step="2">
		<span>${cnt2 } </span>
	</c:forEach>
	
	
	<!-- 응용) 반복문 연습
		1. 1 ~ 7까지 출력하면 h5로 안녕하세요 
		2. 테이블의 열을 1~3열까지 @@행 @@열 표기
		3. 테이블의 행을 1~5행까지 @@행 @@열 표기 
		(5조 제출, 나머지 손들기)  -->
	
	
	<h3 align="center">1~7출력</h3>
	<c:forEach var="cnt" begin="1" end="7">
		<h5 align="center">안녕하세용</h5>
	</c:forEach>
	
	
	<h3 align="center">3열 테이블 생성</h3>
	<table align="center" class="listTable">
		<c:forEach var="cnt" begin="1" end="1">
			<tr>
			<c:forEach var="cnt2" begin="1" end="3">
				<td>${cnt } 행 ${cnt2 }열</td>
			</c:forEach>
			</tr>
		</c:forEach>
	</table>
	
	<h3 align="center">5행 테이블 생성</h3>
	<table align="center" class="listTable">
		<c:forEach var="cnt" begin="1" end="5">
			<tr>
			<c:forEach var="cnt2" begin="1" end="1">
				<td>${cnt } 행 ${cnt2 }열</td>
			</c:forEach>
			</tr>
		</c:forEach>
	</table>
	
	
	<h3 align="center">3x3 테이블 생성</h3>
	<table align="center" class="listTable">
		<c:forEach var="cnt" begin="1" end="3">
			<tr>
			<c:forEach var="cnt2" begin="1" end="3">
				<td>${cnt } 행 ${cnt2 }열</td>
			</c:forEach>
			</tr>
		</c:forEach>
	</table>
	
	<h3 align="center">3x3 테이블 생성 다른방법</h3>
	<table align="center" class="listTable">
		<c:set var="rcnt" value="0"/>
		<c:forEach var="cnt" begin="1" end="9">
			<c:if test="${cnt%3==1 }"> 
				<tr>${rcnt += 1 } 
			</c:if>
			<th>${cnt }</th>
				<c:if test="${cnt%3==0 }">
			</tr>
			</c:if>
		</c:forEach>
	</table>
	
	
	<!--  응용) 행/열 테이블을 jstl로 생성하는데 
			4x5테이블을 생성하고 1~20까지 출력하기 (1조 제출, 나머지 손들기) -->
			
	<h3 align="center">4x5 테이블 생성</h3>
	<table align="center" class="listTable">
		<c:set var="conNum" value="0"/>
		<c:forEach var="cnt" begin="1" end="4">
			<tr>
			<c:forEach var="cnt2" begin="1" end="5">
				<td>${conNum = conNum+1}번</td>
			</c:forEach>
			</tr>
		</c:forEach>
	</table>
	
	<h3 align="center">4x5 테이블 생성 다른방법</h3>
	<table align="center" class="listTable">
		<c:forEach var="cnt" begin="1" end="20">
			<c:if test="${cnt%5 == 1 }"><tr></c:if>
			<td>${cnt }번</td>
			<c:if test="${cnt%5==0 }"></tr></c:if>
		</c:forEach>
	</table>
	
	
	
	
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