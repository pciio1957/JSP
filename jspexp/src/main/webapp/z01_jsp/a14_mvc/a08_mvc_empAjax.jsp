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

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var xhr = new XMLHttpRequest();
		$("[name=ename], [name=job]").keyup(function(event){
			if(event.keyCode==13){
				schFun();	
			}
		});
		
		$("#schBtn").click(function(){
			schFun();
		});
		
		function schFun(){
			var enameV = $("[name=ename]").val();
			var jobV = $("[name=job]").val();
			var qstr = "ename="+enameV+"&job="+jobV;
			xhr.open("get","${path}/ajaxEmp.do?"+qstr,true);
			xhr.onreadystatechange = function(){
				if(xhr.readyState==4&&xhr.status==200){
					var elist = JSON.parse(xhr.responseText);
					console.log(elist);
					var show="";
					$(elist).each(function(idx,emp){
						show+="<tr class='text-center'><td>"
								+emp.empno+"</td>";
						show+="<td>"+emp.ename+"</td>";
						show+="<td>"+emp.job+"</td>";
						show+="<td>"+emp.sal+"</td>";
						show+="<td>"+emp.deptno+"</td></tr>";
						
					});
					$("#show tbody").html(show);				
				}
			};
			xhr.send();			
		}
		
	});

</script>
<body>
	<h2 align="center">직원정보 mvc(ajax처리)</h2>
	
	<h3 align="center">회원ID 조회</h3>
	<table id="tab01" align="center" class="listTable">
		<tr><th>회원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>직책명</th><td><input type="text" name="job" value=""/></td></tr>
		<tr><td colspan="2"><input type="button" id="schBtn" value="조회하기"/></td></tr>
	</table>
	
	<h3 align="center">조회 결과</h3>
	<table id="show" align="center" class="listTable">
    <thead>
      <tr><th>사원번호</th><th>사원명</th><th>직책명</th><th>급여</th><th>부서명</th></tr>
    </thead>	
    <tbody>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    </tbody>
	</table>	

</body>
</html>