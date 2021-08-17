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
	width:400px;
	margin-bottom:20px;
	padding:20px;
}

td {
	text-align:center;
}

</style>
</head>
<%-- 
# 주간 정리문제
1. [jquery]form 요소객체 관련 filter 선택자를 기술하세요.
	1) 선택된 선택자 중 원하는 선택자에만 속성을 적용하기 위해서 사용 
	2) 기본 형식 : .filter("선택자형식")
	3) 콜백 함수 형식 : filter(function(idx, 요소객체){ return boolean값; }); 
	
	
	$(":button") : input type="button|submit|reset"
	$(":checkbox | radio")
	$(":checked") : 체크되었을때
	$(":disabled | enabled") : 비활성화/활성화
	$(":file | image | hidden | password") : 폼의 하위 요소객체
	$("input") : 폼에 입력되는 요소객체들 선택
 	
2. [jquery]위치기반 셀렉터와 동일하게 지원하는 메서드를 기술하세요 

	$("td:eq(0)")와 $("td").eq(0)과 동일하게 지원하는 메소드
		- $("td:eq(0)").click(function(){ return 반환값; });
		  $("td").eq(0).click(function(){ return 반환값; });	
		
	1) $("td:first") $("td").first();	
	2) $("td:start") $("td").start();	
	3) $("td:odd") $("td").odd(); : 홀수 
	4) $("td:even") $("td").even();	 : 짝수
	
3. [jquery]select 관련 이벤트와 선택자를 활용하여 물건의 구매정보를 출력처리하세요.
	(아래)
	
4. [jquery]속성관련 기능메서드와 활용방법을 기술하세요.
	속성 기능 메소드 : attr(), css()
	1) 태그의 속성값 변경해주는 태그 
	2) 기본 형식
		(1) $("선택자").attr("속성", "속성값") : 단일 속성 변경
		(2) $("선택자").attr({속성:속성값, 속성:속성값...}) : 다중 속성 변경
		(3) $("다중 선택자").attr("속성", function(){ return "속성값"}) : 다중 속성 변경시 콜백 함수로 할당
		(4) $("다중 선택자").attr({"속성1":function(idx){return 속성값;}}, {"속성2":function(idx){return 속성값;}}..})
	
5. [jquery]출력관련 기능메서드를 정리하세요.
	출력 기능 메소드 : html(), text(), val()
	1) .html() : HTML을 통해 렌더링할 내용과 코드를 가져와 Tag, Text 모두 적용 후 출력
	2) .text() : HTML코드를 가져와 Text내용 그대로 출력
	3) .val() : 선택된 태그의 속성 중 value값을 가져와 처리한다. 
	
	*콜백함수 사용가능 
	$("다중 선택자").attr("속성", function(){ return "속성값"})

6. [jquery]callback 메서드란 무엇인가? 기능메서드를 통해서 기술하세요.
	1) 이벤트의 처리 후 return값을 통해 여러 속성의 지정 및 연산처리를 한꺼번에 처리 가능
	2) 기본 형식 : $("선택자").기능메서드(function(idx){ return "설정할값"});

	ex) h3의 TEXT내용을 변경하면서 해당 h3의 배경색도 지정
		var colors = ["red", "yellow", "pink", "red","green"];
		var fruits = ["사과", "바나나", "복숭아","딸기", "수박"];
		$("h3").text(function(idx){
			$(this).css("Background",colors[idx]);
			return fruits[idx];
		});
		
7. [jquery]callback 메서드를 통해서, emp테이블의 데이터를 json 배열객체로 선언하여,
    테이블에 출력하세요.
    (a0817exp_2.jsp)
    
