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
	margin-bottom:20px;
	padding:20px;
}

table td {
	width:80px;
	height:30px;
}

</style>
</head>
<%-- 

#has("선택자")
- 해당 객체의 선택자가 있으면 처리하는 기능 메소드 

#slice(시작, 마지막)
- 특정한 요소객체의 시작과 마지막 부분을 선택한다

#event.target : 이벤트가 일어난 대상 객체
- .ls("선택자") : 위 이벤트의 대상객체가 선택자에 해당하는지에 대한 여부를 boolean값으로 가져온다 

#find("선택자")
- 하위 요소객체를 찾아서 해당 요소객체에 대한 메소드를 처리한다.
- 하위에 있는 요소를 다 찾음

#children("선택자")
- 바로 및 하위 계층구조의 요소객체를 찾아서 선택처리하는 것을 말한다. 
- 바로 하위의 요소만 찾음 ex) 부모자식관계에서 자식만 찾아서 처리함

--%>
<%

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("여러가지 기능메소드(클릭)").click(function(){
			
			// 아이디가 ul01이고 바로 하위 자식에 ul을 포함하고 있으면 배경색 지정
			$("#ul01>li").has("ul").css("background", "pink");
			$("#ul02>li").slice(2, 4).css("background", "purple");
		});
		
		// 이벤트에 일어난 내용 확인
		$("#ul02").click(function(){
			console.log(event.target);
			$(event.target).css("background", "blue");
		});
		
		$("#addBtn").click(function(){
			$("#div01").html($("#div01").html() + "<h4> 추가h4 </h4>");
		});
		
		// body에는 현재 h4 선언이 없음 
		// 이럴때는 현재 화면에는 없지만 앞으로 만들어질 객체에 대한 이벤트처리는 상위객체 기준으로 이벤트 선언
		//	event.target을 통해서 이벤트가 일어나는 대상객체를 지정하고
		//	.is("h3")를 통해서 하위객체를 선택자로 지정
		$("#div01").click(function(){
			if($(event.target).is("h3")) $(event.target).css("background", "yellow");
			if($(event.target).is("h4")) $(event.target).css("background", "pink");
		});
		
		
		// 응용2
		var parts = ["CPU", "RAM", "HDD", "그래픽카드"];
		$("#addPartBtn").click(function(){
			// $("선택자").append("추가 객체 | HTML") : 기존에 있는 태그나 요소객체의 내용에서 더 추가되는 내용 처리
			var rIdx = Math.floor(Math.random() * parts.length);
			$("#div02").append("<h4>" + parts[rIdx] + "</h4>");
		});
		
		$("#div02").click(function(event){
			if($(event.target).is("h4")) $(event.target).css({"color":"yellow", "background":"navy"});
		});
		
		
		// find 
		$("#btnFind").click(function(){
			$("#div03").append("<p>안녕하세요!</p>");
			$("#div03").find("p").css("border", "1px solid blue");
			$("#div03").find("span").css("color", "green");
			// children은 바로 하위 요소(span)에만 적용하므로 홍길동에만 배경이
			$("#div03").children("span").css("background", "pink");
		});
		
		// 응용3
		$("#tb03 td").text("데이터");
		$("#tb03 td").text(function(index){ return "데이터" + index+1; });	
		
		$("#tb03").find("td").click(function(){
			$(event.target).css("background", "yellow");
		});
	});
</script>
<body>
	<h2 align="center"></h2>
	
	<!--  slice 선택자 -->
	<ul id="ul02">
		<li>아이템1</li>
		<li>아이템2</li>
		<li>아이템3</li>
		<li>아이템4</li>
		<li>아이템5</li>
		
	<!-- has 선택자 -->
	<ul id="ul01">
		<li>아이템1</li>
		<li>아이템2</li>
		<li>아이템3
			<ul>
				<li>아이템3-1</li>
				<li>아이템3-2</li>
				<li>아이템3-3</li>
			</ul>
		</li>
		<li>아이템4</li>
		<li>아이템5</li>
	</ul>
	</ul>
	
	<!--  응용1) event.target을 활용하여 div를 클릭하여 하위에 여러개의 h3을 만들어
		클릭시 배경색으로 노랑색 출력처리하기 (2조 제출, 나머지 손들기) -->
		
	<input type="button" value="추가" id="addBtn"/>
	<div id="div01">
		<h3>아이템H3-1</h3>
		<h3>아이템H3-2</h3>
		<h3>아이템H3-3</h3>
		<h3>아이템H3-4</h3>
		<h3>아이템H3-5</h3>
		<h3>아이템H3-6</h3>
	</div>

	<!--  응용2) 버튼을 만들고 추가를 클릭했을때 div01에 h4로 컴퓨터 부분이 추가되고 
			해당 컴퓨터부분 클릭시 배경색과 글자색 변경되도록 하기 (3조 제출, 나머지 손들기) -->
		
	
	<input type="button" value="부품 추가" id="addPartBtn"/>
	<h3 align="center"> 컴퓨터 부품 랜덤 추가</h3>
	<div id="div02"></div>
	<br>
	
	<input type="button" value="find기능처리" id="btnFind"/>
	<div id="div03">
		<span>홍길동</span>
		div...
		<p>p...
			<span>마길동</span>
			<span>오길동</span>
		</p>
	</div>
	
	
	<!-- 응용3) 3x3 테이블을 만들고 find를 활용하여 td의 배경색을 노랑색으로 처리하기 
			(4조 제출, 나머지 손들기) -->
	
	<h4 align="center"> 테이블 처리 </h4>	
	<table id="tb03"  align="center" class="listTable">
		<tr><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
			
</body>
</html>