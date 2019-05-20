package value.mvc.model.dto;

public class NoticeDTO {
	private String noticeNo;
	private String noticeTitle;
	private String noticeWritedate;
	private String noticeContent;
	public NoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeDTO(String noticeNo, String noticeTitle, String noticeContent) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}
	
	public NoticeDTO(String noticeTitle, String noticeContent) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}
	public NoticeDTO(String noticeNo, String noticeTitle, String noticeWritedate, String noticeContent) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeWritedate = noticeWritedate;
		this.noticeContent = noticeContent;
	}

	public String getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeWritedate() {
		return noticeWritedate;
	}
	public void setNoticeWritedate(String noticeWritedate) {
		this.noticeWritedate = noticeWritedate;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	
	
	
}
