package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;
import product.ProductDB;
import product.ProductDBBean;

public class ProductDBBean {
	
private static ProductDBBean instance = new ProductDBBean();
	
	public static ProductDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{	
		Context ctx = new InitialContext();
 		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
 		return ds.getConnection();
	}
	
	public int insertProduct(ProductDB product) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql ="";
		int number=1;//if문에서 else로 1값을 주거나 초기값으로 1을 줄수 있다.
		int re = -1;
		
	
		
		try {
			conn = getConnection();
			
			sql = "select max(s_id) from beige_shop";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1)+1;
			}
			
			
			sql="insert into beige_shop(S_ID, S_NAME,s_size,s_category,s_price,s_stock,s_image) "
					+ "values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,number);
			pstmt.setString(2,HanConv.toKor(product.getS_name()));
			pstmt.setString(3,product.getS_size());
			pstmt.setString(4,HanConv.toKor(product.getS_category()));
			pstmt.setInt(5,product.getS_price());
			pstmt.setInt(6, product.getS_stock());
			pstmt.setString(7,product.getS_image());
			pstmt.executeUpdate();
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
		
	}
	
	public ArrayList<ProductDB> listProduct(String pageNumber){
	
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs=null;
		String sql = "";
		ResultSet pageSet = null;
		
		ArrayList<ProductDB> productlist = new ArrayList<ProductDB>();
		
		int dbcount=0;//글갯수
		int absolutePage=1;//첫 글 위치
		
		
		try {
			conn = getConnection();
			
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);//스크롤하면서 변동된 사항 적용+조회된 결과값 위치정보 업데이트, 페이징 처리시 필수값
			pageSet = stmt.executeQuery("select count(*)from beige_shop");
			
			if (pageSet.next()) {
				dbcount = pageSet.getInt(1);
				pageSet.close();
			}//총 글의 수
			
			if (dbcount % ProductDB.pageSize ==0) {
				ProductDB.pageCount = dbcount / ProductDB.pageSize;
			}
			
			else {
				ProductDB.pageCount = dbcount / ProductDB.pageSize+1;

			}//총 페이지 수
			
			if(pageNumber != null) {
				ProductDB.pageNum= Integer.parseInt(pageNumber);
				absolutePage = (ProductDB.pageNum-1) * ProductDB.pageSize+1;
			}
			
//			stmt = conn.createStatement();
			sql = "select*from beige_shop";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				rs.absolute(absolutePage);
				int count = 0;//페이지 카운트
				
				while(count < ProductDB.pageSize) {
					ProductDB product = new ProductDB();
					
					product.setS_id(rs.getInt(1));
					product.setS_name(rs.getString(2));
					product.setS_size(rs.getString(3));
					product.setS_category(rs.getString(4));
					product.setS_price(rs.getInt(5));
					product.setS_stock(rs.getInt(6));
					product.setS_image(rs.getString(7));
					productlist.add(product);
					
					if(rs.isLast()) {
						break;
					}else {
						rs.next();
					}
					
					count++;
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return productlist;
	}
	
	public ProductDB getProduct(int sid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql ="";
		ProductDB product = null;
		
		try {
			conn = getConnection();
			
			sql ="select * from beige_shop where s_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				product = new ProductDB();
				product.setS_id(rs.getInt(1));
				product.setS_name(rs.getString(2));
				product.setS_size(rs.getString(3));
				product.setS_category(rs.getString(4));
				product.setS_price(rs.getInt(5));
				product.setS_stock(rs.getInt(6));
				product.setS_image(rs.getString(7));
			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return product; 
	}
	
	public int deleteProduct(int s_id, String s_name) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql ="";
		int re = -1;
		String name = "";
		
		try {
			conn= getConnection();
			sql = "select s_name from beige_shop where s_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				name = rs.getString(1);
				if(!name.equals(s_name)) {
					re=0;
				}else {
					sql="delete beige_shop where s_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, s_id);
					pstmt.executeUpdate();
					re = 1;
				}
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	public int editProduct(ProductDB product) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql ="";
		int re = -1;
		String name = "";
		
		try {
			conn= getConnection();
			sql = "select s_name from beige_shop where s_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product.getS_id());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				name = rs.getString(1);
				if(!name.equals(product.getS_name())) {
					re=0;
				}else {
					sql="update beige_shop set s_name=?, s_size=?, s_category=?, s_price=?, s_stock=? where s_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, HanConv.toKor(product.getS_name()));
					pstmt.setString(2, product.getS_size());
					pstmt.setString(3, HanConv.toKor(product.getS_category()));
					pstmt.setInt(4, product.getS_price());
					pstmt.setInt(5, product.getS_stock());
					pstmt.executeUpdate();
					re = 1;
				}
			}
		
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}

}
