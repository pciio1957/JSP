<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a01_start.*"
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
	
/*
	
# 정리문제
1. 요청값 처리에 대한 location.href 방식 form 하위 요소객체를 이용하여 처리하는
   방식의 차이점을 코드로 기술하세요.
   1) 처리하는 영역이 다름 
   		location.href : 자바스크립트
   			location.href = "이동할페이지?요청키=요청값";
   		form 하위 요소객체 : HTML 
   			<form action="이동할페이지">
   				<input name="요청키" value="요청값"/>
   				<input type="submit"/> 
   				 	-> submit 버튼 클릭시 url로 '이동할페이지?요청키=요청값'으로 넘김
   2) 
   
2. 요청값이 없는 경우에 처리할 내용에 대한 기본 코드를 기술하세요.
	null값 처리는 데이터 유형에 따라 다르다 
	
	<　% String x = request.getParameter("x"); %>
	1) 문자열일 경우
		if(x == null) x = "";
	2) 숫자일 경우
		if(x == null) x = "0";
	
	
	1) 한 페이지로 요청값 처리와 초기 form화면을 같이 처리할 때 사용된다
	2) 초기요청값 자체가 없는 경우
		url : 페이지명.jsp
		String name = request.getParameter("name");
		if(name==null)
	3) form 하위에 입력을 하지 않고 submit버튼을 클릭한 경우
		url : 페이지명.jsp?name=
		String name = request.getParameter("name");
		if(name.equals("")) 
			cf) 아예 입력이 안된 경우는 일반적으로 자바스크립트를 이용해 
				서버에 전송이 안되게 한다
				if(nameVal == "") {
					alert("입력해야 전송됩니다");
				}
	
	
3. form 형식으로 숫자형 데이터를 전송하여 처리하는 방식에 있어서, 반드시 처리해야 될
   내용을 예제와 함께 기술하세요.
   1) 데이터값이 null인지 확인 후 
   2) 숫자형으로 형변환해줘야한다
   
   String num01S = request.getParameter("num01");
   
   // trim() : 양쪽 공백제거, 입력폼에 공백을 넣고 전송된 경우도 방지
   if(num01S == null || num01S.trim().equals("")) {
	   num01S = "0";
   }
   
4. 온라인 영화관 예약시스템에서 입장할 영화제목, 입장인원, 입장료, 상영시간으로 
   입력하여 처리결과를 확인하고자 한다. 2개 페이지로 처리하는 형식과 
   1개 페이지로 처리하는 형식을 처리해보세요.
   처리결과 : 영화제목, 상영시간, 입장인원, 총비용 출력
   
5. 아래와 같은 형식으로 계산기를 처리하세요.(1개페이지)
   [    ] [연산자select] [    ] [합산]
  
9:30까지 일단 진행해보겠습니다~~


*/

