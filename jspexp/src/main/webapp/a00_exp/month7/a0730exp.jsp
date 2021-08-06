<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
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
		document.querySelector("h3").innerText="0730 복습문제";
	}

</script>
</head>
<%-- 
# 정리문제
1. 리스트된 화면의 특정 키를 통해 상세화면에 전송처리하는 js를 기술하세요.
	<script>
	
	function info(deptno) {
		alert("부서 상세화면 이동");
		location.href = "a0720exp2.jsp?deptno=" + deptno;
	}
	</script>
	
2. 상세화면에서 받은 key를 요청값을 이용해서, 요청값을 받았을 때, 처리할 프로세스를
   기술하세요.
   1) 요청값을 getParameter()로 받아준다
   2) 요청값이 오지않는 경우를 생각해 null처리를 한다(데이터의 초기값 지정)
   3) null이 아닐때 나올 화면을 작성한다 
   	
3. 요청값을 기준으로 dao에 단일 데이터를 처리하여 form하위 input에 할당하는 프로세스를
   순서로 기술하세요.
   1) EmpList.jsp : 먼저 EmpList.jsp에서 여러 데이터를 표로 출력되어있을 때 
   			리스트에서 특정 행의 데이터를 더블 클릭시 해당 행의 정보를 EmpDetail.jsp로 넘김
   2) EmpDetail.jsp : EmpList.jsp에서 보낸 요청값을 getParameter()를 
   			이용해 변수에 받아준다.
   3) EmpDetail.jsp : 받은 요청값을 테이블의 input[type=text] 객체에 
   			value 부분에 값을 할당한다. value="<%= 변수 %>"
   
4. 상세화면을 특정한 내용을 변경 후, 처리하는 프로세스를 파일명 기준으로 하여 핵심 코드를 기술하세요.
	1) EmpDetail.jsp : 상세화면 페이지에서 input[type=text]로 입력해놓은 값을 
			사용자가 특정 내용을 변경한 후 수정 버튼을 클릭 -> 수정처리를 하는 화면으로 이동
	2) EmpUpdate.jsp : DB의 수정 메소드와 연결하여 update처리 되도록 한다
	
	
	1) 상세화면.jsp -> 2) 처리 프로세스(수정/삭제).jsp
	
	1) 항목에서
		form action="처리프로세스.jsp"
			submit() 
	2) request.getParameter("요청key")
		Dao객체에 필요한 기능메소드 처리
		요청값을 받아서 객체로 선언 및 할당
		dao.기능메소드(요청값); 

5. 회원리스트 화면에서 상세화면 처리 및 수정 처리하세요.

~ 발표는 9:30 진행하겠습니다.
# 각 조별로 발표진행 시, 개선 및 도입사항을 조별 발표진행 후, 전달해주세요.

--%>
<%

A05_PreparedDao dao1 = new A05_PreparedDao();
ArrayList<Dept> dList = new ArrayList<Dept>();
dList = dao1.getDeptAllList();

a01_Dao dao2 = new a01_Dao();
Product pro = new Product();
pro = dao2.getProduct("사과");

%>
<body>
	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		
		<tr>
			<% for(Dept p:dList) {  %>
			<td><input type="text" onclick="info(<%= p.getDeptno() %>)" name="deptno" value="<%= p.getDeptno() %>"/></td>
			<% } %>
		</tr>
	</table>	
	</form>

	<script>
	
	function info(deptno) {
		alert("부서 상세화면 이동");
		location.href = "a0730exp2.jsp?deptno=" + deptno;
	}
	</script>


	
	<% if(pro != null) { %>
	<form id="frm03">
	<table>
		<tr><th>물건명</th><td><input type="text" name="pname" value="<%= pro.getName() %>"/></td></tr>
		<tr><th>물건가격</th><td><input type="text" name="price" value="<%= pro.getPrice() %>"/></td></tr>
		<tr><th>물건갯수</th><td><input type="text" name="cnt" value="<%= pro.getCnt() %>"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="조회하기"/></td></tr>
	</table>	
	</form>
	
	<% } else { %>
	<h4> 전달된 데이터가 없습니다 </h4>
	<% } %>
</body>
</html>