<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String pwd = "tiger";
	String sql = "select * from beige_shop";
%>
<body>

	
	<p>
		상품 목록
	</p>

	<form method="post" name="search" action="product_list.jsp">
		<table	width=95%>
			<tr>
				<td align="right">
					상품명으로 찾기
					<input type="text" name="sn">
					<input type="submit" value="검색">
				</td>
			</tr>
			<tr>
				[<a href="main.jsp">메인으로</a>]
				<a href="product_list.jsp">전체</a>-
				<a href="product_list.jsp?cat=shirt">상의</a>-
				<a href="product_list.jsp?cat=pants">하의</a>-
				<a href="product_list.jsp?cat=onepiecs">원피스</a>-
				<a href="product_list.jsp?cat=accessory">악세사리</a>
			</tr>
		</table>
	</form>
	
	<center>
		<table width="95%" cellpadding="4" cellspacing="4" style="font-size:10pt">
			<tr>
				<th>
					번호
				</th>
				<th>
					상품명
				</th>
				<th>
					판매가
				</th>
				<th>
					재고량
				</th>
				<th>
					사이즈
				</th>
			</tr>
		<%
			String cond ="";
			String ca = "";
			String sn="";
			
			if(request.getParameter("cat")!=null){
				if(!(request.getParameter("cat").equals(""))){
					ca=request.getParameter("cat");
					cond = " where s_category='"+ca+"'";
				}
			}
			//if(request.getParameter("sn")!=null){
				//if(!(request.getParameter("sn").equals(""))){
					//sn=request.getParameter("sn");
					//cond = " where s_name like '%"+sn+"%'";
			//	}
		//	}
			
			Vector pname = new Vector();
			Vector sname = new Vector();
			Vector keyid = new Vector();
			Vector cat = new Vector();
			Vector dprice = new Vector();
			//Vector inputdate = new Vector();
			Vector stock = new Vector();
			Vector size = new Vector();
			String category = null;
			
			long id = 0;
			
			NumberFormat nf = NumberFormat.getInstance();
			String downprice=null;
			
			int where =1;
			int totalgroup=0;
			int maxpages=2;
			int startpage=1;
			int endpage=startpage+maxpages-1;
			int wheregroup=1;
			if(request.getParameter("go")!=null){
				where = Integer.parseInt(request.getParameter("go"));
				wheregroup = (where-1)/maxpages+1;
				startpage =(wheregroup-1)*maxpages+1;
				where = startpage;
				endpage=startpage+maxpages-1;
			}
			else if(request.getParameter("gogroup")!=null){
				wheregroup =Integer.parseInt(request.getParameter("gogroup"));
				startpage =(wheregroup-1)*maxpages+1;
				where = startpage;
				endpage=startpage+maxpages-1;
			}
			int nextgroup = wheregroup+1;
			int priorgroup = wheregroup-1;
			
			int startrow=0;
			int endrow=0;
			int maxrows=5;
			int totalrows=0;
			int totalpages=0;
			Connection con = null;
			Statement st = null;
			ResultSet rs = null;
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			}catch(ClassNotFoundException e){
				out.println(e);
			}
			try{
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			}catch(SQLException e){
				out.println(e);
			}
			try{
				st = con.createStatement();
				String sql = "select*from beige_shop order by s_id";
				//sql = sql+cond+"order by s_id";
				rs= st.executeQuery(sql);
				if(!(rs.next())){
					out.println("상품이 없습니다.");
				}
				else{
					do{
						keyid.addElement(new Long(rs.getLong("s_id")));
						cat.addElement(rs.getString("s_category"));
						sname.addElement(rs.getString("s_name"));
						dprice.addElement(new Integer(rs.getInt("s_price")));
						size.addElement(rs.getString("s_size"));
						//String idate = rs.getString("inputdate");
						//idate = idate.substring(0,8);
						//inputdate.addElement(idate);
						stock.addElement(new Integer(rs.getInt("s_stock")));
					}while(rs.next());
					
					totalrows = pname.size();
					totalpages = (totalrows-1)/maxrows +1;
					startrow = (where-1)*maxrows;
					endrow = startrow+maxrows-1;
					if(endrow>=totalrows)
						endrow = totalrows-1;
					totalgroup = (totalpages-1)/maxpages+1;
					if(endpage>totalpages)
						endpage=totalpages;
					for(int j=startrow; j<=endrow; j++){
						id=((Long)keyid.elementAt(j)).longValue();
						downprice=nf.format(((Integer)dprice.elementAt(j)).intValue());
						switch (Integer.parseInt((String)cat.elementAt(j))){
						case 11:
							category="상의";
							break;
						case 22:
							category="하의";
							break;
						case 33:
							category="원피스";
							break;
						case 44:
							category="액세사리";
							break;
						default:
							break;
						}
						out.println("<tr>");
						out.println("<td>"+j+1+"</td>");
						out.println("<td> <a href=\"product_read.jsp?id="+id+"&go="+where);
						out.println("&cat="+ca+"&name="+sname+"\">"+sname.elementAt(j));
						out.println("</a></td>");
						out.println("<td>"+id+"</td>");
					//	out.println("<td>"+inputdate.elementAt(j)+"</td>");
						out.println("<td>"+downprice+"</td>");
						out.println("<td>"+stock.elementAt(j)+"</td>");
						out.println("<td>"+size+"</td>");
						out.println("<td>"+category+"</td>");
					}
					rs.close();
				}
				out.println("</table>");
				st.close();
				con.close();
			}catch(SQLException e){
				out.println(e);
			}
			if(wheregroup>1){
				out.print("[<a href=\"product_list.jsp?gogroup=1&cat="+ca+"&sname="+sname+"\">처음</a>]");
				out.print("[<a href=\"product_list.jsp?gogroup="+priorgroup+"&cat="+ca+"&sname="+sname+"\">이전</a>]");
			}else{
				out.println("[처음]");
				out.println("[이전]");
			}
			if(totalrows !=0){
				for(int k=startpage; k<=endpage; k++){
					if(k==where)
						out.println("["+k+"]");
					else{
						out.print("[<a href=\"product_list.jsp?gogroup="+k+"&cat="+ca+"&sname="+sname+"\">"+k+"</a>]");
					}
				}
			}
			if(wheregroup < totalgroup){
						out.print("[<a href=\"product_list.jsp?gogroup="+nextgroup+"&cat="+ca+"&sname="+sname+"\">다음</a>]");
						out.print("[<a href=\"product_list.jsp?gogroup="+totalgroup+"&cat="+ca+"&sname="+sname+"\">마지막</a>]");
			}
			else{
				out.println("[다음]");
				out.println("[마지막]");
			}
			out.println("전체상품수 :"+totalrows);
		%>	
	</center> 
</body>
</html>