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

#MVC 패턴 핵심 로직
1. 모델1(jsp)에서 처리하는 핵심데이터, 화면 처리 등을 분리시켜
	보다 기능별로 처리할 수 있게 한다
2. 주요 기능 처리 내용
	1) controller : 중재자역할을 한다. 요청값을 처리하고 
		모델 데이터에 맞게 이 요청값을 변경하고 화면에 전달할 
		핵심데이터를 모델데이터로 만든다
		최종적으로 화면(view, jsp)를 호출하여 효과적으로
		웹 프로그래밍을 할 수 있게 한다
	2) model : 컨트롤러에서 보내온 요청값을 가지고, 화면에 
		전달할 핵심데이터를 만든다. 일반적으로 database를 
		연동한 dao에서 온 데이터나, 조건/반복 등을 통해서 
		이 모델데이터를 만든다. jsp에서는 request.setAttribute("모델명", 핵심데이터)
		형식으로 처리한다. framework에서는 이러한 처리를 해주는 기능 
		객체를 사용하는 이것을 service단이라고 한다
		
	3) view : 모델 데이터를 controller를 통해서 전달받아
		화면을 구성하는 것을 말한ㄷ. 보통 jsp로 웹 화면을 구성하지만
		파일을 다운로드하거나 엑셀을 다운로드하는 등 여러가지 
		화면구성을 할 수 있다. 넘겨온 model을 el/jstl을 통해서 
		사용자의 ui(user interface)에 맞게 처리해준다.
		
		
#MVC 패턴 코딩 순서
1. 초기화면 호출을 위한 controller 구성
	요청 page url형식을 정하여 호출할 초기 화면 page를 선언한다
	1) http://localhost:7080/jspexp/start.do
	urlpatterns = {"/start.do"}
	
	2) 만일 초기화면에서도 데이터나 로직을 처리하여 model 데이터가 출력이 
		필요하면 model단을 선언하여 dao/로직을 호출하여 model 데이터를 처리한다
		request.setAttribute("모델명", 처리할 데이터객체);
		
	3) RequestDispatcher rd = request.getRequestDispatcher("jsp 폴더 및 파일명");
		rd.forward(request, response);
		
		
2. 초기화면 (view단 처리)
	1) jsp로 화면구성을 한다
	2) model 데이터가 있으면 el/jstl을 이용하여 화면구성 처리를 한다
	3) 다음 처리 프로세스를 위해서 form을 선언하고 form 하위에 여러가지 요소객체
		<input, <select, <textarea 를 통해서 name속성으로 데이터를 전송할 준비를 한다
	4) submit버튼이나, button을 통해서 js의 함수를 호출하여 
		전송할 데이터에 대한 유효성(공백, 숫자처리, 형식) - (js정규식표현 참고)를 체크하여
		서버에서 받을 수 있는 형식 check를 하고 전송할 수 있게 한다
	5) submit처리를 통해서 form의 method방식 get/post, 호출할 controller를 
		action 속성으로 지정하여 처리한다.
		<form method="post" action="${path}/gogo.do">
		
		
3. 요청값을 받는 controller
	1) 요청값에 대한 처리, String 변수명 = request.getParameter("요청key");
	2) model 데이터의 처리를 위한 작업 
		(화면단에 보여줄 데이터가 있을 때)
		요청값을 model데이터를 만들기 위한 데이터의 변형이나
		조건/반복문을 처리한다
		
		ex) proc(upt/del/del) 따라서 dao단을 호출/변경 등..
		cf) service : 요청값에 따라 데이터 처리, 
			model을 만들기 위한 데이터 처리 프로세스
			dao (data access object) : 데이터를 접근하여 처리한 객체 
			
		#모델 데이터가 필요할 때 (화면에 보여줄 데이터가 있는 경우)
		- list, 상세페이지, 수정 후 수정된 내용을 볼 경우
		
		#모델데이터가 필요없는 경우 (처리 프로세스만 하고, 화면에 데이터가 필요없는 경우)
		- 등록 삭제
		
		
	3) model 데이터 처리
		위에 service로 처리된 데이터를 아래 형식으로 모델데이터를 만든다
		request.setAttribute("모델명", "할당할 데이터객체");
		
	4) 프로세스가 조건에 따라서 사용하게 될 view단을 호출
		ex) 위 처리 프로세스(service)에서 id/pass가 있을 때는 메인페이지로
			이동 처리, 없을 때는 다시 로그인 페이지 이동처리 



#MVC 패턴으로 계산기만들기
1. 소스 파일 정보
	1) controller : java/
	
2. 구현 순서
	1) 초기화면 로딩
		controller단 구현
		--> service로 A20_MVC_Calcu.java 객체생성, calcu.do로 호출 가능하도록 처리
		--> RequestDispather rd = request.getRequestDispatcher("\a14_mvc\a01_basic.jsp");
		
		view단 구현
		--> 기본 form 화면 구현, num01, num02, cal(연산자) 연산자 선택시 다시 controller를 호출하게 구현
		
	2) 요청값 처리와 결과 출력
		controller단 구현
		--> 요청값 처리 
		request.getParameter("num01"), request.getParameter("num02"), request.getParameter("cal");
		
		--> 모델 데이터 만들기
		request.setAttribute("sum", num01 + num02);
		
		view단 구현
		--> 이전 요청값을 el태그로 ${param.num01}로 처리하고 model데이터로 온 값을 ${sum}으로 처리하여
			@@@ + @@@ = @@@ 형식으로 출력하게 처리한다
		
--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

		$("[name=cal]").change(function(){
			if($(this).val() != "") {
				//alert("계산결과 처리");
				$("form").submit();
			}
		});
	});
</script>
<body>
	<h2 align="center">MVC 계산기</h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>숫자1</th><td><input type="text" name="num01" value=""/></td></tr>
		<tr><th>숫자2</th><td><input type="text" name="num02" value=""/></td></tr>
		<tr><th>연산자</th>
			<td>
				<select name="cal">
					<option value="">연산자를 선택하세요</option>
					<option value="0">+</option>
					<option value="1">-</option>
					<option value="2">*</option>
					<option value="3">/</option>
				</select>
			</td>
		</tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="검색"/>
		</td></tr>
	</table>	
	</form>
	
	<c:if test="${not empty param.num01 }">
	<table align="center" class="listTable">
		<tr><th>${param.num01 } ${cal } ${param.num02 } = ${sum }</th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	</c:if>
	
	<!--  응용) A21_MVC_Buy.java a02_buyProduct.jsp
			물건명 : [ ]  가격 : [ ] 갯수: [ ] [구매] 
			구매 클릭시 모델데이터로 물건명과 총계 출력 (3조 제출, 나머지 손들기) -->
	
</body>
</html>