package value.mvc.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import value.mvc.model.dto.AccountDTO;
import value.mvc.model.dto.CustomerDTO;
import value.mvc.model.dto.NoticeDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.QuestionDTO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public int joinCustomer(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CustomerDTO selectCustomerById(String id) {
		// TODO Auto-generated method stub
		return null;
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
	public String loginCustomer(String id, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int logoutCustomer(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public AccountDTO selectAccount(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertAccount(AccountDTO accountDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAccount(AccountDTO accountDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAccount(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ProductDTO selectInterest(String id) {
		// TODO Auto-generated method stub
		return null;
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
	public List<ProductDTO> selectSelling(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductDTO> selectBuying(String id) {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public QuestionDTO selectOneQuestion(String QuestionNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertQuestion(QuestionDTO questionDTO) {
		// TODO Auto-generated method stub
		return 0;
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

}
