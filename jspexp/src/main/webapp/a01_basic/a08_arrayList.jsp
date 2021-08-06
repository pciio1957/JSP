<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.a01_start.*" %>
   
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

	<%
	
	ArrayList<String> list = new ArrayList<String>();
	
	
	/*
	
	응용1) 컴퓨터부품을 list에 등록하고 테이블로 아래 형식으로 출력하기
		번호  컴퓨터부품
		1	@@@
		2	@@@
		3	@@@
		
	응용2) ArrayList<Product> 처리하고 아래와 같이 출력하기 (1조)
		번호  물건명   가격  갯수
		1	@@@		@@  @@
		2	@@@		@@	@@
		3	@@@		@@	@@
	
	*/
	
	
	list.add("마우스");
	list.add("모니터");
	list.add("키보드");
	
	// 바로 위에 add하지않고 간편하게 작성하는 방법
	List<String> list2 = Arrays.asList("마우스", "모니터", "키보드");
	
	
	ArrayList<Product> proList = new ArrayList<Product>();
	
	proList.add(new Product("마우스", 10000, 10));
	proList.add(new Product("키보드", 30000, 9));
	proList.add(new Product("모니터", 200000, 5));
	
	
	%>

	<h3></h3>
	<table>
		<% for(int idx=0;idx<list.size(); idx++) { %>
		<tr><th>번호</th><th>물건명</th><th>가격</th><th>갯수</th></tr>
		<tr>
			<td><%= idx %></td>
			<td><%= proList.get(idx).getPname() %></td>
			<td><%= proList.get(idx).getPrice() %></td>
			<td><%= proList.get(idx).getCnt() %></td>
		</tr>
		<% } %>
	</table>
</body>
</html>