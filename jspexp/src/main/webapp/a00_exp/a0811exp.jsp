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
	
	td, td {
		width:100px;
		height:40px;
	}
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("8월  11일 응용문제");
		
		
		
		$("#opr").change(function(){
			var num001 = $("[name=num001]").val();
			var num002 = $("[name=num002]").val();

			//var opr = $(":selected").text();
			var ope = $(this).find(":selected").text();
			var result = 0;
			
			switch(ope) {
				case "+" :
					result = num001+num002; break;
				case "-" :
					result = num001-num002; break;
				case "*" :
					result = num001*num002; break;
				case "/" :
					result = num001/num002; break;
				default: 
					result = "";
			}
			
			$("#showtd").innerText = result;
			$("#showtd").Text = result;
			
			//console.log("출력 : " + num001 + opr + num002);
			console.log("출력2 : " + num001 + ope + num002);
			console.log("결과 : " + result);
			
		});
		
		$("#btnSh").click(function(){
			var inValue = $("[name=inValue]").val();
			
			$("#tab03 td:contains('" + inValue + "')").css("background", "skyblue");
			
		});
		
		$("#stimg").change(function(){
			
			var selVal = $(this).find(":selected").text();
			
			switch(selVal) {
				case "img01" :
					$("#tab04 img").attr("src", "<%= path %>\z02_jquery\a03_attribute\image\img01.jfif");
					break;
				case "img02" :
					$("#tab04 img").attr("src", "<%= path %>\z02_jquery\a03_attribute\image\img02.jfif");
					break;
				case "img03" :
					$("#tab04 img").attr("src", "<%= path %>\z02_jquery\a03_attribute\image\img03.jfif");
					break;
				default :
					$("#tab04 img").attr("src", "<%= path %>\z02_jquery\a03_attribute\image\img01.jfif");
			}
		});
		
	});
</script>
</head>
<%-- 

#정리문제
1. [jsp]directive 종류를 기술하세요
	directive의 종류
	1) page : jsp페이지에 대한 정보 지정. 
		문서의 타입, 출력 버퍼의 크기, 에러 페이지 등 정보 지정
	2) taglib : 사용할 태그 라이브러리 지정
	3) include : 해당 페이지에 다른 JSP페이지를 포함시킴

2. [jsp]script의 종류 3가지를 기술하고, 간단한 예제로 출력까지 하세요.
	스크립트의 요소 3가지
	1) declaration : <%! %>
		변수, 상수, 메소드의 선언
		ex) java의 class 바로 밑 선언 부분
	2) scriplet : <% %>
		자바의 데이터 할당, 조건/반복문 등 프로세스 처리
		ex) java의 main()있는 부분
	3) expression : <%= %>
		화면에 출력할 변수, 상수, 메소드리턴값 선언
		ex) java의 main()안에 System.out.println();

3. [jsp]request와 response객체를 서버/클라이언트 관점에서 기술하세요.

	 * request : 요청값을 받을 때 활용 (session)
		
	클라이언트 ===(request)==> 서버
	(브라우저)	<==(response)== (톰캣)
	
	* response : 클라이언트에 화면이나 쿠키값을 보낼때 (cookie)
	
	1. 서버(web application server)에서 둘 다 코드로 수행되는 내용이다
	2. request는 주로 클라이언트에서 요청하는 정보에 대한 처리를 한다
		url 정보, 요청값, 서버로 전달하는 cookie
	3. response는 주로 서버에 있는 내용을 클라이언트로 전달할 때 사용
		브라우저에 전달할 화면(html태그 등), 클라이언트에 저장할 쿠키
		기타 (파일, pdf, excel 전송 등)
	
			
