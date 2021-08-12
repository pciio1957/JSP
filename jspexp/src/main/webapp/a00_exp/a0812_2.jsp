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

	List<String> plist = Arrays.asList("사과", "바나나", "수박", "딸기", "오렌지", "키위");
	
	String proc = request.getParameter("proc");
	String ckprod[] = request.getParameterValues("ckprod");
	System.out.println("처리 프로세스 : " + ckprod);
	
	// 웹상의 thread 환경에서 ArrayList/List remove() 기능 메소드 처리 에러발생.. 
	//	-> <vector>사용으로 해결
	Vector<String> result = new Vector<String>();
	
	
	if(proc != null) {
		if(proc.equals("choice")){
			if(ckprod!=nullㅁ && ckprod.length>0) {
				for(String prod:ckprod) {
					result.add(prod);
				}
			}
		}
		
		if(proc.equals("delete")) {
			result = plist;
			if(ckprod!=null&&ckprod.length>0) {
				result.removeAll(Arrays.asList(ckprod));
			}
		}
	}
	
	
	
	/*
	if(proc != null) {
		if(proc.equals("choice")) {
			for(int idx=0; idx<plist.size();idx++) {
				for(String prod:ckprod) {
					if(plist.get(idx).equals(prod)){
						plist.remove(idx);
					}
				}
			}
		}
		
		if(proc.equals("delete")) {
			for(int idx=0; idx<plist.size();idx++) {
				for(String prod:ckprod) {
					if(plist.get(idx).equals(prod)){
						plist.remove(idx);
					}
				}
			}
		}
		*/
	}
	
%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("장바구니");
		
		$("[type=button]").click(function(){
			if($(this).val() == "선택") $("[name=proc]").val("choice");
			if($(this).val() == "제거") $("[name=proc]").val("delete");
			$("#frm01").submit();
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
				<input type="submit" value="검색"/>
			</td></tr>
			<tr><th><input type="checkbox" name="ckAll"/></th><th>물건명</th></tr>
			<% for(String prod:plist) { %>
			<tr><td><input type="checkbox" name="ckprod" value="<%= prod %>"/></td>
			<td><%= prod %></td></tr>
			<% } %>
			<tr><td colspan="2">
				<input type="button" value="선택"/>
				<input type="button" value="제거"/>
			</td></tr>
		</table>	
	</form>
	
	
	
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>