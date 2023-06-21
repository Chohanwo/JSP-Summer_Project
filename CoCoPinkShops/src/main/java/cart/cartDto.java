package cart;

public class cartDto {

	private int CartNum;
	private String userId;
	private String productNum;
	private String productSize;
	
	public cartDto() {};
	
	public int getCartNum() {
		return CartNum;
	}

	public void setCartNum(int cartNum) {
		CartNum = cartNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getProductNum() {
		return productNum;
	}

	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}

	public String getProductSize() {
		return productSize;
	}

	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}

}
