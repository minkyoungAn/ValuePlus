package value.mvc.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import value.mvc.model.dao.AuthoritiesDAO;
import value.mvc.model.dao.CustomerDAO;
import value.mvc.model.dto.AccountDTO;
import value.mvc.model.dto.Authority;
import value.mvc.model.dto.CustomerDTO;
import value.mvc.model.dto.NoticeDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.QuestionDTO;
import value.mvc.model.dto.TransactionalInformationDTO;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDAO customerDao;
	@Autowired
	private AuthoritiesDAO authDAO;
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Transactional
	@Override
	public void joinCustomer(CustomerDTO customerDTO) {
		String encodedPassword = passwordEncoder.encode(customerDTO.getPw());
		customerDTO.setPw(encodedPassword);
		authDAO.insertAuthority(new Authority(customerDTO.getId(), value.spring.util.Constants.ROLE_MEMBER));
		customerDao.joinCustomer(customerDTO);
	}

	@Override
	public CustomerDTO selectCustomerById(String id) {
		// TODO Auto-generated method stub
		return customerDao.selectCustomerById(id);
	}

	@Override
	public int deleteCustomer(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCustomer(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String loginCustomer(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return customerDao.loginCustomer(customerDTO);
	}

	@Override
	public int logoutCustomer(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public AccountDTO selectAccount(String id) {
		// TODO Auto-generated method stub
		return customerDao.selectAccount(id);
	}

	@Override
	public int insertAccount(AccountDTO accountDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAccount(AccountDTO accountDTO) {
		return customerDao.updateAccount(accountDTO);
	}

	@Override
	public int deleteAccount(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ProductDTO> selectInterest(String id) {
		return customerDao.selectInterest(id);
	}

	@Override
	public int insertInterest(String productNo, String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteInterest(String productNo, String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TransactionalInformationDTO> selectSelling(String id) {
		return customerDao.selectSelling(id);
	}

	@Override
	public List<TransactionalInformationDTO> selectBuying(String id) {
		return customerDao.selectBuying(id);
	}

	@Override
	public List<NoticeDTO> selectAllNotice() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeDTO selectOneNotice(String noticeNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<QuestionDTO> selectQuestion() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<QuestionDTO> selectQuestionById(String id) {
		return customerDao.selectQuestionById(id);
	}

	@Override
	public QuestionDTO selectOneQuestion(String QuestionNo) {
		return customerDao.selectOneQuestion(QuestionNo);
	}

	@Override
	public int insertQuestion(QuestionDTO questionDTO) {
		// TODO Auto-generated method stub
		return customerDao.insertQuestion(questionDTO);
	}

	@Override
	public int updateQuestion(QuestionDTO questionDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteQuestion(String questionNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String idCheck(String id) {
		int count = customerDao.idCheck(id);
		return (count == 0) ? "ok" : "fail";
	}

	@Override
	public int test() {
		return customerDao.test();
	}

	@Override
	public String findId(String name) {
		return customerDao.findId(name);
	}

	@Override
	public String findPw(String id) {
		return customerDao.findPw(id);
	}

	@Override
	public void updatePw(CustomerDTO customerDTO) {
		customerDao.updatePw(customerDTO);
	}

	@Override
	public int updateProfile(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return customerDao.updateProfile(customerDTO);
	}

	@Override
	public List<ProductDTO> selectToday(String id) {
		// TODO Auto-generated method stub
		return customerDao.selectToday(id);
	}

	// 오늘본상품 삭제
	@Override
	public void deleteTodaySeeProduct() {
		customerDao.deleteTodaySeeProduct();

	}

	/*
	 * 민경추가 12/16 낙찰자 메일보낼 정보가져오기
	 */
	@Override
	public Map<String, String> selectMailingBuyerInfo(String id, String productNo) {
		Map<String, String> map = new HashMap<>();

		map.put("email", customerDao.selectMailingEmail(id));
		map.put("productName", customerDao.selectMailingProductName(productNo));
		return map;
	}
	/*
	 * 민경추가 12/16
	 */

	@Override
	public Map<String, String> selectMailingSellerInfo(String productNo) {
		Map<String, String> map = new HashMap<>();
		String id = customerDao.selectMailingSellerId(productNo);
		map.put("id", id);
		map.put("email", customerDao.selectMailingEmail(id));
		map.put("productName", customerDao.selectMailingProductName(productNo));

		return map;
	}

	@Override
	public void updatePwByUser(CustomerDTO customerDTO) {
		customerDao.updatePwByUser(customerDTO);
	}

	@Override
	public List<TransactionalInformationDTO> selectWaitSelling(String id) {
		return customerDao.selectWaitSelling(id);
	}

}
