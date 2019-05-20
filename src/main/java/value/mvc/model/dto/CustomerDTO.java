package value.mvc.model.dto;

public class CustomerDTO {
   private String id;
   private String pw;
   private String name;
   private String email;
   private String birth;
   private String zipNo;
   private String roadAddrPart1;
   private String addrDetail;
   private String phone;
   private String grade;
   private String address;
   private int sellCount;
   private int buyCount;
  
public int getSellCount() {
	return sellCount;
}
public void setSellCount(int sellCount) {
	this.sellCount = sellCount;
}
public int getBuyCount() {
	return buyCount;
}
public void setBuyCount(int buyCount) {
	this.buyCount = buyCount;
}
public String getAddress() {
      return address;
    }
    public void setAddress(String address) {
      this.address = address;
    }
	public CustomerDTO() {}
	public CustomerDTO(String id, String pw, String name, String email, String birth, String zipNo, String roadAddrPart1,
			String addrDetail, String phone, String grade, String address, int sellCount, int buyCount) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.birth = birth;
		this.zipNo = zipNo;
		this.roadAddrPart1 = roadAddrPart1;
		this.addrDetail = addrDetail;
		this.phone = phone;
		this.grade = grade;
		this.address = address;
		this.sellCount = sellCount;
		this.buyCount = buyCount;
	}   
	public CustomerDTO(String id, String pw, String name, String email, String birth, String zipNo,
	         String roadAddrPart1, String addrDetail, String phone, String grade, String address) {
      super();
      this.id = id;
      this.pw = pw;
      this.name = name;
      this.email = email;
      this.birth = birth;
      this.zipNo = zipNo;
      this.roadAddrPart1 = roadAddrPart1;
      this.addrDetail = addrDetail;
      this.phone = phone;
      this.grade = grade;
      this.address = address;
   }
   public CustomerDTO(String id, String pw, String name, String email, String birth, String zipNo,
         String roadAddrPart1, String addrDetail, String phone) {
      super();
      this.id = id;
      this.pw = pw;
      this.name = name;
      this.email = email;
      this.birth = birth;
      this.zipNo = zipNo;
      this.roadAddrPart1 = roadAddrPart1;
      this.addrDetail = addrDetail;
      this.phone = phone;
   }
   public CustomerDTO(String id, String email, String zipNo, String roadAddrPart1, String addrDetail,
         String phone) {
      super();
      this.id = id;
      this.email = email;
      this.zipNo = zipNo;
      this.roadAddrPart1 = roadAddrPart1;
      this.addrDetail = addrDetail;
      this.phone = phone;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getBirth() {
      return birth;
   }
   public void setBirth(String birth) {
      this.birth = birth;
   }
   
   public String getZipNo() {
      return zipNo;
   }


   public void setZipNo(String zipNo) {
      this.zipNo = zipNo;
   }


   public String getRoadAddrPart1() {
      return roadAddrPart1;
   }


   public void setRoadAddrPart1(String roadAddrPart1) {
      this.roadAddrPart1 = roadAddrPart1;
   }


   public String getAddrDetail() {
      return addrDetail;
   }


   public void setAddrDetail(String addrDetail) {
      this.addrDetail = addrDetail;
   }


   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   public String getGrade() {
      return grade;
   }
   public void setGrade(String grade) {
      this.grade = grade;
   }


   public String getPw() {
      return pw;
   }


   public void setPw(String pw) {
      this.pw = pw;
   }
   
   
}