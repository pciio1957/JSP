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

</script>
</head>
<body>

<%

String num01S = request.getParameter("num01");
String cal01 = request.getParameter("cal");
String num02S = request.getParameter("num02");

if(num01S == null) {
	


%>

	<h3>5번 계산기</h3>
	<form id="frm04">
		<table>
			<tr>
				<td><input type="text" value="0" name="num01"></td>
				<td>
					<select name="cal">
						<option name="0">+</option>
						<option name="1">-</option>
						<option name="2">*</option>
						<option name="3">/</option>
					</select>
				</td>
				<td><input type="text" value="0" name="num02"></td>
				<td><input type="submit" value="연산"></td>
			</tr>
		</table>
	</form>


<% } else { 

int num01 = Integer.parseInt(num01S);
int num02 = Integer.parseInt(num02S);
int calIdx = Integer.parseInt(cal01);

// 위에 각 데이터를 가져와서 연산하기 위해서는 변환이 많이 일어남
// 그래서 각 옵션에 name값을 줘서 그 인덱스를 이용해서 연산처리
// index에 따른 연산결과를 배열에 index로 선택하기 때문에 조건문이 필요없다
String cal[] = {"+", "-", "X", "/"};
int result[] = {num01+num02, num01-num02,
				num01*num02, num01/num02};

%>


	<h3>결과</h3>
	<table>
		<tr><td><%= num01 %> X <%= num02 %> = <%= result[calIdx] %></td></tr>
	</table>
	
<% } %>
	
</body>
</html>