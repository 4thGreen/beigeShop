<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	String pageNum = request.getParameter("pageNum");
	int s_id = Integer.parseInt(request.getParameter("s_id"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="board2.js" charset="utf-8"></script>
</head>
<body>
	<center>
		<h1>��ǰ �� �� �� �� </h1>
		<form name="form" method="post" action="delete_ok.jsp?s_id=<%=s_id%>&pageNum=<%=pageNum%>">
			<table>
				<tr height="50">
					<td colspan="2">
						<b> >> ��ǰ�� �Է��ϼ���. << </b>
					</td>
				</tr>
				<tr>
					<td width="80">
						��ǰ��
					</td>
					<td>
						<input type="text" name="s_name" size="12" maxlength="12">
					</td>		
				</tr>
				<tr height="50" align="center">	
					<td colspan="2">
						<input type="button" value="��ǰ ����" onclick="delete_ok()">
						<input type="reset" value="�ٽ� �ۼ�">
						<input type="button" value="��ǰ���" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>