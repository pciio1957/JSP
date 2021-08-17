<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.a01_start.*"
    import="jspexp.z01_database.*"
    import="jspexp.z02_vo.*"
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


/*

# 정리문제
1. 아래내용을 jsp로 출력하세요.
    1) 반복문 1~4선언하고, 테이블행(4X1)과 테이블열(1X4)로 출력하세요.
    2) 배열로 무지개색상 선언, h2로 7개의 무지개 배경색상으로 문자열과 함께 출력
    3) 아래와 같은 형식을 반복문을 활용하여 form하위 요소객체를 이용하여 테이블과 함께 출력하세요
        선택 물건명   가격  갯수
        []  [   ]  [  ] [select(1~10)]
        []  [   ]  [  ] [select(1~10)]
        []  [   ]  [  ] [select(1~10)]
    4) ArrayList<String>으로 메뉴리스트를 선언하고, ul하위에 li안에 a link로 메뉴로 출력하세요.
    5) 회원 VO를 Member(아이디,패스워드,이름,권한,포인트)로 만들고, 회원리스트 ArrayList<Member>로
        회원 5명 등록하고, 테이블 리스트로 출력처리하세요.
    6) 반복문과 조건문을 활용하여 번호가 있는 4X4테이블을 출력하세요.
2. 학번 이름 국어 영어 수학 형식으로 출력할 내용을 테이블로 설계를 하고, 데이터를 입력후,
    기존 dao(전날)에 출력 list하는 메서드를 만든 후, jsp 화면으로 출력처리하세요.
~ 정리문제 진행한 후, 9:30에 발표 진행하겠습니다. 각 조별 발표담당자를 메시지로 올려주세요.
각 조별로 발표시, 개선/적용 사항을 파악하여 정리해두었다가 취합해주세요.

 
*/
	window.onload = function() {
		document.querySelector("h3").innerText="시작";
	}

