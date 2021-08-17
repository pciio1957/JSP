<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a01_start.*"
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
<body>

<!-- 

#jsp에서 요청값 처리
1. jsp에서는 요청값 형식으로 현재 페치지에 요청데이터를 넘겨주거나
다음페이지에 요청값을 전달해줄 수 있다.

2. 기본형식
	1) get방식에 의한 요청값 전달
		페이지명?요청key=요청값&요청key2=요청값2
	2) 요청페이지에서는 request.getParameter("요청key")
		형식으로 요청값을 받을 수 있다 
		- jsp의 서버단 java 프로그램에서 처리가능
		
3. 단계별 연습예제
	0) 핵심 key word의 이해
		request.getParameter("요청키");
		url주소에 페이지명?key=value
	1) 현재 페이지에 요청값 처리하기
	2) 다른 페이지에 요청값 처리하기
		형식
		- a href : a href="이동할페이지?요청key=요청값&요청키2=요청값2"
		- javascript location
			함수호출, form 하위요소 입력
			location.href = "주소?요청키=" + 요청값;
			window.open("주소?요청키=" + 요청값, "", "");
		- form 객체 활용 : 요청페이지와 요청값을 form객체의 action속성과
			form하위 객체의 name="속성" value="속성값"형식으로 
			submit 버튼으로 처리하는 것을 말함
			
			
			#location.href="요청페이지?요청키=요청값" 과 동일한 form 요소
			form요소객체의 속성과 하위의 객체들은 submit을 클릭하는 순간
			위 내용을 처리해준다.
			
			ex) location.href = "gogo.jsp?name=홍길동&age=25";
			위의 location에서 설정해주는 주소와 같은 form 요소
			<form action="gogo.jsp">
				<input type="text" name="name" value="홍길동"/>
				<input type="text" name="age" value="25"/>
				<input type="submit" value="전송"/>
			</form>
			
			-> submit 버튼을 클릭시 js의 이벤트 함수호출 필요없이 위와 동일한 처리 
			 = 서버로 데이터를 전송한다	
			
	3) 요청값의 여러가지 데이터 유형 처리하기
		- null 
			ex) String name = request.getParameter("name");
				if(name == null) name = "";
				
		- 숫자형변환 
			요청값을 일단 문자열로만 받을 수 있기 때문에
			숫자형일 경우 형변환 필요 Integer.parseInt(), Double.parseDouble()
			
			ex) String priceS = request.getParameter(priceS);
				if(priceS == null) name = "0";
				int price = Integer.parseInt(priceS);
				
		- 객체형 할당 처리 
			Dao나 여러가지가 메소드에 데이터를 넘길때 
			객체로 할당처리하여 매개변수로 전송할 때 사용한다
			
			ex) Product pod = new Product(name, price, cnt);
				dao.insertProduct(pod);
	
	4) 한페이지에서 요청값 처리
		1) form, location을 통해서 현재 페이지를 다시 요청하면서 요청값을 처리하는 경우가 있다.
			주로 검색처리
		2) 물리적으로는 jsp가 한페이지지만, 논리적으로 2페이지로 요청값을 전달하고 
			요청값을 받아서 처리한다. 
		3) 핵심처리 
			request.getParameter()를 통해서 한 소스에서 처리되기에
			초기화면에 대한 처리를 하고 요청값을 넘겼을 때를 구분해서 처리한다. 
			- null에 대한 처리 : 초기에는 null을 가지고 
			
	5) form method="post" 방식 처리  
		1) 기본 url의 전송방식은 get방식 
			전송하는 용량의 제한과 url에 보이는 단점이 있다. 
		2) 이때 전송방식을 post로 하면 url에 요청값(key=value)가
			사라지고 요청페이지만 남게된다
		3) 요청값은 내부적으로 요청 body에서 전달되어
			요청값을 보이지않게 처리하거나 많은 요청을 처리할 때 활용된다
