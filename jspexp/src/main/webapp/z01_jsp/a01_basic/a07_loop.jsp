<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
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
		document.querySelector("h3").innerText="시작";
	}

</script>
</head>
<body>

	<h3></h3>
	<% String fruits[] = {"사과", "바나나", "딸기"}; %>
	
	<select>
		<% for(int idx=0; idx<fruits.length;idx++) { %>
		<option> <%=fruits[idx] %> </option>
		<% } %>
	</select>
	<ul type="none">
		<% for(int idx=0; idx<fruits.length;idx++) { %>
		<li><a href="">[<%= idx+1 %>] <%= fruits[idx] %></a></li>
		<%} %>
	</ul><br>
	
		<% for(int idx=0; idx<fruits.length;idx++) { %>
		<%= idx+1 %> 번째 과일 : <input type="text" value="<%=fruits[idx] %>"/><br>
		<%} %>
	
	
	<%-- 
	
	응용) a07_loop.jsp
		배열로 사원명 배열 선언
		배열로 사원번호 배열 선언
		배열로 부서명 배열 선언으로 아래와 같이 출력하기 (6조)
		
		사원명  사원번호  부서명
		@@@    @@@    @@@
		@@@    @@@    @@@
		@@@    @@@    @@@
		
	 --%>
	 
	 
	 <% 
	 
	 String ename[] = {"홍길동", "고길동", "오길동"};
	 int eno[] = {1001, 1020, 1030};
	 String dname[] = {"인사팀", "전산팀", "총무팀"};
	 

	 %>
	 <table>
	 	<tr><th>사원명</th><th>사원번호</th><th>부서명</th></tr>
	 	<% for(int idx=0; idx<ename.length; idx++) { %>
	 	<tr>
	 		<td><%= ename[idx] %></td>
	 		<td><%= eno[idx] %></td>
	 		<td><%= dname[idx] %></td>
	 	</tr>
	 	<% } %>
	 </table>
	 
</body>
</html>