package value.mvc.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class UpLoadDTO {
   private String name;
   
   private String fileName;
   private long fileSize;
   
   private MultipartFile file; //<input type="file" name="file">
   	
	public UpLoadDTO() {
	super();
	// TODO Auto-generated constructor stub
	}
	public UpLoadDTO(String name, String fileName, long fileSize, MultipartFile file) {
	super();
	this.name = name;
	this.fileName = fileName;
	this.fileSize = fileSize;
	this.file = file;
}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public long getFileSize() {
		return fileSize;
	}
	
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	
	public MultipartFile getFile() {
		return file;
	}
	
	public void setFile(MultipartFile file) {
		this.file = file;
	}
   
   
}
