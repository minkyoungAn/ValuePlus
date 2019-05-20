package value.mvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import value.mvc.model.dto.QuestionDTO;
import value.mvc.model.service.CustomerService;

@Controller
public class CSController {
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("cs")
	public String customerService() {
		return "cs/csMain";
	}
	
	/*@RequestMapping("questionAndAnswer")
	public String questionAndAnswer() {
		
		return "cs/questionAndAnswer";
	}*/
	@RequestMapping("questionToAdmin")
	public String questionToAdmin() {
		return "cs/questionToAdmin";
	}
	@RequestMapping("questionToAdmin2")
	@ResponseBody
	public int questionToAdmin(HttpServletRequest request,QuestionDTO questionDTO) {
		String userId=request.getParameter("userId");
		String questionTitle =request.getParameter("questionTitle");
		String questionContent = request.getParameter("questionContent");
		questionDTO.setUserId(userId);
		questionDTO.setQuestionTitle(questionTitle);
		questionDTO.setQuestionContent(questionContent);
		customerService.insertQuestion(questionDTO);
		return 1;
	}
	
	@RequestMapping("notice")
	public String notice() {
		
		return "cs/notice";
	}
}
