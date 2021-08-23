<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    import = "java.net.*"    
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

# 정리문제
1. [jquery] filter()의 사용형식과 end()기능메서드의 의미를 기술하세요.
	$("선택자").filter("선택자|가상선택자").적용기능메소드();
	$("선택자").filter(function(idx, ele){ return boolean값; }).적용기능메소드();
		- 해당 선택자 중에 다중 선택자나 callback함수를 적용하여 boolean값이 true인 경우
			이후에 나타나는 적용기능메소드 처리 
	$("선택자").메소드1().메소드2().end().메소드3().메소드4()
		- 선택자 이후 메소드는 해당 선택자에 중첩적으로 적용된다
			end()메소드가 처리되는 경우에 해당 선택자의 중첩적 적용을 중단하고 초기 선택자에
			다시 적용 메소드를 이후에 처리할 때 활용된다

2. [jquery] event.target의 활용하는 기본예제를 기술하세요.
	(아래)
	
3. [jquery] 버튼을 클릭시, 하단에 h3가 추가되고, h3를 클릭시, 배경색상이 변경되게 처리하세요.
	(아래)
	
4. [jquery] 계층 구조 메서드를 기술하세요.
	계층 구조 관련 메소드
	1) children("선택자") : 자식 중 고를 선택자 입력
	2) parents() : 상위 계층 객체들 모두 해당
	   parent() : 바로 상위 부모객체
	3) next() : 같은 부모 요소객체를 두고, 같은 레벨의 요소객체인 형제객체 중 다음 순서의 객체 지정
	4) prev() : 같은 부모 요소객체를 두고, 같은 레벨의 요소객체인 형제객체 중 이전 순서의 객체 지정
	5) siblings() : 형제 요소객체들 모두 해당

5. [jsp] 액션 태그 <jsp:include><jsp:forward>의 차이점을 기술하세요.
	jsp:include
	1) 다른 jsp페이지의 실행 결과를 현재 위치에 삽입한다
	
	jsp:forward
	1) 해당 페이지로 요청값과 함께 이동처리된다.
	2) request 요청값은 함께 이동처리된다.
	
6. [jsp] 위 액션 태그를 활용하서 메뉴별 페이지가 이동되게 처리하세요.
	1) select를 이용해서 값을 선택할 수 있도록 한다
	2) jquery로 change할때 form을 submit해줌
	3) request를 이용해 select의 값을 받아온 뒤 
		값이 있을때만 forward 설정되도록 하기

7. [jsp] 에러 코드와 클래스별 예외 처리를 web.xml(서버)단위로 처리하는 것을 기술하세요.
	1) jsp페이지별 예외 처리
		에러페이지 지정 : errorPage="예외발생시 처리할 페이지"
		에러페이지 작성 : isErrorPage = "true"
			exception.getMessage(), exception.prontStackTrace()
	
	2) 웹서버 전체적으로 에러 지정
		  <error-page>
		  	<error-code>404</error-code>
		  	<location>/z01_jsp/a08_exception/a02_404.jsp</location>
		  </error-page>
		  
		  - NullPointer예외 : 사용될 객체나 변수가 null인데 사용할 경우 발생
		  <error-page>
		  	<exception-type>java.lang.NullPointerException</exception-type>
		  	<location>/z01_jsp/a08_exception/a03_nullPointer.jsp</location>
		  </error-page>

8. [jsp] 쿠키를 활용하여, 물건을 카트에 담고, 삭제 처리하게 하세요.
	(아래)

9. [jsp] 세션값의 설정과 할당을 List<VO>로 설정되게 하세요.
	(아래)
	
10. [jsp] 해당 기능 버튼을 클릭시, 세션값이 없을 때, 로그인 페이지로 이동되게 처리하세요.
	(a10session 폴더에 있는 로그인 참고)

--%>
<%

	String name = request.getParameter("name");
	String cnt = request.getParameter("cnt");
	
	if(name != null) {
		response.addCookie(new Cookie(URLEncoder.encode(name, "utf-8"), cnt));
		response.sendRedirect("a0823exp_ans.jsp");
	}
	
%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("8월 23일 정리문제 풀이");
		
			
		// 3번 문제
		var idx = 1;
		$("#btnadd").click(function(){
			$("#div02").append("<h3 align='center'>추가되는 h3데이터_" + idx++ + "</h3>");
		});
		
		$("#div02").click(function(){
			if($(event.target).is("h3")) {
				$(event.target).css("background", "pink");
			}
		});
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	
	<!-- 3번 문제  -->
	<div align="center">
	H3 객체 추가 <input type="button" value="추가" id="btnadd"/>
	<div id="div02"></div>
	</div>
	<br><br>
	
	<!--  8번 문제 -->
	<form id="frm01">
	<table align="center" class="listTable" method="post">
		<tr><th>물건명</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="담기"/>
		</td></tr>
	</table>	
	</form>
	
	<h3 align="center"> 카트 내용 확인 </h3>
	<form>
		<table align="center" class="listTable">
			<tr><th>　</th><th>물건명</th><th>갯수</th></tr>
		
			<% 
				// input type="checkbox" name="ck" value="<%= ck.getName()
				// 요청값으로 온 삭제할 쿠키의 이름들
				String cks[] = request.getParameterValues("ck");
				if(cks != null) {
					for(Cookie cookie:request.getCookies()) {
						for(String ck:cks) {
							if(cookie.getName().equals(ck)) {
								cookie.setMaxAge(0);
								response.addCookie(cookie);
							}
						}
					}
					response.sendRedirect("a0823exp_ans.jsp"); 
				}
				
				if(request.getCookies() != null) {
					for(Cookie ck:request.getCookies()) {
						if(!ck.getName().equals("JSESSIONID")) {
			%>
			<tr>
				<td><input type="checkbox" name="ck" value="<%= ck.getName() %>" />
				<td><%= URLDecoder.decode(ck.getName(), "utf-8") %></td><td><%= ck.getValue() %></td></tr>
			<% }}}  %>
			<tr>
				<td colspan="3" style="text-align:center">
					<input type="submit" value="삭제"/>
				</td>
			</tr>
		</table>	
	</form>
	
	<%
	
	ArrayList<String> fruits = new ArrayList<String>();
	String ranFruit[] = {"사과", "바나나", "딸기", "오렌지", "수박"};
	
	if(session.getAttribute("frutits")!= null){
		fruits = (ArrayList<String>) session.getAttribute("fruits");
	}
	
	fruits.add(ranFruit[(int)(Math.random() * 5)]);
	session.setAttribute("fruits", fruits);
	%>
	
	<h3 align="center">세션 List</h3>
	<table align="center" class="listTable">
		<tr><th>물건명</th></tr>
		<% for(String fru:fruits) { %>
			<tr><td><%= fru %></td></tr>
		<% } %>
	</table>	
</body>
</html>