<%@page import="product.ProductDB"%>
<%@page import="product.ProductDBBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<%
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null){
			pageNum ="1";
		}
		
		ProductDBBean db = ProductDBBean.getInstance();
		ArrayList<ProductDB> productlist = db.listProduct(pageNum);
				
		
		int s_id=0,s_price=0,s_stock=0;
		String s_name, s_size, s_category, s_image;
	%>	

<!DOCTYPE html>
<html>
<head> 
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>상품 목록 보기</h1>

				<table width="600">
				<tr>
					<td align="right">		
					<a href="write.jsp?pageNum=<%=pageNum%>">상품등록</a></td>
				</tr>
			</table>
			<table width="800" border="1" cellspacing="0">	
				<tr height="25">
					<td width="40" align="center">번호</td>
					<td width="80" align="center">카테고리</td>
					<td width="450" align="center">상품명</td>
					<td width="120" align="center">상품사이즈</td>
					<td width="130" align="center">상품가격</td>
					<td width="60" align="center">재고량</td>
				</tr>
				<%
					for(int i = 0; i<productlist.size(); i++){
						
						ProductDB product = productlist.get(i);
						s_id=product.getS_id();
						s_category=product.getS_category();
						s_name=product.getS_name();
						s_size=product.getS_size();
						s_price=product.getS_price();
						s_stock=product.getS_stock();
						
				%>
					<tr height="25" bgcolor="#f7f7f7" 
									onmouseover="this.style.backgroundColor='#eeeeef'"
									onmouseout="this.style.backgroundColor='#f7f7f7'">
						<td align="center"><%= s_id %></td>
							<a href = "show.jsp?s_id=<%= s_id %>&pageNum=<%=pageNum%>"><%= s_name %></a>
						</td>
					</tr>	
				<%		
					}
				%>
			</table>
    </center>
    <center>
   		 <%= ProductDB.pageNumber(4) %>
	</center>		
</body>
</html>