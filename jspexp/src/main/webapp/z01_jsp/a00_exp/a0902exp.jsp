<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Front 연습</title>
<link rel="stylesheet" href="${path}/z00_com/a01_com.css">
<style>

table {
	width:70%;
	margin-bottom:20px;
	padding:20px;
}

td {
	text-align:center;	
}

</style>
</head>
<%-- 

#정리문제
1. com.google.gson.Gson api를 활용하여 객체를 json문자열로,
json문자열을 객체로 변환하는 기본 메소드를 기술하기 
	Gson Aqi
	구글에서 지원하는 json 문자열 데이터 변환 Api
	1) toJson
		객체를 json문자열로 바꿔준다
	2) fromJson
		json문자열을 객체로 바꿔준다 
		
	Member m01 = new Member("himan", "7777", "오길동", "관리자", 1000);
	Gson gson = new Gson();
		
	// 문자열 -> json 문자열
	String str01 = gson.toJson(m01);
	System.out.println(str01);
		
	// json 문자열 -> 문자열
	Member m02 = gson.fromJson(str01, Member.class);
	System.out.println(m02.getId());
	System.out.println(m02.getPw());
	System.out.println(m02.getName());
	System.out.println(m02.getAuth());
	System.out.println(m02.getPoint());

2. MVC 패턴을 활용하여 ajax 데이터를 처리하려고 한다.
controller, service, dao, view단 위주로 처리하는 핵심 프로세스를 정리하기
	MVC패턴을 이용한 ajax 데이터 처리 프로세스
	1) view
		- 초기화면 로딩하기 위해 화면 작성 
		- 입력할 요청값 확인하여 ajax 처리
	2) controller 
		- 요청값 처리 
		- JSON 결과 데이터, 모델값 처리를 위한 service단 호출 	 	
	3) service 
		- JSON 데이터 변환(객체->json데이터) 후 dao 호출
	4) DAO
		- sql 실행 후 service로 전송 -> service에서 controller로 반환
	5) controller
		- view단 연결 후 Json 결과 데이터를 전달
		- out.print()를 이용해 화면에 출력
	6) view 
		- json문자열을 json객체로 변환 후 화면에 출력
		
		
	1) controller (url : call.do)
		요청값 처리 : request.getParameter("key");
		model 데이터처리 <-- service <-- dao
			ajax는 모델데이터를 선언할 필요없이 json 데이터로 처리
			service단에서 Gson api 활용
		view단 호출
			초기화면 호출(ajax처리일때만) : response.redirect("호출할 페이지");
			response.getWriter().print()
			
	2) view
		요청처리할 화면 name으로 구성 : <input name="key"
		js controller를 ajax 호출
		var xhr = new XMLHttpRequest(); 
		$("이벤트선택자").이벤트명(function() {
			// xhr 이용
		});
		

3. 전날 처리한 ajax를 이용한 회원id 조회화면에서 등록, 수정, 삭제 버튼을 추가하여 ajax로 처리해보기 

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
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