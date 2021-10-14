<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="purchase_ok.jsp">
	<table>
		<tr>	
		 	<td>이름</td>
		 	<td>
		 		<input type="text" name="userId">
		 	</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<input type="tel" name="userTel">
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" name="userAddr">
			</td>
		</tr>
		<tr>
			<td>상품명</td>
		</tr>	
		<tr>
			<td>가격</td>
		</tr>
		<tr>
			<td>옵션</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="구매">
			</td>
		</tr>
	</table>
</form>
</body>
</html>