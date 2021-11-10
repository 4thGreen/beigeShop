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

    public List<OrderDTO> viewOrderOneDate(String userID, String inputOrderDate) {
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
//                OrderDTO orderDTO = new OrderDTO(orderNo, productNo, quantity, price, orderDate, status, request, tracking, );
//                orderDTOList.add(orderDTO);
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


    public List<OrderDTO> viewOrderTwoDate(String userID, String OrderStartDate, String OrderEndDate) {
//        List<OrderDTO> orderDTOList = null;
//        String SQL = "SELECT * FROM ORDERLIST WHERE ID = ? AND ORDERDATE BETWEEN ? AND ?";
        String SQL = "select o.m_id" +
                "     , o_id" +
                "     , o.s_id" +
                "     , o_quantity" +
                "     , o_price" +
                "     , TO_CHAR(o_date, 'yyyy-mm-dd hh24:mi:ss') AS o_date" +
                "     , o_status" +
                "     , o_comment" +
                "     , o_ship" +
                "     , o_type" +
                "     , s.s_name" +
                "     from beige_order o, beige_shop s" +
                "     WHERE m_id = ? AND o.s_id = s.s_id " +
                "    AND o_date BETWEEN TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS')";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            pstmt.setString(2, OrderStartDate);
            pstmt.setString(3, OrderEndDate);
            rs = pstmt.executeQuery();
            while (rs.next()) {

                String id = rs.getString("m_id");
                Long orderNo = rs.getLong("o_id");
                Long productNo = rs.getLong("s_id");
                int quantity = rs.getInt("o_quantity");
                int price = rs.getInt("o_price");
                String orderDate = rs.getString("o_date");
                String status = rs.getString("o_status");
                String request = rs.getString("o_comment");
                Long tracking = rs.getLong("o_ship");
                String type = rs.getString("o_type");
                String productName = rs.getString("s_name");
                OrderDTO orderDTO = new OrderDTO(orderNo, productNo, quantity, price, orderDate, status, request, tracking, type, productName);
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


    public OrderDTO orderDetailView(long orderNumber) {
//        List<OrderDTO> orderDTOList = null;
        String SQL = "SELECT * FROM beige_order o, beige_shop s WHERE o_id = ? AND o.s_id = s.s_id";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setLong(1, orderNumber);

            rs = pstmt.executeQuery();
            if (rs.next()) {

                String id = rs.getString("m_id");
                Long orderNo = rs.getLong("o_id");
                Long productNo = rs.getLong("s_id");
                int quantity = rs.getInt("o_quantity");
                int price = rs.getInt("o_price");
                String orderDate = rs.getString("o_date");
                String status = rs.getString("o_status");
                String request = rs.getString("o_comment");
                Long tracking = rs.getLong("o_ship");
                String type = rs.getString("o_type");
                String productName = rs.getString("s_name");
                OrderDTO orderDTO = new OrderDTO(orderNo, productNo, quantity, price, orderDate, status, request, tracking, type, productName);
//                orderDTOList.add(orderDTO);
//                System.out.println("orderDTOList.size = " + orderDTOList.size());
                return orderDTO;
            }

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
