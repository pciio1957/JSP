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
<link rel="stylesheet" href="<%=path%>/z00_com/a01_com.css">
<style>

table {	
	width:40%;
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
1. [jquery]parent(), children()의 차이를 기본예제를 통해서 기술하세요.
2. [jquery]이벤트를 처리할 때, event.target는 어떤 용도로 쓰이며, .is("선택자")는 어떻게 활용되는가?
	$("대상객체").이벤트(function(event){
		// 익명 이벤트 핸들러
		// event : 이벤트 정보를 처리하는 객체
		// event.target : 이벤트의 대상 객체 지칭
		// event.keyCode : 키 이벤트일 경우 키 코드를 가져온다 
		// $(event.target).is("선택자") : 이벤트의 대상 선택자인지 여부를 가져온다
		//				하위 계층의 각각의 대상 이벤트를 따로 선택자로 처리할 때 활용된다
	});

3. [jquery]아래와 같은 화면을 처리하세요.(위 event.target, find() 활용)
    물건명 [  ] 가격 [  ] [등록] ==> 등록시 아래에 추가가 되고
    번호 물건명 가격
    ##  ###  ## ==> 추가된 항목을 클릭시, 배경색상이 변경된다.           
    ##  ###  ##          
4. [jquery]계층 구조관련 기능 action 메서드를 기술하세요.
5. [jquery]아래의 화면을 내용을 처리하세요.
    []서울[]대구[]부산[]광주 ==> check시, 바로옆레이블 배경색변경
6. [jsp]서버 404에러발생시, 예외 처리 페이지 지정 방식을 기술하세요.
7. [jsp]session과 cookie의 가장 큰 차이점을 기술하세요.
9:30 일차점검 후, 진행합니다.~ 메시지제출 및 손들어 주세요

--%>
<%

%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("연습예제");
		
		$("#div01").click(function(){
			$(this).children("h3").css("font-size", "30px");
			$(this).parent().css("height", "150px");
		});
		
		var num = 1;
		$("#btnAdd").click(function(){
			var pname = $("[name=pname]").val();
			var price = $("[name=price]").val();
			
			//$("#tab03").html($("#tab03").html() + "<tr><td>" + num++ + "</td><td>" + pname + "</td><td>" + price + "</td></tr>");
			$("#tab03 tbody").append("<tr><td>" + num++ + "</td><td>" + pname + "</td><td>" + price + "</td></tr>");
			
			// 초기화
			 $("[name=price]").val("0");
			 $("[name=pname]").val("").focus();
		});
		
		
		$("#tab03 tbody").click(function(event){
			//if($(event.target).is("td")) 
			//	$(event.target).parent().css("background", "yellow");
			$(this).find($(event.target)).parent().css("background", "yellow");
			// 1. 이벤트가 일어나는 하위 객체 확인 
			// 2. css 적용된 계층의 상위 부분 선택자 선택 : .parent() 
			// 3. 필요한 속성 적용
			// $(this) : 이벤트가 처리된 객체 
			// find() : 하위에 특정한 객체 찾기
			// find( $(event.target)) : 이벤트가 일어나는 대상 객체 td
			// .parent() : 대상 객체 td의 부모객체 tr 지칭
		});
		
		$("[name=loc]").click(function(){
			$("[name=loc]").next().css("background", "");
			$("[name=loc]:checked").next().css("background", "pink");
			// css로 기본적인 설정을 default로 처리 (unchecked 되었을때)
			// checked의 .next() : 다음 형제객체
		});
		
	});
</script>
<body>
	<h2 align="center"></h2>
	<div style="background:pink; height:100px;">
		<div id="div01" style="border:1px solid blue;">
			<h3 style="border:1px solid red;">안녕</h3>
		</div>
	</div>
	
	
	<!--  3번 문제 -->
	<form id="frm03">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="button" value="등록하기" id="btnAdd"/>
		</td></tr>
	</table>	
	</form>
	
	<h3 align="center">물건 정보</h3>
	<table id="tab03" align="center" border>
		<thead><tr><th>번호</th><th>물건명</th><th>가격</th></tr></thead>
		<tbody></tbody>
	</table>
	
	<!--  5번 문제 -->
	<input type="checkbox" name="loc"/> <span>서울</span>
	<input type="checkbox" name="loc"/> <span>대구</span>
	<input type="checkbox" name="loc"/> <span>부산</span>
	<input type="checkbox" name="loc"/> <span>광주</span>
	<br>
	
</body>
</html>