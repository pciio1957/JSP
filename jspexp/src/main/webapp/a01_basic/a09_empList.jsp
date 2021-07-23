<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z01_database.A05_PreparedDao"
    import="jspexp.z02_vo.Emp"
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
		document.querySelector("h3").innerText="사원정보";
	}

</script>
</head>
<body>
	<%
	
	A05_PreparedDao dao = new A05_PreparedDao();
	ArrayList<Emp> elist = dao.getEmpList();
	
	
	
	%>
	
	리스트 확인 : <%= elist.size() %>
	<h3></h3>
	<table>
		<tr><th>사원번호</th><th>사원명</th><th>급여</th></tr>
		<% for(Emp e:elist) { %>
		<tr>
			<td><%= e.getEmpno() %></td>
			<td><%= e.getEname() %></td>
			<td><%= e.getSal() %></td></tr>
		<% } %>
		
	</table>
	
	
	
	<h3>회원테이블 수정</h3>
	<table>
		<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>직책</th>
			<th>관리자번호</th>
			<th>입사일</th>
			<th>급여</th>
			<th>보너스</th>
			<th>부서번호</th>
		</tr>
		<% for(Emp e:elist) { %>
		<tr> 
			<td><%= e.getEmpno() %></td>
			<td><%= e.getEname() %></td>
			<td><%= e.getJob() %></td>
			<td><%= e.getMgr() %></td>
			<td><%= e.getHiredate() %></td>
			<td><%= e.getSal() %></td>
			<td><%= e.getComm() %></td>
			<td><%= e.getDeptno() %></td>
		</tr>
		<% } %>
	</table>
	
	<!--  
	
	초기화면에서 form 하위에 있는 요소객체에 데이터를 입력하고
	submit 버튼 클릭시 
	url 주소의 형식이 변경 : a09_empList?name=홍길동&job=사원
	key : name, job
	value : 홍길동, 사원 
	key, value 형식으로 화면을 다시 호출한다. 
	
	서버 안에 있는 java 코드인 request.getParameter("name")가 
	request.getParameter("jop") -> job과 mapping되는 
	사원에 불러온다 
	
	 -->
	<%
	
	String name = request.getParameter("name");
	String job = request.getParameter("job");
	
	if(name == null) name = "";
	if(job == null) job = "";
	
	// Emp VO객체에 생성자유형 중 이름, 직책 2개의 데이터를 받는 생성자를 이용해서 
	//	이름, 직책 조회가 이루어진다. 
	// 입력한 데이터를 request로 받아서 해당 데이터로 db에 연결해 데이터 출력 
	ArrayList<Emp> emplist = dao.getPreparedEmpList(new Emp(name, job));
	%>
	<h3> 아이디? 조회하기 </h3>
	<form>
		<table>
			<tr><th>사원명</th><td><input type="text" name="name" value="<%= name %>"></td></tr>
			<tr><th>직책명</th><td><input type="text" name="job" value="<%= job %>"></td></tr>
			<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
		</table>
	</form>
	
	<h4> 요청받은 사원명 : <%= request.getParameter("name") %></h4>
	<h4> 요청받은 직책명 : <%= request.getParameter("job") %></h4>
	
	<table>
		<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>직책</th>
			<th>관리자번호</th>
			<th>입사일</th>
			<th>급여</th>
			<th>보너스</th>
			<th>부서번호</th>
		</tr>
		<% for(Emp e:emplist) { %>
		<tr> 
			<td><%= e.getEmpno() %></td>
			<td><%= e.getEname() %></td>
			<td><%= e.getJob() %></td>
			<td><%= e.getMgr() %></td>
			<td><%= e.getHiredate() %></td>
			<td><%= e.getSal() %></td>
			<td><%= e.getComm() %></td>
			<td><%= e.getDeptno() %></td>
		</tr>
		<% } %>
	</table>
	

</body>
</html>