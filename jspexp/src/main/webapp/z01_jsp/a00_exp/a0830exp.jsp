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
	padding:30px;
}

td {
	text-align:center;	
}

</style>
</head>
<%-- 

#정리문제
1. useBean을 활용하여 요청값을 처리하는 코드를 예제로 기술하기
	(아래)
	
2. useBean과 dao를 활용하여 사원정보 검색을 출력하기
	(아래)
	
3. el 태그의 empty는 어떻게 활용할 수 있는가? 실제 예제로 작성해보기
	empty : 해당 el태그의 변수에 값이 없을 때
	not empty : 해당 el태그의 변수에 값이 있을 때, 비어있지 않을 때
	
4. page scope와 session scope를 이용하여 회원정보를 받아서 리스트되게 처리하기


5. jstl을 통한 객체할당을 하고 property를 변경처리하기 
	(아래)

6. jstl 반복문과 조건문을 이용하여 3/6/9게임을 20까지 처리하기

7. XMLHttpRequest 객체의 get/post, 동기/비동기 방식의 기본 처리 형식 기술하기 
8. 사원 empno를 입력하고 엔터키를 눌렀을 때 자세한 정보를 아래에 출력되게 ajax로 처리하기 

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

		
		$("#btnEmpSch").click(function(){
			$("frm04").submit();
			//location.href="z0830_data1.jsp";
		});
		
	});
</script>
<body>
	<h2 align="center">8월 30일 정리문제</h2>
	
	<jsp:useBean id="mem01" class="jspexp.z02_vo.Member"/>
	<jsp:setProperty property="*" name="mem01"/>
	
	<h3 align="center">1번 문제</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>비밀번호</th><td><input type="text" name="pw" value=""/></td></tr>
		<tr><th>이름</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>권한</th><td><input type="text" name="auth" value=""/></td></tr>
		<tr><th>포인트</th><td><input type="text" name="point" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="출력"/>
		</td></tr>
	</table>	
	</form>
	
	<h3 align="center">1번 결과</h3>
	<table align="center" class="listTable">
		<tr><th>아이디</th><td>${mem01.id }</td></tr>
		<tr><th>비밀번호</th><td>${mem01.pw }</td></tr>
		<tr><th>이름</th><td>${mem01.name }</td></tr>
		<tr><th>권한</th><td>${mem01.auth }</td></tr>
		<tr><th>포인트</th><td>${mem01.point }</td></tr>
	</table>
	
	
	<jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao"/>
	<jsp:useBean id="empSelect" class="jspexp.z02_vo.Emp"/>
	<jsp:setProperty property="*" name="empSelect"/>
	
	<h3 align="center">2번 문제</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>직책</th><td><input type="text" name="job" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="검색"/>
		</td></tr>
	</table>	
	</form>
	
	
	<h3 align="center">2번 결과</h3>
	<table align="center" class="listTable">
		<tr><th>번호</th><th>사원명</th><th>직책</th></tr>
		<c:forEach var="eList" items="${dao.getPreparedEmpList(empSelect) }" varStatus="sts">
			<tr><td>${sts.count }</td><td>${eList.ename }</td><td>${eList.job }</td></tr>
		</c:forEach>
	</table>	
	
	
	<jsp:useBean id="mem02" class="jspexp.z02_vo.Member"/>
	<jsp:setProperty property="*" name="mem02"/>
	
	<h3 align="center">3번 문제</h3>
	<form id="frm03">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>비밀번호</th><td><input type="text" name="pw" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="로그인"/>
		</td></tr>
	</table>	
	</form>
	
	<!--  위에서 데이터를 작성하지않으면 해당 테이블이 안보임! -->
	<c:if test="${not empty mem02.id }">
		<h3 align="center">3번 결과</h3>
		<table align="center" class="listTable">
			<tr><th>아이디</th><td>${mem02.id }</td></tr>
			<tr><th>비밀번호</th><td>${mem02.pw }</td></tr>
		</table>
	</c:if>
	
	

	<h3 align="center">4번 문제</h3>
	<form id="frm04">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>직책</th><td><input type="text" name="job" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="button" id="btnEmpSch" value="조회"/>
		</td></tr>
	</table>	
	</form>

	<c:if test="${not empty param.ename }">
	
		<c:set var="empSch01" value="<%= new Emp() %>" scope="page"/>
		<c:set target="${empSch01 }" property="ename" value="${param.ename }"/>
		<c:set target="${empSch01 }" property="job" value="${param.job }"/>
		${param.ename }
		
		<c:set var="empSch02" value="<%= new Emp() %>" scope="session"/>
		<c:set target="${empSch02 }" property="ename" value="${param.ename }"/>
		<c:set target="${empSch02 }" property="job" value="${param.job }"/>
		${empSch02.ename }

	</c:if>
	
	
	<h3 align="center">5번 문제</h3>
	<c:set var="prod" value="<%= new Product() %>" scope="request"/>
	${prod.setName("컴퓨터") }
	${prod.setPrice(1000000) }
	${prod.setCnt(2) }
	
	
	<c:if test="${not empty prod.name}">
		<h3 align="center">5번 결과</h3>
		<table align="center" class="listTable">
			<tr><th>물건명</th><td>${prod.name}</td></tr>
			<tr><th>물건가격</th><td>${prod.price}</td></tr>
			<tr><th>물건갯수</th><td>${prod.cnt}</td></tr>
		</table>
	</c:if>
	
	
	
	
	
	
	
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