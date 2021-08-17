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
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
		type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
		
		// 응용) 물건명:[ ] 가격:[select(1000~5000)] 갯수:[select(1~10)]
		//		갯수를 선택했을 때 하단에 구매 정보(물건명, 총계 @@을 출력) (1조 제출, 전체 손들기)
		$("[name=cnt]").change(function(){
			var pname = $("[name=pname]").val();
			
			// 선택된 값 출력하는 2가지 방법 
			// 1. option:selected 된것 확인
			var price = $("[name=price]>option:selected").text();
			// 2. 지정된 value값 가져오기 : form의 하위 요소객체이므로 선택된 값을 가져올 수 있다
			var cnt = $("[name=cnt]").val();
			
			alert(pname + ":" + price + ":" + cnt);
			$("#show").text("구매정보 : " + pname + " 총계 : " + (price*cnt));
		});
		
	});
</script>
</head>
<%-- 
# 

--%>
<%

%>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>가격</th><td>
			<select name="price">
				<%-- 해당 option에 대한 값은 value(val()), 출력내용은 innerText(text())
					value값이 선택되지 않을 때는 text()내용이 value값으로 처리된다
					결국 $("[name=price]").val()로 선택되어진 option이 처리된다 --%>
				<option value="0">가격선택</option>
				<option>1000</option>
				<option>2000</option>
				<option>3000</option>
				<option>4000</option>
				<option>5000</option>
			</select>
		</td></tr>
		<tr><th>갯수</th><td>
			<select name="cnt">
				<option value="0">갯수선택</option>
				<% for(int x=1; x<=10; x++) { %>
				<option><%= x %></option>
				<% } %>
			</select>
		</td></tr>
		<tr><th>물건명</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table  align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>