</script>
</head>
<body>

	<h3 align="center">3번 문제</h3>
	<h5>요청값 처리</h5>
	<form id="frm01">
		<table>
			<tr><th>물건명</th><td><input type="text" value="" name="pname"></td></tr>
			<tr><th>물건가격</th><td><input type="text" value="" name="price"></td></tr>
			<tr><td colspan="2"><input type="submit" value="전송하기"></td></tr>
		</table>
	</form>
	
	<%
	
		String pname = request.getParameter("pname");
		String price = request.getParameter("price");
		
		
		if(pname == null && price == null) {
			pname = "";
			price = "0";
		} else { 
	%>
	
	<h5>요청값 처리결과</h5>
	<table>
		<tr><th>물건명</th><td><%= pname %></td></tr>
		<tr><th>물건가격</th><td><%= price %></td></tr>
	</table>
	<% } %>
	
	
	<h3>4번 영화관</h3>
	<h5>(2페이지)예매 내용 입력</h5>
	<form id="frm02" action="a0728exp2.jsp">
		<table>
			<tr><th>영화제목</th><td><input type="text" value="" name="mname"></td></tr>
			<tr><th>입장인원</th><td><input type="text" value="" name="mperson"></td></tr>
			<tr><th>입장료</th><td><input type="text" value="" name="mprice"></td></tr>
			<tr><th>상영시간</th><td><input type="text" value="" name="mtime"></td></tr>
			<tr><td colspan="2"><input type="submit" value="예매하기"></td></tr>
		</table>
	</form>
	
	<h5>(1페이지)예매 내용 입력</h5>
	<form id="frm03">
		<table>
			<tr><th>영화제목</th><td><input type="text" value="" name="mvname"></td></tr>
			<tr><th>입장인원</th><td><input type="text" value="" name="mvperson"></td></tr>
			<tr><th>입장료</th><td><input type="text" value="" name="mvprice"></td></tr>
			<tr><th>상영시간</th><td><input type="text" value="" name="mvtime"></td></tr>
			<tr><td colspan="2"><input type="submit" value="예매하기"></td></tr>
		</table>
	</form>
	
	
	<%
	
	
	String mvname = request.getParameter("mvname");
	String mvpersonS = request.getParameter("mvperson");
	String mvpriceS = request.getParameter("mvprice");
	String mvtime = request.getParameter("mvtime");
	
	if(mvname == null) mvname = "";
	if(mvpersonS == null) mvpersonS = "0";
	if(mvpriceS == null) mvpriceS = "0";		
	if(mvtime == null) {
		mvtime = "";
		
	%>
	
		<h3 align="center"> 입력된 데이터가 없습니다 </h3>
	
	<%
		
	} else {
		
		int mvperson = Integer.parseInt(mvpersonS);
		int mvprice = Integer.parseInt(mvpriceS);
		
		int sum = mvperson * mvprice;
	
	%>
	
	
		<h3 align="center"></h3>
		<table>
			<tr><th>영화제목</th><td><%= mvname %></td></tr>
			<tr><th>상영시간</th><td><%= mvtime %></td></tr>
			<tr><th>입장인원</th><td><%= mvperson %></td></tr>
			<tr><th>총 비용</th><td><%= sum %></td></tr>
		</table>
	<% } %>
	
	<%
	
	String num01S = request.getParameter("num01");
	String num02S = request.getParameter("num02");
	
	
	if(num01S == null) num01S = "0";
	if(num02S == null) {
		num02S = "0";
	
	%>
	
	
	<h5>(풀이)예매 내용 입력</h5>
	<form id="frm032">
		<table>
			<tr><th>영화제목</th><td><input class="input" type="text" value="" name="mvname"></td></tr>
			<tr><th>입장인원</th>
				<td>
					<select name="cnt" class="input" >
						<option value="">선택</option>
						<% for(int idx=1; idx<=20; idx++) { %>
						<option><%= idx %></option>
						<% } %>
					</select>
				</td></tr>
			<tr><th>입장료</th><td><input class="input"  type="text" value="" name="mvprice"></td></tr>
			<tr><th>상영시간</th>
				<td>
					<select name="time" class="input" >
						<option value="">선택</option>
						<% for(int hour=9; hour<=23; hour++) { %>
						<option><%= hour %>:00</option>
						<% } %>
					</select>
				</td>
			</tr>
			<tr><td colspan="2"><input type="button" onclick="send()" value="예매하기"></td></tr>
		</table>
	</form>
	
	<script type="text/javascript">
		function send() {
			// 공백처리, 정규식표현처리, 문자의범위
			//	요소객체.value == "" , isNaN(), .length 등을 활용하여 
			//	유효성체크 후 서버에 전송하는 것이 일반적이다
			var inputArr = document.querySelectorAll(".input");
			if(inputArr[0].value=="") {
				alert("제목을 입력하세요! ");
				return; // submit()프로세스를 중지함
			}
			if(inputArr[1].value=="") {
				alert("입장인원을 입력하세요! ");
				return; // submit()프로세스를 중지함
			}
			if(inputArr[2].value=="") {
				alert("상영시간을 선택하세요! ");
				return; // submit()프로세스를 중지함
			}
			
			// form객체의 .submit()함수를 통해서 submit버튼을 클릭한 것과
			// 동일한 기능 처리
			// 위에 유효성을 js로 check하고 전송해야할 경우 주로 사용된다
			document.querySelector("#frm032").submit();
		}
	
	</script>

	
	<h3>5번 계산기</h3>
	<form id="frm04">
		<table>
			<tr>
				<td><input type="text" value="" name="num01"></td>
				<td>
					<select id="sltOp" onclick="select()">
						<option>+</option>
						<option>-</option>
						<option>*</option>
						<option>/</option>
					</select>
				</td>
				<td><input type="text" value="" name="num02"></td>
				<td><input type="submit" value="합산"></td>
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">
	
	
	
	function select() {
		
		var selectOpv = document.querySelector("#sltOp").value;
		
		console.log("value :" + selectOpv);
	}
	
	</script>
</body>
</html>