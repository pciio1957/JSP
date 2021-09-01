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

#MVC Ajax 처리
1. 처리프로세스
	1) controller로 초기화면 호출
	2) 초기화면에 입력 처리 및 ajax로 controller 호출
	3) 요청값을 받을 controller는 요청값을 기준으로
		초기화면과 메시지를 전달해야할 내용의 조건 처리한다
	4) 메시지 전달은 out.print()를 활용한다
	
2. 실습예제
	1) controller : A24_AjaxController (buy02.do)
		String priceS = request.getParameter("price");
		String cntS = request.getParameter("cnt");
	2) view : z01_jsp\a14_mvc\a04_mvcAjax.jsp
		가격: [ ]
		갯수: [ ] -> enter키 입력시 ajax로 controller 호출 후 처리 
	

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
		$("[name=price], [name=cnt]").keyup(function(event){
			var xhr = new XMLHttpRequest();
			if(event.keyCode == 13) {
				var snd = "price=" + $("[name=price]").val() + "&cnt=" + $("[name=cnt]").val();
				xhr.open("get", "${path}/buy02.do?" + snd, true);
				xhr.send();
				
				xhr.onreadystatechange = function(){
					if(xhr.readyState == 4 && xhr.status == 200) {
						alert(xhr.responseText);
						$("#show").text(xhr.responseText);
					}
				};	
			}
		});
		
		// 이 이벤트가 안먹음 
		$("[name=age]").keyup(function(event){
			var xhr2 = new XMLHttpRequest();
			if(event.keyCode == 13){
				var snd = "age=" + $("[name=age]").val();
				xhr2.open("get", "${path}/buy02.do?" + snd, true);
				xhr2.send();
				
				xhr2.onreadystatechange = function(){
					if(xhr2.readyState == 4 && xhr2.ststus == 200) {
						alert(xhr2.responseText);
						$("#show2").text(xhr2.responseText);
					}
				};	
			}
		});
		
		
		/* 응용) 나이:[ ] -> 입력한 나이가 18세 이상이면 성인, 이하면 미성년으로 
			서버단에서 데이터를 처리해서 alert()과 화면에서 출력되게 처리하기 (3조 제출, 나머지 손들기) */
	});
</script>
<body>
	<h2 align="center">MVC ajax연습</h2>
	<table align="center" class="listTable">
		<tr><th>가격</th><td><input type="text" name="price" value=""/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt" value=""/></td></tr>
		<tr><td id="show" colspan="2" style="text-align:center"></td></tr>
	</table>	

	<table align="center" class="listTable">
		<tr><th>나이</th><td><input type="text" name="age" value=""/></td></tr>
		<tr><td id="show2" colspan="2" style="text-align:center"></td></tr>
	</table>	

</body>
</html>