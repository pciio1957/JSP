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
#자바빈
1. 웹프로그래밍에서 데이터의 표현을 목적으로 사용한다
2. 일반적인 Bean 구성 
	값을 저장하기 위한 필드
	값을 수정하기 위한 setter
	값을 읽어오기 위한 getter

3. 자바빈 프로퍼티 ★
	1) 프로퍼티는 자바빈에 저장되어 있는 값을 표현한다.
	2) 메소드 이름을 사용해서 프로퍼티의 이름을 결정한다
	3) 규칙 : 프로퍼티 이름이 propName일 경우 
		- setter : public void setPropName(Type value);
		- getter : public Type getPropName();
		- boolean : isPropName();
		- 배열 지정 가능 : public void setName(String[]);
			ex) 프로퍼티명이 age인 경우
				setter : public void setAge(int age[]){};
				getter : public int getAge();
				boolean : public boolean isAge();		

			ex2) public void setLoc(String loc){}
				-> property이름 : loc
				
4. 활용
	1) useBean
		<jsp:setProperty name="p01" property="loc" value="서울"/>
	2) el/jstl
		${p01.name} -> p01.getName() 호출
	
5. <jsp:useBean> 태그
	1) jsp에서 자바빈 객체를 생성할 떄 사용
		<jsp:useBean id="빈이름" class="패키지명.자바클래스" scope="session범위"/>
	
	ex) 위의 useBean과 setProperty 같음 
		<jsp:useBean id="p01" class="jspexp.z02_vo.Person" scope="request"/>
		-> request.setAttribute("p01", new Person());
		
		<jsp:setProperty name="p01" property="name" value="홍길동"/>
		-> Person p01 = new Person();
			p01.setName("홍길동");
			
		<jsp:getProperty name="p01" property="name"/>
		-> Person p01 = (Person) request.getAttribute("p01");
			<%= p01.getName() %>
			${p01.name}	
			
--%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("useBean 활용");
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>

<!-- 1-1) [자바] 객체 생성 후 세션에 객체 할당 -->
<%
	Person p = new Person();
	p.setName("마길동");
	p.setAge(27);
	p.setLoc("서울방배동");
	session.setAttribute("p01", p);
%>

<!--  1-2) [자바] 할당된 세션의 값을 가져와서 객체에 할당 -->
<%

	Person p01 = (Person) session.getAttribute("p01");
	
%>
<!--  1-3) [자바] 가져온 객체값 출력 -->
	<h3 align="center">자바코드로 처리</h3>
	<table align="center" class="listTable">
		<tr><th>p01.getName()</th><td><%= p01.getName() %></td></tr>
		<tr><th>p01.getAge()</th><td><%= p01.getAge() %></td></tr>
		<tr><th>p01.getLoc()</th><td><%= p01.getLoc() %></td></tr>
	</table>

<!--  2-1) [useBean] setter를 이용해 useBean으로 자바빈 객체 선언/할당  -->
<jsp:useBean id="p02" class="jspexp.z02_vo.Person" scope="session"/>
<jsp:setProperty name="p02" property="name" value="홍길동"/>
<jsp:setProperty name="p02" property="age" value="25"/>
<jsp:setProperty name="p02" property="loc" value="서울신림동"/>

<!--  2-2) [useBean]  getter를 이용해 자바빈 객체의 값 출력  -->
	<h3 align="center">useBean로 처리</h3>
	<table align="center" class="listTable">
		<tr><th>Property name</th><td><jsp:getProperty property="name" name="p02"/></td></tr>
		<tr><th>Property age</th><td><jsp:getProperty property="age" name="p02"/></td></tr>
		<tr><th>Property loc</th><td><jsp:getProperty property="loc" name="p02"/></td></tr>
	</table>	
	
<!--  3-1) [el] 할당된 출력 -->
	<h3 align="center">el태그로 처리</h3>
	<table align="center" class="listTable">
		<tr><th>el태그 name</th><td>${p01.name}, ${p02.name}</td></tr>
		<tr><th>el태그 age</th><td>${p01.age}, ${p02.age}</td></tr>
		<tr><th>el태그 loc</th><td>${p01.loc}, ${p02.loc}</td></tr>
	</table>
	
	
<!--  응용) student 클래스를 Bean 객체로 선언 후 데이터 할당하고 호출
이때 el태그로 호출까지 (1조 제출, 나머지 옆으로 손들기..?)  -->
<jsp:useBean id="stu01" class="jspexp.z02_vo.Student" scope="session"/>
<jsp:setProperty name="stu01" property="sno" value="1"/>
<jsp:setProperty name="stu01" property="name" value="김기동"/>
<jsp:setProperty name="stu01" property="kor" value="90"/>
<jsp:setProperty name="stu01" property="eng" value="88"/>
<jsp:setProperty name="stu01" property="math" value="92"/>

	<h3 align="center">응용문제 출력1 - useBean</h3>
	<table align="center" class="listTable">
		<tr><th>학생 번호</th><td><jsp:getProperty property="sno" name="stu01"/></td></tr>
		<tr><th>학생 이름</th><td><jsp:getProperty property="name" name="stu01"/></td></tr>
		<tr><th>학생 국어</th><td><jsp:getProperty property="kor" name="stu01"/></td></tr>
		<tr><th>학생 영어</th><td><jsp:getProperty property="eng" name="stu01"/></td></tr>
		<tr><th>학생 수학</th><td><jsp:getProperty property="math" name="stu01"/></td></tr>
	</table>
	
	<!--  화면에 보이지 않고 저장이 가능하다  -->
	${stu01.setName("신쫄이")} 
	
	<h3 align="center">응용문제 출력2 - el태그</h3>
	<table align="center" class="listTable">
		<tr><th>학생 번호</th><td>${stu01.sno}</td></tr>
		<tr><th>학생 이름</th><td>${stu01.name}</td></tr>
		<tr><th>학생 국어</th><td>${stu01.kor}</td></tr>
		<tr><th>학생 영어</th><td>${stu01.eng}</td></tr>
		<tr><th>학생 수학</th><td>${stu01.math}</td></tr>
	</table>


</body>
</html>