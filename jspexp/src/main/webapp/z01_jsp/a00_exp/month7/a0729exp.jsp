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
	window.onload = function() {
		document.querySelector("h3").innerText="0729 문제풀이";
	}

</script>
</head>
<%-- 
정리문제
1. 요청값의 post방식과 get방식의 차이점을 기술하세요.
	post : 전달되는 요청값이 주소에 보이지않음. 보안유지에 좋음. 
		get방식보다 적은 용량의 데이터의 전송이 가능하다
	get : Form의 default 요청값 처리 방식으로 요청값이 주소에 보인다
		보안유지가 어렵지만 대용량의 데이터의 전송이 가능하다
		
	location.href, a href로 작성해서 url로 전송하는 요청값 전달 방식은 모두 get방식
	<form method="get"> : 요청값 get 
		안정적인 요청값을 url로 전송
	<form method="post"> : 요청값 post
	
	
2. 아래와 같은 도서구매 시스템을 post방식으로 처리하세요.(한페이지처리)
    도서명 [     ] 가격 [    ] 수량 [    ] [구매] 
    ==> 구매한 도서 @@@ 총비용 @@ 할인 15% 후, 금액 @@@@
    (아래)
    
    1) 화면구현
    2) 초기화면/요청값 후 처리를 요청값으로 분리 (request.getParameter)
    
3. 사원 정보 등록 처리 프로세스을 파일명과 요청값처리, js, dao 핵심 코드위주로
   기술하세요.
   1) form.jsp : 사원의 정보를 입력받는 form이 있는 jsp파일
   			이때 입력이 끝나면 result.jsp로 넘어가도록 submit버튼 사용
   			null값에 대한 처리를 해준다
   2) result.jsp : 사원의 정보를 서버로 요청값을 받음 
   			해당 요청값들을 dao의 사원정보 등록 메소드로 넘긴다.
   3) empDao.java : 사원의 정보를 매개변수로 받아 DB와 연결해 sql처리한다. 
   			sql문은 조건에 맞게 작성한 뒤 등록처리한다
   4) result.jsp : dao에서 등록처리가 완료되었으면 
   			요청값이 정상적으로 들어왔을때/아닐때 화면 처리를 해준다. 
   			
   1) 전체 화면 및 파일 
   		조회리스트 (a28_empList.jsp)
   		등록화면 (a29_empInsert.jsp)
   2) 화면이동처리 
   		(1) 조회리스트 -> 등록화면 (등록버튼 클릭시 등록화면이동, js이용)
	   		input onclick = "insertFrm()"
	   		function insertFrm() {
	   			location.href = "등록화면";
	   		}
   		
   		(2) 등록화면에서 등록처리(2개의 프로세스 처리)
   			[jsp] 데이터 입력후 input type="submit" 버튼 클릭시
   			[jsp] String ename = request.getParameter("ename"); 으로 입력값을 받음
   			[jsp] 등록 dao에 기능 메소드의 매개변수로 할당하기 위한 객체생성
   				Emp ins = new Emp(0, ename, job, ...) 
   			[java] Dao에 입력처리 기능메소드 추가 (public void insertEmp(Emp ins))
   			[java] sql 작성 (insert into emp02 values(emp_seq_nextval, ?, ?, ?...)
   			[java] pstmt.setString()
   		
   
4. 회원정보 관리시스템을 기존 member테이블을 활용하여 진행하되, 
전체리스트에서 등록처리화면로 처리하세요. (회원리스트화면, 등록처리화면, dao 등록)
	(아래)
	
	1) 주요기능 파일
	회원조회리스트 (a0729_1_memberList.jsp)
	회원등록처리 (a0729_2_memberInsert.jsp)
	데이터처리 DAO (A05_PreparedDao.java)
		- 회원조회메소드 (getMemberList())
		- 회원등록메소드 (insertMember(Member ins))
	2) 핵심처리내용
		- 페이지 전환	: 이벤트 속성으로 함수호출과 location.href
		- 요청값 처리 : name="요청키" request.getParameter("요청키")
				submit, post/get방식
				초기 화면과 분리 if(요청변수 != null)
		- dao 처리 : sql 확인, 메소드 선언(입력값, 리턴값)
			?, ?, ? -> pstmt.setXXX(1, 데이터)
			-> 결과값이 있을 대 rs.next(), rs.getXXX(컬럼명);
		- 화면에서 dao 호출 및 기능메소드처리
			초기화면과 요청값이 왔을 때 조건처리
			if(요청변수 != null) 
				dao객체 생성, 기능메소드 호출 및 매개변수로 입력객체전달
	
