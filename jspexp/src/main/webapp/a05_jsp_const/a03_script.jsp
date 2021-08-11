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
		//$("h2").text("시작");
	});
</script>
</head>
<%-- 
#스크립트
1. 요청을 처리하는데 필요한 코드를 실행
2. 동적으로 응답 결과를 생성하기 위해 사용
3. 스크립트의 요소 3가지
	1) declaration : <%! %>
		ex) java의 class 바로 밑 선언 부분
	2) scriplet : <% %>
		ex) java의 main()있는 부분
	3) expression : <%= %>
		ex) java의 main()안에 System.out.println();

--%>
<%!
	String pname = "사과";
	int getTot(int price, int cnt) {
		return price*cnt;
	}
	
	// 응용
	String id;
	String pass;
	boolean login(String id, String pass) {
		return (id.equals("himan")&&pass.equals("7777"))?true:false;
	}
%>
<%
	pname = "바나나"; // 상단에 선언된 변수 내용 변경
	int sum = getTot(3000, 2); // 선언된 메소드 활용
	
	// 응용) id, pass, login(아이디, 패스워드) 인증여부리턴 -> 선언부에 선언
	//		위 변수 선언 및 할당 -> 스크립틀릿에 선언
	//		위 결과 내용 출력 -> 익스프레션 사용 (3조)
	
	id = "himan";
	pass = "7777";
	
%>
<body>
	<h2 align="center">물건명:<%= pname %>, 총계:<%=sum %></h2>
	<h3 align="center"> 로그인 결과 : <%= login(id, pass)?"일치합니다":"일치하지않습니다" %></h3>
</body>
</html>