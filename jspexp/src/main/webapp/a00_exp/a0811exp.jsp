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
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
</head>
<%-- 

#정리문제
1. [jsp]directive 종류를 기술하세요
	directive의 종류
	1) page : jsp페이지에 대한 정보 지정. 
		문서의 타입, 출력 버퍼의 크기, 에러 페이지 등 정보 지정
	2) taglib : 사용할 태그 라이브러리 지정
	3) include : 해당 페이지에 다른 JSP페이지를 포함시킴

2. [jsp]script의 종류 3가지를 기술하고, 간단한 예제로 출력까지 하세요.
	스크립트의 요소 3가지
	1) declaration : <%! %>
		ex) java의 class 바로 밑 선언 부분
	2) scriplet : <% %>
		ex) java의 main()있는 부분
	3) expression : <%= %>
		ex) java의 main()안에 System.out.println();

3. [jsp]request와 response객체를 서버/클라이언트 관점에서 기술하세요.
4. 아래 내용은 어떤 filter선택자를 활용할 것인가를 기술하세요
    성별 :()남자()여자 [등록]
    관리자[   ] 일반사용자[    ] [관리자활성화][일반사용자활성화]
    취미 :[]운동[]게임[]독서[]음악 [취미등록]
5. 아래와 같은 화면을 연산자를 선택시, 계산결과를 출력하는 프로그램을 만들세요.
    [    ][select연산자][     ]
    결과 :  @@ X @@ = @@
6. 학생의 성적이 리스트되는 화면에서 검색할 행(필터객체를 확인)의 배경색상을 
   표기해주는 프로그램을 작성하세요.(1단계-해당데이터td,2단계-해당포함tr)
    검색내용 [    ][검색]
    no  이름  국어 영어 수학
    1   @@@  @@  @@ @@@
    2   @@@  @@  @@ @@@
    3   @@@  @@  @@ @@@
7. 전날 다운 받은 이미지와 속성을 활용해서 해당 기능을 처리하세요
    [이미지]  [select-이미지변경][커져라][작아져라]
# 다하신 분은 손들기 해주시고 내용을 올려주세요.(9:30 1차점검)


--%>
<%!

	int num01; int num02;
	int getMulti(int num01, int num02) {
		return num01*num02;
	}
%>
<%
	num01 = 10;
	num02 = 4;
	int tot = getMulti(num01, num02);
	
%>
<body>
	<h2 align="center"></h2>
	
	<h3 align="center">연산결과</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>연산식</th><td>
			<input type="text" name="num01" value="<%= num01 %>"/>
			<input type="text" name="num02" value="<%= num02 %>"/>
		</td></tr>
		<tr><th>결과</th><td><%= tot %></td></tr>
	</table>	
	</form>
	
	
	
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>