5. 아래와 같은 임의의 구구단 문제를 10문제 리스트하고, 현재페이지에 post방식을 전달하여 
   최종 점수를 출력하세요.
    번호  문제     정답
    1    2 * 5  [   ]
    2    4 * 3  [   ]
    3    6 * 5  [   ]
   ...
        [시험완료] ==>  @@ 점.
~9:30 진행 후, 시간 확인하겠습니다.

--%>
<%

%>
<body>
	<h3 align="center"></h3>
	<h4>도서구매 시스템 </h4>
	<form id="frm01" method="post">
	<table>
		<tr><th>도서명</th><td><input type="text" name="bname" value=""/></td></tr>
		<tr><th>도서가격</th><td><input type="text" name="bprice" value=""/></td></tr>
		<tr><th>도서수량</th><td><input type="text" name="bcnt" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="구매하기"/></td></tr>
	</table>	
	</form>
	
	
	<% 
	
	String bname = request.getParameter("bname");
	String bpriceS = request.getParameter("bprice");
	String bcntS = request.getParameter("bcnt");
	
	if(bname == null) bname = "";
	if(bpriceS == null) bpriceS = "0";
	if(bcntS == null) {
		bcntS = "0";
	%>
	<h2> 데이터를 입력하세요</h2>
	
	<% } else { 
	
	int bprice = Integer.parseInt(bpriceS);
	int bcnt = Integer.parseInt(bcntS);
	
	%>
	<h4>도서구매 결과</h4>
	<table>
		<tr><th>구매 도서명</th><td><%= bname %></td></tr>
		<tr><th>총 비용</th><td><%= bprice * bcnt %></td></tr>
		<tr><th>할인 가격</th><td><%= (bprice * bcnt)*0.85 %></td></tr>
	</table>	
	<% } %>
	<br><br>
	
	<%
	
	A05_PreparedDao dao = new A05_PreparedDao();
	ArrayList<Member> memList = new ArrayList<Member>();
	memList = dao.getMemList();
	
	%>
	
	<h4 align="center">회원정보 시스템</h4>
	<form id="frm02">
		<table>
			<tr><th>ID</th><th>PW</th><th>이름</th><th>권한</th><th>Point</th></tr>
				<% for(Member m:memList) { %>
			<tr>
				<td><%= m.getId() %></td>
				<td><%= m.getPw() %></td>
				<td><%= m.getName() %></td>
				<td><%= m.getAuth() %></td>
				<td><%= m.getPoint() %></td>
			</tr>
			<% } %>
			<tr><td colspan="5"><input type="button" value="회원 등록" name="btnJoin" onclick="join()"></td></tr>
		</table>
	</form>

	<%-- 
	
	String names[] = request.getParameterValues("다수의 name명");
	--%>


	<h4 align="center">구구단</h4>
	<form id="frm01" method="post">
	<table>
		<tr><th>번호</th><th colspan="3">문제</th><th>정답</th></tr>
		<%
			
		for(int no=0; no<10; no++) {	
			int ran01 = (int) (Math.random()*8+2);
			int ran02 = (int) (Math.random()*8+2);
			int corrpl = ran01 * ran02;
		
		%>
		<tr><td><%= no %></td>
			<td><input type="text" name="num01_<%= no %>" size="1" value="<%= ran01 %>"></td>
			<td>X</td>
			<td><input type="text" name="num02_<%= no %>" size="1" value="<%= ran02 %>"></td>
			<%-- <input type="hidden" name="corrpl" value="<&= corrpl %>" />--%>
			<td><input type="text" name="reply_<%= no %>" size="2" value="0"/></td>
		</tr>
		<% } %>
		<tr><td colspan="5"><input type="submit" value="시험완료"/></td></tr>
		<%-- 클릭시 요청값으로 입력한 답과 정답을 전달해야 정답 여부를 처리할 수 있다 --%>
	</table>	
	</form>
	
	<%
	
	int point = 0;
	String num01S = request.getParameter("num01_1");
	for(int nom=1; nom<10; nom++) {
		num01S = request.getParameter("num01_"+nom);
		String num02S = request.getParameter("num02_"+nom);
		String replyS = request.getParameter("reply_"+nom);
		
		
		if(num01S != null) { // 초기값이 아닐때 
			int num01 = Integer.parseInt(num01S);
			int num02 = Integer.parseInt(num02S);
			int reply = Integer.parseInt(replyS);
	
			if(num01 * num02 == reply) {
				// 못봄
				point += 10;
			}
		}
	}
	
	
	%>
	
	<% if(num01S != null) { %>

	<h4 align="center"> 획득 점수 : <%= point %></h4>
	
	<% } %>
	
<script type="text/javascript">

function join() {
	
	if(confirm("회원등록하시겠습니까?")) {
		location.href = "a0729exp2.jsp";
	}
}



</script>
</body>
</html>