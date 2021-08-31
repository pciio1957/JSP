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
	해당 값이 null인 경우, "" 공백인 경우에 대한 처리를 할 때 조건값을 활용한다
	
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
			$("#frm04").submit();
			//location.href="z0830_data1.jsp";
		});
		
		
		#("[name=empno]").keyup(function(event){
			if(event.keyCode == 13) {
				xhr.open("get", "a0830_data2.jsp?empno=" + $(this).val() , false);
				xhr.send();
				
				var emp = JSON.parse(xhr.responseText);
				
				if(emp.empno != "") {
					$(".emp").eq(0).text(emp.empno);
					$(".emp").eq(1).text(emp.ename);
					$(".emp").eq(2).text(emp.job);
					$(".emp").eq(3).text(emp.mgr);
					$(".emp").eq(4).text(emp.hiredate);
					$(".emp").eq(5).text(emp.sal);
					$(".emp").eq(6).text(emp.comm);
					$(".emp").eq(7).text(emp.deptno);
				} else {
					$(".emp").text("");
				}
				
			}
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
	
	<c:if test="${empSelect.ename == null }"><c:set target="${empSelect }" property="ename" value=""/></c:if>
	<c:if test="${empSelect.job == null }">${empSelect.setJob("") }</c:if>
	
	<h3 align="center">2번 문제</h3>
	<form id="frm02">
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
	
	<c:set var="id" value="${(empty param.id)?' ':param.id}"/>
	<c:set var="pw" value="${(empty param.pw)?' ':param.pw}"/>
	
	<!--  위에서 데이터를 작성하지않으면 해당 테이블이 안보임! -->
	<c:if test="${not empty mem02.id }">
		<h3 align="center">3번 결과</h3>
		<table align="center" class="listTable">
			<tr><th>아이디</th><td>${mem02.id }</td></tr>
			<tr><th>비밀번호</th><td>${mem02.pw }</td></tr>
		</table>
	</c:if>

	
	
	<!--  단일 데이터로 리스트 등록하기 -->
	<h3 align="center">4번 문제</h3>
	<form id="frm04">
	<table align="center" class="listTable">
		<tr><th>회원명</th><td><input type="text" name="coname" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" id="btnEmpSch" value="등록"/>
		</td></tr>
	</table>	
	</form>

	<c:set var="member" value="${param.coname }" scope="page"/>
	<c:choose>
		<c:when test="${mlist == null }">
			<jsp:useBean id="mlist" class="java.util.ArrayList" scope="session"/>
		</c:when>
		<c:otherwise>
			<span style="visibility:hidden;">${mlist.add(member) }</span>
		</c:otherwise>
	</c:choose>
	<h4 align="center">현재 크기:${mlist.size() }</h4>
	<c:forEach var="name" items="${mlist }">
	<h4 align="center">${name }</h4>
	</c:forEach>
	
	
	<!--  다중 데이터로 리스트 등록하기  -->
	<form id="frm05">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>패스워드</th><td><input type="text" name="pw" value=""/></td></tr>
		<tr><th>회원명</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>권한</th><td><input type="text" name="auth" value=""/></td></tr>
		<tr><th>포인트</th><td><input type="text" name="point" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="등록"/>
		</td></tr>
	</table>	
	</form>
	
	<!--  단위객체로 받을 수 있는 page범위의 Member 선언 -->
	<jsp:useBean id="member2" class="jspexp.z02_vo.Member" scope="page"/>
	<c:if test="${not empty param.id }"> 
		<jsp:setProperty property="*" name="member2"/>
	</c:if>
	<c:choose>
		<c:when test="${mlist2 == null }"> <!-- empty mlist는 객체가 생성되었으나 size가 0인 경우 포함 -->
			<jsp:useBean id="mlist2" class="java.util.ArrayList" scope="session"/>
		</c:when>
		<c:otherwise>
			<span style="visibilty:hidden;"> ${mlist2.add(member2) }</span>
		</c:otherwise>
	</c:choose>
	
	<h4 align="center">등록 회원수:${mlist2.size() }</h4>
	<table align="center" class="listTable">
		<tr><th>아이디</th><th>회원명</th><th>권한</th><th>포인트</th></tr>
		<c:forEach var="mem" items="${mlist2 }">
			<tr><td>${mem.id }</td><td>${mem.pw }</td><td>${mam.auth }</td><td>${mem.point }</td></tr>
	</c:forEach>
	</table>
	
	
	
	
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
	
	

	
	<h3 align="center">6번 문제</h3>
	<table align="center" class="listTable">
		<tr>
		<c:forEach var="cnt" begin="1" end="20">
		<th>
			<c:choose>
				<c:when test="${cnt%10 != 0 && cnt%10%3==0}">
					짝
				</c:when>
				<c:otherwise>
					${cnt }
				</c:otherwise>
			</c:choose>
		</th>
		</c:forEach>
	</table>
	
	
	
	<!--  8번 ajax문제 -->
	<h3 id="ajax01" align="center">8번 문제</h3>
	<table align="center" class="listTable">
		<tr><th>회원번호</th><td><input type="text" name="empno" value=""/></td></tr>
	</table>
	
	<h3 id="ajax01" align="center">8번 결과</h3>
	<table align="center" class="listTable">
		<tr><th>회원번호</th><td class="emp"></td></tr>
		<tr><th>사원명</th><td class="emp"></td></tr>
		<tr><th>직책</th><td class="emp"></td></tr>
		<tr><th>관리자번호</th><td class="emp"></td></tr>
		<tr><th>입사일</th><td class="emp"></td></tr>
		<tr><th>급여</th><td class="emp"></td></tr>
		<tr><th>보너스</th><td class="emp"></td></tr>
		<tr><th>사원번호</th><td class="emp"></td></tr>
	</table>	
	
	
	
	
	
	
	
	<form id="frm06">
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