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

#정리문제
1. jsp에서 예외클래스 등록을 처리하는 순서를 정리 하세요.
	예외클래스 등록
	1) 예외가 발생하면 보여줄 페이지(jsp)를 작성한다.
	2) web.xml의 error-page안에 exception-type에 해당 예외클래스를 등록한다.
	  <error-page>
	  	<exception-type>java.lang.Exception</exception-type>
	  	<location>/z01_jsp/a08_exception/a05_Exception.jsp</location>
	  </error-page>
	3) 강제 예외 발생 테스트
	
2. 쿠키를 브라우저와 서버간에 처리코드를 기술하세요.
	쿠키의 사용
	1) 쿠키 등록 : Cookie c1 = new Cookie("cookie","first"); response.addCookie(c1); 
				or response.addCookie(new Cookie("cookie", "second")); 
	2) 쿠키 조회 : Cookie[] cks = request.getCookies();


	클라이언트(브라우저) <======> 서버(톰캣)
		저장소(쿠키)
	1) 서버단에 쿠키를 생성해서 response객체로 전달 : response.addCookie(new Cookie(이름, 값));
	2) 브라우저에 특정 저장소에 저장
	3) 요청객체(request)로 서버에 전달 : request.getCookies();

3. 쿠키의 한글처리시 사용하는 코드를 기술하세요.
	쿠키의 한글 처리 방법
	1) 작성 후 쿠키 생성시 인코딩 (작성한 한글을 변환)
		URLEncoder.encode("한글데이터", "utf-8");
	2) 쿠키를 불러올때 디코딩 (변환된 한글데이터를 한글로 출력)
		URLDecoder.decode("한글데이터", "utf-8");
		
		
	저장시 encoding : URLEncoder.encode("쿠키의 이름/값", "utf-8");
	호출시 decoding : URLDecoder.decode("쿠키의 이름/값", "utf-8");
	
4. 쿠키값 삭제 2가지 방법을 기술하세요.
	쿠키의 삭제 방법
	1) 쿠키 데이터는 서버와 클라이언트가 끊어지면 사라진다
		-> 서버를 재가동 or 클라이언트의 브라우저를 모두 종료 시 삭제됨
	2) JSP에서 쿠키를 삭제하기 위해서는 서버프로그램을 삭제해야한다. 
		-> 해당 쿠키를 보낼 때 유효시간을 0으로 설정 후 쿠키를 추가한다.
		c1.setMaxAge(0);
		response.addCookie(c1);
		

	서버와 클라이언트가 접속 종료시 (브라우저를 다 종료하고, 서버도 종료함)
	지정된 쿠키의 생명주기를 0으로 처리하여 response.addCookie로 보낸다
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	 
5. 쿠키를 활용하여 영화를 예매하고, 최종 결재할 내용만 남기는 처리를 하세요.
    [영화제목][보통/3d/4d][금액][관람갯수][예매] ==> 현예매현황(최종내용현황)
    [] 영화제목 분류 금액 관람수
    []  @@@  @@  @@@ @@@
          [제외][결재]
          
          
발표는 9:30에 진행하겠습니다.~~
발표자는 단톡에 올려주세요 3조,4조

--%>
<%

%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("8월 20일 정리문제");
	});
</script>
<body>
	<h2 align="center"></h2>
	
	<h3 align="center">영화 예매</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>영화제목</th><td><input type="text" name="mvName" value=""/></td></tr>
		<tr><th>분류</th>
			<td>
				<input type="radio" name="mvClass" value="보통"/>보통
				<input type="radio" name="mvClass" value="3D"/>3D
				<input type="radio" name="mvClass" value="4D"/>4D
			</td>
		</tr>
		<tr><th>금액</th><td><input type="text" name="mvPrice" value=""/></td></tr>
		<tr><th>관람갯수</th>
			<td>
				<select name="mvCnt">
					<option>갯수선택</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
				</select>
			</td>
		</tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="예매"/>
		</td></tr>
	</table>	
	</form>
	
	<%
	
	String mvName = request.getParameter("mvName");
	String mvClass = request.getParameter("mvClass");
	String mvPrice = request.getParameter("mvPrice");
	String mvCnt = request.getParameter("mvCnt");
	
	System.out.println(mvName);
	System.out.println(mvClass);
	System.out.println(mvPrice);
	System.out.println(mvCnt);
	
	%>
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>