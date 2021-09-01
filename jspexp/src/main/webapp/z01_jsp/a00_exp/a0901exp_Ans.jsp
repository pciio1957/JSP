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
1. 날짜형 데이터에 대한 fmt 기본 형식을 기술하기
	날짜 처리
	1) 날짜 데이터에는 날짜와 시간이 결합되어있다.
	2) data  type은 java.util.Date를 활용한다
	3) 기본 형식
		<fmt:formatDate type="date|time|both"
			dateStyle="full|short"
			timeStype="full|short"
			pattern="yyyy/MM/dd kk:mm:ss.S"
			value="선언된 데이터"/>

2. 오늘 기준으로 날짜와 현재시간을 full 형식으로 출력처리하기
	(아래)

3. 숫자형 데이터의 기본 속성을 기술하기 
	숫자처리
	1) 숫자를 통화나 소숫점 이하 지정된 형식으로 처리할 수 있다
	2) type의 속성
		currency : 통화단위 (원 표시와 천 단위마다 , 적용)
		percent : % 단위 (단위뒤에 % 적용)
	3) pattern : 00,000,000.000 등과 같이 
		특정한 출력 형식을 처리할 수 있다 (사용자 지정 패턴)

4. DB 접근하여 MVC 패턴으로 데이터를 출력하는 기본 프로세스를
	controller, service, dao, view, model로 
	나누어 핵심코드와 함께 설명하기 

	1) cotroller
		초기 화면구성, 기본 모델 데이터 생성
		
	2) service(.java)
		모델단 처리를 위한 비지니스 로직을 처리할 객체 
		dao단을 호출하고 controller에 특정한 데이터를 return해준다
		
	3) dao (.java)
		database access object로 데이터베이스를 접근하여 처리할 객체를 말한다
		sql 처리를 하고 service단에 결과값을 리턴한다
		
	4) view단(.jsp)
		화면구현, form 객체 선언
		${모델명} : controller에서 넘겨온 데이터 출력처리 
	
	
5. MVC 패턴으로 등록된 id인지 여부를 확인 처리하는 (DAO추가)
	jsp 프로그램을 구현하기
	
	1) 개발순서
		- sql 작성
		- dao단 메소드 확인 및 추가
		- service단 생성 및 메소드 추가 (dao단 호출 및 리턴)
		- controller 생성
			초기화면 호출
		- view단 생성
			id 요청값으로 호출 
		- controller단 추가
			요청값 id 처리
			service단 연동 및 model 데이터로 등록여부 전송
				request.setAttribute("reg", service.hasMember(id) == null?"등록가능":"등록불가능");
		- view단
			모델 데이터를 입력받아 js로 등록가능 여부 출력 

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

		
		
		$("[name=id]").keyup(function(event){
			
			/*
			if(event.keyCode == 13) {
				$("form").submit();
			}
			*/
			
			if(event.keyCode == 13) {
				xhr.open("get", "${path}//memCheck2.do?id=" + $(this).val(), true);
				xhr.send();
				xhr.onreadeystatechange = function (){
					if(xhr.readyState == 4 && xhr.status == 200) {
						// controller단 처리, 화면단 처리 구현
						console.log(xhr.responseText);
						alert(xhr.responseText);
					}
				}
				
			}
			
			
		});
		/*
		var idCheck = "${idCheck}";
		if(idCheck != ""){
			alert(idCheck);
			
			if(idCheck=="등록가능"){
				$("[name=id]").val("${param.id}");
			}
		}
		*/
	});
	
	
</script>
<body>
	<h2 align="center">9월 1일 응용문제</h2>
	
	<h3>오늘의 날짜</h3>
	<c:set var="now" value="<%= new Date() %>"/>
	<fmt:formatDate type="date" dateStyle="full" value="${now}"/>
	
	
	<h3 align="center">아이디 중복확인</h3>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="button" value="조회"/>
		</td></tr>
	</table>	
	</form>
	
</body>
</html>