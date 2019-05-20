package value.mvc.model.dto;

public class DeliveryDTO {
	private String productNo;
	private String deliveryCompany;
	private String deliveryNo;
	
	public DeliveryDTO() {
		super();
	}
	public DeliveryDTO(String productNo, String deliveryCompany, String deliveryNo) {
		super();
		this.productNo = productNo;
		this.deliveryCompany = deliveryCompany;
		this.deliveryNo = deliveryNo;
	}
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public DeliveryDTO(String deliveryCompany, String deliveryNo) {
		super();
		this.deliveryCompany = deliveryCompany;
		this.deliveryNo = deliveryNo;
	}


	public String getDeliveryCompany() {
		return deliveryCompany;
	}


	public void setDeliveryCompany(String deliveryCompany) {
		this.deliveryCompany = deliveryCompany;
	}


	public String getDeliveryNo() {
		return deliveryNo;
	}


	public void setDeliveryNo(String deliveryNo) {
		this.deliveryNo = deliveryNo;
	}
	
	
}
