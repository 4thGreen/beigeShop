<%@page import="project1.shopBean"%>
<%@page import="project1.shopDBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int s_id = Integer.parseInt(request.getParameter("s_id"));

	shopDBBean db = shopDBBean.getInstance();
	shopBean shop = db.getBoard(s_id);
	
	
	int s_price = 0, s_stock = 0; 
	String s_name="",s_category="",s_size="";
	
	s_id = shop.getS_id();
	s_name = shop.getS_name();
	s_category = shop.getS_category();
	s_price = shop.getS_price();
	s_stock = shop.getS_stock();
	s_size = shop.getS_size();
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>	
	<center>
		<h1>상 품 보 기</h1>
			<table border="1" width="800" cellspacing = "0" >
				<tr height="30" align="center">
					<td width="100"> 상품번호</td>
					<td width="200"><%=s_id %> </td>
					<td width="100">상품군</td>
					<td width="200"><%=s_category %></td>
				</tr>
				<tr height="30" align="center">
					<td width="100"> 재고량</td>
					<td width="200"> <%=s_stock %></td>
					<td width="100"> 가격</td>
					<td width="200"> <%=s_price %></td>
				</tr>
				<tr height="30" align="center">
					<td width="110">파&nbsp;&nbsp;일</td>
					<td colspan="3">
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
						<%	
							out.println("<p>첨부파일"+"<a href='FileDownload.jsp?fileN="+s_id+"'>"+"</a></p>");
						%>
					</td>
				</tr>
				<tr height="30">
					<td width="100" align="center"> 상품명</td>
					<td colspan="3" width="200"> <%=s_name %></td>
				</tr>
				<tr height="30">
					<td width="100" align="center"> 사이즈</td>
					<td colspan="3" width="200"> 
					<pre>
						<%=s_size %>
					</pre>
					</td>
				</tr>
				<tr height="30">
					<td colspan="4" align="right">
						<input type="button" value="글목록" onclick="location.href='list.jsp'"> 
					</td>
				</tr>
			</table>
	</center>

</body>
</html>