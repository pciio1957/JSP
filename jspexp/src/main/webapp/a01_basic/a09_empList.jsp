<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z01_database.A05_PreparedDao"
    import="jspexp.z02_vo.Emp"
    import="jspexp.z02_vo.Dept"
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
	// 전체 화면이 로딩될 때 시작할 js함수로
	// body 최하단에 js를 선언한 효과이벤트 
	window.onload = function() {
		document.querySelector("h3").innerText="사원정보";
		
		var empSchArry = document.querySelectorAll("[name=ename], [name=job]");
		
		for(var idx=0; idx<empSchArry.length; idx++) {
			empSchArry[idx].onkeyup = function () {
				console.log(this.value);
			}
		}
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
	<form id="frm01">
	<!--  form 객체의 하위 내용을 enter를 입력했을 때 자동으로 요청값을 전송하는
		것을 브라우저가 지원하는 경우가 종종 있다  -->
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
	
	<%-- 
	
	#DB sql을 통한 jsp 화면 처리
	1. sql 작성
	2. sql의 단위를 할당할 vo 작성
	3. DAO 기능 메소드 추가
		0) 비슷한 유형 기능 메소드를 copy
		1) 리턴할 유형 선언, vo, 매개변수
		2) sql 할당, 리턴할 메소드 main()을 통해서 test
	4. jsp에서 vo, arrayList, dao 객체를 import 함
	5. dao 객체 생성 리턴할 arrayList 선언 및 활당
	6. 화면구성 
		1) 기본화면 구성 : form(검색), list 테이블 처리
		2) 반복문 처리 
		3) 요청값 받아서 dao단 요청값 전달 처리 
			(검색)
	
	 --%>
	 
	 <%
	 
	 // 1. 요청값 받아오기
	 String dname = request.getParameter("dname");
	 String loc = request.getParameter("loc");
	 
	 // 2. 초기화시 default값 설정
	 if(dname == null) dname = "";
	 if(loc == null) loc = "";
	 
	 // 3. 데이터 처리 결과 받기
	 List<Dept> dlist = dao.getDeptList(new Dept(0, dname, loc));
	 %>
	 
	<h3> Dept테이블 조회 </h3>
	<form>
		<table>
			<tr><th>부서명</th><td><input type="text" name="dname" value="<%= dname %>"></td></tr>
			<tr><th>부서위치</th><td><input type="text" name="loc" value="<%= loc %>"></td></tr>
			<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
		</table>
	</form>
	
	<table>
		<tr>
			<th>부서번호</th>
			<th>부서명</th>
			<th>부서위치</th>
		</tr>
		<% for(Dept d:dlist) { %>
		<tr> 
			<td><%= d.getDeptno() %></td>
			<td><%= d.getDname() %></td>
			<td><%= d.getLoc() %></td>
		</tr>
		<% } %>
	</table>

</body>
</html>