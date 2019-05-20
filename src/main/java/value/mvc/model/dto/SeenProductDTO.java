package value.mvc.model.dto;

public class SeenProductDTO {
	private String productNo;
	private String userId;
	private String seenTime;

	public SeenProductDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SeenProductDTO(String productNo, String userId, String seenTime) {
		super();
		this.productNo = productNo;
		this.userId = userId;
		this.seenTime = seenTime;
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

	public String getSeenTime() {
		return seenTime;
	}

	public void setSeenTime(String seenTime) {
		this.seenTime = seenTime;
	}

}
