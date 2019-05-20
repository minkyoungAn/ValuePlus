package value.mvc.model.dto;

public class QuestionDTO {
	private String questionNo;
	private String userId;
	private String questionTitle;
	private String questionContent;
	private String questionWritedate;
	private String answerContent;
	private String questionProcess;
	public QuestionDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QuestionDTO(String questionNo, String userId, String questionTitle, String questionContent,
			String questionWritedate, String answerContent, String questionProcess) {
		super();
		this.questionNo = questionNo;
		this.userId = userId;
		this.questionTitle = questionTitle;
		this.questionContent = questionContent;
		this.questionWritedate = questionWritedate;
		this.answerContent = answerContent;
		this.questionProcess = questionProcess;
	}
	public String getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(String questionNo) {
		this.questionNo = questionNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public String getQuestionWritedate() {
		return questionWritedate;
	}
	public void setQuestionWritedate(String questionWritedate) {
		this.questionWritedate = questionWritedate;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	public String getQuestionProcess() {
		return questionProcess;
	}
	public void setQuestionProcess(String questionProcess) {
		this.questionProcess = questionProcess;
	}
	
	
	
	
}
