<%@page import="wpqkf.ProductDB"%>
<%@page import="wpqkf.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
   		String pageNum = request.getParameter("pageNum");
    	int s_id=0;
    	String s_name="";
    	if(request.getParameter("s_id") != null){
	    	s_id = Integer.parseInt(request.getParameter("s_id"));
    	}
     	
    	ProductDBBean db = ProductDBBean.getInstance();
    	ProductDB product = db.getProduct(s_id);
    	
    	if(product!= null){
    		s_name = product.getS_name();
    	}
    %>
<!DOCTYPE html>
<html>
	<script type="text/javascript" src="board2.js" charset="utf-8"></script>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<form name= "form" method="post" action="write_ok.jsp" enctype="multipart/form-data">
			<input type="hidden" name="s_id" value="<%= s_id %>">
			
			<table>
				<tr>
			<th colspan="2"> 상품올리기</th>
		</tr>
		<tr>
			<th width="30%">상품명</th>
			<td>
				<input type="text" name="s_name" size="30">
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
			<th width="30%">판매가</th>
			<td>
				<input type="number" name="s_price" size="10">
			</td>
		</tr>
		<tr>
			<th width="30%">재고량</th>
			<td>
				<input type="number" name="s_stock" size="10">
			</td>
		</tr>
		
		<tr>
			<th width="30%">대표이미지</th>
			<td>
				<input type="file" name="s_image" size="30">
			</td> 
			 
		</tr>
		<tr>	
			<th width="30%">상세이미지</th>
			<td>
				<input type="file" name="s_image2" size="30">
			</td> 
			 
		</tr>	
				<tr height="50" align="center">
					<td colspan="4" >
						<input type="submit" value="상품등록" onclick="check_ok()">&nbsp;
						<input type="reset" value="다시작성">&nbsp;
						<input type="button" value="상품목록" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">&nbsp;
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>