<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%	
		String select = request.getParameter("pageChange");
		if(select == null){
			select="shop.jsp";
		}
	%>
	<form>
		
			<img alt="��ǰ �̹���" src="">
				
		<div>
				<h2>��ǰ�� </h2> 
				<h4>��ǰ����</h4>
				<select name="msize">
					<option>S
					<option>M
					<option>L
				</select>
				<br>
				<input type="button" value="�����ϱ�" onclick="location.href='purchase.jsp'">
				<input type="button" value="��ٱ���">
		</div>
			<hr>
			<br>
			<jsp:include page="menu.jsp"></jsp:include>	
			<br>
			<jsp:include page="<%=select %>"></jsp:include>
		<hr>
		<br>
			<jsp:include page="footer.jsp"></jsp:include>
		
	</form>

</body>
</html>