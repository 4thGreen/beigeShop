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
			<th colspan="2"> ��ǰ�ø���</th>
		</tr>
		<tr>
			<th width="30%">��ǰ��</th>
			<td>
				<input type="text" name="s_name" size="30">
			</td>
		</tr>
		<tr>
			<th width="30%">������</th>
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
			<th width="30%">��ǰ�з�</th>
			<td>
				<select name="s_category" size="1">
					<option value="shirt">����
					<option value="pants">����
					<option value="onepiecs">���ǽ�
					<option value="accessory">�Ǽ��縮
				</select>
			</td>
		</tr>
		<tr>
			<th width="30%">�ǸŰ�</th>
			<td>
				<input type="number" name="s_price" size="10">
			</td>
		</tr>
		<tr>
			<th width="30%">���</th>
			<td>
				<input type="number" name="s_stock" size="10">
			</td>
		</tr>
		
		<tr>
			<th width="30%">��ǥ�̹���</th>
			<td>
				<input type="file" name="s_image" size="30">
			</td> 
			 
		</tr>
		<tr>	
			<th width="30%">���̹���</th>
			<td>
				<input type="file" name="s_image2" size="30">
			</td> 
			 
		</tr>	
				<tr height="50" align="center">
					<td colspan="4" >
						<input type="submit" value="��ǰ���" onclick="check_ok()">&nbsp;
						<input type="reset" value="�ٽ��ۼ�">&nbsp;
						<input type="button" value="��ǰ���" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">&nbsp;
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>