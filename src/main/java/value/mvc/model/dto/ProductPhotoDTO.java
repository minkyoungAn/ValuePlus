package value.mvc.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductPhotoDTO {
	private String productNo;
	private String photo1Path;
	private String photo2Path;
	private String photo3Path;
	private String photo4Path;
	private String photo5Path;
	private String photo6Path;
	private String photo7Path;
	private String photo8Path;
	private String photo9Path;
	

	private MultipartFile file;


	public String getProductNo() {
		return productNo;
	}


	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}


	public String getPhoto1Path() {
		return photo1Path;
	}


	public void setPhoto1Path(String photo1Path) {
		this.photo1Path = photo1Path;
	}


	public String getPhoto2Path() {
		return photo2Path;
	}


	public void setPhoto2Path(String photo2Path) {
		this.photo2Path = photo2Path;
	}


	public String getPhoto3Path() {
		return photo3Path;
	}


	public void setPhoto3Path(String photo3Path) {
		this.photo3Path = photo3Path;
	}


	public String getPhoto4Path() {
		return photo4Path;
	}


	public void setPhoto4Path(String photo4Path) {
		this.photo4Path = photo4Path;
	}


	public String getPhoto5Path() {
		return photo5Path;
	}


	public void setPhoto5Path(String photo5Path) {
		this.photo5Path = photo5Path;
	}


	public String getPhoto6Path() {
		return photo6Path;
	}


	public void setPhoto6Path(String photo6Path) {
		this.photo6Path = photo6Path;
	}


	public String getPhoto7Path() {
		return photo7Path;
	}


	public void setPhoto7Path(String photo7Path) {
		this.photo7Path = photo7Path;
	}


	public String getPhoto8Path() {
		return photo8Path;
	}


	public void setPhoto8Path(String photo8Path) {
		this.photo8Path = photo8Path;
	}


	public String getPhoto9Path() {
		return photo9Path;
	}


	public void setPhoto9Path(String photo9Path) {
		this.photo9Path = photo9Path;
	}


	public MultipartFile getFile() {
		return file;
	}


	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
}
