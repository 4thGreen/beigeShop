<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript" charset="UTF-8">
	function check(f) {
		blank = false;
		for (var i = 0; i < f.elements.length; i++) {
			if(f.elements[i].value=="")
				if(f.elements[i].name != "large")
					blank = true;
		}
		if(blank = true)
			alert("��� �׸��� �Է��ϼž� �մϴ�.");
		else
			f.submit();
	}
</script>
<body>
	[<a href="main.jsp"> ��������</a>]
	
	<form method="post" action="product_save.jsp" enctype="multipart/form-data">
	<table border="1" width="500">
		<tr>
			<th colspan="2"> ��ǰ�ø���</th>
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
			<th width="30%">��ǰ��</th>
			<td>
				<input type="text" name="s_name" size="30">
			</td>
		</tr>
		<tr>
			<th width="30%">�ǸŰ�</th>
			<td>
				<input type="text" name="s_price" size="10">
			</td>
		</tr>
		<tr>
			<th width="30%">���</th>
			<td>
				<input type="text" name="s_stock" size="10">
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
			<th width="30%">���� �̹���</th>
			<td>
				<input type="file" name="s_simage" size="30">
			</td>
		</tr>
		<tr>
			<th width="30%">ū �̹���</th>
			<td>
				<input type="file" name="s_limage" size="30">
			</td>
		</tr> 
	
		<tr>
			<td colspan="2">
				<input type="submit" value="����">
				<input type="reset" value="�ٽþ���">
			</td>
		</tr>
	</table>	
	</form>
</body>
</html>














