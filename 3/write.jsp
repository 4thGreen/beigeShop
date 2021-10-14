<%@page import="project1.shopDBBean"%>
<%@page import="project1.shopBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
<!DOCTYPE html>
<html>
	<script type="text/javascript" src="shop.js" charset="utf-8"></script>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>상품 올리기</h1>
		<form name= "form" method="post" action="write_ok.jsp" enctype="multipart/form-data">
			
			<table>
				<tr height="30">
					<td width="80"> 카테고리</td>
					<td width="140"><input type="text" name="s_category"></td>
				</tr>
				<tr height="30">	
					<td width="80"> 상품명 </td>
					<td width="240"><input type="text" name="s_name"></td>
				</tr>
				<tr height="30">
					<td width="80">가격</td>
					<td colspan="3">
						<input type="number" name="s_price">
					</td>
				</tr>
				<tr height="30">
					<td width="80">재고량</td>
					<td colspan="3">
						<input type="number" name="s_stock">
					</td>
				</tr>
				<tr height="30">
					<td width="80">상품이미지</td>
					<td colspan="3">
						<input type="file" name="s_image" size="40">
					</td>
				</tr>
				
				<tr height="50" align="center">
					<td colspan="4" >
						<input type="button" value="글쓰기" onclick="check_ok()">&nbsp;
						<input type="reset" value="다시작성">&nbsp;
						<input type="button" value="글목록" onclick="location.href='list.jsp'">&nbsp;
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>