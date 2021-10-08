package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private ResultSet rs;
    private PreparedStatement pstmt;
    private Connection conn;
    private List<String> list = new ArrayList<>();

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

    public List<String> view(String userID) {
        String SQL = "SELECT * FROM SHOPUSER WHERE ID = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                String id = rs.getString("ID");
                String password = rs.getString("PASSWORD");
                String name = rs.getString("NAME");
                String address = rs.getString("ADDRESS");
//                long mobileNumber = Long.parseLong(rs.getString("MOBILENUMBER"));
                String mobileNumber = rs.getString("MOBILENUMBER");
                String phoneNumber = rs.getString("PHONENUMBER");
                String email = rs.getString("EMAIL");
                list.add(id);
                list.add(password);
                list.add(name);
                list.add(address);
                list.add(mobileNumber);
                list.add(phoneNumber);
                list.add(email);
            }

//            return -1; //아이디가 없음
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbClose();
        }
        return list;
    }


    public int join(UserDTO user){
        String SQL = "INSERT INTO SHOPUSER VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserId());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserAddress());
            pstmt.setString(5, user.getPhoneNumber());
            pstmt.setString(6, user.getMobileNumber());
            pstmt.setString(7, user.getUserEmail());
            return pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        } finally {
            dbClose();
        }
        return -1;

    }

    //회원 정보 수정
    public int updateMember(UserDTO user) {
//    public int updateMember(String id, String password, String name, String address, long mobileNumber, long phoneNumber, String email) {
        String sql = "UPDATE SHOPUSER SET PASSWORD = ?, NAME = ?, ADDRESS = ?, MOBILENUMBER = ?, PHONENUMBER = ?, EMAIL = ? WHERE ID = ?" ;



        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUserPassword());
            pstmt.setString(2, user.getUserName());
            pstmt.setString(3, user.getUserAddress());
            pstmt.setString(4, user.getPhoneNumber());
            pstmt.setString(5, user.getMobileNumber());
            pstmt.setString(6, user.getUserEmail());
            pstmt.setString(7, user.getUserId());

            pstmt.executeUpdate();
            System.out.println("회원정보수정성공");
            return  1;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("updateMember() Exception!!!");
        } finally {
            dbClose();
        }
        return -1;
    }

    public void dbClose() {
        try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("dbClose() Exception!!!");
        }
    }
}
