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
	margin-bottom:20px;
	padding:20px;
}

</style>
</head>
<%-- 

# 정리문제
1. [jquery] filter()의 사용형식과 end()기능메서드의 의미를 기술하세요.
	filter
	1) 특정 요소객체를 선택하여 action메소드를 처리하고 
	하위 계층에 있는 요소 객체를 filter()를 이용해 속성을 지정할 때 주로 사용된다.
	2) .filter(function(idx, 요소객체){ return boolean값; });
	3) 메소드의 chainning이 가능해 여러 속성 지정이 가능하다. 
	
	end
	1) filter()를 이용해 chainning을 할 때 기존의 메소드의 연결을 끊고 
	새로운 filter()의 속성을 지정하기 위해서 사용된다.


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
	<jsp:include> : 해당 페이지에 외부의 페이지를 포함시킨다. 외부의 페이지에서 반환될 때 param을 이용해 실행 처리 결과를 가져온다.	
	<jsp:forward> : 다른 페이지로 이동하는 태그로 흐름 제어에 사용된다.

6. [jsp] 위 액션 태그를 활용하서 메뉴별 페이지가 이동되게 처리하세요.
	<jsp:forward page="a0819exp.jsp"/>
	<jsp:forward page="a0820exp.jsp"/>
	<jsp:forward page="a0823exp.jsp"/>
	
7. [jsp] 에러 코드와 클래스별 예외 처리를 web.xml(서버)단위로 처리하는 것을 기술하세요.
	에러 코드별/클래스별 예외 처리
	1) 처리 순서
		- 에러가 발생하면 호출될 페이지를 작성
		- web.xml에 <error-page>를 작성한다. 
		  이때 에러 코드는 <error-code>, 클래스별 예외는 <exception-type>를 이용해 처리한다
		- 제대로 처리되는지 확인한다
	2) 에러별 작성 내용
	  - 404에러 : 파일이 없거나 경로가 잘 못 되어있을 때 주로 나타나는 에러
	  <error-page>
	  	<error-code>404</error-code>
	  	<location>/z01_jsp/a08_exception/a02_404.jsp</location>
	  </error-page>
	  
	  - NullPointer예외 : 사용될 객체나 변수가 null인데 사용할 경우 발생
	  <error-page>
	  	<exception-type>java.lang.NullPointerException</exception-type>
	  	<location>/z01_jsp/a08_exception/a03_nullPointer.jsp</location>
	  </error-page>
	  
	  - ArrayIndexOutOfBounds예외 : 배열의 인덱스가 범위를 벗어났을 때 발생
	  <error-page>
	  	<exception-type>java.lang.ArrayIndexOutOfBoundsException</exception-type>
	  	<location>/z01_jsp/a08_exception/a04_indexOfBound.jsp</location>
	  </error-page>
	  
	  - Exception예외 : 모든 예외를 뜻함
	  <error-page>
	  	<exception-type>java.lang.Exception</exception-type>
	  	<location>/z01_jsp/a08_exception/a05_Exception.jsp</location>
	  </error-page>


8. [jsp] 쿠키를 활용하여, 물건을 카트에 담고, 삭제 처리하게 하세요.
9. [jsp] 세션값의 설정과 할당을 List<VO>로 설정되게 하세요.
10. [jsp] 해당 기능 버턴을 클릭시, 세션값이 없을 때, 로그인 페이지로 이동되게 처리하세요.
~ 09:50까지 진행해주시고, 완료된 분들은 손들고 제출해주세요 

--%>
<%

String goPage = request.getParameter("goPage");

%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("8월 23일 정리문제");
		
		// 2번 문제
		$("#div01 p").click(function(){
			$(event.target).css("background", "yellow");

		});
		
		// 3번 문제
		var idx = 1;
		$("#btnadd").click(function(){
			$("#div02").append("<h3 align='center'>추가되는 h3데이터_" + idx++ + "</h3>");
		});
		
		$("#div02").click(function(){
			$(event.target).css("background", "pink");
		});
		
		// 6번 문제
		$("[name=goPage]").change(function(){
			$("#frm01").submit();
		});
		
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	
	<!-- 2번 문제 -->
	<div id="div01" align="center">
		<p>안녕하세요~1</p>
		<p>안녕하세요~2</p>
		<p>안녕하세요~3</p>
		<p>안녕하세요~4
			<span>Span 1</span>	
			<span>Span 2</span>	
			<span>Span 3</span>	
			<span>Span 4</span>	
		</p>
		<p>안녕하세요~5</p>
		<p>안녕하세요~6</p>
	</div>
	<br>
	
	<!-- 3번 문제  -->
	<div align="center">
	H3 객체 추가 <input type="button" value="추가" id="btnadd"/>
	<div id="div02"></div>
	</div>
	<br><br>
	
	
	<!-- 6번 문제 -->
	<form id="frm01" align="center">
		<select name="goPage">
			<option value="">선택하세요!</option>
			<option value="a0819exp.jsp">8월 19일</option>
			<option value="a0820exp.jsp">8월 20일</option>
		</select>
	</form>
	
	<% if(goPage != null && !goPage.equals("")) { %>
		<jsp:forward page="<%= goPage %>"/>
	<% } %>

</body>
</html>