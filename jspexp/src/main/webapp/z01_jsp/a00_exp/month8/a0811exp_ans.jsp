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
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
		
		/*
		// select의 값이 변경될 때
		$("#opr").change(function(){
			
			var num001 = $("[name=num001]").val();
			var num002 = $("[name=num002]").val();
			
			// 선택된 내용을 value값으로 가져오기
			var calIdx = $("#opr").val();
			// option의 value값을 가져옴 
			// var cal = $("#opr>option:selected").text(); 오류남 ㅠ
			var cal = $(this).find(":selected").text();
			
			// 사칙연산을 배열로 선언해 해당 index값을 가져와서 조건문없이 실행
			var rs = [num001+num002, num001-num002, num001*num002, 
					(num001/num002).toFixed(1)]; // 소숫잠 1자리까지 보이도록 함
			
			if(cal != "연산자선택") {
				#("#show").text(num001 + cal + num002 + " = " + rs[calIdx]);
			} else {
				#("#show").text("");
			}
			
		});
		*/
		
		// 찾기 - 1단계 td, 2단계 tr
		$("#btnSh").click(function(){
			var inValue = $("[name=inValue]").val();
			console.log(inValue);
			
			// 1단계 해당 td 검색
			//$("#tab03 td:contains('" + inValue + "')").css("background", "skyblue");
			
			// 2단계 해당 tr 검색
			//$("#tab03 tr:contains('" + inValue + "')").parent().css("background", "skyblue");
			$("#tab03 tr:contains('" + inValue + "'):parent").css("background", "skyblue");
			//$("#tab03 td:contains('"+inValue+"')").parent().css("background-color",'yellow');

		});
		
		var wid = 100;
		var hei = 100;
		
		
		$("#stimg").change(function(){
			// $(this).val() : 선택한 option의 value값을 가져온다
			//	ex) value = "img01.png" 이런식으로 할당됨
			
			// 이미지의 src 속성으로 해당 value값으로 할당
			// path : 서버상의 절대위치를 가져온다
			$("img").attr("src", "<%= path %>/z02_jquery/a03_attribute/image/" + $(this).val());
		});
		
		// 버튼 클릭시 증가 처리후 다중의 속성값 지정
		$("#btnBig").click(function(){
			wid += 10; hei += 10;
			$("img").attr({width:wid, height:hei});
		});
		
		$("#btnSmall").click(function(){
			wid -= 10; hei -= 10;
			$("img").attr({width:wid, height:hei});
		});
		
	});
</script>
</head>
<%-- 
# 

--%>
<%

%>
<body>
	<h2 align="center"></h2>

	<h3> 5. 계산기</h3>
	<table align="center" class="listTable">
		<tr>
			<th>
				<input type="text" name="num001" value="0"/>
			</th>
			<th> 
				<select id="opr">
					<option value="-1">select연산자</option>
					<option value="0">+</option>
					<option value="1">-</option>
					<option value="2">*</option>
					<option value="3">/</option>
				</select>
			</th>
			<th>
				<input type="text" name="num002" value="0"/>
			</th>
		</tr>
		<tr><td id="showtd" colspan="3"><h4 id="show"></h4></td></tr>
	</table>
	
	<%
	
	List<String> asList = Arrays.asList("홍길동", "김길동", "신길동", "마길동", "오길동");
	%>
		
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
		<% for(int cnt=1; cnt<=30; cnt++) { %>
		<tr>
			<td><%= cnt %></td>
			<td><%= asList.get((int)(Math.random()*asList.size())) %></td>
			<td><%= (int) (Math.random()*101) %></td>
			<td><%= (int) (Math.random()*101) %></td>
			<td><%= (int) (Math.random()*101) %></td>
		</tr>
		<% } %>	
	</table>
	
	
	<h3> 7. 이미지 변경 </h3>
	<table id="tab04" align="center" class="listTable">
		<tr><td colspan="2">
			<img src="<%= path %>\z02_jquery\a03_attribute\image\img01.jfif" width="200px" height="200px"/>
		</td></tr>
		<tr>
			<td>
				<select id="stimg">
					<option value="img01.jfif">img01</option>
					<option value="img02.jfif">img02</option>
					<option value="img03.jfif">img03</option>
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