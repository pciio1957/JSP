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
		$("#h3Title").text("8월 5일 응용문제");
	});
</script>
</head>
<%-- 
#정리문제

1.useBean에서 사용되는 property란 무엇을 의미하는지 vo객체를 예로 기술하기
	useBean으로 생성한 객체의 필드값을 말한다. 
	Vo객체의 경우 Member mem = new Member("himan01","7777"); 
	이렇게 생성자로 값을 지정하는데 useBean은 setProperty로 값을 지정하고 
	getProperty로 값을 가져와서 사용가능하다
	
	ex) 
	Class Person {
		private String name; // property가 아님
		public void setName(String name) {
			// 여기서 set을 뺀 Name -> 소문자 name으로 이것이 프로퍼티임
		}
	}
	
2. Person 객체를 useBean으로 활용하여 이름, 나이, 사는 곳을 property로 저장하고 호출하기
	(아래)
	
3. 모델1과 모델2의 차이 기술
	1) 모델1
		jsp를 이용한 단순한 모델로 jsp에서 요청 처리 및 뷰의 생성 처리를 한다.
		구현이 쉽다는 장점이 있지만 요청 처리 및 뷰 생성 코드가 뒤섞이게 되 코드가 복잡하다.
	2) 모델2
		서블릿이 요청을 처리하고 JSP가 뷰를 생성하는 방법으로 
		모든 요청을 단일 서블릿에서 처리하도록 한다.
		그 후 요청 처리된 후 결과를 보여줄 JSP로 이동한다.
		
	
		
4. MVC란 무엇인지 servlet 클래스인 A03_MVC.java를 통해서 각각의 구성요소를 나타내고 설명하기
	모델(service메소드) - 비즈니스영역의 상태 정보를 처리한다
	뷰(a03_mvc.jsp) - 비즈니스 영역에 대한 프레젠테이션 뷰로 사용자에게 정보를 표시한다
	컨트롤러(controller메소드) - 사용자의 입력 및 흐름 제어를 담당한다. 
	
	컨트롤러를 통해서 입력받은 값을 
	-> 모델(service)에서 핵심 기능 처리로 로그인의 경우 유효성 체크 후 
	-> 뷰(a03_mvc.jsp)를 통해 화면에 나타낸다. 

5. el태그로 Member vo객체의 정보 출력하기
	(아래)

--%>
<%

// page단위에서만 사용할 수 있는 범위 설정
pageContext.setAttribute("m01", new Member("himan", "7777", "홍길동","관리자",1000));

%>
<body>
	<h3 align="center" id="h3Title"></h3>
	
	<jsp:useBean id="p01" class="jspexp.z02_vo.Person" scope="page"/>
	<jsp:setProperty property="name" name="p01" value="홍길동" >
	<jsp:setProperty property="age" name="p01" value="25" >
	<jsp:setProperty property="loc" name="p01" value="서울" >
	

	<h3 align="center">Property 전달받은 객체 정보</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>이름</th><td><jsp:getProperty property="name" name="p01"/> </td></tr>
		<tr><th>이름</th><td><jsp:getProperty property="age" name="p01"/> </td></tr>
		<tr><th>이름</th><td><jsp:getProperty property="loc" name="p01"/> </td></tr>
	</table>	
	
	<jsp:useBean id="mem" class="jspexp.z02_vo.Member" scope="page"/>
	<jsp:setProperty property="id" name="mem" value="himan01" >
	<jsp:setProperty property="pw" name="mem" value="1111" >
	
	</form>
	<table  align="center" class="listTable">
		<tr><th>ID</th><td>${mem.id} </td></tr>
		<tr><th>PW</th><td>${mem.pw} </td></tr>
	</table>	
	
	<h3 align="center">객체로 생성한 멤버</h3>
	<table  align="center" class="listTable">
		<tr><th>ID</th><td>${m01.id} </td></tr>
		<tr><th>PW</th><td>${m01.pw} </td></tr>
	</table>	
	
</body>
</html>