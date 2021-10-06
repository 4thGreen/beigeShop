package order;

public class OrderDTO {
    private Long orderNumber;   // 주문번호
    private String productImage;// 상품이미지
    private int productInfo; // 상품정보
    private int amount;         // 수량
    private int price;          // 가격
    private String orderStatus; // 주문처리상태
    private String orderCancel; // 취소/교환/환불 상태


    public OrderDTO(Long orderNumber, String orderStatus, String orderCancel, int amount, int price, int productInfo, String productImage) {
        this.orderNumber = orderNumber;
        this.orderStatus = orderStatus;
        this.orderCancel = orderCancel;
        this.amount = amount;
        this.price = price;
        this.productInfo = productInfo;
        this.productImage = productImage;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public Long getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(Long orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderCancel() {
        return orderCancel;
    }

    public void setOrderCancel(String orderCancel) {
        this.orderCancel = orderCancel;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getProductInfo() {
        return productInfo;
    }

    public void setProductInfo(int productInfo) {
        this.productInfo = productInfo;
    }
}
