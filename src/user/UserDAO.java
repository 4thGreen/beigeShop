package user;

import java.sql.*;
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
                } else {
                    return 0; // 비밀번호 불일치
                }
            }
            return -1; //아이디가 없음
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2;
    }

    public UserDTO view(String userID) {
        String SQL = "SELECT * FROM SHOPUSER WHERE ID = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                String id = rs.getString("ID");
                String password = rs.getString("PASSWORD");
                String name = rs.getString("NAME");
                String address = rs.getString("ADDRESS");
//                long mobileNumber = Long.parseLong(rs.getString("MOBILENUMBER"));
                String mobileNumber = rs.getString("MOBILENUMBER");
                String phoneNumber = rs.getString("PHONENUMBER");
                String email = rs.getString("EMAIL");
                UserDTO userDTO = new UserDTO(id, password, name, address, mobileNumber, phoneNumber, email);

                return userDTO;
<<<<<<< HEAD
            }

//            return -1; //아이디가 없음
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbClose();
        }
        return null;
    }


    public UserDTO viewAddress(String userID) {
        String SQL = "SELECT REGEXP_SUBSTR(ADDRESS, '[^/]+',1,1) AS POSTCODE , REGEXP_SUBSTR(ADDRESS, '[^/]+',1,2) AS ADDRESS, REGEXP_SUBSTR(ADDRESS, '[^/]+',1,3) AS EXTRAADDRESS, REGEXP_SUBSTR(ADDRESS, '[^/]+',1,4) AS DETAILADDRESS FROM SHOPUSER WHERE ID = ?";
//        ResultSetMetaData rsmd;
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String postcode = rs.getString("POSTCODE");
                String address = rs.getString("ADDRESS");
                String detailAddress = rs.getString("DETAILADDRESS");
                String extraAddress = rs.getString("EXTRAADDRESS");
//                rsmd = rs.getMetaData();
//                System.out.println("rsmd.getColumnName(1) = " + rsmd.getColumnName(1));
//                System.out.println("rsmd.getColumnName(1) = " + rsmd.getColumnName(2));
//                System.out.println("rsmd.getColumnName(1) = " + rsmd.getColumnName(3));
//                System.out.println("rsmd.getColumnName(1) = " + rsmd.getColumnName(4));


                UserDTO userDTO = new UserDTO(postcode, address, detailAddress, extraAddress);

                return userDTO;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbClose();
        }
        return null;
    }

    public UserDTO viewNumber(String userID) {
        String SQL = "SELECT REGEXP_SUBSTR(PHONENUMBER, '[^-]+',1,1)AS PHONENUMBER1 , REGEXP_SUBSTR(PHONENUMBER, '[^-]+',1,2)AS PHONENUMBER2, REGEXP_SUBSTR(PHONENUMBER, '[^-]+',1,3)AS PHONENUMBER3, REGEXP_SUBSTR(MOBILENUMBER, '[^-]+',1,1)AS MOBILENUMBER1, REGEXP_SUBSTR(MOBILENUMBER, '[^-]+',1,2)AS MOBILENUMBER2, REGEXP_SUBSTR(MOBILENUMBER, '[^-]+',1,3)AS MOBILENUMBER3 FROM SHOPUSER WHERE ID = ?";
        ResultSetMetaData rsmd1;
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String phoneNumber1 = rs.getString("PHONENUMBER1");
                String phoneNumber2 = rs.getString("PHONENUMBER2");
                String phoneNumber3 = rs.getString("PHONENUMBER3");
                String mobileNumber1 = rs.getString("MOBILENUMBER1");
                String mobileNumber2 = rs.getString("MOBILENUMBER2");
                String mobileNumber3 = rs.getString("MOBILENUMBER3");


                UserDTO userDTO = new UserDTO(phoneNumber1, phoneNumber2, phoneNumber3, mobileNumber1, mobileNumber2, mobileNumber3);

                return userDTO;
=======
>>>>>>> 29da850dee530697d34243d63d4b283fe6add4fd
            }

//            return -1; //아이디가 없음
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbClose();
        }
        return null;
    }


