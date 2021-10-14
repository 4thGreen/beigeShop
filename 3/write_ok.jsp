<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.jspsmart.upload.File"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
 <jsp:useBean id="board" class="magic.board.BoardBean"></jsp:useBean>   
<jsp:setProperty property="*" name="board"/>
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	
	String path = request.getRealPath("upload");
	int size = 1024*1024;//메가
	int fileSize = 0;
	String file ="";
	String oriFile="";
	
	MultipartRequest multi = new MultipartRequest(request,path,size, "euc-kr",new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	String str = (String)files.nextElement();
	file = multi.getFilesystemName(str);
	
	if(file != null){
		oriFile = multi.getOriginalFileName(str);
		fileSize = file.getBytes().length;
		
	}
	
	shopBean shop = new shopBean();
	
	shop.setS_id(Integer.parseInt(multi.getParameter("s_id")));
	shop.setS_name(multi.getParameter("s_name"));
	shop.setS_price(Integer.parseInt(multi.getParameter("s_price")));
	shop.setS_stock(Integer.parseInt(multi.getParameter("s_stock")));
	shop.setS_category(multi.getParameter("s_category"));
	shop.sets_size(multi.getParameter("s_size"));
	

	shopDBBean db =  shopDBBean.getInstance();
	if(db.insertBoard(shop) ==1){
		
		response.sendRedirect("list.jsp");
	}
	
	else {
		response.sendRedirect("write.jsp");
	}
	
%>	
</body>
</html>
 