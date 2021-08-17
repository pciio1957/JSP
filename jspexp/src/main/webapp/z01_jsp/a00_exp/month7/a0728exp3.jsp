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
		document.querySelector("h3").innerText="예약";
	}

</script>
</head>
<body>

	<%-- 
	
	#form 및 요청처리 단일 페이지
	1. 요청폼과 결과처리화면 구현 
	2. 전송결과 조건에 따른 초기값과 결과화면의 분리
	3. 세부적인 데이터 처리 
	
	--%>


	<%
	
	String title = request.getParameter("mvname");
	String cntS = request.getParameter("mvperson");
	String payS = request.getParameter("mvprice");
	String time = request.getParameter("mvtime");
	
	
	// 초기화면
	if(title == null) {
		
	
	%>

	
	<h5>(풀이)예약 등록 처리 결과</h5>
	<form id="frm032">
		<table>
			<tr><th>영화제목</th><td><input class="input" type="text" value="" name="mvname"></td></tr>
			<tr><th>입장인원</th>
				<td>
					<select name="cnt" class="input" >
						<option value="">선택</option>
						<% for(int idx=1; idx<=20; idx++) { %>
						<option><%= idx %></option>
						<% } %>
					</select>
				</td></tr>
			<tr><th>입장료</th><td><input class="input"  type="text" value="" name="mvprice"></td></tr>
			<tr><th>상영시간</th>
				<td>
					<select name="time" class="input" >
						<option value="">선택</option>
						<% for(int hour=9; hour<=23; hour++) { %>
						<option><%= hour %>:00</option>
						<% } %>
					</select>
				</td>
			</tr>
			<tr><td colspan="2"><input type="submit" value="예매하기"></td></tr>
		</table>
	</form>
	
	<% } else { %>

	<h3 align="center"></h3>
		<table>
			<tr><th>영화제목</th><td><%= title %></td></tr>
			<tr><th>상영시간</th><td><%= time %></td></tr>
			<tr><th>입장인원</th><td><%= cntS %></td></tr>
			<tr><th>총 비용</th><td><%= Integer.parseInt(cntS) *
					Integer.parseInt(payS) %></td></tr>
		</table>
		
		
	<% } %>
</body>
</html>