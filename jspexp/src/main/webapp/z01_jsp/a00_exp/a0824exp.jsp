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
	width:70%;
	margin-bottom:20px;
	padding:20px;
}

</style>
</head>
<%--
 
#정리문제
1. 서버단위로 session 만료기간을 설정하려고 한다. 처리할 내용 기술하기
	세션의 만료기간(유효기간) 설정
	1) web.xml의 session-config안에 session-timeout 속성 지정하기 
		session-timeout의 경우 분단위로 설정한다. 

2. 자바빈의 기본형식 중 bean선언, 프로퍼티 선언, el호출까지 기술하기
	자바빈의 기본형식
	1) bean선언
	<jsp:useBean id="stu01" class="jspexp.z02_vo.Student"/>
	2) 프로퍼티 선언
	<jsp:setProperty name="stu01" property="name" value="홍길동"/>
	<jsp:getProperty name="stu01" property="name" />
	3) el호출
	${stu01.name}
	
3. 자바빈의 프로퍼티란 무엇인가?
	자바빈은 자바의 클래스를 객체로 프로퍼티는 해당 클래스의 필드를 의미한다.
	getProperty는 getXXX() setProperty는 setXXX()를 의미한다.

4. jspexp.z02_vo.Student를 bean으로 설정하고 
	요청값으로 ?no=1&name=홍길동&kpt=70&ept=80&mpt=90 를 받아서 처리하려고 한다
	요청값을 받은 내용을 bean을 활용하여 출력하기
	
5. 아래와 같은 부서정보 등록(DAO처리)를 Bean을 활용하여 처리하기
	부서번호 :
	부서명 : 
	부서위치 : 
		[등록]
		
	---- 부서정보리스트 ---- 
	9시 30분에 1차 점검 

--%>
<jsp:useBean id="dp01" class="jspexp.z02_vo.Dept"/>	
<%

	A05_PreparedDao dao = new A05_PreparedDao();
	ArrayList<Dept> dpSelect = dao.getDeptAllList();

	
	String deptnoS = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	
	if(loc != null) {
		int deptno = Integer.parseInt(deptnoS);
%>	
	<!--  <jsp:setProperty property="*" name="dp01"/> property와 요청key가 같으면 자동할당 -->	
	<jsp:setProperty name="dp01" property="deptno" value="<%= deptno %>"/>
	<jsp:setProperty name="dp01" property="dname" value="<%= dname %>"/>
	<jsp:setProperty name="dp01" property="loc" value="<%= loc %>"/>
	
<%	
		System.out.println(dp01.getDname());
		dao.insertDept(dp01);
		dpSelect = dao.getDeptAllList();
	}
	
%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("8월 24일 정리문제");
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	
	<!--  4번 문제 -->
	<jsp:useBean id="stu01" class="jspexp.z02_vo.Student"/>
	<jsp:setProperty name="stu01" property="sno" param="no"/>
	<jsp:setProperty name="stu01" property="name"/>
	<jsp:setProperty name="stu01" property="kor" param="kpt"/>
	<jsp:setProperty name="stu01" property="eng" param="ept"/>
	<jsp:setProperty name="stu01" property="math" param="mpt"/>
	
	<h3 align="center"> 학생 정보 </h3>
	<table align="center" class="listTable">
		<tr><th>학생번호</th><td>${stu01.sno}</td></tr>
		<tr><th>학생이름</th><td>${stu01.name}</td></tr>
		<tr><th>국어점수</th><td>${stu01.kor}</td></tr>
		<tr><th>영어점수</th><td>${stu01.eng}</td></tr>
		<tr><th>수학점수</th><td>${stu01.math}</td></tr>
	</table>
	

	
	<!--  5번 문제 -->

	<h3 align="center"> 부서 정보 등록 </h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>부서번호</th><td><input type="text" name="deptno" value=""/></td></tr>
		<tr><th>부서명</th><td><input type="text" name="dname" value=""/></td></tr>
		<tr><th>부서위치</th><td><input type="text" name="loc" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="등록"/>
		</td></tr>
	</table>	
	</form>
	
	
	<% if(dpSelect != null) { %>
	<h3 align="center"> 부서 정보리스트 </h3>
	<table align="center" class="listTable">
		<tr><th>부서번호</th><th>부서명</th><th>위치</th></tr>
		<% for(Dept dt:dpSelect) { %>
			<tr><td><%= dt.getDeptno() %></td><td><%= dt.getDname() %></td><td><%= dt.getLoc() %></td></tr>
			<!-- <tr><td>${dt.deptno}</td><td>${dt.dname}</td><td>${dt.loc}</td></tr>  -->
		<% } %>
	</table>	
	<% } %>
	
</body>
</html>