package order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    private ResultSet rs;
    private PreparedStatement pstmt;
    private Connection conn;
    private List<String> list = new ArrayList<>();
    private List<OrderDTO> orderDTOList = new ArrayList<>();

    public OrderDAO() {
        try {
            String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
            String dbID = "scott";
            String dbPassword = "tiger";
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<OrderDTO> view(String userID, String inputOrderDate) {
//        List<OrderDTO> orderDTOList = null;
        String SQL = "SELECT * FROM ORDERLIST WHERE ID = ? AND ORDERDATE = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            pstmt.setString(2, inputOrderDate);
            rs = pstmt.executeQuery();
            while (rs.next()) {

                String id = rs.getString("ID");
                Long orderNo = rs.getLong("ORDERNO");
                Long productNo = rs.getLong("PRODUCTNO");
                int quantity = rs.getInt("QUANTITY");
                int price = rs.getInt("PRICE");
                String orderDate = rs.getString("ORDERDATE");
                String status = rs.getString("STATUS");
                String request = rs.getString("REQUEST");
                Long tracking = rs.getLong("TRACKING");
                OrderDTO orderDTO = new OrderDTO(orderNo, productNo, quantity, price, orderDate, status, request, tracking);
                orderDTOList.add(orderDTO);
                System.out.println("orderDTOList.size = " + orderDTOList.size());
            }
            return orderDTOList;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbClose();
        }
        return null;
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
