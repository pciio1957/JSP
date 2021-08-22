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

</style>
</head>
<%-- 

#세션이란? 
1. 웹 컨테이너에서 클라이언트의 정보를 보관할 때 사용된다
2. 오직 서버에서만 생성하여 저장된다
3. 클라이언트와 관계에서 세션이 생성되기에 같은 브라우저가 아니면 세션은 종료된다
4. session의 설정
	session.setAttribute("세션명", 할당할 객체);
	지정한 세션만 삭제 : session.removeAttribute("세션명");
	전체 세션의 종료 : session.invalidate();
	
5. session의 유효시간 설정
	1) web.xml 작성
		<session-config>
			<session-timeout> 분단위
	2) setMaxInactiveInterval(); 
	

--%>
<%

	// 1-1. 기본 변수할당
	session.setAttribute("num01", 25);
	// 2-1. 기본 객체할당
	session.setAttribute("p01", new Person("홍길동", 25, "서울"));
	// 3-1. 배열형 List 객체할당
	session.setAttribute("list", Arrays.asList("사과", "바나나", "딸기"));
	
	
	// 1-2. 변수 가져오기
	int num01 = (Integer) session.getAttribute("num01");	
	// 2-2. 객체 가져오기
	Person p01 = (Person) session.getAttribute("p01");
	// 3-2. 배열 가져오기
	List<String> fruits = (List<String>) session.getAttribute("list");
	
	
	// 응용) 변수, 객체, 배열 생성 후 값 출력하기 
	session.setAttribute("num02", 33);
	session.setAttribute("pro", new Product("텀블러", 12000, 3));
	session.setAttribute("mlist", Arrays.asList(new Member("himan", "7777"), new Member("higirl", "8888")));
			

	int num02 = (Integer) session.getAttribute("num02");
	Product pro = (Product) session.getAttribute("pro");
	List<Member> mlist = (List<Member>) session.getAttribute("mlist");

%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("Session 데이터 확인");
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>

	<table align="center" class="listTable">
		<tr><th>변수(num01)</th><td><%= num01 %></td></tr>
		<tr><th>객체(p01)</th>
			<td><%= p01.getName() %>,
			<%= p01.getAge() %>,
			<%= p01.getLoc() %></td>
		</tr>
		<tr><th>객체(p01) EL태그</th>
			<td>${p01.name},
			${p01.age},
			${p01.loc}</td>
		</tr>
		<tr><th>배열(list)</th>
			<td><%= fruits.get(0) %>,
			<%= fruits.get(1) %>,
			<%= fruits.get(2) %></td>
		</tr>
		<tr><th>배열(list) EL </th>
			<td>${fruits.get(0)},
			${fruits.get(1)},
			${fruits.get(2)}</td>
		</tr>
	</table>	
	
	<!--  응용) 변수 num02, 객체 Product, 배열객체 List<Member>로 session에 저장하고
			호출하기 (5조 제출, 나머지 손들기) -->
	
	<table align="center" class="listTable">
		<tr><th>변수</th><td colspan="2"><%= num02 %></td></tr>
		<tr><th>객체</th><td colspan="2"><%= pro.getName() %>, <%= pro.getPrice() %>, <%= pro.getCnt() %></td></tr>
		<tr><th>배열</th>
			<% for(Member m:mlist) { %>
			<td><%= m.getId() %>, <%= m.getPw() %></td>
			<% } %>
	</table>
	
	
	
	<h3 align="center" onclick="location.href = 'a02_show.jsp'"> session 확인</h3>
	
</body>
</html>