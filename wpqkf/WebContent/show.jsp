<%@page import="product.ProductDB"%>
<%@page import="product.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	int sid = Integer.parseInt(request.getParameter("s_id"));

	ProductDBBean db = ProductDBBean.getInstance();
	ProductDB product = db.getProduct(sid);
	
	int s_id = 0, s_price = 0, s_stock=0;
	String s_name="", s_size="", s_category="", s_image="";
	
	s_id=product.getS_id();
	s_category=product.getS_category();
	s_name=product.getS_name();
	s_size=product.getS_size();
	s_price=product.getS_price();
	s_stock=product.getS_stock();
	s_image=product.getS_image();
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>	
	<center>
		<h1>��ǰ �� ��</h1>
			<table border="1" width="800" cellspacing = "0" >
				<tr height="30" align="center">
					<td width="100"> ��ǰ��ȣ</td>
					<td width="200"><%=s_id %> </td>
				</tr>
				<tr height="30" align="center">
					<td width="100"> ��ǰ��</td>
					<td width="200"> <%=s_category %></td>
					<td width="100"> ���</td>
					<td width="200"> <%=s_stock %></td>
				</tr>
				<tr height="30" align="center">
					<td width="110">��&nbsp;&nbsp;��</td>
					<td colspan="3">
						<%-- 
						&nbsp;
						<%
							if(b_fname != null){
								%>
									<img src="./images/zip.gif">
									<a href="./upload/<%=b_fname%>">�������� : <%= b_fname %>(<%=b_fsize %>)</a>
								<%
							}
						%>
						--%>
						<%	
							out.println("<p>÷������"+"<a href='FileDownload.jsp?fileN="+s_id+"'>"+s_image+"</a></p>");
						%>
					</td>
				</tr>
				<tr height="30">
					<td width="100" align="center"> ��ǰ��</td>
					<td colspan="3" width="200"> <%=s_name %></td>
				</tr>
				<tr height="30">
					<td width="100" align="center"> ��ǰ ����</td>
					<td colspan="3" width="200"> 
						<%=s_price%>
					</td>
				</tr>
				<tr height="30">
					<td colspan="4" align="right">
						<input type="button" value="��ǰ����" onclick="location.href='edit.jsp?s_id=<%=s_id%>&pageNum=<%=pageNum%>'">
						<input type="button" value="��ǰ����" onclick="location.href='delete.jsp?s_id=<%=s_id %>&pageNum=<%=pageNum%>'"> 
						<input type="button" value="�۸��" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'"> 
					</td>
				</tr>
			</table>
	</center>

</body>
</html>