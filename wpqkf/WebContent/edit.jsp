<%@page import="product.ProductDB"%>
<%@page import="product.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
  <%
 	String pageNum = request.getParameter("pageNum");
  	int s_id =Integer.parseInt(request.getParameter("s_id"));
  
	ProductDBBean db = ProductDBBean.getInstance();
	ProductDB product = db.getProduct();
  	
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
		<h1>��ǰ �����ϱ�</h1>
		<form name= "form" method="post" action="edit_ok.jsp?b_id=<%=s_id%>&pageNum=<%=pageNum%>">
			<table>
				<tr height="30">
					<td width="80"> ��ǰ�� </td>
					<td width="140"><input type="text" name="s_name" maxlength="20" size="20" value="<%=product.getS_name()%>"></td>
					<td width="80"> ������</td>
					<td width="240"><input type="text" name="s_size" maxlength="50" size="50" value="<%=product.getS_size()%>"></td>
				</tr>
				<tr height="30">
					<td width="80"> ��ǰ ī�װ�</td>
					<td colspan="3"><input type="text" size="80" name="s_category" maxlength="80" value="<%=product.getS_category()%>"></td>
				</tr>
				<tr>
					<td width="80"> ��ǰ ����</td>
					<td colspan="3"><input type="number" size="80" name="s_price" maxlength="80" value="<%=product.getS_price()%>"></td>
				</tr>
				<tr>
					<td width="80"> ���</td>
					<td colspan="3"><input type="number" size="80" name="s_price" maxlength="80" value="<%=product.getS_stock()%>"></td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4" >
						<input type="button" value="��ǰ ����" onclick="check_ok()">&nbsp;
						<input type="reset" value="�ٽ��ۼ�">&nbsp;
						<input type="button" value="��ǰ���" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>