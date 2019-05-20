package value.mvc.model.dto;

public class BuyingListDTO {
	private String productNo;
	private String userId;
	public BuyingListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BuyingListDTO(String productNo, String userId) {
		super();
		this.productNo = productNo;
		this.userId = userId;
	}

	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
