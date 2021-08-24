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
<link rel="stylesheet" href="<%=path%>/z00_com/a01_com.css">
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

#표현언어(Expression Language)
1. jsp에서 사용가능한 새로운 스크립트 언어
	데이터가 없을 때, nullpoint예외가 발생하지 않아서 
	웹 화면에서는 효과적인 언어라고 할 수 있다.
	
2. 주요 기능
	1) jsp의 4가지 기본 객체가 제공하는 영역의 속성 사용
		(page, request, session application)에서 변수 사용
		session.setAttribute("name", "홍길동");
		${name} : session 범위 안에서 해당 변수의 데이터를
			 ${} 형식으로 활용할 수 있다.
			 
	2) 객체와 집합 객체에 대한 접근 방법 제공
		- 객체
		request.getAttribute("p01", new Person("홍길동", 25, "서울 신림"));
		${변수명.get프로퍼티}
		${p01.name} ${p01.age} ${p01.loc}
		
		- 집합객체
		request.setAttribte("arr01", {"사과", "바나나", "딸기"});
		${arr01[0]}, ${arr01[1]}, ${arr01[2]}
		ArrayList<Product> plist = new ArrayList<Product>();
		plist.add(new Product("사과", 3000, 2));
		plist.add(new Product("바나나", 4000, 3));
		plist.add(new Product("딸기", 12000, 4));
		
		
	3) 수치연산, 관계연산, 논리 연산 제공
		request.setAttribute("num01", 25);
		request.setAttribute("num02", 5);
		${num01+num02}, ${num01*num02} : 사칙 연산 가능 
		${num01>num02} : 관계 연산 가능
		
		request.setAttribte("mb01", new Member("himan", "7777"));
		${mb01.id == 'himan' and mb01.pw == '7777'};
		
		비교연산자 - ==, eq, !=, ne, < 또는 lt, >, gt >= ge
		논리연산 처리 && and, || or, ! not
		
	4) empty
		${변수명 != null && 변수명 != ""}
		${not empty 변수명} null 아니고 공백이 아닐때
		${empty 변수명} null이거나 공백일 때 
		
	5) 3항 연산자
		${변수 == 변수?"true일때":"false일떄"}
		
		
	6) 요청값 처리 
		1) ${param.요청키} : 단일 값
		2) ${paramValues.요청키} : 다중 값
		
		

--%>
<%
	// 1. page 범위로 데이터 설정
	// pageContext로 설정한 데이터는 pageScope.설정변수 로 호출할 수 있다
	// pageScope는 명확하게 구분해줄 필요성이 있을 때를 제외하고 생략가능하다
	pageContext.setAttribute("name", "사과");
	pageContext.setAttribute("price", 3000);
	pageContext.setAttribute("cnt", 5);
	
	// 2. request, session, application 범위로 설정
	request.setAttribute("pname", "컴퓨터");
	session.setAttribute("id", "himan");
	application.setAttribute("serverinfo", "tomcat");
	
	
	// 응용) 도서 정보 선언
	pageContext.setAttribute("bkname", "JSP&servlet");
	request.setAttribute("bkprice", 16000);
	session.setAttribute("bkcnt", 2);
	application.setAttribute("bkcmp", "앤써북");
	
	
	// 3. 객체형 할당
	request.setAttribute("p01", new Person("홍기도", 25, "서울 홍대"));
	
	
	// 응용) 물건 정보 선언
	session.setAttribute("p02", new Product("초코우유", 1200, 10));
	
	
	// 4. 배열형 할당
	request.setAttribute("array01", new String[]{"사과", "바나나", "딸기"});
	
	// ArrayList형 데이터 처리 
	List<Product> list = new ArrayList<Product>();
	list.add(new Product("사과", 3000, 5));
	list.add(new Product("바나나", 5000, 3));
	list.add(new Product("딸기", 12000, 1));
	request.setAttribute("list", list);
	
	
	// 응용) Dept 사원정보 할당
	List<Dept> dList = new ArrayList<Dept>();
	dList.add(new Dept(1000, "인사과", "서울 신림"));
	dList.add(new Dept(2000, "교통과", "서울 건대"));
	dList.add(new Dept(3000, "전산과", "서울 교대"));
	request.setAttribute("dList", dList);
	
