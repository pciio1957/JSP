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
	(아래 작성)
	
2. [jquery]이벤트를 처리할 때, event.target는 어떤 용도로 쓰이며, .is("선택자")는 어떻게 활용되는가?
	event.target 
	1) 어떤 객체에 이벤트를 작성 후 해당되는 이벤트를 실행한 객체를 타겟으로 지정하는 것
	2) .is("선택자")는 실행한 객체에서 입력한 특정 객체만 실행하도록 하는 것

3. [jquery]아래와 같은 화면을 처리하세요.(위 event.target, find() 활용)
    물건명 [  ] 가격 [  ] [등록] ==> 등록시 아래에 추가가 되고
    번호 물건명 가격
    ##  ###  ## ==> 추가된 항목을 클릭시, 배경색상이 변경된다.           
    ##  ###  ## 
    
             
4. [jquery]계층 구조관련 기능 action 메서드를 기술하세요.
	계층 구조 관련 메소드
	1) children() : 자식객체
	2) - parents() : 상위 계층 객체들 (다중)
	   - parent() : 바로 상위 부모객체 (단일)
	3) next() : 같은 레벨의 같은 부모 요소객체를 가진 형제객체 중 다음 객체
	4) prev() : 같은 레벨의 같은 부모 요소객체를 가진 형제객체 중 전 객체
	5) siblings() : 형제요소객체들 지정 

5. [jquery]아래의 화면을 내용을 처리하세요.
    []서울[]대구[]부산[]광주 ==> check시, 바로옆레이블 배경색변경
    
    
6. [jsp]서버 404에러발생시, 예외 처리 페이지 지정 방식을 기술하세요.
	예외 처리 페이지 지정 방식
	1) 에러가 발생하면 대신 나타낼 페이지(jsp)를 작성한다
	2) web.xml에 error를 작성한다
	  <error-page>
	  	<error-code>404</error-code>
	  	<location>/a08_exception/a02_404.jsp</location>
	  </error-page>
	3) 해당 서버 내에 에러 내용 확인

7. [jsp]session과 cookie의 가장 큰 차이점을 기술하세요.
	1) 공통점 : session과 cookie는 모두 서버에서 처리된다
	2) 차이점 : 하지만 cookie의 경우 서버가 값을 가지고 있지않기 때문에 중요한 데이터는 세션으로 처리한다

	1) session은 서버와 클라이언트간 연결 정보에 대한 임시 데이터를 서버에 저장
	2) cookie는 서버와 클라이언트 간 연결 정보에 대한 임시 데이터를 브라우저에 저장
9:30 일차점검 후, 진행합니다.~ 메시지제출 및 손들어 주세요

--%>
<%

%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#h2Title").text("8월 19일 정리문제");
		
		$("#div01 h3").text("h3 데이터");
		$("#div01 h4").text("h4 데이터");
		$("#div01 li").text("목록 데이터");
		$("#div01 span").text("span 데이터");
		
		$("#h2Click").text("1번문제 클릭하세요!").click(function(){
			$("div").children("h3").css("background", "green");
			$("span").parents().css("color", "red");
			$("span").parent().css("color", "blue");
		});
		
		
	
		var num = 1;
		$("#btnAdd").click(function(){
			var pname = $("[name=pname]").val();
			var price = $("[name=price]").val();
			
			$("#tab03").html($("#tab03").html() + "<tr><td>" + num++ + "</td><td>" + pname + "</td><td>" + price + "</td></tr>");
		});
		
		// if문으로 조건 검색하거나, parent()를 이용해서 td의 tr에 적용. 
		// 근데 이렇게 하면 find()를 못써서 풀이에 있는거처럼 작성함
		$("#tab03").click(function(){
			$(event.target).parent().css("background", "yellow");
		});
	});
</script>
<body>

	<h2 id="h2Title" align="center"></h2>
	
	<!-- 1번 문제 -->
	<div id="div01">	
		<h2 id="h2Click">클릭하세요!</h2>
		<h3></h3>
		<h4></h4>
		<h3></h3>
		<h3></h3>
		<div><span></span></div>
		<h4></h4>
		<h3></h3>
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
		<tr><th>번호</th><th>물건명</th><th>가격</th></tr>
	</table>
	
	
	<!--  5번 문제 -->
</body>
</html>