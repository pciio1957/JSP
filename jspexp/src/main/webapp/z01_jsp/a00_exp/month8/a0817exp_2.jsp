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

td{
	text-align:center;
}

</style>
</head>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
		var price = 0;
		var cnt = 0;
		
		$("select").change(function(){
			//if($(this).attr("name")=="proprice") price=$(this).val();
			var name = $("[name=proname]").val();
			var price = $("#proprice").val();
			var cnt = $("#procnt").val();
			
			$("#show").text("물건명 : " + name + " 가격 : " + price + " 갯수 : " + cnt);
		});
	});
</script>
<body>
	<h2 align="center"></h2>
	
	
	<h3 align="center">3번 문제</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="proname" value=""/></td></tr>
		<tr><th>가격</th>
		<td>
				<select id="proprice">
				<% for(int price=1000;price<=10000;price+=1000) { %>
				<option><%= price %></option>
				<% } %>
			</select>
		</td></tr>
		<tr><th>갯수</th>
		<td>
			<select id="procnt">
				<% for(int cnt=1;cnt<=10;cnt++) { %>
				<option><%= cnt %></option>
				<% } %>
			</select>
		</td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input id="btnBuy" type="button" value="구매하기"/>
		</td></tr>
		<tr><td colspan="2" id="show"></td></tr>
	</table>	
	</form>
	
	<h3 align="center">7번 문제</h3>
	<table id="empTab" align="center" class="listTable">
		<tr><th>사원번호</th><th>사원명</th><th>부서번호</th></tr>
		<tr class="list"></tr>
		<tr class="list"></tr>
		<tr class="list"></tr>
	</table>
	
	<script type="text/javascript">
	
		var elist = [
			{empno:7001, ename:'홍길동', deptno:10},
			{empno:7002, ename:'유길동', deptno:20},
			{empno:7003, ename:'허길동', deptno:30}
		];
	
		$("#empTab tr.list").html(function(idx){
			var emp = elist[idx];
			return "<td>" + emp.empno + "</td><td>" + emp.ename + "</td><td>" + emp.deptno + "</td>";
		});
	</script>
</body>
</html>