<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript" charset="UTF-8">
	function check(f) {
		blank = false;
		for (var i = 0; i < f.elements.length; i++) {
			if(f.elements[i].value=="")
				if(f.elements[i].name != "large")
					blank = true;
		}
		if(blank = true)
			alert("모든 항목을 입력하셔야 합니다.");
		else
			f.submit();
	}
</script>
<body>
	[<a href="main.jsp"> 메인으로</a>]
	
	<form method="post" action="product_save.jsp" enctype="multipart/form-data">
	<table border="1" width="500">
		<tr>
			<th colspan="2"> 상품올리기</th>
		</tr>
		<tr>
			<th width="30%">상품분류</th>
			<td>
				<select name="s_category" size="1">
					<option value="shirt">상의
					<option value="pants">하의
					<option value="onepiecs">원피스
					<option value="accessory">악세사리
				</select>
			</td>
		</tr>
		<tr>
			<th width="30%">상품명</th>
			<td>
				<input type="text" name="s_name" size="30">
			</td>
		</tr>
		<tr>
			<th width="30%">판매가</th>
			<td>
				<input type="text" name="s_price" size="10">
			</td>
		</tr>
		<tr>
			<th width="30%">재고량</th>
			<td>
				<input type="text" name="s_stock" size="10">
			</td>
		</tr>
		<tr>
			<th width="30%">사이즈</th>
			<td>
				<select name="s_size" size="1">
					<option value="s">S
					<option value="m">M
					<option value="l">L
					<option value="free">FREE
				</select>

			</td>
		</tr>
		
		<tr>
			<th width="30%">작은 이미지</th>
			<td>
				<input type="file" name="s_simage" size="30">
			</td>
		</tr>
		<tr>
			<th width="30%">큰 이미지</th>
			<td>
				<input type="file" name="s_limage" size="30">
			</td>
		</tr> 
	
		<tr>
			<td colspan="2">
				<input type="submit" value="저장">
				<input type="reset" value="다시쓰기">
			</td>
		</tr>
	</table>	
	</form>
</body>
</html>














