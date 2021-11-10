package order;

public class OrderDTO {
//    private Long orderNumber;   // 주문번호
//    private String productImage;// 상품이미지
//    private int productInfo; // 상품정보
//    private int quantity;         // 수량
//    private int price;          // 가격
//    private String orderStatus; // 주문처리상태
//    private String orderCancel; // 취소/교환/환불 상태
//

    private final Long orderNumber;
    private final Long productNumber;
    private final int quantity;
    private final int price;
    private final String orderDate;
    private final String status;
    private final String request;
    private final Long tracking;
    private final String productName;
    private  String type;


    public OrderDTO(Long orderNumber, Long productNumber, int quantity, int price, String orderDate, String status, String request, Long tracking, String type, String productName) {
        this.orderNumber = orderNumber;
        this.productNumber = productNumber;
        this.quantity = quantity;
        this.price = price;
        this.orderDate = orderDate;
        this.status = status;
        this.request = request;
        this.tracking = tracking;
        this.type = type;
		this.productName = productName;
    }

    public Long getOrderNumber() {
        return orderNumber;
    }

    public Long getProductNumber() {
        return productNumber;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getPrice() {
        return price;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public String getStatus() {
        return status;
    }

    public String getRequest() {
        return request;
    }

    public Long getTracking() {
        return tracking;
    }

    public String getType() {
        return type;
    }

	public String getProductName() {
		return productName;
	}
}
