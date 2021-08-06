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
	window.onload = function() {
		document.querySelector("h3").innerText="시작";
	}

</script>
</head>
<body>

	<%
	
	String pname = request.getParameter("pname");
	String price = request.getParameter("price");
	String pcnt = request.getParameter("pcnt");
	%>
	
	<h3 align="center"></h3>
	<form id="frm01">
		<table>
			<tr>
				<th>물건명</th>
				<th>가격</th>
				<th>갯수</th>
			</tr>
			<tr>
				<td><%= pname %></td>
				<td><%= price %></td>
				<td><%= pcnt %></td>
			</tr>
		</table>
	</form>
	
	
	
	<%--
	
	#요청데이터에 대한 처리
	1. null
		요청값이 없을 때 기능메소드를 이용하거나 화면에 null로 보여지는 것을 방지해야 한다
		1) if(요청값 == null) 변수명 = default 데이터 처리
			문자열의 경우 "", 숫자형은 "0"이나  
	2. 형변환 처리
	3. 객체에 대한 할당처리 
	
	--%>
	
	<%
	

	
	// 요청값은 값을 넘겨줘야 데이터를 얻기때문에 이 파일내에서는 null값임 
	// 그래서 null에 대한 처리를 해줘야함 
	if(pname==null) 
		pname=" "; // nullpointer예외나 null 오류 방지
	
	if(price==null)  // 숫자형은 0이나 기본데이터로 처리
		price="0";
	
	if(pcnt==null) 
		pcnt="0";
	
	// null에 대한 처리 후 기능메소드 선언시 오류가 나지않음 
	if(pname.equals("바나나")) {
		;
	}
	
	
	
	// 응용) a18_form.jsp
	//		도서명 : [ ]
	//		저자 : [ ] [확인] 
	//		-> a19_rev.jsp로 도서명: @@, 저자:@@
	//		입력이 안된 경우 "입력안됨", "익명"으로 표현하여 출력하기(3조)
	
	
	%>
	
	
	
</body>
</html>