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
	width:50%;
	margin-bottom:20px;
	padding:20px;
}

</style>
</head>
<%-- 

 응용1) 쿠키 생성하고 확인하는 페이지 작성하기 
	a04_buyBook.jsp (구매할 도서 - 구매처리 - 쿠키에 담기) 도서명, 가격
	a05_CartBook.jsp (현재 카트에 도서 담기)  (5조 제출, 나머지 손들기) 

--%>

	<!--  응용2) 앞의 응용문제에서 한글로 쿠키값을 설정하여 확인할 수 있도록 하기 
	(1조 제출, 나머지 손들기) -->
	
	<!--  응용) 카드에서 장바구니에서 제외 처리하기 (2조 제출, 나머지 손들기) -->

<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("도서 구매 페이지");
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>도서명</th><td><input type="text" name="bkName" value=""/></td></tr>
		<tr><th>도서가격</th><td><input type="text" name="bkPrice" value="0" /></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="검색"/>
		</td></tr>
	</table>	
	</form>

<%

	String bkName = request.getParameter("bkName");
	String bkPrice = request.getParameter("bkPrice");
	
	if(bkName != null) {
		//Cookie b01 = new Cookie(bkName, bkPrice);
		Cookie b01 = new Cookie(URLEncoder.encode(bkName, "utf-8"), URLEncoder.encode(bkPrice, "utf-8"));
		
		response.addCookie(b01);
		response.sendRedirect("a05_CartBook.jsp");
	}
%>

</body>
</html>