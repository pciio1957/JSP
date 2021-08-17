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
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
		type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h3Title").text("시작");
	});
</script>
</head>
<%-- 
#자바빈(javaBeans)
1. 웹 프로그래밍에서 데이터의 표현을 목적으로 사용한다.
2. 일반적인 구성
	값을 저장할 필도, 수정시 사용할 setter메소드, 읽기 위한 getter 메소드
	vo객체의 구성 처리 
3. 자바빈 프로퍼티
	1) 프로퍼티는 자바빈에 저장되어있는 값을 표현
	2) 메소드 이름을 사용해서 프로퍼티의 이름을 결정
	3) 규칙 : 프로퍼티 이름은 propertyName일 경우
		- setter : public void set프로퍼티이름(타입)
		- getter : public 리턴타입 get프로퍼티이름()
		- boolean 타입의 경우 getter에 get대신 is 사용 
		- 배열 지정 가능 
			ex) public void setNames(String[] names);
	4) 읽기/쓰기
		- 읽기 전용 : get 또는 is메소드만 존재하는 프로퍼티 
		- 읽기/쓰기 : get/set 또는 is/set 메소드가 존재하는 프로퍼티 
		
4. jsp:useBean 태그
	1) jsp에서 자바빈 객체를 생성할 때 사용한다
	2) 기본형식 
		<jsp:useBean id="빈이름" class="자바빈클래스이름" scope="범위"/>
			- id : jsp페이지에서 자바빈 객체에 접근할 때 사용할 이름
			- class : 패키지 이름을 포함한 자바빈 클래스의 완전한 이름
			- scope : 자바빈 객체가 저장될 영역을 저장
					page, request, session, application 중 하나의 값을 가짐


--%>
<%

%>
<body>
	<%-- 
	
	// useBean한거보다 복잡
	Member m01 = new Member();
	pageContext.setAttribute("m01", m01);
	
	--%>
	
	<jsp:useBean id="m01" class="jspexp.z02_vo.Member" scope="page"></jsp:useBean>
	
	<%
		m01.setName("홍길동무");
	%>
	
	<%-- 
	
	응용) Product클래스를 z02_vo에 생성하고 useBean으로 객체 생성 후 
		물건명, 가격, 갯수 출력하기 (3조) 
	--%>
	
	<jsp:useBean id="probean" class="jspexp.z02_vo.Product" scope="page"/>
	
	<% 
	
	probean.setName("텀블러");
	probean.setPrice(12000);
	probean.setCnt(3);
	
	%>
	
	<h3 align="center" id="h3Title"></h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>bean name 프로퍼티</th><td><%= m01.getName() %></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table  align="center" class="listTable">
		<tr><th>물건명</th><td><%= probean.getName() %></td></tr>
		<tr><th>가격</th><td><%= probean.getPrice() %></td></tr>
		<tr><th>갯수</th><td>v<%= probean.getCnt() %></td></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>