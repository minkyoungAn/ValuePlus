package value.mvc.model.dto;

public class AccountDTO {
	private String userId;
	private String bankName;
	private String accountHolder;
	private String accountNo;
	
	public AccountDTO() {}
	
	
	
	public AccountDTO(String userId, String bankName, String accountNo) {
		super();
		this.userId = userId;
		this.bankName = bankName;
		this.accountNo = accountNo;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getAccountHolder() {
		return accountHolder;
	}
	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	
}