</script>
</head>
<body>
	<h2>테이블행(4행x1열)</h2>
	<table>
		<% for(int idx=0; idx<4; idx++) { %>
			<tr><td><%= idx+1 %></td></tr>
		<% }  %>
	</table><br>
	
	<h2>테이블행(1행x4열)</h2>
	<table>
		<tr>
		<% for(int idx=0; idx<4; idx++) { %>
			<td><%= idx+1 %></td>
		<% }  %>
		</tr>
	</table><br>
	
	<!-- 예제) 4x4 테이블 -->
	<table>
		<% for(int row=1; row<=4; row++) { %>
			<tr>
			<% for(int col=1; col<=4; col++) { %>
				<td><%= row %></td>
			<% }  %>
			</tr>
		<% }  %>
	</table><br>
	
	<!-- 응용) 2x3 테이블, 4x3 테이블(1~12표시) (1조) -->
	<h3>2x3테이블</h3>
	<% int ocount = 1; %>
	<table>
		<% for(int row=1; row<=2; row++) { %>
			<tr>
			<% for(int col=1; col<=3; col++) { %>
				<td><%= ocount++ %></td>
			<% }  %>
			</tr>
		<% }  %>
	</table><br>
	
	<% int count = 1; %>
	<h3>4x3테이블</h3>
	<table>
		<%	for(int val=1; val<=4; val++) { %>
			<tr>
			<% for(int vul=1; vul<=3; vul++) { %>
			<td> <%= count++ %> </td>
			<% } %>
			</tr>
		<% } %>
	</table>
	
	<h2>무지개 배경색</h2>	
	<%
	String rainbows[] = {"red", "yellow", "orange", "green", "blue", "navy", "purple"};

	//for(int idx=0; idx<rainbows.length; idx++) { 
	
	for(String color:rainbows) {%>
	
	<h2 style="background-color:<%= color %>" align="center"> <%= color %> </h2>

	<% } %>
	
	<h2>form</h2>
	<table>
		<tr><th>선택 </th><th>물건명</th><th>가격</th><th>갯수</th></tr>
			<% for(int idx=0; idx<3; idx++) { %>
				<tr><td><input type="checkbox"> </td>
				<td><input type="text"> </td>
				<td><input type="text"> </td>
				<td>
					<select>
						<% for(int cnt=0; cnt<10; cnt++) { %>
						<option><%= cnt+1 %></option>
						<% } %>
					</select>
				</td></tr>
			<% } %>
	</table>
	
	<%-- jsp가 만들어지는 과정
		jsp -> java(servlet) -> class -> 실행결과 -> html -> 
		네트워크를 통해 클라이언트에 전달됨
		jsp에서 java로 변환될 때 에러가 많음..    --%>
	<h3> 풀이) form 요소객체 처리 </h3>
	<select size="2">
		<% for(int cnt=1; cnt<= 10; cnt++) { %>
		<option><%= cnt %></option>
		<% } %>
	</select>
	
	<%--
	회원가입 -> 타이틀은 배열로 선언 (2조)
	아이디 : [ ] 
	패스워드 : [ ] 
	이름 : [ ] 
	포인트 : [ ] 
	
	 --%>
	 
	 <%
	 
	 String titles[] = {"아이디", "패스워드", "이름", "포인트"};
	 
	 %>
	 <h3>회원가입 폼</h3>
	 <form>
	 	<table>
	 		<tr><th colspan="2">회원가입</th></tr>
	 		<% for(int x=0; x<titles.length; x++) { %>
	 			<tr><th><%= titles[x] %></th><td><input type="<%= x==1?"password":"text"%>"></td></tr>
	 		<% } 
	 		// 삼항연산자를 활용해서 input 타입의 설정 %>
	 	</table>
	 </form>
	 
	      
	<h3>메뉴리스트</h3>
	<%
	
	// Arrays.asList(데이터유형1, 데이터유형2);
	List<String> menuList = Arrays.asList("로그인", "식료품", "의류", "관리자");
	
	//menuList.add("수박");
	//menuList.add("바나나");
	//menuList.add("사과");
	//menuList.add("화채");
	
	%>
	<!-- ul의 type은 리스트이므로 목록마다 아이콘이 붙는데 none 적용시 없어짐 -->
	<ul>
		<% for(int idx=0; idx<menuList.size(); idx++) { %>
		<li><a href="#"><%= menuList.get(idx) %></a>	</li>
		<% } %>
	</ul>

	<h3>회원등록리스트(Member)</h3>
	<%
	
	// Arrays.asList()는 여러개의 리스트를 선언가능하다 
	List<Member> memList = Arrays.asList(
			new Member("himan", "7777", "홍길동", "관리자", 1000),
			new Member("higirl", "8888", "홍리나", "일반사용자", 2000),
			new Member("goodman", "9999", "김철희", "관리자", 1000),
			new Member("ohmy", "555", "신현숙", "방문맥", 1200)
	);
	
	%>
	<table>
		<tr><th>전체선택</th><th>아이디</th><th>패스워드</th><th>이름</th><th>권한</th><th>포인트</th><th>수정</th></tr>
		<%
		for(Member m:memList) {
		%>
		<tr>
			<td><input type="checkbox" name="ch" value="<%= m.getId() %>"/></td>
			<td><input type="text" name="id" value="<%= m.getId() %>"/></td>
			<td><input type="text" name="pw" value="<%= m.getPw() %>"/></td>
			<td><input type="text" name="name" value="<%= m.getName() %>"/></td>
			<td><input type="text" name="auth" value="<%= m.getAuth() %>"/></td>
			<td><input type="text" name="point" value="<%= m.getPoint() %>"/></td>
			<td><input type="button" name="upt" value="수정" onclick="upt('<%= m.getId() %>')"/></td>
		<% } %>
	</table>

<!--  #DB 처리 화면 구성
1. db 구조 만들기, 데이터 입력, sql 작성
2. vo 만들기
3. Dao, 기능메소드 구현
4. 화면에서 호출 출력  -->

	<%
	A05_PreparedDao dao = new A05_PreparedDao();
	
	%>
	<h3>DB연결하기</h3>
	<table>
		<tr><th>학생번호</th><th>학생명</th><th>국어</th><th>영어</th><th>수학</th><th>평균</th></tr>
		<%
		int tot=0;
		for(Student s:dao.getStudents()) {
			int avg = (s.getKor() + s.getEng() + s.getMath())/3;
			tot += avg;
		
		%>
		
		<tr>
		<td><%= s.getSno() %></td>
		<td><%= s.getName() %></td>
		<td><%= s.getKor() %></td>
		<td><%= s.getEng() %></td>
		<td><%= s.getMath() %></td>
		<td><%= avg %></td>
		</tr>
		<% } %>
		
		<tr><td colspan="5">전체평균</td><td><%= tot/dao.getStudents().size() %></td></tr>
	</table>
</body>
</html>