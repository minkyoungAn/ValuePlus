package value.mvc.model.dto;

public class QuestionDTO {
	private String questionNo;
	private String id;
	private String questiontitle;
	private String questionContent;
	private String questionWriteDate;
	private String answerContent;
	
	
	public String getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(String questionNo) {
		this.questionNo = questionNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQuestiontitle() {
		return questiontitle;
	}
	public void setQuestiontitle(String questiontitle) {
		this.questiontitle = questiontitle;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public String getQuestionWriteDate() {
		return questionWriteDate;
	}
	public void setQuestionWriteDate(String questionWriteDate) {
		this.questionWriteDate = questionWriteDate;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	
	
}
