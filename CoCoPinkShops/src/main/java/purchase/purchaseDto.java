package purchase;

public class purchaseDto {
	
	private int purchaseNum;
	private String productNum;
	private String userId;
	private String productSize;
	
	public purchaseDto() {};
	
	
	
	public int getPurchaseNum() {
		return purchaseNum;
	}

	public void setPurchaseNum(int purchaseNum) {
		this.purchaseNum = purchaseNum;
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
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
