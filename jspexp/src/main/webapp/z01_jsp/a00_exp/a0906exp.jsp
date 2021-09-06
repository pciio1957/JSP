<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Front 연습</title>
<link rel="stylesheet" href="${path}/z00_com/a01_com.css">
<style>

table {
	width:70%;
	margin-bottom:20px;
	padding:20px;
}

td {
	text-align:center;	
}

</style>
</head>
<%-- 

#정리문제
1. 모델2와 모델1의 궁극적인 차이를 화면로딩 방식, 모델데이터의 활용, controller의 주요 기능을 통해서 기술하기
	모델의 차이
	1) 화면로딩 방식
		- 모델1 : view에서 제어를 하므로 화면에서 실행
		- 모델2 : controller에서 제어하므로 controller에서 실행
	2) 모델데이터의 활용
		- 모델1 : view에서 스크립틀릿을 이용해 데이터의 선언과 호출을 진행
		- 모델2 : 실행한 controller로 요청값이 전달되고 해당 요청값을 통해 화면 제어
	3) controller의 주요 기능
		- 모델2 : controller에서 요청값을 처리해서 초기화면, 요청값에 맞는 view를 보여주고, 
			조건에 따라 service와 dao에서 DB데이터를 받아와 화면제어를 한다 
			
	
	모델의 차이점
	1) 화면 로딩 방식
		- 모델1은 jsp가 직접적으로 호출되어 처리된다
		- 모델2는 controller단인 servlet을 거쳐 view(jsp)가 호출되어 처리된다
	2) 모델데이터 활용 
		- 모델1은 필요없는 경우가 많다
		- 모델2는 controller단에서 반드시 선언해야한다 
		
2. gson api의 기능메소드를 기술하기
	gson의 기능메소드
	1) toJson : 데이터를 Json 형태로 만들어줌
	2) fromJson : Json 형태의 데이터를 문자열로 만들어준다.

3. MVC를 통한 ajax를 처리의 핵심프로세서 controller, service, dao, view, model의 소스로 나눠서 핵심 코드와 함께 설명하기
	1) controller
		String id = request.getParameter("id");
		response.sendRedirect = "Main.jsp";
		
		if(proc != null) {
			if(proc.equals("memCheck")) {
				response.getWriter().print(service.memCheck(id));
			}
		}
		
		
	2) service
		public String memCheck(String id){
			Member mem = dao.memCheck(id);
			retrun "{\"result\":\"결과\" + json.toJson(mem) +"}";
		}	
	3) dao
		public Member memCheck(String id) {
			Member m = null;
			string sql = "select * from Member where id = ?";
			... 
			return  m;
		}
	4) view 
		<form>
			<input type="hidden" name="proc"/>
			<tr><td>아이디 확인</td><input type="text" name="id" value=""/></td></tr>
			<tr><td colspan="2"><input type="button" id="btnCk" value="확인"/></td></tr>
		</form>
		..
		$("#btnCk").click(function(){	
			var xhr = new XMLHttpRequest();
			var data = "id=" + $("[name=id]").val();
			
			xhr.open("get", "/memCheck.do?" + data, true);
			xhr.send();
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.ststus == 200) {
					var memData = JSON.parse(xhr.responseText);
					if(memData != "{}"){
						var mem = JSON.parse(xhr.responseText); 
						...
					}
				}
			}
		});

4. MVC 패턴을 이용해서 사원정보(Emp)의 조회 리스트를 ajax로 처리하기
	jspexp 프로젝트
	controller : A27_AjaxEmpCtrl.java (ajaxEmp.do)
	service : CommonService.java
	view : webapp\a14_mvc\
	dao : A05_PreparedDao.java
		getPreparedEmpList(Emp sch)
	wiwe : webapp\a14_mvc\a08_mvc_empAjax.jsp

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="검색"/>
		</td></tr>
	</table>	
	</form>
	
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>