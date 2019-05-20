package value.mvc.model.dto;

public class InterestDTO {

	private String productNo;
	private String userID;

	public InterestDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public InterestDTO(String productNo, String userID) {
		super();
		this.productNo = productNo;
		this.userID = userID;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

}
