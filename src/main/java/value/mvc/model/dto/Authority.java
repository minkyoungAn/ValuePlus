package value.mvc.model.dto;

public class Authority {
	private String userId; // �����̸�
	private String role;	// ����.
	
	public Authority(){}
	
	public Authority(String userId, String role) {
		super();
		this.userId = userId;
		this.role = role;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	
   
}
