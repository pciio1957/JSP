<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a01_start.*"
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


</script>
</head>
<body>
<!-- 

# 정리문제
1. 요청값을 전달하는 url형식과 요청값을 받는 jsp 기능 메서드를 기술하세요.

	1) 요청값 전달하는 url
	<a href="result.jsp?name=댄스&day=10일차">
	
	2) 요청값 받는 jsp 기능메소드 
	function call() {
		<%
			String name = request.getParameter("name");
			String day = request.getParameter("day");
		%>
		
		<h2> 댄스 몇일차? </h2>
		<h4> <%= name %>
		<h4> <%= day %>
		
	}
2. 아래의 요청값 전달 처리의 방식 기본예제를 코드하세요
    0) 현재페이지 요청값 처리
   		String name= request.getParameter("name");
   		<h2>입력한 이름 : <.. name> </h2>
   		실행한 창 url에 요청값 입력
   		url주소
   		http://localhost:6080/jspexp/a0727exp.jsp?name=홍길동
   		
    1) a href 요청값 처리하기
    2) 함수호출하여 location.href 객체활용하기
    
3. 아래와 같은 처리를 함수와 location.href를 통해서 요청처리하세요.
   id:[    ]
   pass:[    ]
   [로그인] ==> 로그인  
   1단계) 로그인한 id:@@@ 패스워드 @@@  
   2단계) 인증여부 성공/실패 (himan/7777)
   3단계) 다음 페이지 js에서 alert으로 성공여부에 때라 main페이지 이동/login 페이지이동
   hit) 다음페이지에서 location.href 활용
   4단계) 다음 페이지에서 select * from member where id = ? and pass=?
      를 통한 dao를 만든 후, dao 연동하여 인증여부처리 및 3단계의 페이지 이동 로직 처리.
# 9:30까지 일단 진행해보겠습니다.

-->


	<h2>1) 요청값 전달</h2>
	(1) 현재페이지 요청값 처리 <br>
	<a href="a0727exp.jsp?title=정리문제">1단계:제목만보내기</a><br>
	<a href="a0727exp.jsp?title=정리문제&aday=화">2단계:제목과 요일</a><br>
	<a href="a0727exp.jsp?title=정리문제&aday=화&adate=0727">3단계:제목,요일,날짜</a><br>
	
	<% String title = request.getParameter("title"); %>
	<% String aday = request.getParameter("aday"); %>
	<% String adate = request.getParameter("adate"); %>
	
	<h3>결과</h3>
	현재페이지 제목 : <%= title %> <br>
	현재페이지 요일 : <%= aday %> <br>
	현재페이지 날짜 : <%= adate %> <br>
	
	
	<h2>2) 요청값 처리</h2>
	2) a href 처리 <br>
	<a href="a0727exp2.jsp?name=홍길동&team=인사팀">1단계:이름만보내기</a><br>
	<a href="a0727exp2.jsp?name=홍길동&team=인사팀">2단계:이름,팀 보내기</a><br>
	<a href="a0727exp2.jsp?name=홍길동&team=인사팀&teamno=101">3단계:이름,팀,팀번호 보내기</a><br>
	
	<h2>3) 함수로출로 처리</h2>
	<form>
		물건명 : <input type="text" name="pname"><br>
		가격 : <input type="text" name="price"><br>
		갯수 : <input type="text" name="pcnt"><br>
		<input type="button" value="등록하기" onclick="buy()"><br>
	</form>
	
	<h2>3. 요청처리</h2>
	<form id="frm01">
		ID : <input type="text" name="loginid"><br>
		PW : <input type="text" name="loginpw"><br>
		<input type="button" value="로그인" onclick="login()">
	</form>
	

	<h2>[풀이] 사원정보검색</h2>
	<form>
		사원명 : <input type="text" name="ename"><br>
		<input type="button" value="찾기" onclick="openWin()">
	</form>


 	<!--  조별 과제시 사용할 수 있는 예제 -->
 		<h2>[풀이] 부서정보검색</h2>
	<form>
		부서명 : <input type="text" name="dname"><br>
		<input type="button" value="부서상세검색" onclick="openWindow()">
	</form>
	
	<%
	
	String ename = request.getParameter("ename");
	
	// dao 호출
	// 화면 출력
	
	%>

</body>
<script type="text/javascript">

function buy() {
	
	var txtname = document.querySelector("[name=pname]").value;
	var txtprice = document.querySelector("[name=price]").value;
	var txtcnt = document.querySelector("[name=pcnt]").value;
	
	location.href = "a0727exp.jsp?pname=" + txtname + "&price=" + txtprice
			+ "&pcnt=" + txtcnt;
}

function login() {
	
	
	var txtid = document.querySelector("[name=loginid]").value;
	var txtpw = document.querySelector("[name=loginpw]").value;
	
	location.href = "a0727exp2.jsp?loginid=" + txtid +
			"&loginpw=" + txtpw;
}


function openWin() {
	var ename = document.querySelector("[name=ename]").value;
	
	window.open("a0727exp2.jsp?ename=" + ename, "", "width=300, height=300");
}

function openWindow() {
	//var 다시 넘길 데이터
	//opener.document.qeurySelector();
}
</script>
</html>