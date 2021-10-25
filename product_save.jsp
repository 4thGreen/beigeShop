<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	String fileurl = "D:/2021 자바_박지은/upload/";//파일 업로드되는 절대경로, 컴퓨터마다 변경 필요
	String svaeFolder = "upload";//파일이 업로드되는 폴더 지정
	String encType="euc-kr";//인코딩 타입 지정
	int Maxsize = 5*1024*1024;//최대 업로드될 파일 크기 지정
	
	MultipartRequest multi = null;
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	multi = new MultipartRequest(request, fileurl,Maxsize,encType,policy);
	//전송 담당 컴포넌트 생성 후 전송할 파일명을 가지고 있는 객체, 서버상의 절대경로, 최대업로드 파일크기, 문자코드, 기본 보안적용을 지정한다.
	
	String cat = multi.getParameter("s_category");
	String sn = multi.getParameter("s_name");
	int price = Integer.parseInt(multi.getParameter("s_price"));
	int stock = Integer.parseInt(multi.getParameter("s_stock"));
	String size = multi.getParameter("s_size");
	
	long id = 0;//상품 키값을 저장하기위한 변수
	int pos = 0;
	
	
	//java.util.Date yymmdd = new java.util.Date();
	//SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
	//String ymd = myformat.format(yymmdd);
	
	String sql = null;
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	int cnt = 0;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}catch (java.lang.ClassNotFoundException e){
		out.println(e.getMessage());
	}
	try{
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
		st = con.createStatement();
		sql = "select max(s_id) from beige_shop ";
		//상품의 키값을 설정하기 위해 같은 상품 분류 중 최고 id값을 구한다.
		rs = st.executeQuery(sql);
		rs.next();
		id =rs.getLong(1);
		//sql을 실행한 다음 반환된 레코드 셋에서 레코드를 읽어온다. 그리고 첫번째 컬럼 값을 변수 id에 저장한다.
		
		if(id==0)
			id=00001;
		else
			id =id+1;
		//기존에 등록된 같은 분류의 상품이 있는 경우 기존 상품 중 가장 id가 큰값에 1을 더한다.
		Enumeration files = multi.getFileNames();
		String fname1 = (String)files.nextElement();
		String filename1 = multi.getFilesystemName(fname1);
		String fname2 = (String)files.nextElement();
		String filename2 = multi.getFilesystemName(fname2);
		//<input>태그의 type속성이 file로 지정된 텍스트 상자의 개수만큼의 값을 얻어온다.
		if(filename2 == null)
			filename2 = filename1;
		
		//StringBuffer insertQuery = new StringBuffer();
		
	//	insertQuery.append("insert into beige_shop values('");
		//insertQuery.append(id+"', '");
	//	insertQuery.append(cat+"', '");
		//insertQuery.append(sn+"', '");
		//insertQuery.append(price+"', '");
		//insertQuery.append(size+"', '");
		//insertQuery.append(stock+"', '");
		//insertQuery.append(filename1+"', '");
		//insertQuery.append(filename2+"') ");
		
	//	System.out.println(insertQuery);
		
		sql = "insert into beige_shop";
		sql = sql+" values("+id+", '";
		sql = sql+sn+"', '"+size+"', '"+cat+"', '"+price;
		sql = sql+"', '"+stock+"', '"+filename1+"', '"+filename2+"')";
		//filename2가 null문자이면 filename1값을 저장한다. 
		cnt = st.executeUpdate(sql);
		
		if(cnt>0)
			out.println("상품을 등록했습니다.");
		else
			out.println("상품이 등록되지 않았습니다.");
		
		st.close();
		con.close();
	}
	catch (SQLException e){
		out.println(e);
	}
%>
<p>
<a href="product_list.jsp">[상품 목록으로]</a> &nbsp;
<a href="product_write.jsp">[상품 올리는 곳으로]</a>