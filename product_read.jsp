<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" charset="utf-8">
	function view(temp) {
		filename = "http://localhost:8181/jsp/image/"+temp;
		i=window.open(filename, "win", "height=350,width=450,toolbar=0,menubar=0,scrollbars=1,resizable=1,status=0");
	}
</script>
</head>
<body>
	<%
		String ca="";
		String pn="";
		
		if(request.getParameter("cat") !=null)
			if(!(request.getParameter("cat").equals("")))
				ca=request.getParameter("cat");
		if(request.getParameter("sn") !=null)
			if(!(request.getParameter("sn").equals("")))
				ca=request.getParameter("sn");
		
		String sql = null;
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		long id = Long.parseLong(request.getParameter("id"));
		
		String url = "http://localhost:8181jsp/upload/";
		String small = null;
		
		out.print("[<a href=\"product_list.jsp?go="+request.getParameter("go")+"&cat="+ca+"&pname="+pn+"\">상품목록으로</a>]");
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(ClassNotFoundException e){
			out.println(e);
		}
		
		try{
			con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
		}catch(SQLException e){
			out.println(e);
		}
		
		try{
			st=con.createStatement();
			sql = "select*from beige_shop where s_id="+id;
			rs=st.executeQuery(sql);
			if(!(rs.next())){
				out.println("해당 내용이 없습니다.");
			}else{
				small=url+rs.getString("s_simage");
				out.println("<table width=500><tr><th rowspan=3>");
						
				out.println("<a href=JavaScript:view(\""+rs.getString("s_limage")+"\")>");
				out.println("<img width=100 height=100 src="+small+">");
				out.println("<br>확대</a></th>");
				out.println("<th>"+rs.getString("sn")+"("+rs.getLong("m_id")+")");
				out.println("</th></tr>");
				out.println("<tr><td align=right>");
				out.println("판매가: "+rs.getString("price")+"원");
				out.println("</td></tr>");
				out.println("</table>");
				
			}
			rs.close();
			st.close();
			con.close();
		}catch(SQLException e){
			out.println(e);
		}
	%>
</body>
</html>