%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("el 태그의 활용");
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	
	<h3 align="center"> 일반변수 </h3>
	<table align="center" class="listTable">
		<tr><th>과일명</th><th>가격</th><th>갯수</th></tr>
		<tr><td>${pageScope.name}</td><td>${pageScope.price}</td><td>${pageScope.cnt}</td></tr>
	</table>
	
	<h3 align="center"> Page 범위 </h3>
	<table align="center" class="listTable">
		<tr><th>request 범위</th><th>session 범위</th><th>application 범위</th></tr>
		<tr><td>${requestScope.pname}</td><td>${sessionScope.id}</td><td>${applicationScope.serverinfo}</td></tr>
	</table>
	
	<!-- 응용) session scope별로 도서명 도서가격 도서갯수 출판사로 선언하고 
			해당 내용을 el로 호출하기 (3조 제출, 나머지 손들기) -->
	
	<h3 align="center"> 도서 정보 </h3>
	<table align="center" class="listTable">
		<tr><th>도서명</th><td>${bkname}</td></tr>
		<tr><th>도서가격</th><td>${bkprice}</td></tr>
		<tr><th>도서갯수</th><td>${bkcnt}</td></tr>
		<tr><th>출판사</th><td>${bkcmp}</td></tr>
	</table>
	
	
	<h3 align="center"> 객체형 할당/선언 </h3>
	<table align="center" class="listTable">
		<tr><th>이름</th><th>나이</th><th>위치</th></tr>
		<tr><td>${p01.name }</td><td>${p01.age }</td><td>${p01.loc }</td></tr>
		${p01.setName("이창준")}  ${p01.setAge(55)}   ${p01.setLoc("서부검찰")} 
		<tr><td>${p01.name }</td><td>${p01.age }</td><td>${p01.loc }</td></tr>
	</table>
	
	
	<!--  응용) session 범위로 객체를 물건명, 가격, 갯수를 할당하고 
			가격을 el태그로 10% 인상처리 후 출력처리 (4조 제출, 나머지 손들기) -->
	${p02.setPrice(p02.price * 1.1)} 
			
	<h3 align="center"> 물건 할당/선언 </h3>
	<table align="center" class="listTable">
		<tr><th>물건명</th><th>가격</th><th>갯수</th></tr>
		<tr><td>${p02.name }</td><td>${p02.price }</td><td>${p02.cnt }</td></tr>
	</table>
	
	
	<h3 align="center"> 배열형 할당/선언 </h3>
	<table align="center" class="listTable">
		<tr><th>배열 데이터</th><td>${array01[0]}, ${array01[1]}, ${array01[2]}</td></tr>
		<tr><th>객체 데이터</th><td>${list.get(0).getName()} </td></tr>
		<tr><th>객체 데이터</th><td>${list.get(1).getPrice()} </td></tr>
		<tr><th>객체 데이터</th><td>${list.get(2).getCnt()} </td></tr>
	</table>
	
	
	<!-- 응용) 부서정보 ArrayList<Dept>로 할당하여 el로 호출하여 출력하기 
			(5조 제출, 나머지 손들기) -->
	<h3 align="center"> 부서정보 할당/선언 </h3>
	<table align="center" class="listTable">
		<tr><th>부서1 데이터</th>
			<td>${dList.get(0).getDeptno()} </td>
			<td>${dList.get(0).getDname()} </td>
			<td>${dList.get(0).getLoc()} </td>
		</tr>
		<tr><th>부서2 데이터</th>
			<td>${dList.get(1).getDeptno()} </td>
			<td>${dList.get(1).getDname()} </td>
			<td>${dList.get(1).getLoc()} </td>
		</tr>
		<tr><th>부서3 데이터</th>
			<td>${dList.get(2).getDeptno()} </td>
			<td>${dList.get(2).getDname()} </td>
			<td>${dList.get(2).getLoc()} </td>
		</tr>
	</table>
</body>
</html>