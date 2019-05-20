package value.mvc.model.dto;

public class TransactionalInformationDTO {
	private String customerId;
	private String prodImg;
	private String bidderDate;
	private String prodName;
	private int nowPrice;
	private String prodState;
	private String productNo;
	private String sellId;
	
	
	
	public String getSellId() {
		return sellId;
	}



	public void setSellId(String sellId) {
		this.sellId = sellId;
	}

	

	public TransactionalInformationDTO() {}
	
	
	
	public TransactionalInformationDTO(String customerId, String productNo) {
		super();
		this.customerId = customerId;
		this.productNo = productNo;
	}



	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getProdImg() {
		return prodImg;
	}
	public void setProdImg(String prodImg) {
		this.prodImg = prodImg;
	}
	public String getBidderDate() {
		return bidderDate;
	}
	public void setBidderDate(String bidderDate) {
		this.bidderDate = bidderDate;
	}
	public int getNowPrice() {
		return nowPrice;
	}
	public void setNowPrice(int nowPrice) {
		this.nowPrice = nowPrice;
	}
	public String getProdState() {
		return prodState;
	}
	public void setProdState(String prodState) {
		this.prodState = prodState;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	
	

}
