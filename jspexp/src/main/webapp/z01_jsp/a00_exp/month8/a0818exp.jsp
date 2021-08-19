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

#정리문제
1. [jsp] 세션 scope의 범위를 구체적인 내용과 함께 기술하세요
	세션의 범위 : pageContext, request, session, application
	1) pageContext : 한 페이지 단위에서 데이터의 저장 및 활용
	2) request : form 사용 시 연결되는 페이지까지 데이터의 저장 및 활용
	3) session : 브라우저가 열리고 닫힐 때까지 해당 데이터의 저장 및 활용 가능
	4) application : 서버에서 공유되는 데이터로 브라우저를 종료 후 다시 실행해도 사용 가능
	
2. [jsp] application 객체를 활용하여 web.xml에 설정되어 있는 값을 처리하는 코드를 기술하세요.
	application : 서버내에 저장되는 정보를 활용할 수 있다 (서버의 공통정보를 출력할 때 유용)
	1) web.xml에 작성되어 있는 param-name 확인
	2) 스크립틀릿에 해당 param을 이용해 정보를 가져옴
		String dbPort = application.getInitParameter("DB_PORT");
	3) 사용할 곳에 표현식을 이용해 출력 
		<%= dbPort %>

3. [jsp] <jsp:include> 액션 태그와 include의 기본 코드와 차이점을 기술하세요.
	기본 include는 단순히 페이지를 포함시키지만 <jsp:include>는 파라미터와 버퍼를 이용해 데이터의 전달 및 활용이 가능하다.

4. [jsp] <jsp:include> 액션 태그로 매개변수값으로 데이터를 처리하는 방식을 이용해서 포함된 페이지에
    아이디값을 넘기세요.
    로그인 메뉴1 메뉴2 ==> 클릭시, 하단 메뉴 이동
    로그인 ID [  ][로그인] ==> 로그인후 메뉴1로 이동 ID값 전달
    
5. [jsp] <jsp:forward>를 활용하여 물건명과 가격, 갯수를 입력하여 결과페이지(물건명,계)를 출력하세요.
	(아래, a0818exp2.jsp로 연결)

6. [jquery] filter()와 not()의 차이를 기술하세요.
	1) filter() : 원하는 태그를 선택하기 위해 사용하므로 작성한 선택자에게 메소드 적용
	2) not() : not은 반대 결과값을 나타내며 작성한 선택자의 반대되는 선택자에게 메소드 적용

7. [jquery] 버튼을 클릭시, h2는 배경색상 노랑색으로 처리하고, add()를 활용해서 h2와 함께
    h3의 글자색상을 navy로 처리하세요.
~ 제출하고, 손들어주세요!

--%>
<%

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2obj").text("8월 18일 정리문제");
		

	});
</script>
<body>
	<h2 id="h2obj" align="center"></h2>
	
	<!--  4번 문제 -->
	<table id="tab01" class="generalTable">
		<tr>
			<th><input type="submit" value="로그인" id="btnLogin"/></th>
			<th><input type="submit" value="메뉴1" id="btnMenu1"/></th>
			<th><input type="submit" value="메뉴2" id="btnMenu2"/></th>
		</tr>
	</table>
	
	<jsp:include page="a0818_Login.jsp">로그인</jsp:include>
	<jsp:include page="a0818_menu1.jsp">메뉴1</jsp:include>
	<jsp:include page="a0818_menu2.jsp">메뉴2</jsp:include>
	

	
	<!--  5번 문제 -->
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value="0"/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="pcnt" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="구매하기"/>
		</td></tr>
	</table>	
	</form>
	
	<% 	
		String pcntS = request.getParameter("pcnt");
		if(pcntS != null) {
	%>
	<jsp:forward page="a0818exp2.jsp"/>
	<% } %>

	
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>