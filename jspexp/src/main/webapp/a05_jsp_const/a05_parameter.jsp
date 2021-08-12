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
	
	table {
		margin-bottom:20px;
		padding:20px;
	}
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
</head>
<%-- 
#요청값 처리
1. get/post 방식에 의해 전달해온 요청값을 처리하는 메소드들
2. 요청값 형식
	페이지?key1=value1&key2=value2&key3=value3;
3. 지원메소드
	1) String value1 = request.getParameter("key1");
		System.out.println("요청값: " + value1);
	
	2) String regs[] = request.getParameterValues("동일한이름의 요청키");
		페이지?buyprod=사과&buyprod=바나나&buyprod=딸기
		String prods[] = request.getParameterValues("buyprod");
		for(String prod:prods) {
			System.out.println(prod);
		}
	
	3) form 요소객체의 특성에 따른 요청값 전달
		<input type="text" name="요청이름1"/>
		<input type="text" name="요청이름1"/>
		<input type="text" name="요청이름1"/>
		<input type="text" name="요청이름1"/>
		
		#input type="text"의 경우
			name의 설정값이 1개 일때는 request.getParameter("단일요청");
			name의 설정값이 다중일때는 request.getParameterValues("다중요청");
		
		
		
		<input type="radio" name="요청이름1" value="값1"/>
		<input type="radio" name="요청이름1" value="값1"/>
		<input type="radio" name="요청이름1" value="값1"/>
		
		#input type="radio"의 경우
			같은 name값으로는 checked가 한개만 선택되므로 여러 객체가 radio로 나열되어 있어도 요청값은 하나만 처리된다.
			그러므로 request.getParameter("단일요청")을 활용
		
		
		
		<input type="checkbox" name="요청이름1" value="값1"/>
		<input type="checkbox" name="요청이름1" value="값2"/>
		<input type="checkbox" name="요청이름1" value="값3"/>
		
		#input type="checkbox"인 경우
			동일한 요청이름으로 여러 개의 데이터를 전송할 수 있는데
			★checked★가 된것만 요청값의 배열로 전송된다.
			그러므로 String cks[] = request.getParameterValues("다중요청");



		<input type="hidden" name="proc"/>

		#input="hidden"의 경우
			요청값으로 화면에는 보이지 않게하여야 하나, js로 요청값을 전송할 때
			반드시 처리할 내용은 type="hidden"으로 하고 js/jquery에 의해 처리된다. 

		cf) form 데이터 전송 관련 js/jquery 처리 부분
		1) <input type="submit"/> : 해당 버튼을 클릭시, form 하위 요소 객체의 데이터를 전송한다
		2) 전송 전 유효성 check를 하기 위한 데이터 처리
			<input type="submit"/> -> <input type="button" id="funBtn"/>
			#("#funBtn").click(function(){
				if($("[name=요청키]").val() == "") { // 공백에 대한 유효성 체크
					// return ; // 전송프로세스 중단
				}
				if($("[name=요청키]").val().length>8) { // 입력할 데이터의 크기 유효성 체크
					// return; // 전송프로세스 중단
				}
				
				
				// hidden 데이터 처리
				$("[name=proc]").val("수정");
				// form의 조건에 따른 요청 controller/jsp 페이지 처리 
				
				if($("[name=proc]").val() == "수정") {
					$("form").attr("action", "<%= path %>/calUpdate.do");
				}
				
				if($("[name=proc]").val() == "삭제") {
					$("form").attr("action", "<%=path%>/calDelete.do");
				}
				
				$("form").submit();
			});
		
		
--%>

<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>구매자명</th><td><input type="text" name="buyer" value=""/></td></tr>
		<tr><th>구매물건1</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>구매물건2</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>구매물건3</th><td><input type="text" name="pname" value=""/></td></tr>
		
		<tr><th>단일선택1</th><td><input type="radio" name="kind" value="신제품"/>신제품</td></tr>
		<tr><th>단일선택2</th><td><input type="radio" name="kind" value="중고"/>중고</td></tr>
		<tr><th>단일선택3</th><td><input type="radio" name="kind" value="전시제품"/>전시제품</td></tr>
		
		<tr><th>다중선택1</th><td><input type="checkbox" name="calMsg" value="기본출력"/>계산서출력</td></tr>
		<tr><th>다중선택2</th><td><input type="checkbox" name="calMsg" value="메일"/>계산서메일발송</td></tr>
		<tr><th>다중선택3</th><td><input type="checkbox" name="calMsg" value="메시지"/>계산서메시지발송</td></tr>
		<tr><td colspan="2" style="text-align:center"><input type="submit" value="구매"/></td></tr>
	</table>	
	</form>
	
	
	<%

	String buyer = request.getParameter("buyer");
	String pnames[] = request.getParameterValues("pname");
	String kind = request.getParameter("kind");
	String calMsgs[] = request.getParameterValues("calMsg");
	
	%>
	<% if(buyer != null) { %>
	<table align="center" class="listTable">
		<tr><th>구매자명</th><td><%= buyer %></td></tr>
		<tr><th>물건구분</th><td><%= kind %></td></tr>
		<% for(int idx=0; idx<pnames.length; idx++) { %>
		<tr><th>구매물건 <%= idx+1 %></th><td><%= pnames[idx] %></td></tr>
		<% } %>
		<% for(int idx=0; idx<calMsgs.length; idx++) { %>
		<tr><th>계산서처리 <%= idx+1 %></th><td><%= calMsgs[idx] %></td></tr>
		<% } %>
	</table>	
	<% } %>
	
<%-- 

	// 응용) 다음 화면 요청 결과값까지 출력하기  (2조 제출, 나머지 손들기)
		이름 : [  ] 
		성별 : ( ) 남 ( ) 여
		좋아하는 동물 : [ ] 강아지 [ ] 고양이 [ ] 돼지 [ ] 기타 

 --%>	
	
	<h3 align="center"> 개인정보 입력 </h3>
	<form>
		<table align="center" class="listTable">
			<tr><td>이름</td><td><input type="text" name="ename" value=""/></td></tr>
			<tr><td>성별</td>
			<td>
				<input type="radio" name="gender" value="남"/>남
				<input type="radio" name="gender" value="여"/>여
			</td></tr>
			<tr><td>좋아하는 동물</td>
			<td>	
				<input type="checkbox" name="animal" value="강아지"/>강아지
				<input type="checkbox" name="animal" value="고양이"/>고양이
				<input type="checkbox" name="animal" value="돼지"/>돼지
				<input type="checkbox" name="animal" value="기타"/>기타
			</td></tr>
			<tr><td colspan="2">
				<input type="submit" id="btnpush" value="등록"/>
 			</td></tr>
		</table>
	</form>
	
	<%
	
	String ename = request.getParameter("ename");
	String gender = request.getParameter("gender");
	String animal[] = request.getParameterValues("animal");
	
	%>
	
	<% if(ename != null) { %>
	<h3 align="center"> 결과 출력 </h3>
	<table  align="center" class="listTable">
		<tr><th>이름</th><td><%= ename %></td></tr>
		<tr><th>성별</th><td><%= gender %></td></tr>
		<tr><th>좋아하는 동물</th><td>
		<% for(int x=0; x<animal.length;x++) { %>
			<%= animal[x] %>
		<%-- <tr><th>좋아하는동물 <%= x %> </th><td> <%= animal[x] %></td></tr> --%>
		<% } %>
		</td></tr>
	</table>
	<% } %>
</body>
</html>