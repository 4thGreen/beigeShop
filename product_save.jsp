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
	String fileurl = "D:/2021 �ڹ�_������/upload/";//���� ���ε�Ǵ� ������, ��ǻ�͸��� ���� �ʿ�
	String svaeFolder = "upload";//������ ���ε�Ǵ� ���� ����
	String encType="euc-kr";//���ڵ� Ÿ�� ����
	int Maxsize = 5*1024*1024;//�ִ� ���ε�� ���� ũ�� ����
	
	MultipartRequest multi = null;
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	multi = new MultipartRequest(request, fileurl,Maxsize,encType,policy);
	//���� ��� ������Ʈ ���� �� ������ ���ϸ��� ������ �ִ� ��ü, �������� ������, �ִ���ε� ����ũ��, �����ڵ�, �⺻ ���������� �����Ѵ�.
	
	String cat = multi.getParameter("s_category");
	String sn = multi.getParameter("s_name");
	int price = Integer.parseInt(multi.getParameter("s_price"));
	int stock = Integer.parseInt(multi.getParameter("s_stock"));
	String size = multi.getParameter("s_size");
	
	long id = 0;//��ǰ Ű���� �����ϱ����� ����
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
		//��ǰ�� Ű���� �����ϱ� ���� ���� ��ǰ �з� �� �ְ� id���� ���Ѵ�.
		rs = st.executeQuery(sql);
		rs.next();
		id =rs.getLong(1);
		//sql�� ������ ���� ��ȯ�� ���ڵ� �¿��� ���ڵ带 �о�´�. �׸��� ù��° �÷� ���� ���� id�� �����Ѵ�.
		
		if(id==0)
			id=00001;
		else
			id =id+1;
		//������ ��ϵ� ���� �з��� ��ǰ�� �ִ� ��� ���� ��ǰ �� ���� id�� ū���� 1�� ���Ѵ�.
		Enumeration files = multi.getFileNames();
		String fname1 = (String)files.nextElement();
		String filename1 = multi.getFilesystemName(fname1);
		String fname2 = (String)files.nextElement();
		String filename2 = multi.getFilesystemName(fname2);
		//<input>�±��� type�Ӽ��� file�� ������ �ؽ�Ʈ ������ ������ŭ�� ���� ���´�.
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
		//filename2�� null�����̸� filename1���� �����Ѵ�. 
		cnt = st.executeUpdate(sql);
		
		if(cnt>0)
			out.println("��ǰ�� ����߽��ϴ�.");
		else
			out.println("��ǰ�� ��ϵ��� �ʾҽ��ϴ�.");
		
		st.close();
		con.close();
	}
	catch (SQLException e){
		out.println(e);
	}
%>
<p>
<a href="product_list.jsp">[��ǰ �������]</a> &nbsp;
<a href="product_write.jsp">[��ǰ �ø��� ������]</a>