package project1;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import magic.board.BoardBean;
import myUtil.HanConv;

public class shopDBBean {

	private static shopDBBean instance = new shopDBBean();
	
	public static shopDBBean getInstance() {
		return instance;
	}
	
	
	public Connection getConnection() throws Exception{	
		Context ctx = new InitialContext();
 		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
 		return ds.getConnection();
	}
	
	public shopBean getBoard(int s_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql ="";
		shopBean shop = null;
		
		try {
			conn = getConnection();
			
		
			sql ="select * from shop where s_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s_id);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				shop = new shopBean();
				shop.setS_id(rs.getInt(1));
				shop.setS_name(rs.getString(2));
				shop.setS_category(rs.getString(3));
				shop.setS_price(rs.getInt(4));
				shop.setS_stock(rs.getInt(5));
				shop.setS_size(rs.getString(6));
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
		return shop; 
	}
	
	public int insertBoard(shopBean shop) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql ="";
		int number=1;//if문에서 else로 1값을 주거나 초기값으로 1을 줄수 있다.
		int re = -1;
		
		
		try {
			conn = getConnection();
			
			sql="insert into shop(s_id, s_name,s_category,s_price,s_stock,s_size) "
					+ "values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,number);
			pstmt.setInt(2, shop.getS_id());
			pstmt.setString(3, shop.getS_name());
			pstmt.setString(4, shop.getS_category());
			pstmt.setInt(5, shop.getS_price());
			pstmt.setInt(6, shop.getS_stock());
			pstmt.setString(7, shop.getS_size());
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
	
}