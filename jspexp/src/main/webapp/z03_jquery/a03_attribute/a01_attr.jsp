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

.tdClass{
	width:100px;
	height:100px;
	color:black;
}
	
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
		cf) jquery에서는 여러개의 선택자를 한번에 동일한 속성으로 설정하는 것은 반복문을 활용하지않아도 된다. 
		$("h2").attr("align", "center") : 다수의 h2에 대한 정렬 속성을 중앙으로 변경
		$("h2, h3, h6").attr("align", "center") : 다수의 h2에 대한 정렬 속성을 중앙으로 변경
--%>
<%
	String IMG_PATH = application.getInitParameter("IMG_PATH");
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
	
	<%-- 0813 범위!! --%>
	<h4 align="center">여러 이미지 설정</h4>
	<table align="center" class="listTable">
		<tr><td>
			<img class="imgCls" src="" width="200pt" height="200pt"/>
			<img class="imgCls" src="" width="200pt" height="200pt"/>
			<img class="imgCls" src="" width="200pt" height="200pt"/>
		</td></tr>
	</table>	
<script type="text/javascript">
	var imgs = ["img01", "img02", "img03"];

	$("h4").click(function(){
		// $("배열선택자").attr(속성, function(){
		//		idx : 배열의 index값, return "해당단위객체의 속성값 선언"
		// });
		$(".imgCls").attr("src", function(idx){
			console.log(idx);
			return "<%= path %><%= IMG_PATH %>" + imgs[idx] +  ".jfif";
		});
	});
</script>


	<%-- 
		응용) h5개를 만들고 정렬을 왼쪽 중앙 오른쪽으로 정렬하는데 
		위의 콜백함수(return)을 활용하여 출력하기 (2조 제출, 나머지 손들기)
	--%>
	
	<h5 class="h5Objs" align="">정렬할까요?</h5>
	<h5 class="h5Objs" align="">정렬할까요?</h5>
	<h5 class="h5Objs" align="">정렬할까요?</h5>
	<h5 class="h5Objs" align="">정렬할까요?</h5>
	<h5 class="h5Objs" align="">정렬할까요?</h5>
	
<script type="text/javascript">
	
	var sorts = ["left", "center", "right"];
	
	$("h5").click(function(){
		$(".h5Objs").attr("align", function(idx){
			return sorts[idx%3];
		});
	});

</script>

<%-- 

#CSS 속성 설정
	1) $("선택자").css("속성", "속성값");
	2) $("선택자").css({"속성":"속성값", "속성":"속성값"});
	3) $("선택자").css("속성", function(idx) { return "속성값" });
	
	
	응용) 테이블 3x3 테이블을 만들고, 각 td의 글자 색상을 빨/주/노/초/파/남/보/빨/주 로 설정하기 
		(2,3조 제출, 나머지 손들기)

--%>

<h3 id="h3Back" align="center">테이블 td 글자색 변경</h3>
<table id="tabB_Color" align="center" class="listTable">
	<tr><td>데이터</td><td>데이터</td><td>데이터</td></tr>
	<tr><td>데이터</td><td>데이터</td><td>데이터</td></tr>
	<tr><td>데이터</td><td>데이터</td><td>데이터</td></tr>
</table>

<script type="text/javascript">

	$("#tabB_Color td").toggleClass("tdClass");

	//$("#tabB_Color td").css("color", "black");
	var b_color = ["red", "orange", "yellow","green","blue","navy","purple","red","orange"];
	
	$("#h3Back").click(function(){
		$(".tdClass").css("color", function(idx){
			return b_color[idx];
		});
	});

</script>

</body>
</html>