4. 아래 내용은 어떤 filter선택자를 활용할 것인가를 기술하세요
    성별 :()남자()여자 [등록]
    관리자[   ] 일반사용자[    ] [관리자활성화][일반사용자활성화]
    취미 :[]운동[]게임[]독서[]음악 [취미등록]
    
    성별의 경우 라디오버튼
    취미의 경우 체크박스이므로 :checked를 이용한다.
    
    성별(단일) : 등록 클릭시 check가 된 값을 가져올 때 
    	$("input[name=gender]:checked").val()
    관리자 : 활성화/비활성화 
    	$("input[name=admin]:disabled").attr("disabled", "")  : 비활성화 -> 활성화
    	$("input[name=normal]:enabled").attr("disabled", "disabled") : 활성화 -> 비활성화
    취미(다중) : 등록 클릭시 check가 된 값 가져옴 
    	var hobbyCk = $("input[name=hobby]:checked") 
    	for(var idx=0; idx<hobbyCk.length; idx++) {
    		// hobby의 checked가 된 것의 값 가져오기 
    		$("input[name=hobby]:checked").eq(idx).val();
    	}
    
5. 아래와 같은 화면을 연산자를 선택시, 계산결과를 출력하는 프로그램을 만들세요.
    [    ][select연산자][     ]
    결과 :  @@ X @@ = @@
    (위에 풀이)
    
6. 학생의 성적이 리스트되는 화면에서 검색할 행(필터객체를 확인)의 배경색상을 
   표기해주는 프로그램을 작성하세요.(1단계-해당데이터td,2단계-해당포함tr)
    검색내용 [    ][검색]
    no  이름  국어 영어 수학
    1   @@@  @@  @@ @@@
    2   @@@  @@  @@ @@@
    3   @@@  @@  @@ @@@
    
7. 전날 다운 받은 이미지와 속성을 활용해서 해당 기능을 처리하세요
    [이미지]  [select-이미지변경][커져라][작아져라]
# 다하신 분은 손들기 해주시고 내용을 올려주세요.(9:30 1차점검)


--%>
<%!

	int num01; int num02;
	int getMulti(int num01, int num02) {
		return num01*num02;
	}
%>
<%
	num01 = 10;
	num02 = 4;
	int tot = getMulti(num01, num02);
	
%>
<body>
	<h2 align="center"></h2>
	
	<h3 align="center">연산결과</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>연산식</th><td>
			<input type="text" name="num01" value="<%= num01 %>"/>
			<input type="text" name="num02" value="<%= num02 %>"/>
		</td></tr>
		<tr><th>결과</th><td><%= tot %></td></tr>
	</table>	
	</form>
	
	
	<h3> 5. 계산기</h3>
	<table align="center" class="listTable">
		<tr>
			<th>
				<input type="text" name="num001" value="0"/>
			</th>
			<th> 
				<select id="opr">
					<option>select연산자</option>
					<option>+</option>
					<option>-</option>
					<option>*</option>
					<option>/</option>
				</select>
			</th>
			<th>
				<input type="text" name="num002" value="0"/>
			</th>
		</tr>
		<tr><td colspan="3" id="showtd"></td></tr>
	</table>
	
	<h3> 6. 검색 </h3>
	<table id="tab03" align="center" class="listTable">
		<tr>
			<td>검색내용</td>
			<td colspan="3"><input type="text" name="inValue" value=""/></td>
			<td><input type="button" id="btnSh" value="검색"/></td>
		</tr>
		<tr>
			<th>no</th>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
		</tr>
		<tr>
			<td>1</td>
			<td>홍길동</td>
			<td>100</td>
			<td>100</td>
			<td>100</td>
		</tr>
		<tr>
			<td>2</td>
			<td>고길동</td>
			<td>80</td>
			<td>85</td>
			<td>80</td>
		</tr>
		<tr>
			<td>3</td>
			<td>유길동</td>
			<td>50</td>
			<td>55</td>
			<td>65</td>
		</tr>		
	</table>
	
	<h3> 7. 이미지 변경 </h3>
	<table id="tab04" align="center" class="listTable">
		<tr><td colspan="2">
			<img src="<%= path %>\z02_jquery\a03_attribute\image\img01.jfif" width="200px" height="200px"/>
		</td></tr>
		<tr>
			<td>
				<select id="stimg">
					<option>select-이미지변경</option>
					<option>img01</option>
					<option>img02</option>
					<option>img03</option>
				</select>
			</td>
			<td>
				<input type="button" id="btnBig" value="커져라"/>
				<input type="button" id="btnSmall" value="작아져라"/>
			</td>
		</tr>
	</table>	
</body>
</html>