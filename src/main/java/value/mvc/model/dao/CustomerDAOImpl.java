package value.mvc.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import value.mvc.model.dto.AccountDTO;
import value.mvc.model.dto.CustomerDTO;
import value.mvc.model.dto.NoticeDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.QuestionDTO;
import value.mvc.model.dto.TransactionalInformationDTO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Resource
	private SqlSession session;

	@Override
	public void joinCustomer(CustomerDTO customerDTO) {
		session.insert("customerMapper.joinCustomer", customerDTO);
	}

	@Override
	public CustomerDTO selectCustomerById(String id) {
		return session.selectOne("customerMapper.selectCustomerById", id);
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
		return session.selectOne("customerMapper.login", customerDTO);
	}

	@Override
	public int logoutCustomer(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public AccountDTO selectAccount(String id) {
		return session.selectOne("customerMapper.selectAccount", id);
	}

	@Override
	public int insertAccount(AccountDTO accountDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAccount(AccountDTO accountDTO) {
		// TODO Auto-generated method stub
		return session.update("customerMapper.updateAccount", accountDTO);
	}

	@Override
	public int deleteAccount(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ProductDTO> selectInterest(String id) {
		return session.selectList("customerMapper.selectInterest", id);
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
		return session.selectList("customerMapper.selectSelling", id);
	}

	@Override
	public List<TransactionalInformationDTO> selectBuying(String id) {
		return session.selectList("customerMapper.selectBuying", id);
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
	public List<QuestionDTO> selectQuestionById(String id) {
		return session.selectList("customerMapper.selectQuestion", id);
	}

	@Override
	public QuestionDTO selectOneQuestion(String QuestionNo) {
		return session.selectOne("customerMapper.selectOneQuestion", QuestionNo);
	}

	@Override
	public int insertQuestion(QuestionDTO questionDTO) {
		// TODO Auto-generated method stub
		return session.insert("customerServiceMapper.insertQuestion", questionDTO);
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
	public int idCheck(String id) {
		return session.selectOne("customerMapper.idCheck", id);
	}

	@Override
	public int test() {
		return session.selectOne("customerMapper.test");
	}

	@Override
	public String findId(String name) {
		// TODO Auto-generated method stub
		return session.selectOne("customerMapper.findId", name);
	}

	@Override
	public String findPw(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("customerMapper.findPw", id);
	}

	@Override
	public void updatePw(CustomerDTO customerDTO) {
		session.update("customerMapper.updatePw", customerDTO);
	}

	@Override
	public int updateProfile(CustomerDTO customerDTO) {
		return session.update("customerMapper.updateProfile", customerDTO);
	}

	@Override
	public List<ProductDTO> selectToday(String id) {
		return session.selectList("customerMapper.selectToday", id, new RowBounds(0, 10));
	}

	@Override
	public List<QuestionDTO> selectQuestion() {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * 12/16민경추가 낙찰자 판매자 id email productName 가져오기 오늘본상품삭제
	 * 
	 */

	@Override
	public void deleteTodaySeeProduct() {
		session.delete("customerServiceMapper.deleteTodaySeeProduct");

	}

	@Override
	public String selectMailingEmail(String id) {
		return session.selectOne("customerMapper.selectMailingEmail", id);

	}

	@Override
	public String selectMailingProductName(String productNo) {
		return session.selectOne("customerMapper.selectMailingProductName", productNo);
	}

	@Override
	public String selectMailingSellerId(String productNo) {
		return session.selectOne("customerMapper.selectMailingSellerId", productNo);
	}

	@Override
	public void updatePwByUser(CustomerDTO customerDTO) {
		session.update("customerMapper.updatePwByUser", customerDTO);
	}

	@Override
	public List<TransactionalInformationDTO> selectWaitSelling(String id) {
		return session.selectList("customerMapper.selectWaitSelling", id);
	}

}
