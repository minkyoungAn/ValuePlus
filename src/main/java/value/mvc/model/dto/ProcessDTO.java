package value.mvc.model.dto;

public class ProcessDTO {
	private String productNo;
	private String waybillNo;
	private String checkPurchase;
	
	
	public ProcessDTO(String productNo, String waybillNo, String checkPurchase) {
		super();
		this.productNo = productNo;
		this.waybillNo = waybillNo;
		this.checkPurchase = checkPurchase;
	}
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getWaybillNo() {
		return waybillNo;
	}
	public void setWaybillNo(String waybillNo) {
		this.waybillNo = waybillNo;
	}
	public String getCheckPurchase() {
		return checkPurchase;
	}
	public void setCheckPurchase(String checkPurchase) {
		this.checkPurchase = checkPurchase;
	}
	
	
}
