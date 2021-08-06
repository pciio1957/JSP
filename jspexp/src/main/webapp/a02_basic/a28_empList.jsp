<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a01_start.*"
    import="jspexp.z02_vo.*"
    import="jspexp.z01_database.*"
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
		document.querySelector("h3").innerText="사원정보 등록";
	}

</script>
</head>
<%-- 

#조회화면에서
CRUD(create, read, update, delete) 처리
1. create 즉, 입력 처리
	1) 기능 버튼 선언(등록) : 클릭시 등록호면으로 이동
	2) 등록 화면 구현 : 사원명, 직책명, 관리자번호, 입사일, 급여, 보너스, 부서명 
	3) 등록 처리할 dao 기능메소드 구현
	4) 등록 화면에서 등록 버튼 클릭시 dao 등록 메소드 호출 처리 
		- 처리 후 전체 조회화면으로 이동/계속 등록할지 여부(confirm) 선택적 처리
	5) 

--%>
<%

%>

<script type="text/javascript">

function regEmp() {
	alert("등록처리");
	location.href = "a29_empInsert.jsp";
}

function goDetail(empno) {
	
	alert(empno + "상세화면 이동");
	location.href = "a32_empDetail.jsp?empno=" + empno;
}


</script>

<!--  

#상세화면 이동 처리 
1. 행 클릭시 empno를 함수를 통해서 전달하고
2. 해당 함수는 location.href = "상세화면?empno=받은empno"로 처리한다

-->
<body>
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>직책명</th><td><input type="text" name="job" value=""/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="검색"/>
			<input type="button" onclick="regEmp()" value="등록"/>
		</td></tr>
	</table>	
	</form>

<%

String name = request.getParameter("name");
String job = request.getParameter("job");

if(name == null) name = "";
if(job == null) job = "";

A05_PreparedDao dao = new A05_PreparedDao();
ArrayList<Emp> emplist = dao.getPreparedEmpList(new Emp(name, job));
%>

	<h4>회원테이블 수정</h4>
	<table>
		<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>직책</th>
			<th>관리자번호</th>
			<th>입사일</th>
			<th>급여</th>
			<th>보너스</th>
			<th>부서번호</th>
		</tr>
		<% for(Emp e:emplist) { %>
		<tr ondblclick="goDetail(<%= e.getEmpno() %>)"> 
			<td><%= e.getEmpno() %></td>
			<td><%= e.getEname() %></td>
			<td><%= e.getJob() %></td>
			<td><%= e.getMgr() %></td>
			<td><%= e.getHiredate() %></td>
			<td><%= e.getSal() %></td>
			<td><%= e.getComm() %></td>
			<td><%= e.getDeptno() %></td>
		</tr>
		<% } %>
	</table>
	
</body>
</html>