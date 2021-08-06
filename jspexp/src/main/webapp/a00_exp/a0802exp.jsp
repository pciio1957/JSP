<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
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
		document.querySelector("h3").innerText="시작";
	}

</script>
</head>
<%-- 

# 주간 정리문제
1. go.jsp에 요청값(name=홍길동)를 단계별로 아래와 같이 처리할 때, 사용 코드를 기술하세요.
    1) a href
    	<a href="a0802exp2.jsp?name=<%= name %>">
    2) h2로 클릭시 
    	<script> 
    	
    	var h2Obj = document.querySelector(h2);
    	h2Obj.onclick = function() {
    	
    		location.href = "a0802exp2.jsp?name=" + name;
    	}
    	</script>
    3) form객체 get방식 2페이지 처리
    	<form action="a0802exp2.jsp" method="get">
    	<input type="submit" value="get방식전송"/>
    
    4) form객체 post방식 1페이지 처리
    	<form method="post">
    	<input type="submit" value="post방식전송"/>
2. 요청값에 대한, null값과 숫자값 처리를 간단한 예제로 기술하세요
	(아래) 
	
	// 초기화면에 대한 nullpointer 예외 방지 처리
	if(요청값 != null) {
		int num = 0;
		if(!요청값.trim().equals("")) {
			num = Integer.parseInt("요청값");
		}
	}
3. 요청값의 1페이지로 아래와 같은 내용을 처리하세요.
    놀이공원입장료 :50000
    나이 :[   ] (나이에 따른 할인율계산)
    인원 :[   ]
    [입장료계산]
4. 물건정보 테이블을 만들고, 물건리스트 처리하는 화면과 등록/상세조회/수정/삭제 구현 처리하세요.
~ 9:30까지 일단 진행하겠습니다. 

--%>
<%

A05_PreparedDao dao = new A05_PreparedDao();
Emp emp = new Emp();
emp = dao.getEmp(7499);

%>

<body>
	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename" value="<%= emp.getEname() %>"/></td></tr>
		<tr><th>사원번호</th><td><input type="text" name="empno" value="<%= emp.getEmpno() %>"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>
	</form>
	
<%

String ename = request.getParameter("ename");
String empnoS = request.getParameter("empno");

if(ename == null) ename = "";
if(empnoS == null) empnoS ="0";

if(ename != null) {
%>	
	
	<table>
		<tr><th>회원명</th><td><%= ename %></td></tr>
		<tr><th>회원번호</th><td><%= empnoS %></td></tr>
	</table>	
	<% } %>

</body>
</html>