<%@page import="product.ProductDB"%>
<%@page import="product.ProductDBBean"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 	String pageNum = request.getParameter("pageNum");
 	int s_id = Integer.parseInt(request.getParameter("s_id"));
 	String s_name = request.getParameter("s_name");
 	
 	ProductDBBean db = ProductDBBean.getInstance();
	ProductDB product = db.getProduct(s_id);
	
	String up = "D:\\2021 java workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\magicBoard\\upload\\";
	
	int re = db.deleteProduct(s_id, s_name);	
	
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
			alert("삭제에 실패하였습니다.");
			history.go(-1);
		</script>

<%			
	}
	
 %>  
