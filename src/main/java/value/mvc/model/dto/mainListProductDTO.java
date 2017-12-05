package value.mvc.model.dto;

import org.springframework.stereotype.Component;

/**
 * 전체 상품 리스트
 * @author minky
 *
 */
public class mainListProductDTO {
	private String productNo;
	private String thumbnailPath;
	private String productName;
	private int price;
	private int countBidder;
	private String id;
	private String deadline;
	
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getThumbnailPath() {
		return thumbnailPath;
	}
	public void setThumbnailPath(String thumnailPath) {
		this.thumbnailPath = thumnailPath;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCountBidder() {
		return countBidder;
	}
	public void setCountBidder(int countBidder) {
		this.countBidder = countBidder;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	
	
}
