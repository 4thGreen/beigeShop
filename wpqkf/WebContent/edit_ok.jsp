<%@page import="product.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="product" class="product.ProductDB"></jsp:useBean> 
<jsp:setProperty property="*" name="product"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String pageNum = request.getParameter("pageNum");
	int s_id =Integer.parseInt(request.getParameter("s_id"));
	
	product.setS_id(s_id);
	 	
	ProductDBBean db = ProductDBBean.getInstance();
	int re =db.editProduct(product);	

	if(re ==1){
		response.sendRedirect("list.jsp?pageNum="+pageNum);
	}
	else if(re==0){
%>	
	<script type="text/javascript">
		alert("상품명이 맞지 않습니다.");
		history.go(-1);
	</script>

<%		
	}
	else if(re==-1){
%>	
		<script type="text/javascript">
			alert("글 수정에 실패하였습니다.");
			history.go(-1);
		</script>

<%			
	}
	
 %>  
</body>
</html>