8. [jsp]request의 주요기능과 기본 정보제공 메서드를 uri와 함께 기술하세요.
	1) 웹 브라우저가 웹 서버에 전송한 요청 관련 정보 제공
	2) 주요 기능
		(1) 클라이언트와 관련된 정보 읽기 기능
		(2) 서버와 관련된 정보 읽기 기능
		(3) 클라이언트가 전송한 요청 파라미터 읽기 기능
		(4) 클라이언트가 전송한 요청 헤더 읽기 기능
		(5) 클라이언트가 전송한 쿠키 읽기 기능
		(6) 속성 처리 기능
		
	3) 기본 정보 제공 메소드 : client(브라우저)에서 전달되어온 정보를 기준으로 메소드로 접근하여 처리가능
		http://localhost:7080/jspexp/index.jsp
		(1) request.getRemoteAddr() : 웹 서버에 연결한 클라이언트의 ip 주소를 구한다
		(2) request.getMethod() : 웹브라우저가 정보를 전송할 때 사용한 방식을 구한다
		(3) request.getRequestURI() : 웹 브라우저가 요청한 URL에서 경로를 구한다.
		(4) request.getContextPath() : jsp 페이지가 속한 웹 애플리케이션의 컨텍스트 경로를 구한다
			웹서버의 절대적인 경로설정의 중요한 역할을 한다 
			이 기준 경로를 통해 여러가지 자원(css, html, 이미지 등)에 접근하여 사용가능해짐
			jspexp\src\main\webapp으로 서버내에 특정한 폴더 기준으로 설정한다.
		(5) request.getServerName() : 연결할 때 사용한 서버 이름을 구한다 ex) localhosst
		(6) request.getServerPort() : 서버가 실행중인 포트 번호를 구한다 ex) 7080

		(1) 클라이언트의 ip주소(MAC) :  request.getRemoteAddr()
		(2) 요청 방식(get/post) : request.getMethod()
		(3) 요청 url 주소(/jspexp/index.jsp) : request.getRequestURI()
		(4) 요청 context명(/jspexp/) : request.getContextPath()
		(5) 서버 이름(localhost) : request.getServerName()
		(6) 서버 port(7080) : request.getServerPort()
		
		
9. [jsp]form 하위 객체와 연관되어 있는 request의 요청값관련 메서드의 처리방법의 특성에 대하여 기술하세요.
	1) 단일 요청값 처리시  
		(1) input[type=text], radio처럼 단일 값을 할당할 때 사용
		(2) 형식 : request.getParameter("이름");
		
	2) 다중 요청값 처리시
		(1) checkbox처럼 같은 이름을 가지고 여러 값을 할당해야할 경우 
		(2) 형식 : request.getParameterValues("이름:);
		
	3) hidden 
		type="hidden" : 화면에 보이지않지만 요청값을 전달하여 처리 

10. [jsp]hidden을 활용하여 중고물품의 판매등록/구매를 처리하세요
    물건명[   ] 가격[     ][판매등록][구매] ==> 클릭시, 하단에 해당 물건/가격을 등록/구매 표기.
09:30에 1차 점검하겠습니다. 제출과 손을 들어 주세요.

--%>
<%

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("8월 17일 복습문제");
		
		// 3-1. 선택완료 후 버튼을 눌렀을 때 값 확인
		$("#btnBuy").click(function(){
			var pcntVal = $("#procnt>option:selected").val();
			console.log("선택값 : " + pcntVal);
			
			$("#frm01").submit();
			
		});
		
		// 3-2. 선택 후 바로 값 확인
		$("#procnt").change(function(){
			var chVal = $(this).find("option:selected()").val();
			
			console.log("바뀐값" + chVal);
		});
		
		
		$("#frm02 [type=button]").click(function(){
			console.log($(this).val());
			$("[name=proc]").val($(this).val());
			$("#frm02").submit();
		});
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	
	<h3 align="center">3번 문제</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="proname" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="pronprice" value="0"/></td></tr>
		<tr><th>갯수</th>
		<td>
			<select id="procnt">
				<option value="0">갯수선택</option>
				<option value="1">1개</option>
				<option value="2">2개</option>
				<option value="3">3개</option>
				<option value="4">4개</option>
			</select>
		</td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input id="btnBuy" type="button" value="구매하기"/>
		</td></tr>
	</table>	
	</form>
	
	<% 
	
		String proName = request.getParameter("proname");
		String proPriceS = request.getParameter("pronprice");
		
		if(proName != null) {
			int proPrice = proPriceS!=null?Integer.parseInt(proPriceS):0;	
	%>

		<input type="hidden" name="proc"/>
		<table align="center" class="listTable">
			<tr><th>물건명</th><th>가격</th><th>갯수</th></tr>
			<tr><td><%= proName %></td><td><%= proPrice %></td><td>${pcntVal}</td></tr>
		</table>	

	<% } %>
	
	
	<form id="frm02">
		<input type="hidden" name="proc"/>
		<table align="center" class="listTable">
			<tr><th>물건명</th><td><input type="text" name="name1" value=""/></td></tr>
			<tr><th>가격</th><td><input type="text" name="price1" value=""/></td></tr>
			<tr><td colspan="2" style="text-align:center">
				<input type="button" value="판매등록"/>
				<input type="button" value="구매"/>
			</td></tr>
		</table>	
	</form>
	
	<%
	
		String name1 = request.getParameter("name1");
		String price1 = request.getParameter("price1");
		String proc = request.getParameter("proc");
		if(proc!=null){
	
	%>
	
	<h3 align="center">물건명:<%=name1%>, 가격:<%=price1%>, <%=proc%>처리</h3>
	<%} %>	
	
</body>
</html>