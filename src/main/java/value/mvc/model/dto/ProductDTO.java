package value.mvc.model.dto;

public class ProductDTO {
	private String productNo;
	private String productName;
	private int price;
	private String description;
	private String deadline;
	private int bidUnit;
	private String successfulBidder;
	private String divisionNo;
	private int hits;
	private String sellerId;
	private String prodName;
	private String thumbnailPath;
	private int startPrice;
	private int bidCount;
	private String categoryName;
	private int auctionDuring;
	private String userId;
	
	
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public String getThumbnailPath() {
		return thumbnailPath;
	}
	public void setThumbnailPath(String thumbnailPath) {
		this.thumbnailPath = thumbnailPath;
	}
	public ProductDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductDTO(String productNo, String productName, int price, String description, String deadline, int bidUnit,
			String successfulBidder, String divisionNo, int hits, int startPrice, int bidCount, String categoryName,
			int auctionDuring, String userId) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.price = price;
		this.description = description;
		this.deadline = deadline;
		this.bidUnit = bidUnit;
		this.successfulBidder = successfulBidder;
		this.divisionNo = divisionNo;
		this.hits = hits;
		this.startPrice = startPrice;
		this.bidCount = bidCount;
		this.categoryName = categoryName;
		this.auctionDuring = auctionDuring;
		this.userId = userId;
	}
	
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
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
	
	public String getDivisionNo() {
		return divisionNo;
	}
	public void setDivisionNo(String divisionNo) {
		this.divisionNo = divisionNo;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(int startPrice) {
		this.startPrice = startPrice;
	}
	public int getBidCount() {
		return bidCount;
	}
	public void setBidCount(int bidCount) {
		this.bidCount = bidCount;
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
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getAuctionDuring() {
		return auctionDuring;
	}
	public void setAuctionDuring(int auctionDuring) {
		this.auctionDuring = auctionDuring;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
