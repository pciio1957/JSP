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
# 

--%>
<%

%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("시작");
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	
	<!--  1. 기본 방법 -->
	<jsp:useBean id="p01" class="jspexp.z02_vo.Person"/>
	<jsp:setProperty property="name" name="p01" value="홍길동"/>
	
	<table align="center" class="listTable">
		<tr><th>이름</th><td>${p01.name}</td></tr>
	</table>
	
	
	<!--  2. param 이용 -->
	<jsp:useBean id="p02" class="jspexp.z02_vo.Person"/>
	
	<!--  주소에서 : a02_bean_param.jsp?callname=봉봉
	
		value로 값을 바로 지정하는 것이 아니라 param을 이용해 
		해당 변수의 값을 변경하여 사용할 수 있다. 
		param을 setProperty처럼 사용 -> public void setName(String name)
		callname을 getProperty로 사용 -> name을 el로 호출가능  -->
	<jsp:setProperty property="name" name="p02" param="callname"/>
	
	<!--  주소에서 : a02_bean_param.jsp?callname=봉봉&age=7
		  주소에서 : a02_bean_param.jsp?callname=봉봉&age=7&location=서울
	
		but, param을 따로 입력하지 않아도 해당 property이름으로 값 지정시 
		해당 데이터를 바로 적용해준다. 
		
		param의 적용범위를 정할 수 있고 현재 callname은 age까지 적용
		loc에 param을 설정했기 때문에 해당 param으로만 적용중
		param을 지우면 loc로 처리가능  -->
	<jsp:setProperty property="age" name="p02"/>
	<jsp:setProperty property="loc" name="p02" param="location"/>
	
	<h3 align="center">Person 객체(param 이용)</h3>
	<table align="center" class="listTable">
		<tr><th>이름</th><td>${p02.name}</td></tr>
		<tr><th>나이</th><td>${p02.age}</td></tr>
		<tr><th>위치</th><td>${p02.loc}</td></tr>
	</table>
	
	
	
	<!--  응용) Product로 Bean 설정 후 ?pname=사과&price=3000&count=5로
			요청값을 받는 내용 출력하기 (2조 제출, 나머지 손들기) -->
	<jsp:useBean id="pd01" class="jspexp.z02_vo.Product"/>
	<jsp:setProperty property="name" name="pd01" param="pname"/>
	<jsp:setProperty property="price" name="pd01"/>
	<jsp:setProperty property="cnt" name="pd01" param="count"/>
	
	<h3 align="center">Product 객체(param 이용)</h3>
	<table align="center" class="listTable">
		<tr><th>물건명</th><td>${pd01.name}</td></tr>
		<tr><th>가격</th><td>${pd01.price}</td></tr>
		<tr><th>수량</th><td>${pd01.cnt}</td></tr>
	</table>
	
	
	<!-- 기본 적용 : ?name=사과&price=3000&cut=5  -->
	<jsp:useBean id="pd02" class="jspexp.z02_vo.Product"/>
	<jsp:setProperty property="name" name="pd02"/>
	<jsp:setProperty property="price" name="pd02"/>
	<jsp:setProperty property="cnt" name="pd02"/>
	
	<h3 align="center">Product 객체(param 이용X)</h3>
	<table align="center" class="listTable">
		<tr><th>물건명</th><td>${pd02.name}</td></tr>
		<tr><th>가격</th><td>${pd02.price}</td></tr>
		<tr><th>수량</th><td>${pd02.cnt}</td></tr>
	</table>
	
	<!-- * 적용 : ?name=사과&price=3000&cut=5
			property를 *로 설정하면 자동으로 요청key와 같은
			property를 찾아서 자동 등록 처리
		setName(String a), setProce(int b), setCnt(int c)가 되어있고
		데이터 유형도 할당이 가능한 메소드로 되어있을 경우
		property를 *로 선언할 시에 자동 할당이 가능함   -->
	<jsp:useBean id="pd03" class="jspexp.z02_vo.Product"/>
	<jsp:setProperty property="*" name="pd03"/>
	
	<h3 align="center">Product 객체(property=* 이용)</h3>
	<table align="center" class="listTable">
		<tr><th>물건명</th><td>${pd03.name}</td></tr>
		<tr><th>가격</th><td>${pd03.price}</td></tr>
		<tr><th>수량</th><td>${pd03.cnt}</td></tr>
	</table>
	
	
	<!--  응용) Member 객체를 Bean으로 할당하여 요청값이 자동으로 전체할당되도록 하고
			할당된 property를 el출력하기 (3조 제출, 나머지 손들기) -->
	<jsp:useBean id="mb01" class="jspexp.z02_vo.Member"/>
	<jsp:setProperty property="*" name="mb01"/>
	
	<h3 align="center">Member 객체(property=* 이용)</h3>
	<table align="center" class="listTable">
		<tr><th>아이디</th><td>${mb01.id}</td></tr>
		<tr><th>비번</th><td>${mb01.pw}</td></tr>
	</table>
	
	
	<jsp:useBean id="mb02" class="jspexp.z02_vo.Member"/>
	
	<!--  form객체의 Bean 설정  -->
	
	<h3 align="center">form 객체 입력</h3>
	<form id="frm01" method="post">
		<table align="center" class="listTable">
			<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
			<tr><th>비밀번호</th><td><input type="text" name="pw" value=""/></td></tr>
			<tr><th>이름</th><td><input type="text" name="name" value=""/></td></tr>
			<tr><th>권한</th><td><input type="text" name="auth" value=""/></td></tr>
			<tr><th>포인트</th><td><input type="text" name="point" value="0"/></td></tr>
			<tr><td colspan="2" style="text-align:center"><input type="submit" value="회원등록"/></td></tr>
		</table>
	</form>
	
	<h3 align="center">form 객체 출력 (property=* 이용)</h3>
	<jsp:setProperty property="*" name="mb02"/>
	<table align="center" class="listTable">
		<tr><th>아이디</th><td>${mb02.id}</td></tr>
		<tr><th>비밀번호</th><td>${mb02.pw}</td></tr>
		<tr><th>이름</th><td>${mb02.name}</td></tr>
		<tr><th>권한</th><td>${mb02.auth}</td></tr>
		<tr><th>포인트</th><td>${mb02.point}</td></tr>
	</table>
</body>
</html>