package value.mvc.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private String productNo;
	private String divisionNo;
	private String productId;
	private int price;
	private String description;
	private String deadline;
	private int bidUnit;
	private String successfulBidder;
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getDivisionNo() {
		return divisionNo;
	}
	public void setDivisionNo(String divisionNo) {
		this.divisionNo = divisionNo;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public int getBidUnit() {
		return bidUnit;
	}
	public void setBidUnit(int bidUnit) {
		this.bidUnit = bidUnit;
	}
	public String getSuccessfulBidder() {
		return successfulBidder;
	}
	public void setSuccessfulBidder(String successfulBidder) {
		this.successfulBidder = successfulBidder;
	}
	
	
}
