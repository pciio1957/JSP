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

#정리문제
1. [ajax] 부서정보를 keyup 이벤트로 ajax로 검색되게 처리하기(dao연동)
 단 json 데이터를 만들어서 처리되게 하기 
 
2. [jstl] forTokens의 속성들을 기술하기
	forTokens의 속성
	1) var : 구분자에 의해 추출된 단위 데이터를 할당할 변수명 지정
	2) items : 구분자가 포함되어 있는 문자열 데이터 ex)사과^바나나^딸기
	3) delims : 구분자 
	4) varStatus : idnex, count, first, last 등 효과적인 변수를 활용 가능

3. [jstl] forTokens를 이중으로 활용하여 문자열 데이터 
	"사과^3000^2@오렌지^2000^3@수박^1200^3" 를 처리하여 테이블에 출력하기 
	

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

		$("[name=deptno]").keyup(function(event){
			if(event.keyCode == 13) {
				
				var xhr = XMLHttpRequest();
				var data = "deptno=" + $("[name=deptno]").val();
				xhr.open("get", "z0831_data1.jsp", true);
				xhr.send(data);
				
				xhr.onreadystatechange = function(){
					
					
					if(xhr.readyState == 4 && xhr.status == 200) { 
						var depts = JSON.parse(xhr.responseText);
						
						console.log(depts);
						$("#tab02 tbody").append("<tr><td>" + depts.deptno + "</td><td>" + depts.dname + "</td><td>" + depts.loc + "</td></tr>");
						
						$("#div01").text(depts.deptno + " : " + depts.dname + " : " + depts.loc);
						
					}
					
					
				}
				
			}
		});
		
	});
</script>
<body>
	<h2 align="center">8월 31일 정리문제</h2>
	

	<h3 align="center">부서정보</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>부서번호</th><td><input type="text" name="dpetno" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="검색"/>
		</td></tr>
	</table>	
	</form>
	
	<!--  <jsp:useBean id="dlist" class="java.util.ArrayList" scope="session"/>  -->
	<table id="tab02" align="center" class="listTable">
		<thead><tr><th>부서번호</th><th>부서명</th><th>위치</th></tr></thead>
		<tbody></tbody>
	</table>	


	<div id="div01"></div>



	<table  align="center" class="listTable">
		<tr><th>물건명</th><th>물건가격</th><th>물건갯수</th></tr>
	<c:forTokens var="fruits" items="사과^3000^2@오렌지^2000^3@수박^1200^3" delims="@" varStatus="sts01">
		<tr>
		<c:forTokens var="prod" items="${fruits }" delims="^" varStatus="sts02">
			<td>${prod }</td>
		</c:forTokens>
		</tr>
	</c:forTokens>
	</table>
	
	
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>부서명</th><td><input type="text" name="ename" value=""/></td></tr>
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