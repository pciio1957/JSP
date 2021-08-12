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
#jsp의 세션 범위 관련 기본 객체
1. jsp는 변수들을 저장할 때 특정한 범위로 저장할 수 있다.
	(page 범위, 시간 - session time, 브라우저와 서버 관계, 서버)
	이때 활용되는 객체가 session scope 범위로
	1) 한 페이지 단위에서 데이터를 저잘하고 활용할 수 있는 pageContext, 
	
	2) 요청 page까지 데이터를 저장하고 활용할 수 있는 request,
		<jsp:forword page="요청페이지"/> request와 response를 요청페이지에 전달
		RequestDispatcher rd = request.getRequestDispatcher("페이지");
		rd.forward(request, response);
		request.setAttribute("p01", new Person("홍길동', 27, "서울"));
		요청된 페이지에서
		Person p01 = (Person) request.getAttribute("p01");
		
	3) 브라우저가 닫힐 때까지 데이터를 저장하고 활용할 수 있는 session, 
		특정한 client(브라우저)와 server(웹 어플리케이션 서버-톰캣(Was)) 관계가 끝날때까지
		response.sendRedirect("이동할 페이지");
		location.href = "이동할페이지";
		<a href="이동할 페이지">안녕하세요</a>
		로 이동했을 떄 페이지를 이동했을지라도 특정 데이터나 객체를 
		가지고 있을 수 있게 처리한다.
		ex) session.setAttribute("mem01", new Member("himan", 7777, "홍길동", 3000));
		
	4) 서버 단위로 데이터를 저장하고 활용할 수 있는 application으로 기본 객체를 지원하고 있다
		다른 브라우저(client)가 다를지라도 
		브라우저를 다닫고 다시 시작하더라도 데이터를 가지고 있을 수 있는 객체
		ex) 주의! session은 url주소를 복사하여 같은 브라우저에서 창을 닫기까지
		session값을 유지하나 다른 브라우저(client가 다른)에서 유지되지 않으나 
		application범위로 접근이 가능하다
		
		ex) application.setAttribute("data01", new Emp(7778, "홍길동', "사원"));
		Emp emp = (Emp) application.getAttribute("data01");
	

--%>
<%

	// 해당 데이터 할당이 없다면 null 출력
	// 1. page Scope 데이터 처리 : 현재 페이지에서만 사용할 수 있는 범위로 객체 선언
	pageContext.setAttribute("pageVar", "홍길동(page)");

	// 2. request Scope 데이터 처리 : reqeust 처리까지 데이터를 가지고 있다
	request.setAttribute("requestVar", "김길동(request)");
	
%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("session scope");
	});
</script>
<body>
	<jsp:forward page="a02_sessionScope2.jsp"/>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>페이지범위</th><td><%= pageContext.getAttribute("pageVar") %></td></tr>
		<tr><th>페이지범위</th><td><%= request.getAttribute("requestVar") %></td></tr>
		<tr><th>페이지범위</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="검색"/>
		</td></tr>
	</table>	
	</form>
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>