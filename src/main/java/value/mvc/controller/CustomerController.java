package value.mvc.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import value.mvc.model.dto.AccountDTO;
import value.mvc.model.dto.CustomerDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.QuestionDTO;
import value.mvc.model.dto.TransactionalInformationDTO;
import value.mvc.model.service.CustomerService;
import value.mvc.model.service.ProductService;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	@Autowired
	private ProductService productService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("waybillNumber")
	public String waybillNumber() {
		return "waybillNumber";
	}

	@RequestMapping("jusoPopup")
	public String juso() {
		return "jusoPopup";
	}

	@RequestMapping("findMain")
	public String findMain() {
		return "findAccount/findMain";
	}

	/*
	 * @RequestMapping("findId") public String findId() { return
	 * "findAccount/findId"; }
	 * 
	 * @RequestMapping("findPassword") public String findPassword() { return
	 * "findAccount/findPassword"; }
	 */
	@RequestMapping("findIdByEmail")
	public ModelAndView findIdByEmail(String name) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("findAccount/findMain");
		String id = customerService.findId(name);
		mv.addObject("findState", "sucId");
		mv.addObject("id", id);
		return mv;
	}

	@RequestMapping("findPwByEmail")
	public ModelAndView findPwByEmail(String id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("findAccount/findMain");
		String id2 = customerService.findPw(id);
		mv.addObject("findState", "sucPw");
		mv.addObject("id", id2);
		return mv;
	}

	@RequestMapping("updatePw")
	public String updatePw(HttpServletRequest request, CustomerDTO customerDTO) {
		String encodePassword = passwordEncoder.encode(customerDTO.getPw());
		customerDTO.setPw(encodePassword);
		String id = request.getParameter("findId");
		customerDTO.setId(id);
		customerService.updatePw(customerDTO);
		return "main/main";
	}

	@RequestMapping("test")
	public ModelAndView test() {
		int test = customerService.test();
		ModelAndView mv = new ModelAndView();
		mv.addObject("test", test);
		mv.setViewName("test2");
		return mv;
	}

	@RequestMapping("customer/test")
	public String test2() {
		return "customer/test";
	}

	// 이메일 인증
	@RequestMapping("emailAuth")
	public ModelAndView emailAuth(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String toat = request.getParameter("toat");
		String authNum = "";
		authNum = RandomNum();
		sendEmail(email, authNum);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("emailAuth");
		mv.addObject("email", email);
		mv.addObject("toat", toat);
		mv.addObject("authNum", authNum);
		return mv;
	}

	private void sendEmail(String email, String authNum) {
		String host = "smtp.gmail.com";
		String subject = "고갱이 인증번호 전달";
		String fromName = "고갱이 관리자 김형민";
		String from = "mingeein@gmail.com";
		String to1 = email;
		String content = "인증번호 [ " + authNum + "]";
		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.setProperty("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthenication() {
					return new PasswordAuthentication(from, "65wjstks!");
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			InternetAddress[] address1 = { new InternetAddress(to1) };
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=UTF-8");
			Transport trans = mailSession.getTransport("smtp");
			trans.connect("smtp.gmail.com", 587, from, "65wjstks!");
			trans.sendMessage(msg, msg.getAllRecipients());
		} catch (MessagingException m) {
			m.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}

	// 회원 가입 페이지 이동
	@RequestMapping("joinCustomer")
	public String join() {
		return "register/joinCustomer";
	}

	// 회원 가입 페이지 이동
	@RequestMapping("join")
	public String joinCustomer(CustomerDTO customerDTO, HttpServletRequest request) {
		customerService.joinCustomer(customerDTO);
		return "main/main";
	}

	// 로그인 폼
	@RequestMapping("loginForm")
	public String loginForm() {
		return "loginForm";
	}

	// 아이디 중복확인
	@RequestMapping("idcheckAjax")
	@ResponseBody
	public String idCheckAjax(HttpServletRequest request) {
		return customerService.idCheck(request.getParameter("id"));
	}

	@RequestMapping("mySellList")
	@ResponseBody
	public List<TransactionalInformationDTO> selectSellList(String id) {
		List<TransactionalInformationDTO> list = customerService.selectSelling(id);
		return list;
	}

	@RequestMapping("myBuyList")
	@ResponseBody
	public List<TransactionalInformationDTO> selectBuyList(String id) {
		List<TransactionalInformationDTO> list = customerService.selectBuying(id);
		return list;
	}

	@RequestMapping("mypage")
	public String mypage() {
		return "myPage/myPage";
	}

	@RequestMapping("/myAccount")
	@ResponseBody
	public List<AccountDTO> selectAccount(String userId) {
		AccountDTO dto = customerService.selectAccount(userId);
		List<AccountDTO> list = new ArrayList<AccountDTO>();
		list.add(dto);
		return list;
	}

	@RequestMapping("/updateAccount")
	@ResponseBody
	public List<AccountDTO> updateAccount(AccountDTO dto) {
		customerService.updateAccount(dto);
		AccountDTO seldto = customerService.selectAccount(dto.getUserId());
		List<AccountDTO> list = new ArrayList<AccountDTO>();
		list.add(seldto);
		return list;
	}

	@RequestMapping("/myProfile")
	@ResponseBody
	public List<CustomerDTO> myProfile(String id) {
		CustomerDTO cusDTO = customerService.selectCustomerById(id);
		List<CustomerDTO> list = new ArrayList<CustomerDTO>();
		list.add(cusDTO);
		return list;
	}

	@RequestMapping("/updateProfile")
	@ResponseBody
	public List<CustomerDTO> updateProfile(CustomerDTO customerDTO) {
		customerService.updateProfile(customerDTO);
		CustomerDTO cusDTO = customerService.selectCustomerById(customerDTO.getId());
		List<CustomerDTO> list = new ArrayList<CustomerDTO>();
		list.add(cusDTO);
		return list;
	}

	@RequestMapping("/myQuestionList")
	@ResponseBody
	public List<QuestionDTO> myQuestion(String userId) {
		List<QuestionDTO> list = customerService.selectQuestionById(userId);
		return list;
	}

	@RequestMapping("/myQuestionDetail")
	@ResponseBody
	public List<QuestionDTO> myQuestionDetail(String no) {
		QuestionDTO dto = customerService.selectOneQuestion(no);
		List<QuestionDTO> list = new ArrayList<QuestionDTO>();
		list.add(dto);
		return list;
	}

	@RequestMapping("/myInterestProd")
	@ResponseBody
	public List<ProductDTO> myInterestProd(String userId) {
		List<ProductDTO> list = customerService.selectInterest(userId);
		return list;
	}

	@RequestMapping("/myTodayProd")
	@ResponseBody
	public List<ProductDTO> myTodayProd(String userId) {
		List<ProductDTO> list = customerService.selectToday(userId);
		return list;
	}

	@RequestMapping("/updateState")
	@ResponseBody
	public List<TransactionalInformationDTO> updateState(TransactionalInformationDTO dto) {
		productService.updateState(dto);
		List<TransactionalInformationDTO> list = customerService.selectBuying(dto.getCustomerId());
		return list;
	}

	@RequestMapping("updatePwByUser")
	@ResponseBody
	public void updatePwByUser(CustomerDTO customerDTO, HttpServletRequest request) {
		String pw = request.getParameter("pw");
		String id = request.getParameter("id");
		String encodePassword = passwordEncoder.encode(pw);
		customerDTO.setPw(encodePassword);
		customerDTO.setId(id);
		// System.out.println("id는 " + id + " 비밀번호는 " + encodePassword);
		customerService.updatePwByUser(customerDTO);
	}

	@RequestMapping("mySellWaitList")
	@ResponseBody
	public List<TransactionalInformationDTO> selectSellWaitList(String id) {
		List<TransactionalInformationDTO> list = customerService.selectWaitSelling(id);
		return list;
	}
}
