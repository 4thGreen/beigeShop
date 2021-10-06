package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private ResultSet rs;
    private PreparedStatement pstmt;
    private Connection conn;

    public UserDAO() {
        try {
            String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
            String dbID = "scott";
            String dbPassword = "tiger";
            Class.forName("oracle.jdbc.OracleDriver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public int login(String userID, String userPassword) {
        String SQL = "SELECT PASSWORD FROM SHOPUSER WHERE ID = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString(1).equals(userPassword)) {
                    return 1; // 로그인 성공
                }else {
                    return 0; // 비밀번호 불일치
                }
            }
            return -1; //아이디가 없음
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2;
    }


    public int join(UserDTO user){
        String SQL = "INSERT INTO SHOPUSER VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserId());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserAddress());
            pstmt.setLong(5, user.getPhoneNumber());
            pstmt.setLong(6, user.getMobileNumber());
            pstmt.setString(7, user.getUserEmail());
            return pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;

    }

    //회원 정보 수정
    public int updateMember(UserDTO user) {
        String sql = "UPDATE SHOPUSER SET ID = ?, PASSWORD = ?, NAME = ?, ADDRESS = ?, MOBILENUMBER = ?, PHONENUMBER = ?, EMAIL = ? ";
        int succ = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUserId());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserAddress());
            pstmt.setLong(5, user.getPhoneNumber());
            pstmt.setLong(6, user.getMobileNumber());
            pstmt.setString(7, user.getUserEmail());
            succ = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("updateMember() Exception!!!");
        } finally {
            dbClose();
        }
        return succ;
    } //updateMember()

    public void dbClose() {
        try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("dbClose() Exception!!!");
        }
    } //dbClose()
}
