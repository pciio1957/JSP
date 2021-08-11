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
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var aligns = ["left", "center","right"];
		var idx = 0;
		
		$("h2").click(function(){
			// idx++%3 : 0, 1, 2 반복으로 동적인 처리 가능 
			$(this).attr("align", aligns[idx++%3]);
		});
		
		// 응용) 애완동물 이미지 3개를 다운받고 이미지변경 클릭시 
		//		아래 img 이미지가 돌아가면서 변경되도록 하기 (2조)
		
		var imags = ["image/img02.jfif", "image/img03.jfif", "image/img01.jfif"];
		var x = 0;
	
		$("img").click(function(){
			$(this).attr("src", imags[x++%3]);
			// 절대주소
			<%--  attr("src", "<%= path %>/a03_attribute/image/" + imags[x++%3] + ".jfif"); --%>
			
		});
		
	});
</script>
</head>
<%-- 
#요소객체의 속성설정
1. 태그의 기본 속성에 대한 속성값 설정 방식은 아래와 같다
	<img src="img01.jpg" alt="고양이이미지" width="100px" height="100px">
	img : 이미지
	src/alt/width/height : 속성
	
	1) $("선택자").attr("속성", "속성값");
	2) $("선택자").attr({속성:속성값, 속성:속성값...});
	3) $("선택자").attr("속성", function(){ return "속성값"});
		-> 선택자가 다중의 요소객체로 속성을 할당하고 처리할 떄 콜백함수를 사용한다.

--%>
<%

%>
<body>
	<h2 align="center">클릭 클릭! </h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	
	<h3 align="center">이미지 변경</h3>
	<table align="center" class="listTable">
		<tr><td><img src="image/img01.jfif" width="200pt" height="200pt"/></td></tr>
	</table>	
	
</body>
</html>