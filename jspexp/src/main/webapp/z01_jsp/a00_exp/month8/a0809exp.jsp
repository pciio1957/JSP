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

# 주간정리
1. jsp 기본 객체 중 특정한 시간적인 범위를 지정하여 설정할 때, 쓰이는 객체들과
    이 범위에 대하여 기술하세요.
    
    session
    jsp는 java와 다른점으로 데이터유형뿐만 아니라 시간과 페이지범위를 정할 수 있다.
    페이지범위, 시간, 브라우저와 서버의 관계 등 설정가능하다.
    
    1) 범위내용
    pageContext(page), request(요청), session(세션), application(서버)

    page : 한 페이지 내에서만 사용이 가능하고 다음 페이지에서는 사용 불가능
    request : 요청값 전달(request) 범위까지 데이터를 사용하는 것
    	submit, location.href의 요청값을 호출하였을 때 해당 처리범위까지 사용
    session : 브라우저가 서버와 연동하는 범위까지 데이터 사용
    application : 브라우저 상관없이 서버가 실행되는 범위까지 데이터 사용 
    
    2) 사용방법
    .setAttribute("키", "값");
	.getAttribute("키"); : 해당 키를 가져온다 
	
2. 액션태그 중에 외부 페이지를 포함하는 태그와 request 범위로 이동하는 태그를 기술하세요.
	1) <jsp:include page="포함할 페이지" />
	액션태그 중 외부 페이지를 해당 페이지에 포함시킬 수 있는 태그
	2) <jsp:forward page="이동할 페이지"/>
	다른 페이지로 이동할 떄 사용되는 태그로 jsp 페이지 내에 forward 액션태그를 만나게 되면
	forward태그가 있던 jsp 페이지의 모든 내용을 버리고 지정한 페이지로 이동
	
3. 서버와 클라이트 연결 시, 임시 데이터의 발생의 저장 위치에 따른 객체를 기술하고,
    이 중 client단에 저장하는 객체의 기본 코드를 기술하세요.
    결과로 특정한 데이터를 클라이언트에 저장할 때 -> 쿠키 사용
    Cookie p01 = new Cookie("name", "himan");
	response.addCookie(p01);
    
    
    session (서버단 저장)
    cookie (클라이언트단 저장)
    
    클라이언트 <------------------> 서버
    						request : 요청값을 받을 때 활용
    						response : 클라이언트에 화면이나 쿠키값을 보낼때 사용 
4. jsp 페이지의 에러발생 처리 방법을 기술하세요.
	1) 에러를 처리할 페이지에 errorPage를 사용해 에러날 경우 나타낼 페이지 지정
	errorPage="z01_error.jsp"
	2) 지정한 페이지에는 isErrorPage의 값을 지정해준다. 
	isErrorPage = "true"

5. bean을 활용한 객체의 생성과 활용을 기술하세요.
	1) Bean의 생성
	JSP에서 작성했던 코드를 재사용하기 위해 데이터를 컴포넌트 형태로 만들어 사용함
	<jsp:useBean id="m01" class="jspexp.z02_vo.Member" scope="page"/>
	scope의 경우 범위 지정
		- page, request, session, application 
	
	2) Bean의 활용
	생성된 Bean을 활용하기 위해서는 set, getProperty를 활용한다
	<jsp:setProperty name="id" property="이름" value="값"/>
	<jsp:getProperty property="이름" name="id">
	
6. property란 무엇인가? 위 bean을 객체를 기준으로 기술하세요.
	프로퍼티는 자바빈에 저장되어있는 값을 표현한다, 하지만 필드와 다르다
	위에서 생성한 m01의 저장되어 있는 setXX, getXX메소드를 이용한 값을 말한다.

7. MVC 패턴의 의미와 Servlet을 통한 Controller단 주요 선언 내용을 기술하세요.
	Model View Controller를 의미하는 것으로 자바의 웹개발이나 화면처리 프로그램의 
	세분화된 개발 패턴을 의미한다
	
	서블릿의 controller 
	1. 요청값 처리 : request.getParameter("요청키");
	2. 모델 데이터 처리 : request.setAttribute("모델키", 모델값);
	3. 화면단 호출 : requestDispatcher rd = reqeust.getRequestDispatcher(위의 view단);
		rd.forward(request, response);
	
8. js의 Date 객체의 주요 메서드를 기술하세요
	set/get메소드  (Set에 setDay()는 없음)
	xxxFullYear(), XXXMonth(), XXXDate(), getDay(), XXXHours() 
	XXXMinutes(), XXXSecounds()
	
9. js의 배열객체의 메서드를 기술하세요
	.length : 배열의크기
	.push() : 배열의 마지막에 데이터 추가
	.pop() : 배열의 데이터 삭제
	.slice(시작, 마지막) : 배열의 일정부분 추출(구조변경 안됨)
	.splice(시작, 마지막) : 배열의 일정 부분 추출(구조변경)
	.concat(배열) : 배열과 배열의 연결
	.sort(function(left, right) { return left-right}) : 오름차순 정렬
	.sort(function(left, right) { return right-left}) : 내림차순 정렬
	
-> 지난주 4조에서 캘린더 사용한다고 했었는데 그거와 연결해서 작성
10. js의 Date를 활용하여 오늘의 요일을 구하고, setDate(getDate()-@@@)을 통해서
이번 주 일요일 날짜를 구하세요. 2X7 테이블을 통해서 요일 행과 날짜 행을 만들고,
이번 주 일요일 날짜와 오늘 날짜를 출력하세요.



--%>
<%

%>
<body>
	<h3 align="center" id="h3Title"></h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table  align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>