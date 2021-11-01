<%@page import="wpqkf.ProductDB"%>
<%@page import="wpqkf.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	int sid = Integer.parseInt(request.getParameter("s_id"));

	ProductDBBean db = ProductDBBean.getInstance();
	ProductDB product = db.getProduct(sid);
	
	int s_id = 0, s_price = 0, s_stock=0;
	String s_name="", s_size="", s_category="", s_image="",s_image2="";
	
	s_id=product.getS_id();
	s_category=product.getS_category();
	s_name=product.getS_name();
	s_size=product.getS_size();
	s_price=product.getS_price();
	s_stock=product.getS_stock();
	s_image=product.getS_image();
	s_image2=product.getS_image2();
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>	
	<center>
		<h1>상품 보 기</h1>
			<table border="1" width="800" cellspacing = "0" >
				<tr height="30" align="center">
					<td width="100"> 상품번호</td>
					<td width="200"><%=s_id %> </td>
				</tr>
				<tr height="30" align="center">
					<td width="100"> 제품군</td>
					<td width="200"> <%=s_category %></td>
					<td width="100"> 재고량</td>
					<td width="200"> <%=s_stock %></td>
				</tr>
				<tr height="30" align="center">
					<td width="110">파&nbsp;&nbsp;일</td>
					
						<%-- 
						&nbsp;
						<%
							if(b_fname != null){
								%>
									<img src="./images/zip.gif">
									<a href="./upload/<%=b_fname%>">원본파일 : <%= b_fname %>(<%=b_fsize %>)</a>
								<%
							}
						%>
						--%>
						<%--	
							out.println("<p>첨부파일"+"<a href='FileDownload.jsp?fileN="+s_id+"'>"+s_image+"</a></p>");
						--%>
						<td><img src="C:/Users/USER/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/wpqkf/upload/<%=s_image%>" height="500" width="500"></td>
						<td><img src="C:/Users/USER/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/wpqkf/upload/<%=s_image2%>" height="3000" width="700"></td>
					
				</tr>
				<tr height="30">
					<td width="100" align="center"> 상품명</td>
					<td colspan="3" width="200"> <%=s_name %></td>
				</tr>
				<tr height="30">
					<td width="100" align="center"> 제품 가격</td>
					<td colspan="3" width="200"> 
						<%=s_price%>
					</td>
				</tr>
				<tr height="30">
					<td colspan="4" align="right">
						<input type="button" value="상품구매" onclick="location.href='edit.jsp?s_id=<%=s_id%>&pageNum=<%=pageNum%>'">
						<input type="button" value="장바구니" onclick="location.href='delete.jsp?s_id=<%=s_id %>&pageNum=<%=pageNum%>'"> 
						<input type="button" value="상품목록" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'"> 
					</td>
				</tr>
			</table>
	</center>

</body>
</html>