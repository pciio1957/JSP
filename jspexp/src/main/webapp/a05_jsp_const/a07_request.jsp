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
# 

--%>
<%

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
		
		$("#regBtn").click(function(){
			// 등록 처리 프로세스 표시
			$("[name=proc]").val("insert");
			$("form").submit();
		});
		
		$("#uptBtn").click(function(){
			// 수정 처리 프로세스 표시
			$("[name=proc]").val("update");
			$("form").submit();
		});
		
		$("#delBtn").click(function(){
			// 삭제 처리 프로세스 표시
			$("[name=proc]").val("delete");
			$("form").attr("action", "<%= path%>/a05_jsp_const/a08_delete.jsp");
			$("form").submit();
		});
		
		$("#mainBtn").click(function(){
			location.href = "<%= path%>/a05_jsp_const/a09_main.jsp";
		});
		
		
		// 응용1
		$("#btnDc5").click(function(){
			$("[name=hiddenPart]").val("5");
			$("#frm02").submit();
		});
		
		$("#btnDc10").click(function(){
			$("[name=hiddenPart]").val("10");
			$("#frm02").submit();
		});
		
		$("#btnDc15").click(function(){
			$("[name=hiddenPart]").val("15");
			$("#frm02").submit();
		});
		
		// 응용2
		$("#tabCal input[type=button]").click(function(){
			$("[name=hiddenCal]").val() = $(this).val();
			
			$("#tabCal").submit();
		});
		
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01" method="post">
		<input type="hidden" name="proc"/>
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="button" value="등록" id="regBtn"/>
			<input type="button" value="수정" id="uptBtn"/>
			<input type="button" value="삭제" id="delBtn"/>
			<input type="button" value="메인화면" id="mainBtn"/>
		</td></tr>
	</table>	
	</form>
	
	<%
		String proc = request.getParameter("proc");
		if(proc != null) {
	%>
	
	<h3 align="center">처리되는 프로세스 : <%= proc %></h3>
	<% } %>
	
	<%--
	
	응용) 단가 [ ] 구매갯수 [ ]  (3조, 나머지 손들기)
		[할인율5%][할인율10%][할인율15%]
	
	 --%> 
	 
	 <form id="frm02" method="post">
	 	<input type="hidden" name="hiddenPart"/>
	 	<table align="center" class="listTable">
	 		<tr><th>단가</th><td><input type="text" name="price" value="0"/></td></tr>
	 		<tr><th>구매갯수</th><td><input type="text" name="cnt" value="0"/></td></tr>
	 		<tr><td colspan="2"> 
	 			<input type="button" id="btnDc5" value="할인율5%"/>
	 			<input type="button" id="btnDc10" value="할인율10%"/>
	 			<input type="button" id="btnDc15" value="할인율15%"/>
	 		</td></tr>
	 	</table>
	 </form>
	 
	 <%
	 
	 String hiddenPart = request.getParameter("hiddenPart");
	 String priceS = request.getParameter("price");
	 String cntS = request.getParameter("cnt");
	 int price = 0; int cnt = 0;
	 
	 if(priceS!=null){ 
		 price = Integer.parseInt(priceS);
	 }
	 
	 if(cntS!=null){ 
		 cnt = Integer.parseInt(cntS); 
	 }
	 int tot = price * cnt;
	 
	 %>
	 
	 <% if(priceS != null) { %>
	 <table align="center" class="listTable">
	 	<tr><th>가격</th><td><%= price %></td>
	 	<tr><th>갯수</th><td><%= cnt %></td>
	 	<tr><th>총계</th><td><%= tot %></td>
	 	<tr><th>할인율</th><td><%= hiddenPart %>%</td>
	 	<tr><th>계산가격</th><td><%= Math.floor(tot - tot /(Double.parseDouble(hiddenPart))) %></td>
	 </table>
	<% } %>
	
	
	<%-- 
	
	응용) [@@] [@@] 
	[+][-][*][/] 클릭시 hidden으로 정해진 연산자로 아래에 요청 결과값으로 출력하기 
	@@@ + @@@ = @@@ (3조/4조 제출, 나머지 손들기)
	
	--%>
	
	<form>
		<table id="tabCal" align="center" class="listTable">
		<input type="hidden" name="hiddenCal"/>
			<tr><td>	
				<input type="text" name="num01" value="0" size="2"/>
				<input type="text" name="num02" value="0" size="2"/>
			</td></tr>
			<tr><td>
				<input type="button" name="btnplus" value="+"/>
				<input type="button" name="btnminus" value="-"/>
				<input type="button" name="btnmulti" value="*"/>
				<input type="button" name="btndivision" value="/"/>
			</td></tr>
		</table>
	</form>
	
	<%
	
	String opIndexS = request.getParameter("hiddenCal");
	String num01S = request.getParameter("num01");
	String num02S = request.getParameter("num02");
	
	if(num01S!=null){
		int num01 = Integer.parseInt(num01S);
		int num02 = Integer.parseInt(num02S);
		int calIdx = Integer.parseInt(opIndexS);
		String cal[] = {"+", "-", "*", "/"};
		int res[] = {num01+num02, num01-num02, num01*num02, num01/num02};
		
	%>
	

	<table align="center" class="listTable">
		<tr><td>
			<%= num01 %> <%= cal[calIdx] %> <%= num02 %> = <%= res[calIdx] %>
		</td></tr>
	</table>
	<% } %>
</body>
</html>