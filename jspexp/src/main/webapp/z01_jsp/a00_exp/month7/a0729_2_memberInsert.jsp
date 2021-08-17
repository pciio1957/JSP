<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
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
	window.onload = function() {
		document.querySelector("h3").innerText="시작";
	}

</script>
</head>
<%-- 
#화면등록 처리 프로세스
1. 초기등록 화면 구성 :form 요소객체와 함께 (name="요청키" value="입력시요청값"
2. 등록버튼 클릭시 화면구성
3. 요청값을 기준으로 분리처리 
	1) dao등록 메소드 구현
	2) dao 등록 메소드 호출
4. js 등록완료 처리

--%>
<%

boolean isInsert = false;
String id = request.getParameter("id");
if(id!=null) { // 초기화면과 프로세스 분리 
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String auth = request.getParameter("auth");
	String pointS = request.getParameter("point");
	
	A05_PreparedDao dao = new A05_PreparedDao();
	Member ins = new Member(id, pass, name, auth, Integer.parseInt(pointS));
	System.out.println("등록 처리 : " + ins.getId());
	
	dao.insertMember(ins);
	isInsert = true;
}

%>
<body>
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>패스워드</th><td><input type="text" name="pass" value=""/></td></tr>
		<tr><th>패스워드 확인</th><td><input type="text" name="passFrm" value=""/></td></tr>
		<tr><th>이름</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>권한</th><td><input type="text" name="auth" value=""/></td></tr>
		<tr><th>포인트</th><td><input type="text" name="point" value="1000"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록"/></td></tr>
	</table>	
	</form>

<script>

var isInsert = <%= isInsert %>;
if(isInsert) {
	
	if(confirm("등록완료! \n 조회페이지로 이동할까요?")) {
		location.href = "a0729_1_memberList.jsp";
	}
}
</script>
</body>
</html>