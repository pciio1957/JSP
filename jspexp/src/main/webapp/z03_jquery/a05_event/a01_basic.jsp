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

#jquery의 이벤트 처리
1. 이베트 등록하기
	$("요소객체").on("이벤트명", 이벤트핸들러함수);
	이 메소드로 해당 엘리먼트에 원하는 이벤트를 적용할 수 있다
	적용 가능한 이벤트는 click, mousedown, focus, resize 등 여러가지가 있다
	인자가 기술한 함수는 이벤트가 발생했을 시 자동 실행된다. 
	
	$("요소객체").one("이벤트명", 이벤트핸들러);
	해당 이벤트를 한번만 수행할 수 있게 하고 더 이상 수행되지 못하게 처리함
	
	ex) 좋아요 기능
	
2. jquery에서 지원하는 이벤트
	blur : focus가 가능한 엘리먼트, 엘리먼트가 포커스를 잃을 때 발생 
	focus : focus가 가능한 엘리먼트, 엘리먼트가 포커스를 얻을 때 발생 
	load : 모든 엘리먼트 가능, 엘리먼트가 자신과 모든 서브엘리먼트들이 로딩을 마쳤을 때 발생
	resize : window엘리먼트, 브라우저의 크기가 변경되었을 때 window 객체에서 발생 
	click : 모든 엘리먼트, 엘리먼트 위에 마우스 포인터를 위치시키고 마우스 버튼을 눌렀다가 뗄 때 발생
	dblclick : 모든 엘리먼트, 엘리먼트가 더블 클릭 되었을 때 발생
	mousedown : 모든 엘리먼트, 엘리먼트 위에 마우스 포인터가 위치되어 있고 마우스 버튼을 눌렀을 때 발생
	mouseup : 모든 엘리먼트, 엘리먼트 위에 마우스 포인터가 위치되어 있고 마우스 버튼을 놓을 때 발생
	mousemove : 모든 엘리먼트, 마우스 포인터가 엘리먼트 내부에서 움직일 때 발생 
	mouseover : 모든 엘리먼트, 마우스 포인터가 엘리먼트 안으로 이동할 때 발생 
	select : input type="text", textarea, 내부의 텍스트틀을 선택했을 때 (영역이 반전되었을 때)  발생
	submit : input type="submit", form값을 넘기려(submit) 할 때
	keydown : focus가 가능한 엘리먼트, 키보드를 누를 때 발생, 키를 누르고 있어도 1회만 발생
	keypress : focus가 가능한 엘리먼트, 키보드를 누를 때 발생, 키를 누르고 있으면 연속적으로 발생 
	keyup : focus가 가능한 엘리먼트, 키보드에서 손을 땔 떼 발생
	error : 로딩이 일어나는 엘리먼트, 이미지 등이 정상적으로 로딩되지 않았을 때 발생 

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").on("click", function(){
			$(this).css("background", "yellow").text("안녕하세요");
		});
		
		$("[name=ename]").on("focus", function(){
			$(this).css("background", "pink");
		});
		
		$("[name=ename]").on("blue", function(){
			$(this).css("background", "white").text("입력완료");
		});

		<!-- 
		$("[name=content]").on("focus", function(){
			$(this).text("");
			$(this).css({"background":"navy", "color":"yellow"});
		});
		
		$("[name=content]").on("blur", function(){
			$(this).text("");
			$("h3").text($(this).val());
		});
		
		-->
		
		// 한번에 작성하는 방법
		$("[name=content]").on({
			'focus':function(){
				$(this).val("");
				$(this).css({"background":"navy", "color":"yellow"});
			}, 'blur':function(){
				$("h3").text($(this).val());
				$(this).val("");
			}
		});
		
		$("#btnOne").one("click",function(){
			var num1 = parseInt($("h4").eq(0).text());
			$("h4").eq(0).text(++num1);
		});
		
		$("#btnDbl").on("dblclick",function(){
			var num2 = parseInt($("h4").eq(1).text());
			$("h4").eq(1).text(++num2);
		});
		
		var cnt = parseInt($("#h3Obj").text()); 
		$("#btn01").one("click", function(){
			$("#h3Obj").text(++cnt);
		});
		
		$("#btn02").one("click", function(){
			$("#h3Obj").text(--cnt);
		});
		
		// 한 클래스로 지정해서 사용
		$(".fav").one("click", function(){
			var fpoint = parseInt($("#h3Obj").text()); 
			if( $(this).val() == '좋아요' ){
				fpoint++;
			} else {
				fpoint--;
			}
			$(".fav").click(); // 둘다 강제 수행
			$("#fpoint").text(fpoint);
		});
	});
</script>
<body>
	<h2 align="center">초기 화면 내용</h2>
	
	<table align="center" class="listTable">
		<tr><th>회원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center"><input type="button" id="btnOne" value="한번"/></td></tr>
		<tr><td colspan="2" style="text-align:center"><input type="button" id="btnDbl" value="더블클릭"/></td></tr>
	</table>
	
	<h4 align="center">0</h4>
	<h4 align="center">0</h4>
	
	
	<!--  
		응용) input으로 focus되기 전에는 입력하세요라고 출력되고
			focus시 입력하세요 삭제, 배경색상 navy 글자색 노랑색으로 입력되다가
			blur시 내용은 지워지고 하단의 h3에 입력된 내용이 출력되도록 하기 (1조 제출, 나머지 손들기)
	-->
	
	
	<table align="center" class="listTable">
		<tr><th>내용</th><td><input type="text" name="content" value="입력하세요"/></td></tr>
	</table>
	<h3 align="center"></h3>
	
	<!--  
		응용) 좋아요, 싫어요 버튼을 만들고 해당 좋아요 버튼을 클릭시 선호도가 1올라가고
			싫어요 버튼을 클릭하면 선호도가 1차감된다. 현재 선호도는 3으로 한번만 클릭 가능하도록 하기 
			(2조 제출, 나머지 손들기)
	-->
	
	<table align="center" class="listTable">
		<tr><td colspan="2" style="text-align:center"><h3 id="h3Obj" align="center">3</h3></td></tr>
		<tr><td colspan="2" style="text-align:center"><input type="button" class="fav" id="btn01" value="좋아요"/></td></tr>
		<tr><td colspan="2" style="text-align:center"><input type="button" class="fav" id="btn02" value="싫어요"/></td></tr>
	</table>
	
</body>
</html>