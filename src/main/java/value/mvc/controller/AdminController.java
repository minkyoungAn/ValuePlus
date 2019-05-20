package value.mvc.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import value.mvc.model.dto.AccountDTO;
import value.mvc.model.dto.CustomerDTO;
import value.mvc.model.dto.DeliveryDTO;
import value.mvc.model.dto.NoticeDTO;
import value.mvc.model.dto.PaymentDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.QuestionDTO;
import value.mvc.model.dto.SellingListDTO;
import value.mvc.model.dto.TransactionalInformationDTO;
import value.mvc.model.dto.UpLoadDTO;
import value.mvc.model.service.AdminService;
import value.mvc.model.service.CustomerService;
import value.mvc.model.service.CustomerService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("payTest")
	public String payTest(){
		return "payTest";
	}

	@RequestMapping("info")
	public String info() {
		return "info";
	}
	/*
	 * 12/16 �ΰ��߰� �����̸���
	 */
	// ���� �̸��� 
   public void endBidEmailForBuyer(String id, String productNo) {
	  //������id�� email productNo�� productName  �ʿ�
	  Map<String, String> map = customerService.selectMailingBuyerInfo(id, productNo);
	  String email = map.get("email");
	  String productName = map.get("productName");
	  //<������>
	  /////////////////////////////////////////////
	  String host = "smtp.gmail.com";
      String subject = "�ȳ��ϼ��� �繰�� �ٽ� �����Դϴ�.";
      String fromName = "���� ������ ������";
      String from = "mingeein@gmail.com";
      String to1 = email;
      String content = id + "����  ��ǰ�� : " + productName + "�����Ǿ����ϴ�."+
      "<br>���������� > ���ų������� �����ϱ⸦ ���� 3�� �̳� �� ���űݾ��� �������ּ���.";
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
   /*
    * 12/16 �ΰ��߰� ������ �Ǹ��� ������� ����
    * @param productNo
    */
   public void endBidEmailForSeller(String productNo) {
	   //�Ǹ���id �Ǹ�productName �Ǹ���email �ʿ�
	   
	   Map<String, String> map = customerService.selectMailingSellerInfo(productNo);
	   
	   String productName = map.get("productName");
	   String id = map.get("id");
	   String email = map.get("email");
	   //<�Ǹ���>
	   /////////////////////////////////////////////
	   String host = "smtp.gmail.com";
	   String subject = "�ȳ��ϼ��� �繰�� �ٽ� �����Դϴ�.";
	   String fromName = "���� ������ ������";
	   String from = "mingeein@gmail.com";
	   String to1 = email;
	   String content = id + "����  ��ǰ�� : " + productName + "��� ����Ǿ����ϴ�."+
			   "<br>���������� > �Ǹų������� ����� Ȯ�����ּ���.";
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
	////////////////
	// ���� �̸���
	@RequestMapping("permitEmail")
	@ResponseBody
	public void permitEmail(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String productName = request.getParameter("productName");
		String email = adminService.selectEmailById(id);
		CustomerEmail(id, email, productName);
	}

	// ���� ��ǰ ���� �̸���
	private void refuseEmail(String id, String email, String productName) {
		String host = "smtp.gmail.com";
		String subject = "�ȳ��ϼ��� �繰�� �ٽ� �����Դϴ�.";
		String fromName = "���� ������ ������";
		String from = "mingeein@gmail.com";
		String to1 = email;
		String content = id + "����  ��ǰ�� : " + productName + "���� �����Ǿ����ϴ�.";
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

	// �������� �̸���(�����ڿ�)
	private void paymentSendEmail(String name, String email, String productName, int price) {
		String host = "smtp.gmail.com";
		String subject = "�ȳ��ϼ��� �繰�� �ٽ� �����Դϴ�.";
		String fromName = "���� ������ ������";
		String from = "mingeein@gmail.com";
		String to1 = email;
		String content = name + "���� ������ ���������� �Ϸ�Ǿ����ϴ�." + "<br>��ǰ�� : " + productName + " ���� " + price;
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
	// �������� �̸���
		private void paymentSendEmailSell(String name, String email, String productName, int price,String address) {
			String host = "smtp.gmail.com";
			String subject = "�ȳ��ϼ��� �繰�� �ٽ� �����Դϴ�.";
			String fromName = "���� ������ ������";
			String from = "mingeein@gmail.com";
			String to1 = email;
			String content = name + "������ �ԱݿϷ��ϼ̽��ϴ�." + "<br>��ǰ�� : " + productName + " ���� " + price;
			content += "<br> " + address + " �� ��ǰ�� ����Ͻð� ���� ���������� ����� ��ȣ�� �Է����ּ���.";
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
	// ��ǰ���� �̸���
	private void CustomerEmail(String id, String email, String productName) {
		String host = "smtp.gmail.com";
		String subject = "�ȳ��ϼ��� �繰�� �ٽ� �����Դϴ�.";
		String fromName = "���� ������ ������";
		String from = "mingeein@gmail.com";
		String to1 = email;
		String content = id + "������ ��û�� " + "��ǰ�� " + productName + " ��� ���εǾ����ϴ�.";
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

	@RequestMapping("selectSellById")
	@ResponseBody
	public List<TransactionalInformationDTO> selectSellById(String id, HttpServletRequest request) {
		id = request.getParameter("id");
		List<TransactionalInformationDTO> list = new ArrayList<>();
		list = adminService.selectSellById(id);
		return list;
	}

	@RequestMapping("selectBuyById")
	@ResponseBody
	public List<TransactionalInformationDTO> selectBuyById(String id, HttpServletRequest request) {
		id = request.getParameter("id");
		List<TransactionalInformationDTO> list = new ArrayList<>();
		list = adminService.selectBuyById(id);
		return list;
	}

	@RequestMapping("selectQuestionById")
	@ResponseBody
	public List<QuestionDTO> selectQuestionById(String userId, HttpServletRequest request) {
		userId = request.getParameter("userId");
		List<QuestionDTO> list = new ArrayList<>();
		list = adminService.selectQuestionById(userId);
		return list;
	}

	@RequestMapping("selectInterestById")
	@ResponseBody
	public List<ProductDTO> selectInterestById(String id, HttpServletRequest request) {
		id = request.getParameter("userId");
		List<ProductDTO> list = new ArrayList<>();
		list = adminService.selectInterestById(id);
		return list;
	}

	@RequestMapping("selectSeenById")
	@ResponseBody
	public List<ProductDTO> selectSeenById(String id, HttpServletRequest request) {
		id = request.getParameter("userId");
		List<ProductDTO> list = new ArrayList<>();
		list = adminService.selectSeenById(id);
		return list;
	}

	@RequestMapping("selectAccountById")
	@ResponseBody
	public List<AccountDTO> selectAccountById(String id, HttpServletRequest request) {
		id = request.getParameter("userId");
		List<AccountDTO> list = new ArrayList<>();
		list = adminService.selectAccountById(id);
		return list;
	}

	@RequestMapping("permitPay")
	public String paymentSystem(CustomerDTO customerDTO, HttpServletRequest request) {
		List<CustomerDTO> list = new ArrayList<>();
		String name = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String productNo = request.getParameter("productNo");
		String id = request.getParameter("userId");
		String address = adminService.selectAddressById(id);
		String buyId = request.getParameter("buyId");
		String sellId = request.getParameter("sellId");
		String sellEmail = adminService.selectEmailById(sellId);
		int price = Integer.parseInt(request.getParameter("price"));
		customerDTO.setName(name);
		customerDTO.setPhone(phone);
		customerDTO.setEmail(email);
		PaymentDTO paymentDTO = new PaymentDTO();
		paymentDTO.setName(name);
		paymentDTO.setProductNo(productNo);
		paymentDTO.setPrice(price);
		list = adminService.paymentSystem(customerDTO);
		request.setAttribute("productNo", productNo);
		request.setAttribute("price", price);
		String productName = adminService.selectProductByNo(productNo);
		if (list.size() == 0) {
			return "errorPay";
		} else {
			adminService.paymentSystem(productNo,paymentDTO,buyId,sellId); 
			paymentSendEmail(name, email, productName, price); 
			paymentSendEmailSell(name, sellEmail, productName, price,address);
			return "permitPay";
		}
	}
	
	@RequestMapping("admin/admin")
	public String admin() {
		return "admin/admin";
	}

	@RequestMapping("deliveryTest")
	public String deliveryTest() {
		return "deliveryTest";
	}

	@RequestMapping("insertDelivery")
	@ResponseBody
	public int insertDelivery(DeliveryDTO deliveryDTO, HttpServletRequest request) {
		String productNo = request.getParameter("productNo");
		String company = request.getParameter("deliveryCompany");
		String no = request.getParameter("deliveryNo");
		String id = request.getParameter("id");
		String productName = request.getParameter("productName");
		String email = adminService.selectEmailById(id);
		deliveryDTO.setProductNo(productNo);
		deliveryDTO.setDeliveryCompany(company);
		deliveryDTO.setDeliveryNo(no);
		deliveryEmail(id,email,productName,company,no);
		return adminService.deliveryTransaction(productNo,deliveryDTO);
	}

	// ��ǰ���� �̸���
	private void deliveryEmail(String id, String email, String productName,String company, String no) {
		String host = "smtp.gmail.com";
		String subject = "�ȳ��ϼ��� �繰�� �ٽ� �����Դϴ�.";
		String fromName = "���� ������ ������";
		String from = "mingeein@gmail.com";
		String to1 = email;
		String content = id + "������ ��û�� " + "��ǰ�� " + productName + " ������Դϴ�.<br> �ڼ��� ������ ���� ���������� Ȯ���Ͻ� �� �ֽ��ϴ�.";
		content += "<br>���ȸ�� : " + company + "����� ��ȣ " + no;
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

	@RequestMapping("selectDeliveryByNo")
	@ResponseBody
	public List<DeliveryDTO> selectDeliveryByNo(String productNo, HttpServletRequest request) {
		List<DeliveryDTO> list = new ArrayList<>();
		productNo = request.getParameter("productNo");
		list = adminService.selectDeliveryByNo(productNo);
		return list;
	}

	@RequestMapping("selectProductByKeyword")
	@ResponseBody
	public List<ProductDTO> selectProductByKeyword(HttpServletRequest request, String keyword) {
		List<ProductDTO> list = new ArrayList<>();
		keyword = request.getParameter("keyword");
		list = adminService.selectProductByKeyword(keyword);
		return list;
	}

	@RequestMapping("selectPermitByKeyword")
	@ResponseBody
	public List<ProductDTO> selectPermitByKeyword(HttpServletRequest request, String keyword) {
		List<ProductDTO> list = new ArrayList<>();
		keyword = request.getParameter("keyword");
		list = adminService.selectPermitByKeyword(keyword);
		return list;
	}

	@RequestMapping("selectUserByKeyword")
	@ResponseBody
	public List<CustomerDTO> selectUserByKeyword(HttpServletRequest request, String keyword) {
		List<CustomerDTO> list = new ArrayList<>();
		keyword = request.getParameter("keyword");
		list = adminService.selectUserByKeyword(keyword);
		return list;
	}

	@RequestMapping("selectNoticeByKeyword")
	@ResponseBody
	public List<NoticeDTO> selectNoticeByKeyword(HttpServletRequest request, String keyword) {
		List<NoticeDTO> list = new ArrayList<>();
		keyword = request.getParameter("keyword");
		list = adminService.selectNoticeByKeyword(keyword);
		return list;
	}

	@RequestMapping("selectQuestionByKeyword")
	@ResponseBody
	public List<QuestionDTO> selectQuestionByKeyword(HttpServletRequest request, String keyword) {
		List<QuestionDTO> list = new ArrayList<>();
		keyword = request.getParameter("keyword");
		list = adminService.selectQuestionByKeyword(keyword);
		return list;
	}

	@RequestMapping("selectAllUser")
	@ResponseBody
	public List<CustomerDTO> selectAllUser(HttpServletRequest request) {
		List<CustomerDTO> list = new ArrayList<>();
		list = adminService.selectAllUser();
		return list;
	}

	@RequestMapping("deleteByName")
	@ResponseBody
	public List<CustomerDTO> deleteByName(String id, HttpServletRequest request) {
		adminService.deleteByName(id);
		List<CustomerDTO> list = new ArrayList<>();
		list = adminService.selectAllUser();
		return list;
	}

	@RequestMapping("productList")
	@ResponseBody
	public List<ProductDTO> productList(HttpServletRequest request) {
		List<ProductDTO> list = new ArrayList<>();
		list = adminService.productList();
		return list;
	}

	@RequestMapping("deleteByProductName")
	@ResponseBody
	public List<ProductDTO> deleteByProductName(String productNo, HttpServletRequest request) {
		adminService.deleteByProductName(productNo);
		List<ProductDTO> list = new ArrayList<>();
		list = adminService.productList();
		return list;
	}

	@RequestMapping("deleteProcessByNo")
	public String deleteProcessByNo(HttpServletRequest request, String productNo) {
		productNo = request.getParameter("productNo");
		String id = request.getParameter("id");
		String productName = adminService.selectProductByNo(productNo);
		String email = adminService.selectEmailById(id);
		refuseEmail(id, email, productName);
		adminService.deleteProcessByNo(productNo);
		return "admin/admin";
	}

	@RequestMapping("productListByState")
	@ResponseBody
	public List<ProductDTO> productListByState(String state, HttpServletRequest request) {
		List<ProductDTO> list = new ArrayList<>();
		list = adminService.productListByState(state);
		return list;
	}

	@RequestMapping("permitProduct")
	@ResponseBody
	public List<ProductDTO> permitProduct(String productNo, HttpServletRequest request) {
		List<ProductDTO> list = new ArrayList<>();
		list = adminService.productListByState("���δ��");
		String userId = request.getParameter("userId");
		adminService.permitProduct(productNo,new SellingListDTO(productNo, userId));
		return list;
	}

	@RequestMapping("updateDeadline")
	@ResponseBody
	public void updateDeadline(ProductDTO productDTO, HttpServletRequest request) {
		String auctionDuring = request.getParameter("autionDuring");
		String productNo = request.getParameter("productNo");
		productDTO.setDeadline(auctionDuring);
		productDTO.setProductNo(productNo);
		adminService.updateDeadline(productDTO);

	}

	@RequestMapping("selectQuestion")
	@ResponseBody
	public List<QuestionDTO> selectQuestion(HttpServletRequest request) {
		List<QuestionDTO> list = new ArrayList<>();
		list = adminService.selectQuestion();
		return list;
	}

	@RequestMapping("selectNotice")
	@ResponseBody
	public List<NoticeDTO> selectNotice(HttpServletRequest request) {
		List<NoticeDTO> list = new ArrayList<>();
		list = adminService.selectNotice();
		return list;
	}

	@RequestMapping("deleteNotice")
	@ResponseBody
	public List<NoticeDTO> deleteNotice(String noticeNo, HttpServletRequest request) {
		adminService.deleteNotice(noticeNo);
		List<NoticeDTO> list = new ArrayList<>();
		list = adminService.selectNotice();
		return list;
	}

	@RequestMapping("selectQuestionByTitle")
	@ResponseBody
	public List<QuestionDTO> selectQuestionByTitle(String questionNo) {
		List<QuestionDTO> list = new ArrayList<>();
		list = adminService.selectQuestionByTitle(questionNo);
		return list;
	}

	@RequestMapping("selectNoticeByTitle")
	@ResponseBody
	public List<NoticeDTO> selectNoticeByTitle(String noticeNo) {
		List<NoticeDTO> list = new ArrayList<>();
		list = adminService.selectNoticeByTitle(noticeNo);
		return list;
	}

	@RequestMapping("updateNotice")
	@ResponseBody
	public List<NoticeDTO> updateNotice(HttpServletRequest request, NoticeDTO noticeDTO) {
		List<NoticeDTO> list = new ArrayList<>();
		list = adminService.selectNoticeByTitle(request.getParameter("noticeTitle2"));
		String noticeTitle = request.getParameter("noticeTitle2");
		String noticeContent = request.getParameter("noticeContent2");
		String noticeNo = request.getParameter("noticeNo");
		noticeDTO.setNoticeTitle(noticeTitle);
		noticeDTO.setNoticeContent(noticeContent);
		noticeDTO.setNoticeNo(noticeNo);
		adminService.updateNotice(noticeDTO);
		return list;
	}

	@RequestMapping("insertAnswer")
	@ResponseBody
	public String insertAnswer(HttpServletRequest request, QuestionDTO questionDTO) {
		String questionNo = request.getParameter("questionNo");
		String answerContent = request.getParameter("answerContent");
		questionDTO.setAnswerContent(answerContent);
		questionDTO.setQuestionNo(questionNo);
		adminService.insertAnswer(questionDTO);
		return "admin/admin";
	}

	@RequestMapping("updateAnswer")
	public String updateAnswer(HttpServletRequest request, QuestionDTO questionDTO) {
		String questionNo = request.getParameter("questionNo");
		String answerContent = request.getParameter("answerContent");
		questionDTO.setAnswerContent(answerContent);
		questionDTO.setQuestionNo(questionNo);
		adminService.updateAnswer(questionDTO);
		return "admin/admin";
	}

	@RequestMapping("deleteAnswer")
	public String deleteAnswer(HttpServletRequest request, String questionNo) {
		questionNo = request.getParameter("questionNo");
		adminService.deleteAnswer(questionNo);
		return "admin/admin";
	}

	@RequestMapping("selectQuestionByProcess")
	@ResponseBody
	public List<QuestionDTO> selectQuestionByProcess(String questionProcess, HttpServletRequest request) {
		List<QuestionDTO> list = new ArrayList<>();
		list = adminService.selectQuestionByState(questionProcess);
		return list;
	}

	@RequestMapping("insertNotice")
	public String insertNotice(HttpServletRequest request, NoticeDTO noticeDTO, UpLoadDTO dto, HttpSession session) {
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		noticeDTO.setNoticeTitle(noticeTitle);
		noticeDTO.setNoticeContent(noticeContent);
		adminService.insertNotice(noticeDTO);
		return "admin/admin";
	}
}
