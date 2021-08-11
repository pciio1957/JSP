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
	
#tab01 td{
	width:100px;
	height:100px;
	border:1px solid blue;
}	

#tab02 td{
	width:100px;
	height:100px;
	border:1px solid red;
}	

.clsDiv {
	height:200px;
	width:80%;
	padding:20px;
	margin:0 auto;
	text-align:center;
	margin-top:20px;
	margin-left:30px;
}


.clsDiv div {
	display:block;
	width:100px;
	height:100px;
	border:1px solid green;
	float:left;
}

.toggleWidth {
	display:block;
	width:10px;
	height:10px;
	background:red;
}

</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("8월 10일 정리문제");
		
		// 짝수 배경 변경
		$("#btnCg").click(function(){
			var btncg = $("#btnCg").val();
			
			if(btncg == "짝수배경변경"){
				$("#tab01 td:odd").css("background", "yellow");
				$("#tab01 td:nth-child(2n+1)").css("background", "green");
				$("#btnCg").text("전체변경");
			} else if(btncg == "전체변경") {
				$("#tab01 td").css("background", "gray");
			}
		});
		
		for(var idx=0;idx<16;idx++){
			$("#tab02 td").eq(idx).css("text-align","center");
			$("#tab02 td").eq(idx).text(idx+1);
		}
		
		// 폭탄
		var tds = $("#tab02 td");
		var ranNum = Math.floor(Math.random() * tds.length);
		
		$("#tab02 td").click(function() {

			$(this).find("#tab02 td:eq(ranNum)").css("background","yellow");
			
			// eq를 따로 안뺴서 적용이 안됨!!
			$("#tab02 td:eq(ranNum)").click(function (){
				$("#tab02 td").eq(ranNum).text("꽝");
				$("#tab02 td").eq(ranNum).css("background","yellow");
				$("#tab02 td").eq(ranNum).css("color","red");
				//$().css({"color":"red", "background":"yellow", "font-size":"30pt"});
				console.log("클릭됨");
			});		
		});
		
		$("#tab02 td").eq(ranNum).click(function(){
			$(this).css({"color":"red", "background":"yellow", "font-size":"30pt"});
			$(this).text("꽝");
		});
		
		
		animateIt();
		
		$("#btnDiv").click(function(){
			$(".clsDiv div:even").toggleClass("toggleWidth");
		});
		
		
		function animateIt() {	
			$(".clsDiv div:even").slideToggle("slow", animateIt);
		}
		
	});
	
	
</script>
</head>
<%-- 

# 정리문제
1. [js] 위치기반 선택자 중, :even과 :nth-child(even) 차이점을 기술하세요
	:even은 페이지 전체에서 짝수번째 엘리먼트를 반환, nth는 짝수의 자식 엘리먼트를 반환한다..
	 
	 $("td:even") : 모든 td의 짝수번째 내용 선택
	 $("td:nth-child(even)") : td의 상위인 tr기준으로 td가 짝수번째인 것 
	 $("td:eq(0)") : 화면에서 첫번째 td
	 $("td:nth-child(0)") : 모든 tr 하위의 첫번째 td
	 
2. 위치기반 선택자를 활용하여 테이블의 배경색상을 행단위 짝/홀로 변경하여 출력하세요.
	(위에 작성)
	
3. 4*4테이블을 1~16로 출력하여 만들고, 이 중 폭탄이 들어간 CELL 1개를 만들어 클릭시, 꽝
    이라는 문자열은 빨강색, 배경색상은 노랑색으로 처리하세요.
    
4. 클래스적용에 대한 기능 메서드를 기술하세요.
	toggleClass(클래스) : 지정한 클래스의 적용/미적용을 반복한다. 
				해당 클래스에는 addClass()/removeClass() 메소드들을 포함한다.
	$("선택자").removeClass("클래스") : 적용된 클래스 삭제
	$("선택자").addClass("클래스") : 클래스 적용

5. 10개의 div가 오른쪽으로 리스트된 화면에서 짝수 div인 것만 sliding되게 처리하고, 버튼을 클릭시 마다
    배경색상과 폭이 변경되게 처리하세요.
    
    
~ 완료가 된 분들은 손을 들어주시고, 제출도 해주세요~

--%>
<%

%>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" id="tab01">
		<tr><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td></tr>
		<tr><td colspan="4"><input type="button" id="btnCg" value="짝수배경변경"/></td></tr>
	</table>	
	</form>
	
	<br>
	<h3>폭탄피하기</h3>
	<table align="center" id="tab02">
		<tr><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td></tr>
	</table>
	
	<input type="button" id="btnDiv" value="클래스변경"/>
	<div class="clsDiv">
		<div></div><div></div><div></div><div></div>
		<div></div><div></div><div></div><div></div><div></div>
		<div></div><div></div>
	</div>	
	
</body>
</html>