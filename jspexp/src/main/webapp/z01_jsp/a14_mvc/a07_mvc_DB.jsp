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

응용) id로 회원정보 MVC ajax로 검색처리 (5조 제출, 나머지 손들기)


#등록처리 
0. 핵심 파일
	1) controller (A27_AjaxController.java)
		요청
		조건에 따른 초기화면, ajax데이터
		service단
	2) service (CommonService.java)
	3) view (a14_mvc\a07_mvc.jsp)
1. 등록데이터 입력
2. 이벤트에 의해 ajax 요청 처리 
	$("[name=proc]").val("ins");
	<input type="hidden" name="proc"
	$("form").serialize() : form 하위에 있는 모든 요소객체들을 
		key=value query String형식으로 자동으로 만들어 준다
3. controller단 처리
	요청값 proc가 ins인 경우
	기존의 요청값을 Member객체에 할당
4. service단
	1) 입력하는 dao단 확인
	2) 메소드 선언 및 리턴 값으로 등록 성공
		public String insert(Member ins){
			String str = "등록성공";
			try {
				dao.insertMem(ins);
			} catch(Exception e){
				str = "등록시 문제발생";
			}
			str = "{\"result\":"+ str +", \"list\":" + dao.getMemberList()+"}";
			
			return str;
		}
		
		public String getMemberList() {
			String jsonData = gson.toJson(dao.getMemberList(), ArrayList.class);
			return jsonData;
		}
5. controller단
	out.print(service.insert(int));

6. view단
	alert(xhr.responseText);
	var jsonData = JSON.parse(xhr.responseText);
	alert(jsonData.result);
	
	var list = jsondata.list; 로 받아와서
	반복문을 통해서 화면에 리스트 처리

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var xhr = new XMLHttpRequest();
		
		// 엔터를 눌렀을 때 등록
		$("[name=id]").keyup(function(event){
			if(event.keyCode == 13) {
				var idVal = $("[name=id]").val();
				console.log($("[name=id]").val());
				
				xhr.open("get", "${path}/schMem.do?proc=sch&id=" + idVal, true);
				xhr.send();
				
				xhr.onreadystatechange = function(){
					if(xhr.readyState == 4 && xhr.status == 200) {
						
						var jTxt = xhr.responseText;
						$("#show td").text("");
						
						if(jTxt != "{}"){
							var mem = JSON.parse(xhr.responseText);
							console.log(mem);
							
							$("#show td").eq(0).text(mem.id);
							$("#show td").eq(1).text(mem.pw);
							$("#show td").eq(2).text(mem.name);
							$("#show td").eq(3).text(mem.auth);
							$("#show td").eq(4).text(mem.point);
						} else {
							alert("해당 아이디는 데이터가 없습니다");
						}
					}
				};
			}
		});
		
		$("#btnAdd").click(function(){
			$("[name=id]").val($("#show td").eq(0).text());
			$("[name=pw]").val($("#show td").eq(1).text());
			$("[name=name]").val($("#show td").eq(2).text());
			$("[name=auth]").val($("#show td").eq(3).text());
			$("[name=point]").val($("#show td").eq(4).text());
		});
		
		
		$("#btnReg").click(function(){
			if(confirm("등록하시겠습니까?")){
				$("[name=proc]").val("ins");
				ajaxForm();
			}
		});
		
		$("#btnUpt").click(function(){
			if(confirm("수정하시겠습니까?")){
				$("[name=proc]").val("upt");
				ajaxForm();
			}
		});
		
		$("#btnDel").click(function(){
			if(confirm("삭제하시겠습니까?")){
				$("[name=proc]").val("del");
				ajaxForm();
			}
		});
		
	});
	
	function ajaxForm() {
		var xhr = new XMLHttpRequest();
		var snd = $("form").serialize();
		console.log(snd);
		
		xhr.open("get", "${path}/schMem.do?" + snd, true);
		xhr.send();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200) {
				
				var jTxt = xhr.responseText;
				console.log(jTxt);

				var jData = JSON.parse(jTxt);
				alert(jData.result);
				
				var list = jData.list;
				var show = "";
				
				$(list).each(function(idx, mem){
					show += "<tr><td>" + mem.id + "</td><td>" + 
						mem.pw + "</td><td>" + mem.name + "</td><td>" +
						mem.auth + "</td><td>" + mem.point + "</td></tr>";
						
				});
				
				$("#list tbody").html(show);
			}
		}
	}
</script>
<body>
	<h2 align="center">회원정보 mvc(ajax처리)</h2>
	
	<h3 align="center">회원ID 조회</h3>
	<table id="tab01" align="center" class="listTable">
		<tr><th>회원아이디</th><td><input type="text" name="id" value=""/></td></tr>
	</table>
	
	<h3 align="center">조회 결과</h3>
	<table id="show" align="center" class="listTable">
		<tr><th>회원아이디</th><td></td>
			<th>회원비밀번호</th><td></td></tr>
		<tr><th>회원명</th><td></td>
			<th>회원권한</th><td></td></tr>
		<tr><th>회원포인트</th><td></td>
			<th></th><td></td></tr>
		<tr><th colspan="4"><input type="button" id="btnAdd" value="아래로"/></th></tr>
	</table>	

	<h3 align="center">등록/수정/삭제 폼</h3>
	<form method="post"><input type="hidden" name="proc"/>
	<table id="tab02" align="center" class="listTable">
		<tr><th>회원아이디</th><td><input type="text" name="id" value=""/></td>
			<th>회원비밀번호</th><td><input type="text" name="pw" value=""/></td></tr>
		<tr><th>회원명</th><td><input type="text" name="name" value=""/></td>
			<th>회원권한</th><td><input type="text" name="auth" value=""/></td></tr>
		<tr><th>회원포인트</th><td><input type="text" name="point" value=""/></td>
			<th></th><td></td></tr>
		<tr><td colspan="4">
			<input type="button" id="btnReg" value="등록"/>
			<input type="button" id="btnUpt" value="수정"/>
			<input type="button" id="btnDel" value="삭제"/>
			<input type="reset" value="초기화"/>		
		</td></tr>
	</table>
	</form>
	
	<h3 align="center">회원정보</h3>
	<table id="list" align="center" class="listTable">
	<thead>
		<tr><th>아이디</th><th>비밀번호</th><th>이름</th><th>권한</th><th>포인트</th></tr>
	</thead>
	<tbody>
		<tr><td></td><td></td><td></td><td></td><td></td></tr>
	</tbody>
	</table>
</body>
</html>