<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a01_start.*"
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
		document.querySelector("h3").innerText="시작";
	}

</script>
</head>
<%-- 

#등록 화면 처리
1. 기본화면 구성
2. form 객체의 요소값 지정
3. form 객체의 공통 combox 데이터 설정 및 처리
4. 요청페이지 구현 

--%>
<%

// 요청값에 대한 처리 
String ename = request.getParameter("ename"); if(ename==null) ename="";
String job = request.getParameter("job"); if(job==null) job="";
String mgrS = request.getParameter("mgr"); if(mgrS==null) mgrS="0";
String hiredate = request.getParameter("hiredate"); if(hiredate==null) hiredate="1970-01-01";
String salS = request.getParameter("sal"); if(salS==null) salS="0";
String commS = request.getParameter("comm"); if(commS==null) commS="0";
String deptnoS = request.getParameter("deptno"); if(deptnoS==null) deptnoS="0";

// DB 입력을 위한 VO객체 처리
boolean isInsert = false;
if(ename != null) { // 초기화면, 등록 버튼 클릭시
	Emp ins = new Emp(0, ename, job, 
				Integer.parseInt(mgrS), 
				hiredate, 
				Double.parseDouble(salS), 
				Double.parseDouble(commS), 
				Integer.parseInt(deptnoS)
				);
	System.out.println("입력할 사원 객체 : " + ins);
}


%>
<body>
	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	
	
	
	<%
	
	List<String> jobs = Arrays.asList("CLERK", "SALESMAN", "PRESIDENT", "MANAGER", "ANALLYST");
	List<Code> mgrs = Arrays.asList(new Code("7566", "JONES"), new Code("7782", "CLARK"));
	List<Code> depts = Arrays.asList(new Code("10", "ACCOUNTING"), 
									new Code("20", "RESEARCH"),
									new Code("30", "SALES"),
									new Code("40", "OPERATIONS"));
	
	
	%>
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>직책명</th><td><input type="text" name="job" value=""/></td></tr>
		<tr><th>관리자명</th><td><input type="text" name="mgr" value=""/></td></tr>
		<tr><th>입사일</th><td><input type="text" name="hiredate" value=""/></td></tr>
		<tr><th>급여</th><td><input type="text" name="sal" value=""/></td></tr>
		<tr><th>보너스</th><td><input type="text" name="comm" value=""/></td></tr>
		<tr><th>부서명</th><td><input type="text" name="deptno" value=""/></td></tr>
		<tr>
			<td colspan="2">
			<input type="submit" name="send" value="등록"/>
			<input type="button" name="home" value="메인화면 이동"/></td>
		</tr>
	</table>	
	
	<%-- 선택할 수 있도록 수정 --%>
	<form id="frm02">
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>직책명</th><td>
			<select name="job">
				<option value="">직책선택</option>
				<% for(String j:jobs) { %>
				<option> <%= j %> </option>
				<% } %>
			</select></td></tr>
		<tr><th>관리자명</th><td>
			<select name="mgr">
				<option value="">관리자선택</option>
				<% for(Code mgr:mgrs) { %>
				<option value="<%= mgr.getKey() %>">
				<%= mgr.getValue() %> </option>
				<% } %>
			</select></td></tr>
		<tr><th>입사일</th><td><input type="date" name="hiredate" value=""/></td></tr>
		<tr><th>급여</th><td><input type="text" name="sal" value=""/></td></tr>
		<tr><th>보너스</th><td><input type="text" name="comm" value=""/></td></tr>
		<tr><th>부서명</th><td>
			<select name="job">
				<option value="">직책선택</option>
				<% for(Code dept:depts) { %>
				<option value="<%= dept.getKey() %>"> 
				<%= dept.getValue() %> </option>
				<% } %>
			</select></td></tr>
		<tr>
			<td colspan="2">
			<input type="submit" name="send" value="등록"/>
			<input type="button" name="home" value="메인화면 이동"/></td>
		</tr>
	</table>	
	</form>
</body>
</html>