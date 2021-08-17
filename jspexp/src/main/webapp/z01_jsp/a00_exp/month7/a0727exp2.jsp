<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a01_start.*"
    import="jspexp.z01_database.*"
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
		document.querySelector("h3").innerText="로그인정보";
	}

</script>
</head>
<body>

	<%
		String name = request.getParameter("name");
		String team = request.getParameter("team");
		String teamno = request.getParameter("teamno");
	%>
	<h2>2단계 데이터</h2>
	이름 : <%= name %> <br>
	담당부서 : <%=team %> <br>
	담당부서번호 : <%=teamno %> <br>
	 <br> <br>

	
	<%
		String loginid = request.getParameter("loginid");
		String loginpw = request.getParameter("loginpw");
	%>
	<h2>Login 정보</h2>
	ID : <%= loginid %><br>
	PW : <%= loginpw %><br>
	<h4></h4>
	
	<% A05_PreparedDao dao = new A05_PreparedDao(); 
		boolean isSucc = dao.login(loginid,loginpw);
	%>
	
	<script type="text/javascript">

	
	<%-- 
	
	// jsp 변수를 js로 할당하기
	// 1. jsp가 먼저 처리되어야하고
	// 2. js는 최종결과물을 화면에서 받아서 처리한다는 개념을 반드시 생각해야함
	// 3.  데이터 처리시 주의사항 
	//	(1) boolean, 숫자형은 그대로 할당 가능
	//	(2) 문자열형은 "<%= jsp변수 %> ", '<%= jsp변수%>'에 할당되어야한다 
	
	--%>
	
	var isSucc = <%= isSucc %>;
	if(isSucc) {
		alert("로그인 성공\n메인페이지 이동");
		// 이동할 메인페이지 지정
		location.href = "a0727exp.jsp"
	} else {
		
		alert("로그인 실패\n로그인을 다시 하세요");
		// 로그인페이지 지정
		location.href = "a0727exp2.jsp";
	}
	
	</script>
	<h3 textalign="center"></h3>
	<form name="frm01">
		<table>
			<tr><th>id</th><td><%= loginid %></td></tr>
			<tr><th>pass</th><td><%= loginpw %></td></tr>
			<tr><th>인증여부</th><td>
				<%= loginid.equals("himan")&&loginpw.equals("7777")?"로그인 성공":"로그인 실패" %>
				<%= dao.login(loginid, loginpw)?"로그인 성공":"로그인 실패" %>
			</td></tr>
		</table>
	</form>

<script type="text/javascript">

// login 인증여부 확인 - 미완
var id = request.getParameter("loginid");
var h4obj = document.querySelector("h4");

h4obj.innerText = ${loginid};

if(<%= loginid%>== "himan"){
	h4obj.innerText = "일치합니다";
	console.log("일치");
} else {
	h4obj.innerText = "일치하지않습니다";
}



</script>
</body>
</html>