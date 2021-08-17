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
		$("h2").text("선택 (Select)"); 
		
		// change(): 특정한 option의 선택을 변경했을 때 처리되는 이벤트
		$("select").change(function(){
			// select 하위에 선택된 option의 text
			var data = $(":selected").text();
			$("#show").text(data);
			// option에 value로 값이 세팅되어있을 경우 
			// var data2 = $(":selected").val(); 로 값을 할당해서 사용가능
		});
	});
	
	// 응용) 물건명:[ ] 가격:[select(1000~5000)] 갯수:[select(1~10)]
	//		갯수를 선택했을 때 하단에 구매 정보(물건명, 총계 @@을 출력) (1조 제출, 전체 손들기)
	$("#price").change(function(){
		console.log("값이 바뀜");
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
	<table align="center" class="listTable" width="30%">
		<tr><th>선택</th><td>
			<select name="phone">
				<option>070</option>
				<option selected>010</option>
				<option>02</option>
				<option>031</option>
			</select>	
		</td></tr>
		<tr><td colspan="2" id="show" style="text-align:center"></td></tr>
	</table>	
	</form>
	
	
	<form>
		<table id="tab02" align="center" class="listTable">
			<tr><th>물건명</th>
				<td>
					<input type="text" name="pname" value=""/>
				</td>
			</tr>
			<tr><th>가격</th>
				<td>
					<select id="price">
						<% for(int i=1000; i<=5000; i+=1000) { %>
						<option><%= i %></option>
						<% } %>
					</select>
				</td>
			</tr>
			<tr><th>갯수</th>
				<td>
					<select name="cnt">
						<% for(int x=1; x<=10; x++) { %>
						<option><%= x %></option>
						<% } %>
					</select>
				</td>
			</tr>
			<tr><td colspan="2" id="info"></td></tr>
		</table>	
	</form>
	
</body>
</html>