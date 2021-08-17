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

	/* 
	
	# 주간 정리문제
	1. js의 배열에 대한 반복문 처리 형식(for in, for of, forEach)을 
	  간단한 예제로 기술하세요.
	  	(아래 기술)
	  	
	  	for(var idx in arr) {
	  		console.log(idx, arr[idx]);
	  	}
	
		for(var idx of arr) {
			console.log(idx, arr[idx]);
		}
		
		arr.forEach(function(obj, idx, arr01){
			console.log(obj, idx);
		});
	2. 화살표 함수를 활용하여, 물건명과 가격의 총합을 처리하는 함수를 만드세요.
		(아래 기술)
		
		
	3. js의 속성할당 방식 2가지를 기술하고, 구매정보를 화면에 출력하는 
	   속성과 메서드를 처리하세요.
	   	(아래 기술)
	   	
	   	객체.속성 = 데이터;
		객체['속성'] = 데이터;
		var buyInfo = {pname:'사과', price:3000, show:function(){
			var h2 = document.querySelector("h2");
			h2.innerHTML = "물건명 : " + this.pname + ", 가격 : " + this.price;
		}};
		prod.buyInfo();
		
	4. database의 함수 종속성 개념을 기술하세요.
		속성들간의 관련성을 의미하며, 정규화에서 부분 함수 종속성, 완전 함수 종속성, 이행 함수 종속성이 사용된다.
	
		1) 완전 함수 종속
		릴레이션(테이블)에서 속성집합(컬럼1의 데이터) Y가 속성집합(컬럼2의 데이터) X에
		함수적으로 종속되어 있지만 속성집합 X(컬럼2의 데이터)의 전체가 아닌 일부분에는
		종속되지 않음을 의미함
		2) 부분 함수 종속 
		릴레이션(테이블)에서 속성집합(컬럼1의 데이터) Y가 속성집합(컬럼2의 데이터) X의
		전체가 아닌 일부분에서 함수적으로 종속됨을 의미
		3) 이행 함수 종속
		릴레이션(테이블)을 구성하는 3개의 속성(컬럼) 집합 X, Y, Z에 대해 함수 종속 
		관계가 X->Y, Y-> Z가 존재하면 논리적으로 X->Z가 성립되는데 
		이때 Z가 X에 이행적으로 함수 종속되었다고 함 
		
		1) 완전 함수 종속성 : 특정한 결정자에 종속되는 데이터에 대한 처리를 말함
			key 컬럼에 해당 컬럼에 종속될 때를 말한다
		-------------------( 테이블 분리 필요 )-------------------
		2) 부분 함수 종속성 : 복합 키에 컬럼이 일부 종속
		3) 종속되지 않음 : 키와 상관없는 컬럼
		
	5. database의 정규화과정을 기술하세요.
		제 1정규형 : 도메인이 원자값
		제 2정규형 : 부분적 함수 종속 제거
		제 3정규형 : 이행적 종속 제거
		BCNF정규형 : 결정자이면서 후보키가 아닌 것 제거
		제 4정규형 : 다치 종속 제거
		제 5정규형 : 조인 종속성 이용 
		
		제 1정규형 : 컬럼의 원자성 유지
		제 2정규형 : 주식별자의 종속되지 않는 속성의 분리, 부분 종속 속성의 분리
		제 3정규형 : 이행적 함수 종속의 분리
		BCNF정규형 : 하나의 릴레이션에 여러 개의 후보키가 존재하는 경우 
		제 4정규형 : 다치 종속
		제 5정규형 : 호보키를 통하지 않는 조인 종속
	
	6. jsp로 현재 로그인된 회원의 정보(id, 이름, 포인트, 권한)을 객체화하여 화면에 출력하세요.
		(아래 기술)
	7. database로 만들어진 회원정보(id, pass,이름, 포인트, 권한)를 
	   dao 기존 기능 메서드에 추가하여, 현재 등록된 jsp 회원정보를 출력하세요.
	~ 9:30까지 해보시고, 시간조정 하겠습니다
	
	*/

	// 1. 배열의 반복문 종류
	var nums = [1, 2, 3, 4, 5, 6];

	// 1) for in : 배열의 인덱스를 기준으로 반복
	for(var val in nums) {
		console.log(val + " : " + nums[val]);
	}
	
	// 2) for of : 배열의 요소를 기준으로 반복 
	for(var val of nums) {
		console.log(val);
	}
	
	// 3) forEach : 함수형태로 사용, 차례로 요소값, 인덱스, 원본배열 
	nums.forEach(function (val, index, nums) {
		console.log(index + " : " + val);
	});
	
	
	// 2. 화살표 함수
	var sum = (num01, num02) => num01 + num02;
	console.log(" sum 결과 : " + sum(10, 20));
	
	
	// 3. 속성 할당 방식, 구매정보 화면에 출력
	var product = {name:"충전기", price:12000};
	product['cnt'] = 2;
	
	document.write("1) 구매정보<br>");
	document.write("이름 : " + product.name + "<br>");
	document.write("가격 : " + product.price + "<br>");
	document.write("갯수 : " + product.cnt + "<br>");
	
	with(product) {
		document.write("2) 구매정보<br>");
		document.write("이름 : " + name + "<br>");
		document.write("가격 : " + price + "<br>");
		document.write("갯수 : " + cnt + "<br>");
	}
	
	product.target = "구매완료";
	product.buy = function() {
		document.write("3) 구매정보<br>");
		document.write("이름 : " + product.name + "<br>");
		document.write("가격 : " + product.price + "<br>");
		document.write("갯수 : " + product.cnt + "<br>");
		document.write("갯수 : " + this.target + "<br>");
	}
	product.buy();

</script>
</head>
<%
	A05_PreparedDao dao = new A05_PreparedDao();
	Member member = new Member("himan1", "홍길동", "관리자", 10000);
%>
<body>
	
	<h2>로그인 정보</h2>
	id : <%= member.getId() %>
	이름 : <%= member.getName() %>
	포인트 : <%= member.getPoint() %>
	권한 : <%= member.getAuth() %>
	
	<table>
		<tr>
			<th>아이디</th><th>패스워드</th><th>이름</th>
			<th>권한</th><th>포인트</th>
		</tr>
		<% for(Member mem:dao.getMemList()) { %>
		<tr><td> <%=  mem.getId() %></td>
		<td> <%=  mem.getPw() %></td>
		<td> <%=  mem.getName() %></td>
		<td> <%=  mem.getPoint() %></td>
		<td> <%=  mem.getAuth() %></td>
		<% } %>
		</tr>
	</table>
	
	
</body>
</html>