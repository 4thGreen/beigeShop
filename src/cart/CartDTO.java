package cart;

public class CartDTO {
    private String productImage; //상품이미지
    private int productInfo;  //상품정보
    private int price;           //가격
    private String delivery;     //배송종류
    private String deliveryPrice;//배송비용


    public CartDTO(String productImage, int productInfo, int price, String delivery, String deliveryPrice) {
        this.productImage = productImage;
        this.productInfo = productInfo;
        this.price = price;
        this.delivery = delivery;
        this.deliveryPrice = deliveryPrice;
    }


    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public int getProductInfo() {
        return productInfo;
    }

    public void setProductInfo(int productInfo) {
        this.productInfo = productInfo;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDelivery() {
        return delivery;
    }

    public void setDelivery(String delivery) {
        this.delivery = delivery;
    }

    public String getDeliveryPrice() {
        return deliveryPrice;
    }

    public void setDeliveryPrice(String deliveryPrice) {
        this.deliveryPrice = deliveryPrice;
    }
}
