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

</style>
</head>
<%-- 

#계층 구조 관련 메소드
1. children("자식 중 선택자")
2. parents() : 상위계층 객체들
	parent() : 바로 상위 부모객체
3. next() : 형제(같은 부모 요소객체를 두고, 같은 level에 있는 요소객체) 중 다음 순서의 요소객체 지정
4. prev() : 형제(같은 부모 요소객체를 두고, 같은 level에 있는 요소객체) 중 앞 순서의 요소객체 지정
5. siblings() : 형제요소객체들 지정 

--%>
<%

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("계층 구조 요소객체(클릭)").click(function(){
			$("p").parent().css("font-size", "30px");
			$("p").parent(".selected").css("background","yellow");
			
			// 배열.each(function(단위객체, index){});
			// 배열 반복문도 callback함수를 이용해 나타낼 수 있음
			$("p").parents().each(function(el, idx){
				console.log(el);
				console.log(idx);
			});
		});
		
	});
</script>
<body>
	<h2 align="center"></h2>

	<div><p>홍길동</p></div>
	<div class="selected"><p>이순신</p></div>
	
</body>
</html>