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

table {
	margin-bottom:20px;
	padding:20px;
}

</style>
</head>
<%-- 

#filter 기능 메소드 활용
1. 기본 filter("선택자형식")

2. filter(function(idx, 요소객체){ return boolean값; });
	cf) 기능메소드의 chainning
		$("요소선택자").기능메소드1().기능메소드2().기능메소드3(); 
		형식으로 기능메소드를 길게 chain처럼 작성하는 것 
		
3. 특정한 요소객체를 선택해서 action메소드를 처리하고 그 하위 계층에 있는 요소 객체를
	filter()를 이용해 속성을 지정할 때 사용한다
	
cf) 메소드 체이닝으로 인해 중첩적인 기능메소드가 적용되는데 이 중첩기능메소드를 적용하지않고
	요소 선택자를 처리할 때는 
	
--%>
<%

A05_PreparedDao dao = new A05_PreparedDao();
ArrayList<Emp> eList = dao.getEmpList();

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("filter 관련 기능 메소드");
		
		// li층에 filter("선택자형식")을 활용하여 짝수번째 있는 내용을 배경색상 green 지정
		// chainning이 일어나서 짝수index에서 다시 짝수/홀수로 나눠져서 기능메소드 처리 
		//$("li").filter(":even").css("background", "green").
		//	filter(":odd").css("background", "orange");
		
		// 기존 chainning을 끊고 기능메소드를 적용하기 위해선 end()를 중간에 삽입해야함
		$("li").filter(":even").css("background", "green").
			end().filter(":odd").css("background", "orange");
		
		// 지정 클래스와 ID가 있는 li에만 폰트 사이즈 크게하기 
		$("li").filter(":even").css("background", "green").
		end().filter(":odd").css("background", "orange").end().
		filter(".orange, #apple").css("font-size", "30px");
		
		
		// 응용) table 사원정보가 있는 내용을 리스트로 만들고
		//	위 filter기능으로 짝수/홀수 배경색상을 다르게 처리하고
		//	클래스 check로 선언된 부분은 글자크기를 25px로 처리하기 (1조 제출, 나머지 손들기)
		$("#tabEmp tr").filter(":even").css("background", "yellow").
			end().filter(":odd").css("background","skyblue").end().
			filter(".checks").css("text-size", "25px");
	
		
		
		$("#h3s").click(function(){
			// 체인이 잘못 작성됐는지 적용이 안됨..ㅎㅎ 
			$("tabEmp2 tr").filter(":even").css("background", "yellow").
				end().filter(":odd").css("background","skyblue").end().
				filter(".checks").css("text-size", "25px");
			
			console.log("출력");
					
			// 이거는 적용됨
			$("#tabEmp2 tr").filter(":even").css("background", "skyblue").end().
				filter(":odd").css("background","gray").end().filter();
			
		});
	});
</script>
<body>
	<h2 align="center"></h2>
	
	<ul>
		<li>아이템1</li>
		<li>아이템2</li>
		<li class="orange">아이템3</li>
		<li>아이템4</li>
		<li id="apple">아이템5</li>
		<li>아이템6</li>
	</ul>
	
	
	<table id="tabEmp" align="center">
		<tr><th>사원명</th><th>사원번호</th><th>연봉</th></tr>
		<tr class="checks"><td>홍길동</td><td>7535</td><td>2000</td></tr>
		<tr class="checks"><td>김길동</td><td>4353</td><td>4000</td></tr>
		<tr><td>이길동</td><td>5345</td><td>7000</td></tr>
		<tr><td>박길동</td><td>2445</td><td>6000</td></tr>
		<tr><td>우길동</td><td>2258</td><td>5000</td></tr>
		<tr><td>신길동</td><td>8456</td><td>1000</td></tr>
	</table>	
	
	<% if(eList != null) { %>
	<table id="tabEmp2" align="center">
		<tr><th>사원명</th><th>사원번호</th><th>연봉</th></tr>
		<% for(Emp e:eList) { %>
		<tr><td><%= e.getEname() %></td><td><%= e.getEmpno() %></td><td><%= e.getSal() %></td></tr>
		<% } %>
		<tr><td colspan="3"><h3 id="h3s">클릭</h3></td></tr>
	</table>
	<% } %>
</body>
</html>