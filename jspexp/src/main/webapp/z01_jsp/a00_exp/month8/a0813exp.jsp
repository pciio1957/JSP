<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"  
    buffer = "8kb"  
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
</head>
<%-- 
# 정리문제
1. session scope의 4가지 범위를 기술하세요.
	pageContext : 한 페이지 범위 설정
		-> 해당 페이지에서만 데이터 유지
	request : 요청 페이지까지 범위 설정
	 	-> forward를 통해서 요청값을 전달할 경우에 데이터 유지
	session : 브라우저가 닫힐 때 까지 범위 설정
		-> 브라우저와 서버간에 연결된 경우에만 데이터 유지
	application : 서버 단위로 범위 설정
		-> 동일한 서버가 기동된 상황까지 데이터 유지
	
2. out 객체를 이용하여 buffer 메모리 8kb를 설정하고, 화면에 로그인 인증여부의 결과를 out객체를 활용하여
   처리하되, buffer의 정보(크기,남은크기)도 함께 출력하세요.
   	(아래)
   	
3. request 범위로 활용하여, 배달물건의 가격에 따른 등급(등급범위는 임의)이 다른 페이지(물건명,가격 요청값 표기)로
    이동하게 처리하세요.
    입력 : 물건명, 가격  페이지1(1등급), 페이지2(2등급), 페이지3(3등급)
    (아래)
    
4. session 범위로 활용하여 초기페이지(세션값1000설정), 이동페이지2(세션값10차감), 이동페이지3(세션값20차감)
    회원의 페이지마다 물건을 구매하는 부분을 간단하게 처리하는 부분으로 초기페이지에서 세션값을 설정한 후,
    이동페이지2, 이동페이지3을 서로 이동하면서 계속 세션값이 차감되어 출력되게 하세요.
    
5. application 범위로 web.xml에 이미지파일경로와 다운로드파일경로를 설정한 후, 해당 경로를 jsp페이지에서 
    호출하여, 출력하게 하세요.
~9:30 1차 점검합니다. 올려주시고, 손들어주세요.

--%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#title").text("8월 13일 복습문제");
		
</script>
<body>
	<h2 align="center" id="title"></h2>
	
	<%-- 2번문제 --%>
	<%
	
	String id = "himan";
	String pw = "7777";
	boolean isLogin = id.equals("himan") && pw.equals("7777")?true:false;
	out.println("<h3 align='center'> 로그인 여부 : " + isLogin + "</h3>");
	
	out.println("<h4 align='center'> 버퍼 사이즈 : " + out.getBufferSize() + "</h4>");
	out.println("<h4 align='center'> 남은 버퍼 사이즈 : " + out.getRemaining() + "</h4><br><br>");
	

	%>

	<%-- 3번문제 --%>
	<h3 align="center">배달물건 등록</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="button" id="btnAdd" value="등록"/>
		</td></tr>
	</table>	
	</form>
	
	<%-- 4번문제 --%>
	<%
			// 4번문제 
			session.setAttribute("pay", 1000);
	%>
	<br><br>
	<h3 align="center" onclick="location.href='a0813exp_buy1.jsp'">물건 구매 페이지1 이동</h3>
	<h3 align="center" onclick="location.href='a0813exp.jsp'">초기포인트 설정</h3>
	
	<%
		// 입력받은 값으로 request 설정하려고 했는데 실패
		String pname = request.getParameter("pname");
		String priceS = request.getParameter("price");
		int price = 0;
		
		RequestDispatcher rd = null;
		
		if(pname != null) {
			request.setAttribute("pnameVar", pname);
			out.print("<jsp:forward page=''/?");
		}
		if(priceS!=null) {
			price = Integer.parseInt(priceS);
			//request.setAttribute("priceVar", price);
			
			
			if(price >= 100000) {
				//out.print("<jsp:forward page='a0813exp_page1.jsp'/>");
				rd = request.getRequestDispatcher("a0813exp_page1.jsp");
			} else if(price >= 50000) {
				rd = request.getRequestDispatcher("a0813exp_page2.jsp");
			} else {
				rd = request.getRequestDispatcher("a0813exp_page3.jsp");	
			}
			
			rd.forward(request, response);
		}
	%>	
	
	
	<%-- 5번문제 --%>
	<%
	
		String imgPath = application.getInitParameter("IMG_PATH");
		String downPath = application.getInitParameter("DOWN_PATH");
	%>
	
	<br>
	<h2 align="center">5번 경로 확인</h2>
	<h3 align="center">이미지 경로 : <%= path+imgPath %></h3>
	<h3 align="center">파일 다운로드 경로 : <%= path+downPath %></h3><br><br>
	
		
	<h2 align="center"> 이미지/파일 경로 사용 예시 </h2>
	<img src="<%=path+imgPath %>img01.jfif" width="200px" height="200px" align="center"/><br>
	<a href="<%= path+downPath %>memo.zip" align="center">파일 다운로드</a>
</body>
</html>