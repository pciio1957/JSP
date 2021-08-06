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
		//$("#h3Title").text("시작");
		
		var num = 1;
		var tot = 0;
		
		// 담기 클릭시 
		$("#add").click(function() {
			// 입력된 정보 가져오기 
			var nameVal = $("[name=name]").val();
			var priceVal = $("[name=price]").val();
			var cntVal = $("[name=cnt]").val();
			
			// 객체 생성
			var prod = new Product(nameVal, priceVal, cntVal);
			pro.appendProduct(num);
		});
		
		//$("#showCart tbody").html(("#showCart tbody").html()+pro.appendProduct(num));
		$("#showCart tbody").append(pro.appendProduct(num));
		
		tot += priceVal * cntVal;
		$("#tot").text(tot);
	});
	
	class Product {
		
		constructor(name, price, cnt) {
			this.name = name;
			this.price = price;
			this.cnt = cnt;
		}
	
		appendProduct(no) {
			
			return "<tr><td>" + no + "</td><td>" + this.name + "</td><td>" + this.price +
			"</td><td>" + this.cnt + "</td><td>" + this.price * this.cnt + "</td><td>" ;
		}
	}
</script>
</head>
<%-- 
# 

--%>
<%

%>
<body>
	<h3 align="center" id="h3Title">장바구니담기</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="pname" value=""></td></tr>
		<tr><th>물건가격</th><td><input type="text" name="price" value=""></td></tr>
		<tr><th>물건갯수</th><td><input type="text" name="cnt" value=""></td></tr>
		<tr><td colspan="2"><input type="button" id="add" value="장바구니담기"></td></tr>
	</table>	
	</form>
	
	<h2>장바구니현황</h2>
	<table  align="center" id="showCart">
		<thead><tr><th>번호</th><th>물건명</th><th>가격</th><th>갯수</th><th>총금액</th></tr></thead>
		<tbody></tbody>
		<tfoot><th colspan="4">총계</th><td id="tot"></td></tfoot>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>