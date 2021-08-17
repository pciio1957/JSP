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
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>

div{
	background:red;  
	border: 1px solid blue;
	width:70px; height:70px;
	margin:0 3px; float:left;
}
.toggleWidth { width:40px; } 
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("입력할 갯수 : " + $(":input").length);
		
		$("#run").click(function() {
			// toggleClass("클래스선언") : 해당 토글에 클래스를 적용/미적용 반복(width의 크기변경)
			//			클릭시마다 클래스의 적용여부를 실행한다. 
			//			toggleClass에 addClass()/removeClass() 포함
			// :animated :  동적인 처리가 일어나고 있는 선택자 객체
			$(":animated").toggleClass("toggleWidth");
			
		});
		
		animateIt();
	
		function animateIt() {	
			// slideToggle("속도", 반복할함수) : 해당 대상객체를 보였다가 보이지않았다를 슬라이더 형식으로 처리
			$("#ani").slideToggle("slow", animateIt); // 재귀적 호출
		}
	
	});
	
	/*
	응용) a06_aniExp.jsp div 위 내용을 적용하되 색상은 파랑색 float:left;는 제거, 
		class로는 width와 height 10px, 10px로 선언하고
		3개의 div를 만들고 1번째, 3번째가 slide로 보였다가/보이지않았다가를
		처리하고 버튼 클릭시 클래스를 적용/미적용 처리하기 
	*/
</script>
</head>
<%-- 
#필터 선택자
 $(":animated") : 현재 애니메이션이 적용되고 있는 엘리먼트 선택
 $(":button") : 모든 유형의 버튼을 선택한다. 
 	input[type=submit], input[type=reset], input[type=button]
 $(":checkbox") : 체크박스 엘리먼트를 선택한다
 $(":checked") : 선택된 체크박스나 라디오 버튼을 선택한다. -> 현재 checked가 된 내용
 $(":contains(food)") : 텍스트 food를 포함하는 엘리먼트만 선택한다.
 $(":disabled") : 비활성화 상태인 모든 폼 엘리먼트 선택
 $(":enabled") : 활성화 상태인 모든 폼 엘리먼트 선택
 $(":file") : 모든 파일 엘리먼트 선택
 $(":header") : 헤어 엘리먼트 선택 (h1~h6)
 $(":hidden") : 감추어진 엘리먼트
 $(":image") : 폼 이미지
 $(":input") : 폼 엘리먼트만 선택
 $(":not(filter)") : 필터의 값을 반대로 변경
 $(":parent") : 자식 엘리먼트를 포함한 엘리먼트
 $(":password") : 패스워드 엘리먼트
 $(":radio") : 라디오 버튼 엘리먼트
 $(":reset") : 리셋 버튼
 $(":selected") : 선택된 엘리먼트만 선택  -> select 요소 객체의 option이 선택된 내용

--%>
<body>
	<h2 align="center"></h2>
	<button id="run">실행</button>
	<div></div>
	<div id="ani"></div>
	<div></div>
	
	
	
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table  align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>