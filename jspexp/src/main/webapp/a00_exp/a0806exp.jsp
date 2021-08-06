<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
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
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
		type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h3Title").text("8월 6일 응용문제");
	});
</script>
</head>
<%-- 

#정리문제
1. servlet을 생성하고, 도서명 가격을 요청값을 받아서 출력하는 처리를 하세요.(out.print())
	(A0806exp.java 파일 생성)
	
2. A13MVC.java를 만들고, view단 호출(jsp)
   초기페이지에 임의의 구구단 [   ] X [   ] 정답 :[   ] [확인]
   정답을 맞추면 정답입니다. 페이지이동, 틀리면, 다시 구구단 문제 페이지로 이동 처리하게 하세요.
   (A0806_A13MVC.java 생성)
   
3. Date 하위 기능 메서드를 정리하세요
	1) .getFullYear() : 연도  (주의! .getYear()시 1970년에서 지난 연도 출력)
	2) .getMonth() : 월(0~11)
	3) .getDate() : 날짜
	4) .getDay() : 요일(0~7) index값을 이용한 출력
	5) .getHour() : 시간
	6) .getMinute() : 분
	7) .getSecound() : 초
	8) .toLocaleString() : GMT기준으로 위치표현방식에 맞게 처리됨	
	9) .setXXX(변경할 데이터) : 데이터변경
	

4. 기념일 확인하기, 오늘로부터 [    ]일 [이전] [이후] 클릭시, 해당 날짜를 계산하여 출력하세요.
   Date객체 활용 d.setDate(d.getDate()+@@@) 
   
5. 배열관련 기능 메서드를 정리하세요. 
	1) length : 배열 요소의 갯수
	2) concat() : 배열 요소를 이어줌
	3) join() : 모든 요소 문자열로
	4) pop() : 마지막 요소 제거, 리턴
	5) push() : 마지막 추가
	6) reverse() : 순서 뒤집기
	7) slice() : 지정부분 리턴 (구조변경안됨)
	8) splice() : 지정 부분 삭제, 삭제한 요소 리턴
	9) sort() : 정렬
		sort(function(left, right) { return left-right; }) // 순차정렬 (오름차순)
		sort(function(left, right) { return right-left; }) // (내림차순)
	
6. 등록점수:[   ][등록][내림차순정렬][오름차순정렬]
   no  점수
   
~ 9:30에 발표하겠습니다.


--%>
<%

	int ranNum01 = (int)(Math.random() * 9 + 2);
	int ranNum02 = (int)(Math.random() * 9 + 1);
	System.out.println("랜덤숫자1 : " + ranNum01);
	System.out.println("랜덤숫자2 : " + ranNum02);

%>
<body>
	<h3 align="center" id="h3Title"></h3>
	<br>
	<h3 align="center">도서 정보 입력</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>도서명</th><td><input type="text" name="bname" value=""/></td></tr>
		<tr><th>도서가격</th><td><input type="text" name="bprice" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="구매"/></td></tr>
	</table>	
	</form>
	
	<br>
	<h3 align="center">구구단 문제</h3>
	<table  align="center" class="listTable">
		<tr>
			<th><input type="text" name="ranNum01" value="<%= ranNum01 %>" readonly></th>
			<th>X</th>
			<th><input type="text" name="ranNum02" value="<%= ranNum02 %>" readonly></th>
		</tr>
		<tr>
			<th>정답</th>
			<td><input type="text" name="ans" value=""></td>
			<td><input type="submit" name="btnAns" value="입력"></td>
		</tr>
	</table>	
	
</body>
</html>