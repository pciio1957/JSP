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
1. 비교연산자와 논리연산자의 문자열 비교/논리처리 형식을 비교기술하기
	논리처리 형식
	1) 비교연산자
		==(eq), !=(ne, not equal), 
		<(lt, less than), <=(le, less equal)
		>(gt, greater than), >=(ge, greater equal)
		
	2) 논리연산자
		&&(and) ||(or), !(not)
		
		ex) ${mb01.id == 'himan' and mb01.pw == '7777'};	
			${stu01.kor gt 80 or stu01.math ge 90};


2. empty 연산자를 이용해 아이디입력 유무를 표기하기
	아이디[ ][등록확인] --> el태그로 요청값 입력여부 js로 표기
	
	empty연산자
	1) 해당 변수가 공백인지, 아닌지 판별 
		empty(null일때), not empty(null이 아닐때)

	ex) 아래에 작성
	
	
3. jstl을 사용하기 위한 설정방법 기술하기	
	1) WEB-INF폴더>lib폴더>하위에 jstl.jar 파일을 넣는다
	2) 작성할 jsp파일 상단에 사용할 태그들을 import한다
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

	3) 사용시에는 prefix에 작성된 태그이름으로 사용한다
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<fmt:requestEncoding value="utf-8"/>


4. el과 jstl을 활용하여 기본 경로 설정과 한글 post방식의
	요청값에 대한 encoding 처리하는 방법 기술하기 
	1) 사용할 태그를 선언한다
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
	
	2) 경로설정에는 c의 set태그, 한글 요청값에 대한 인코딩은 fmt의 requestEncoding 설정을 한다	
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<fmt:requestEncoding value="utf-8"/>
	
	
5. XMLHttpRequest는 어떤 역할을 하는 객체인지 기술하기
	동기/비동기 방식을 선택해 해당 화면의 전체나 특정 데이터를 받아와 처리해주는 객체이다. 
	서버에 있는 자원을 화면 전체나 json데이터를 통해서 받아와서 처리할 수 있다.


6. 동기와 비동기 통신 방식의 차이를 기술하고, XMLHttpRequest에서
	코드상 어떤 차이가 있는지 기술하기 
	
	1) 동기/비동기 방식의 차이점
	XMLHttpRequest로 서버에 접속하여 처리할 때 
	다른 요소객체를 선택하거나 다른 프로세스를 수행할 수 있는가에 대한 여부로 나뉜다.
	
	2) 동기 방식 vs 비동기 방식
	동기
	서버와 클라이언트 같은 속도로 연계
	편지를 우체통에 넣고 답장올 때 까지 기다리고 오면 다른 일을 한다.
	이벤트 핸들러가 필요없다(이벤트가 오면 진행되므로)
	
	비동기
	같은 속도로 연계하지 않음
	편지를 우체통에 넣기만 하고 다른 일하다가 오면 처리 
	이벤트 핸들로가 필요하다(언제 올지 모르기 때문)


7. 두개의 버튼을 만들고 동기/비동기 방식으로 z01_data.txt에 있는 인사말을 불러서 출력하기
	[동기호출][비동기호출]
	데이터 출력

8. json 데이터의 기본형식 기술하기
	json 데이터의 기본 형식
	1) 데이터의 개수에 따라 
		단일 : {속성:속성값}
		다중 : [{속성:속성값..}]
	2) 데이터 유형에 따라
		문자열 데이터 : {"속성":"문자열데이터"}
		숫자형/boolean형 데이터 : {"속성":숫자형/boolean형 데이터}
		
		*문자열의 경우 따옴표 중에서 " "만 가능하다


9. json 문자열 데이터를 json 객체로 변환하는 메소드 기술하기
	json 문자열을 객체로 변환하기
	1) 변환 이유
		네트워크로 전달되어 온 데이터이므로 객체로 변환하여 사용해야 한다
	2) 변환 방법
		(1) eval 함수 사용 
			eval('(' + xhr + ')') 함수
			* 이 규칙을 지켜줘야한다.
			* eval함수 : 문자열을 수치화하거나 스크립트를 실행시킴 
			
		(2) json의 parse 함수 사용
			JSON.parse(xhr)

10. z06_data.txt에 구매 정보([])를 선언후, a06_buyList.jsp로 구매정보를 테이블에 리스트 처리하세요.(전날마지막문제)
[{"name":"텀블러", "price":15000, "cnt":2}, {"name":"다이어리", "price":20000, "cnt":1}]

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">

	var ckVal = $("#userid").val();
	if(ckVal != null) {
		alert("입력값 확인");
	}

	$(document).ready(function(){
		$("#h2Obj").text("8월 26일 정리문제");
		
		// 동기버튼
		$("#btnsyn").click(function(){
			var xhr01 = new XMLHttpRequest();
			xhr01.open("get", "z01_data.txt", false);
			xhr01.send();
			$("#show").text(xhr01.responseText);
		});
		
		// 비동기
		$("#btnasyn").click(function(){
			var xhr02 = new XMLHttpRequest();
			xhr02.open("get", "z01_data.txt", true);
			
			xhr02.send();
			
			xhr02.onreadystatechange = function(){
				if(xhr02.readyState == 4 && xhr02.status == 200) {
					$("#show").text(xhr02.responseText);
				}
			};

		});
		
		$("#btndel").click(function(){
			$("#show").text("");
		});

	});
	

	
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	
	<h3 align="center">2번 문제</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="userid" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" id="btnCk" value="등록확인"/>
		</td></tr>
	</table>	
	</form>
	
	<h3 align="center">${not empty param.userid}</h3>
	
	
	<h3 align="center">7번 문제</h3>
	<form>
		<table align="center" class="listTable">
			<tr>
				<td><input type="button" id="btnsyn" value="동기호출"/></td>
				<td><input type="button" id="btnasyn" value="비동기호출"/></td>
				<td><input type="button" id="btndel" value="초기화"/></td>
			</tr>
			<tr><td colspan="3" id="show"></td></tr>
		</table>
	</form>
	
	
	
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