<<<<<<< HEAD
    public int register(UserDTO user) {
=======

    public UserDTO viewAddress(String userID) {
        String SQL = "SELECT REGEXP_SUBSTR(ADDRESS, '[^/]+',1,1) AS POSTCODE , REGEXP_SUBSTR(ADDRESS, '[^/]+',1,2) AS ADDRESS, REGEXP_SUBSTR(ADDRESS, '[^/]+',1,3) AS DETAILADDRESS, REGEXP_SUBSTR(ADDRESS, '[^/]+',1,4) AS EXTRAADDRESS FROM SHOPUSER WHERE ID = ?";
        ResultSetMetaData rsmd;
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String postcode = rs.getString("POSTCODE");
                String address = rs.getString("ADDRESS");
                String detailAddress = rs.getString("DETAILADDRESS");
                String extraAddress = rs.getString("EXTRAADDRESS");
                rsmd = rs.getMetaData();
                System.out.println("rsmd.getColumnName(1) = " + rsmd.getColumnName(1));
                System.out.println("rsmd.getColumnName(1) = " + rsmd.getColumnName(2));
                System.out.println("rsmd.getColumnName(1) = " + rsmd.getColumnName(3));
                System.out.println("rsmd.getColumnName(1) = " + rsmd.getColumnName(4));


                UserDTO userDTO = new UserDTO(postcode, address, detailAddress, extraAddress);

                return userDTO;
            }

//            return -1; //아이디가 없음
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbClose();
        }
        return null;
    }

    public UserDTO viewNumber(String userID) {
        String SQL = "SELECT REGEXP_SUBSTR(PHONENUMBER, '[^-]+',1,1)AS PHONENUMBER1 , REGEXP_SUBSTR(PHONENUMBER, '[^-]+',1,2)AS PHONENUMBER2, REGEXP_SUBSTR(PHONENUMBER, '[^-]+',1,3)AS PHONENUMBER3, REGEXP_SUBSTR(MOBILENUMBER, '[^-]+',1,1)AS MOBILENUMBER1, REGEXP_SUBSTR(MOBILENUMBER, '[^-]+',1,2)AS MOBILENUMBER2, REGEXP_SUBSTR(MOBILENUMBER, '[^-]+',1,3)AS MOBILENUMBER3 FROM SHOPUSER WHERE ID = ?";
        ResultSetMetaData rsmd1;
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String phoneNumber1 = rs.getString("PHONENUMBER1");
                String phoneNumber2 = rs.getString("PHONENUMBER2");
                String phoneNumber3 = rs.getString("PHONENUMBER3");
                String mobileNumber1 = rs.getString("MOBILENUMBER1");
                String mobileNumber2 = rs.getString("MOBILENUMBER2");
                String mobileNumber3 = rs.getString("MOBILENUMBER3");


                UserDTO userDTO = new UserDTO(phoneNumber1, phoneNumber2, phoneNumber3, mobileNumber1, mobileNumber2, mobileNumber3);

                return userDTO;
            }

//            return -1; //아이디가 없음
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbClose();
        }
        return null;
    }



    public int join(UserDTO user){
>>>>>>> 29da850dee530697d34243d63d4b283fe6add4fd
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
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbClose();
        }
        return -1;

    }

    //회원 정보 수정
    public int updateMember(UserDTO user) {
//    public int updateMember(String id, String password, String name, String address, long mobileNumber, long phoneNumber, String email) {
        String sql = "UPDATE SHOPUSER SET PASSWORD = ?, NAME = ?, ADDRESS = ?, MOBILENUMBER = ?, PHONENUMBER = ?, EMAIL = ? WHERE ID = ?";


        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUserPassword());
            pstmt.setString(2, user.getUserName());
            pstmt.setString(3, user.getUserAddress());
            pstmt.setString(4, user.getMobileNumber());
            pstmt.setString(5, user.getPhoneNumber());
            pstmt.setString(6, user.getUserEmail());
            pstmt.setString(7, user.getUserId());

            pstmt.executeUpdate();
            System.out.println("회원정보수정성공");
            return 1;
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
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("dbClose() Exception!!!");
        }
    }


}
