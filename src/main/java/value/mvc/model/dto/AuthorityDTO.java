package value.mvc.model.dto;

public class AuthorityDTO {
	private String username; // 유저이름
	private String role;	// 권한.
	
	public AuthorityDTO(){}
	public AuthorityDTO(String username, String role) {
		super();
		this.username = username;
		this.role = role;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	
   
}
