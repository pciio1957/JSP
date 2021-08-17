<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a01_start.*"
    import="jspexp.z02_vo.*"
    import="java.util.*"
%>
   
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 외부 CSS 설정 호출 -->
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript">
	window.onload = function() {
		document.querySelector("h3").innerText="요청값(한페이지)";
	}

</script>
</head>
<body>
	<%
	
		String priceS = request.getParameter("price");
		if(priceS==null) { priceS="0"; 
		
	%>
	<h3 align="center"></h3>
	<form id="frm01">
		<table>
			<tr><th>가격</th><td><input type="text" name="price" value=""></td></tr>
			<tr><td colspan="2"><input type="submit" value="20%할인금액"></td></tr>
		</table>
	</form>
	
	<%
		} else {
			
			int price = Integer.parseInt(priceS);	
	%>
		<table>
			<tr><th>가격</th><td><%= price %></td></tr>
			<tr><th>할인금액</th><td><%= (int) (price*0.8) %></td></tr>
		</table>
	
	<% } %>

	<%--
	
	응용) 초기화면 구구단 문제를 임의로 출력 
		[ 4 ] X [ 5 ] 
		정답입력 : [ ] [확인] => 다음 페이지에 4 X 5 = 20 정답/오답 출력 (5조)

	1. 초기화면과 요청값 받았을 때 화면을 구현한다
	2. 
	--%>
	
	<%
	
	String num01S = request.getParameter("num01");
	String num02S = request.getParameter("num02");
	String talkS = request.getParameter("talk");
	
	
	if(talkS == null) { 
		talkS = "0";
	
	%>
	
	
	<h2> 구구단 입력 </h2>
	<form if="frm03">
		<table>
			<tr>
				<td colspan="3"><input type="text" name="num01" value="" size="2"> 
					X <input type="text" name="num02" value="" size="2"></td>
			</tr>
			<tr>
				<th>정답</th>
				<td colspan="2"><input type="text" value="" name="talk" size="2"></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
	
	<%

	} else {


	
	int talk = Integer.parseInt(talkS);
	int num01 = Integer.parseInt(num01S);
	int num02 = Integer.parseInt(num02S);
	
	int answer = num01 * num02;
	
	%>
	<table>
		<tr><th><%= num01 %> X <%= num02 %> = <%= talk %></th></tr>
		<tr>
			<td colspan="3"> <%= answer==talk?"정답":"오답"  %></td>
		</tr>
	</table>
	<% } %>
</body>
</html>