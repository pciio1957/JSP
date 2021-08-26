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

td {
	text-align:center;	
}

</style>
</head>
<%-- 

#정리문제
1. session 4가지 범위로 변수를 선언하고 출력하기
	(아래)
	
2. el에 의한 과일 배열 출력하기
	(아래)
	
3. el을 활용해 쇼핑몰에서 구매한 내용을 요청값에 의해 객체로 할당하고 
	선택한 할인율(10%, 15%, 20%)에 따라 구매 정보 출력하기
	(아래)
	
	1) form 화면 구성
	2) el로 요청 내용 처리 
		- Product 객체는 pageContext.setAttribute("prod", new Product());
		- ${prod.setName(param.name)} 형식으로 변수 설정
		- ${prod.name} 형식으로 출력
	3) 할인율 적용 
		- ${prod.price * prod.cnt * param.discount}
	
4. 아이디 패스워드를 입력하여 el로 요청값(인증여부-himan/7777) 처리 후 출력
	(아래)
	
	1) 로그인 화면 구성
	2) ${param.id} ${param.pw}
	3) 인증여부 
		${param.id == 'himan' && param.pw == '7777'} true/false
		${param.id == 'himan' and param.pw == '7777'}
		${param.id == 'himan' and param.pw == '7777'}?'인증':'미인증';
	
5. 아래와 같은 등록정보를 처리한 화면을 el로 다음 페이지에서 출력하기
	아이디 : [ ] 패스워드 : [ ] 
	성별: ( )남 ( )여  취미 : [ ] 음악 [ ] 운동 [ ] 여행 [ ] 독서 [ ] 게임
	[등록]
	
6. session으로 List객체 선언 후 사원정보(사원번호, 사원명, 직책)을 입력하고
	누적처리한 리스트 출력하기  
	
	1) 해당 범위 객체 선언
		session.setAttribute("empList", new ArrayList<Emp>());
		pageContext.setAttribute();
	2) 이동해서 el로 데이터 할당 처리할 수 있게 하기 
		response.sendRedirect("a0825exp_Ans2.jsp");
	3) 해당 페이지
		${emp.setEmpno(param.empno)}
		${emp.setEname(param.ename)}
		${emp.setJob(param.job)}
		${empList.add(emp)}
		${empList.size()} : 사원정보 갯수
		${empList.get(0).empno}  ${empList.get(0).ename}  ${empList.get(0).job}
		${empList.get(1).empno}  ${empList.get(1).ename}  ${empList.get(1).job}
		${empList.get(2).empno}  ${empList.get(2).ename}  ${empList.get(2).job}

--%>

<jsp:useBean id="prod01" class="jspexp.z02_vo.Product" scope="request"/>
<jsp:setProperty name="prod01" property="*"/>

<jsp:useBean id="mem01" class="jspexp.z02_vo.Member" scope="request"/>
<jsp:setProperty name="mem01" property="*"/>

<%
	// 1번
	pageContext.setAttribute("val01", "사과");
	request.setAttribute("val02", "바나나");
	session.setAttribute("val03", "딸기");
	application.setAttribute("val04", "키위");
	
	// 2번
	String fruits[] = {"사과", "딸기", "오렌지", "복숭아"};
	request.setAttribute("fruits", fruits);
	
	// 3번	
	request.setAttribute("prod01", prod01);
	
	// 7번
	session.setAttribute("empList", new ArrayList<Emp>());
	session.setAttribute("emp", new Emp());

	response.sendRedirect("a0825exp_Ans.jsp");
	//pageContext.setAttribute();


%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("8월 25일 문제");
		
		
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	
	
	<h2 align="center"> 3번 문제 풀이</h2>
	<form id="frm03">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value=""/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt" value=""/></td></tr>
		<tr><th>할인율 선택</th>
			<td>
				<select name="dis">
					<option value="0">할인율 선택</option>
					<option value="0.9">10%</option>
					<option value="0.85">15%</option>
					<option value="0.8">20%</option>
				</select>
			</td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" id="btnBuy" value="구매"/>
		</td></tr>
	</table>	
	</form>
	
	<%
	
	pageContext.setAttribute("prod", new Product());
	
	%>
	
	<!--  el태그는 요청값이 없는 null에 대한 처리도 자동으로 에러없이 처리한다 -->
	${prod.setName(param.pname)} ${prod.setPrice(param.price)} ${prod.setCnt(param.cnt)} 
	<table align="center" class="listTable">
		<tr><th>물건명</th><td>${prod.name}</td></tr>
		<tr><th>구매가격</th><td>${prod.price}</td></tr>
		<tr><th>구매갯수</th><td>${prod.cnt}</td></tr>
		<tr><th>할인율</th><td>${param.discount}</td></tr>
		<tr><th>할인적용 가격</th><td>${prod.price * prod.cnt * param.discount}</td></tr>
	</table>	
	
	
	<h2 align="center"> 4번 문제</h2>
	<form id="frm04">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>비밀번호</th><td><input type="text" name="pw" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="로그인"/>
		</td></tr>
	</table>	
	</form>
	
	<br>
	<% if(mem01.getId() != null) { %>
	<h3 align="center"> 로그인 결과 </h3>
	<h4 align="center"> 아이디 : ${param.id}</h4>
	<h4 align="center"> 비밀번호 : ${param.pw}</h4>
	<h4 align="center"> ${param.id=="himan" && param.pw == "7777"?"인증":"미인증"} </h4>
	<% } %>
	
	
	<h2 align="center"> 5번 문제</h2>
	<form id="frm05">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="mid" value=""/></td></tr>
		<tr><th>비밀번호</th><td><input type="text" name="mpw" value=""/></td></tr>
		<tr><th>성별</th><td>
			<input type="radio" name="mgender" value="남"/>남
			<input type="radio" name="mgender" value="여"/>여
		</td></tr>
		<tr><th>취미</th><td>
			<input type="checkbox" name="mhobbies" value="음악"/>음악
			<input type="checkbox" name="mhobbies" value="운동"/>운동
			<input type="checkbox" name="mhobbies" value="여행"/>여행
			<input type="checkbox" name="mhobbies" value="독서"/>독서
			<input type="checkbox" name="mhobbies" value="게임"/>게임
		</td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="등록"/>
		</td></tr>
	</table>	
	</form>
	
	<table align="center" class="listTable">
		<tr><th>아이디</th><td>${param.mid}</td></tr>
		<tr><th>비번</th><td>${param.mpw}</td></tr>
		<tr><th>성별</th><td>${param.mgender}</td></tr>
		<tr><th>취미1</th><td>${paramValues.mhobbies[0]}</td></tr>
		<tr><th>취미2</th><td>${paramValues.mhobbies[1]}</td></tr>
		<tr><th>취미3</th><td>${paramValues.mhobbies[2]}</td></tr>
		<tr><th>취미4</th><td>${paramValues.mhobbies[3]}</td></tr>
		<tr><th>취미5</th><td>${paramValues.mhobbies[4]}</td></tr>
	</table>	
	
</body>
</html>