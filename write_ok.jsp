<!-- ��� :  C:\Users\USER\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\wpqkf\upload
	upload������ ��ǻ�� �� ��Ŭ���� ��ũ�����̽� ������ ������ ����� �۵��մϴ�!!!!!
	��ǻ�͸��� ��ΰ� ���ݾ� �ٸ��� ����!!!!
-->


<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="wpqkf.ProductDBBean"%>
<%@page import="wpqkf.ProductDB"%>
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
String path = request.getRealPath("upload");
int size = 1024*1024;//�ް�
int fileSize = 0;
String file ="";
String oriFile="";

DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
MultipartRequest multi = new MultipartRequest(request,path,size, "euc-kr",policy);
Enumeration files = multi.getFileNames();
String str = (String)files.nextElement();
file = multi.getFilesystemName(str);

String str2 = (String)files.nextElement();
String file2 = multi.getFilesystemName(str2);

if(file != null){
	oriFile = multi.getOriginalFileName(str);
	fileSize = file.getBytes().length;
	
}

	//SmartUpload upload = new SmartUpload();
	//upload.initialize(pageContext);
	//upload.upload();
	
	//String fName = null;
	//int fSize=0;
	
	//File file = upload.getFiles().getFile(0);
	
	//if(!file.isMissing()){
		//fName = file.getFileName();
		//fSize = file.getSize();
		//file.saveAs("/upload/"+file.getFileName());
	//}


ProductDB product = new ProductDB();

product.setS_id(Integer.parseInt(multi.getParameter("s_id")));
product.setS_name(multi.getParameter("s_name"));
product.setS_size(multi.getParameter("s_size"));
product.setS_category(multi.getParameter("s_category"));
product.setS_price(Integer.parseInt(multi.getParameter("s_price")));
product.setS_stock(Integer.parseInt(multi.getParameter("s_stock")));
product.setS_image(file2);
product.setS_image2(file);


ProductDBBean db = ProductDBBean.getInstance();
if(db.insertProduct(product) ==1){
	
	response.sendRedirect("list.jsp");
}

else {
	response.sendRedirect("write.jsp");
}

%>
</body>
</html>