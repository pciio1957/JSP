<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    import = "java.net.*"
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

5. 쿠키를 활용하여 영화를 예매하고, 최종 결재할 내용만 남기는 처리를 하세요.
    [영화제목][보통/3d/4d][금액][관람갯수][예매] ==> 현예매현황(최종내용현황)
    [] 영화제목 분류 금액 관람수
    []  @@@  @@  @@@ @@@
          [제외][결제]
          
    

--%>
<%

	String proc = request.getParameter("proc");
	String ckNames[] = request.getParameterValues("ck");

	if(proc.equals("del")) {
		if(ckNames != null && ckNames.length > 0) {
			for(Cookie ck:request.getCookies()) {
				for(String name:ckNames) {
					if(ck.getName().equals(name)){
						ck.setMaxAge(0);
						response.addCookie(ck);
					}
				}
			}
			response.sendRedirect("a0820_show2.jsp");
		}
		
	} else if(proc.equals("pre")){
		String no = request.getParameter("no");
		
		if(ckNames != null && ckNames.length > 0) {
			for(Cookie ck:request.getCookies()) {
				for(String name:ckNames) {
					if(ck.getName().equals(name)){
						response.addCookie(ck);
					}
				}
			}
			response.sendRedirect("a0820_Ans2.jsp");
		}	
	}
	
	
	
	
	int no = 0;
 
%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("예매 내역");
		
		$("#btndel").click(function(){
			$("[name=proc]").val("del");
			
			location.href = "a0820_show2.jsp";
		});
		
		$("#btnPre").click(function(){
			$("[name=proc]").val("pre");
			
			location.href = "a0820_show2.jsp";
		});
		
		
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	
	<form id="frm01">
		<input type="hidden" name="proc" value="proc"/>
		<table align="center" class="listTable">
			<tr><th>ck</th><th>영화명</th><th>예약인원</th></tr>
			<% for(Cookie ck:request.getCookies()){ 
					if(!ck.getName().equals("JSESSIONID")) { 
						no++;
			%>
				<input type="hidden" name="no" value="<%= no+1 %>"/>
				<tr><td><input type="checkbox" name="ck" value="<%= URLDecoder.decode(ck.getName(), "utf-8") %>"/></td>
				<td><%= URLDecoder.decode(ck.getName(), "utf-8") %></td><td><%= ck.getValue() %></td></tr>
			<% }} %>
			
			<tr><td colspan="2" style="text-align:center">
				<input type="button" id="btndel" value="삭제"/>
				<input type="button" id="btnPre" value="예약하러가기"/>
			</td></tr>
		</table>	
	</form>
	
</body>
</html>