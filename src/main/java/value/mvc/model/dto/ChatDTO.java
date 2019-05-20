package value.mvc.model.dto;

public class ChatDTO {
	int chatID;
	String fromID;
	String toID;
	String chatContent;
	String chatTime;
	int number;
	int chatread;

	public int getChatread() {
		return chatread;
	}

	public void setChatread(int chatread) {
		this.chatread = chatread;
	}

	public ChatDTO() {
		// TODO Auto-generated constructor stub
	}

	public ChatDTO(String fromID, String toID, String chatContent) {
		super();
		this.fromID = fromID;
		this.toID = toID;
		this.chatContent = chatContent;
	}

	public ChatDTO(String fromID, String toID, int number) {
		super();
		this.fromID = fromID;
		this.toID = toID;
		this.number = number;
	}

	public ChatDTO(String fromID, String toID, int chatID, String string) {
		super();
		this.fromID = fromID;
		this.toID = toID;
		this.chatContent = chatContent;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getChatID() {
		return chatID;
	}

	public void setChatID(int chatID) {
		this.chatID = chatID;
	}

	public String getFromID() {
		return fromID;
	}

	public void setFromID(String fromID) {
		this.fromID = fromID;
	}

	public String getToID() {
		return toID;
	}

	public void setToID(String toID) {
		this.toID = toID;
	}

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public String getChatTime() {
		return chatTime;
	}

	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}

}
