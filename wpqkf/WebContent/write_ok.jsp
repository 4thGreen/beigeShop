<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="product.ProductDB"%>
<%@page import="product.ProductDBBean"%>
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
//String path = request.getRealPath("upload");
//int size = 1024*1024;//메가
//int fileSize = 0;
//String file ="";
//String oriFile="";

//MultipartRequest multi = new MultipartRequest(request,path,size, "euc-kr",new DefaultFileRenamePolicy());
//Enumeration files = multi.getFileNames();
//String str = (String)files.nextElement();
//file = multi.getFilesystemName(str);

//if(file != null){
	//oriFile = multi.getOriginalFileName(str);
	//fileSize = file.getBytes().length;
	
//}

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