-->

	<!--  
	
	1. 현재 페이지의 요청값 처리하기
		a10_requestParam.jsp?id=himan&pass=7777
		로 주소값을 넘기면 
		아래 코드는 id로 himan을 출력한다
		pass로 7777값을 할당하여 출력할 수 있다
	
	-->
	<% String id = request.getParameter("id"); %>	
	<h2> 입력한 id : <%= id %></h2>
	
	
	<!-- 
	응용) a11_requestParam.jsp에 요청key에 name, age, loc를 넘기고
		값을 받아 화면에 이름 @@@, 나이 @@@, 사는곳 @@@을 출력하세요 (1조)
	
	-->

	<%
	/*
	
	2) 다른 페이지에 요청값 처리하기
	형식
	- a href : a href="이동할페이지?요청key=요청값&요청키2=요청값2"
	- javascript location
	- form 객체 활용
	
	*/ %>

	<h2>다른페이지의 요청값 처리하기</h2>
	<a href="a12_receive.jsp?id=himan">아이디만 넘기기</a><br>
	<a href="a12_receive.jsp?id=himan&pass=8888">아이디/패스워드 넘기기</a><br>
	<a href="a12_receive.jsp?name=홍길동&age=25">이름/나이 넘기기</a><br>
	
	<!-- 
	
	응용) a13_receive.jsp 를 만들어서 데이터 넘기기 (2조)
		첫번째 링크 : 물건명 
		두번째 링크 : 물건명과 가격
		세번째 링크 : 물건명과 가격, 갯수
		네번째 링크 : 물건명과 가격, 갯수, 구매자명
		
	-->
	
	<h2>구매정보</h2>
	<a href="a13_receive.jsp?pname=텀블러">물건명</a><br>
	<a href="a13_receive.jsp?pname=텀블러&price=12000">물건명과 가격</a><br>
	<a href="a13_receive.jsp?pname=텀블러&price=12000&pcnt=5">물건명과 가격, 갯수</a><br>
	<a href="a13_receive.jsp?pname=텀블러&price=12000&pcnt=5&buyer=홍길동">물건명과 가격, 갯수, 구매자명</a><br>
	
	<!-- 
	
	#js로 데이터 처리
	1. 함수로 요청페이지에 데이터 넘겨주기
	2. 입력된 내용을 요청페이지에 넘겨주기 
	
	-->
	<h2 onclick="send('사과')"> 물건명 전달 </h2>
	물건명 : <input type="text" name="panme"/><br>
	가격 : <input type="text" name="price"/><br>
	갯수 : <input type="text" name="pcnt"/>
	<input type="button" value="구매정보전달" onclick="buy()"/><br>
	
	
<script type="text/javascript">
		function send(prod) {
			// location.href = "이동할페이지?요청key=요청값";
			location.href = "a14_js_receive.jsp?pname=" + pname;
		}
		
		
		function buy() {
			var pname = document.querySelector("[name=panme]").value;
			var price = document.querySelector("[name=price]").value;
			var pcnt = document.querySelector("[name=pcnt]").value;
			
			location.href = "a14_js_receive.jsp?pname=" + pname +
					"&price=" + price + "&cnt=" + pcnt;
		}
	</script>
	
	
	<!--  
	
	응용) 회원아이디:[ ] 패스워드:[ ] 회원명:[ ]
		권한:[ ]
	  	[정보전달] -> 클릭시 a14_js_receive.jsp에 데이터를 전달처리하기 (3조) 
	-->
	
	<h2>회원 정보 전달</h2>
	회원아이디 : <input type="text" name="memId"><br>
	회원패스워드 : <input type="text" name="memPw"><br>
	회원명 : <input type="text" name="memName"><br>
	회원권한 : <input type="text" name="memAuth"><br>
	<input type="button" name="btnSubmit" onclick="join()" value="회원가입"><br>
	
</body>
<script type="text/javascript">


function join() {
	var memId = document.querySelector("[name=memId]").value;
	var memPw = document.querySelector("[name=memPw]").value;
	var memName = document.querySelector("[name=memName]").value;
	var memAuth = document.querySelector("[name=memAuth]").value;
	
	location.href = "a14_js_receive.jsp?memId=" + memId + "&memPw="
			+ memPw + "&memName=" + memName + "&memAuth=" + memAuth;
}


</script>
</html>