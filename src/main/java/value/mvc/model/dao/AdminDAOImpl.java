package value.mvc.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import value.mvc.model.dto.AccountDTO;
import value.mvc.model.dto.CustomerDTO;
import value.mvc.model.dto.DeliveryDTO;
import value.mvc.model.dto.NoticeDTO;
import value.mvc.model.dto.PaymentDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.QuestionDTO;
import value.mvc.model.dto.SellingListDTO;
import value.mvc.model.dto.TransactionalInformationDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<CustomerDTO> selectAllUser(){
		return session.selectList("adminMapper.selectAllUser");
	}
	
	@Override
	public List<QuestionDTO> selectQuestionByState(String questionProcess) {
		// TODO Auto-generated method stub
		return session.selectList("adminMapper.selectQuestionByProcess",questionProcess);
	}

	@Override
	public int insertNotice(NoticeDTO noticeDTO) {
		// TODO Auto-generated method stub
		return session.insert("adminMapper.insertNotice", noticeDTO);
	}

	@Override
	public int deleteNotice(String noticeNo) {
		// TODO Auto-generated method stub
		return session.delete("adminMapper.deleteNotice",noticeNo);
	}
	@Override
	public int deleteByName(String id) {
		// TODO Auto-generated method stub
		return session.delete("adminMapper.deleteByName",id);
	}
	@Override
	public List<ProductDTO> productList() {
		// TODO Auto-generated method stub
		return session.selectList("adminMapper.productList");
	}
	@Override
	public int deleteByProductName(String productNo) {
		// TODO Auto-generated method stub
		return session.delete("adminMapper.deleteByProductName",productNo);
	}
	@Override
	public List<ProductDTO> productListByState(String state) {
		// TODO Auto-generated method stub
		return session.selectList("adminMapper.productListByState",state);
	}
	@Override
	public int permitProduct(String productNo) {
		// TODO Auto-generated method stub
		return session.update("adminMapper.updatePermit",productNo);
	}
	@Override
	public List<QuestionDTO> selectQuestion() {
		// TODO Auto-generated method stub
		return session.selectList("adminMapper.selectQuestion");
	}
	@Override
	public List<NoticeDTO> selectNotice() {
		// TODO Auto-generated method stub
		return session.selectList("adminMapper.selectNotice");
	}
	@Override
	public List<QuestionDTO> selectQuestionByTitle(String questionNo) {
		// TODO Auto-generated method stub
		return session.selectList("adminMapper.selectQuestionByTitle",questionNo);
	}
	@Override
	public List<NoticeDTO> selectNoticeByTitle(String noticeNo) {
		// TODO Auto-generated method stub
		return session.selectList("adminMapper.selectNoticeByTitle",noticeNo);
	}
	@Override
	public int updateNotice(NoticeDTO noticeDTO) {
		// TODO Auto-generated method stub
		return session.update("adminMapper.updateNotice",noticeDTO);
	}

	@Override
	public int insertAnswer(QuestionDTO questionDTO) {
		// TODO Auto-generated method stub
		return session.update("adminMapper.insertAnswer",questionDTO);
	}

	@Override
	public int updateAnswer(QuestionDTO questionDTO) {
		// TODO Auto-generated method stub
		return session.update("adminMapper.updateAnswer",questionDTO);
	}

	@Override
	public int deleteAnswer(String questionNo) {
		// TODO Auto-generated method stub
		return session.update("adminMapper.deleteAnswer",questionNo);
	}

	@Override
	public int deleteProcessByNo(String productNo) {
		// TODO Auto-generated method stub
		return session.delete("adminMapper.deleteProcess", productNo);
	}

	@Override
	public List<ProductDTO> selectProductByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return session.selectList("adminMapper.selectProductByKeyword", keyword);
	}

	@Override
	public List<ProductDTO> selectPermitByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return session.selectList("adminMapper.selectPermitByKeyword", keyword);
	}

	@Override
	public List<QuestionDTO> selectQuestionByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return session.selectList("adminMapper.selectQuestionByKeyword", keyword);
	}

	@Override
	public List<NoticeDTO> selectNoticeByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return session.selectList("adminMapper.selectNoticeByKeyword", keyword);
	}

	@Override
	public List<CustomerDTO> selectUserByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return session.selectList("adminMapper.selectUserByKeyword", keyword);
	}

	@Override
	public int insertDelivery(DeliveryDTO deliveryDTO) {
		return session.insert("deliveryMapper.insertDelivery",deliveryDTO);
	}

	@Override
	public List<DeliveryDTO> selectDeliveryByNo(String productNo) {
		// TODO Auto-generated method stub
		return session.selectList("deliveryMapper.selectDeliveryByNo", productNo);
	}

	@Override
	public int updateDeadline(ProductDTO productDTO) {
		// TODO Auto-generated method stub
		return session.update("adminMapper.updateDeadline", productDTO);
	}

	@Override
	public int insertSellingList(SellingListDTO sellingListDTO) {
		// TODO Auto-generated method stub
		return session.insert("adminMapper.insertSellingList",sellingListDTO);
	}

	@Override
	public List<CustomerDTO> paymentSystem(CustomerDTO customerDTO) {
		return session.selectList("customerMapper.paymentSystem",customerDTO);
	}

	@Override
	public int insertPayment(PaymentDTO paymentDTO) {
		// TODO Auto-generated method stub
		return session.insert("customerMapper.insertPayment", paymentDTO);
	}

	@Override
	public int updateProcessByPay(String productNo) {
		// TODO Auto-generated method stub
		return session.update("customerMapper.updateProcessByPay",productNo);
	}

	@Override
	public List<TransactionalInformationDTO> selectSellById(String id) {
		return session.selectList("adminMapper.selectSellById", id);
	}
	
	@Override
	public List<TransactionalInformationDTO> selectBuyById(String id) {
		return session.selectList("adminMapper.selectBuyById", id);
	}
	
	@Override
	public List<QuestionDTO> selectQuestionById(String userId) {
		return session.selectList("adminMapper.selectQuestionById", userId);
	}

	@Override
	public List<ProductDTO> selectInterestById(String userId) {
		// TODO Auto-generated method stub
		return session.selectList("adminMapper.selectInterestById", userId);
	}
	
	@Override
	public List<ProductDTO> selectSeenById(String userId) {
		// TODO Auto-generated method stub
		return session.selectList("adminMapper.selectSeenById", userId);
	}
	
	@Override
	public List<AccountDTO> selectAccountById(String id) {
		// TODO Auto-generated method stub
		return session.selectList("adminMapper.selectAccountById", id);
	}

	@Override
	public String selectEmailById(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("adminMapper.selectEmailById", id);
	}

	@Override
	public String selectProductByNo(String productNo) {
		// TODO Auto-generated method stub
		return session.selectOne("adminMapper.selectProductByNo", productNo);
	}
	

	@Override
	public void updateProcessBydel(String productNo) {
		session.update("customerMapper.updateProcessBydel", productNo);
	}

	@Override 
	public String selectAddressById(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("adminMapper.selectAddressById", id);
	}

	@Override
	public void updateBuyCount(String buyId) {
		session.update("gradeMapper.updateBuyCount",buyId);
	}
	@Override
	public void updateSellCount(String sellId) {
		session.update("gradeMapper.updateSellCount",sellId);
	} 
	@Override
	public int selectBuyCountById(String buyId) {
		return session.selectOne("gradeMapper.selectBuyCountById",buyId);
	}
	@Override
	public int selectSellCountById(String sellId) {
		return session.selectOne("gradeMapper.selectSellCountById",sellId);
	}

	@Override
	public void updateGradeToGoldBuy(String buyId) {
		session.update("gradeMapper.updateGradeToGoldBuy",buyId);
		
	}

	@Override
	public void updateGradeToFamBuy(String buyId) {
		session.update("gradeMapper.updateGradeToFamBuy",buyId);
	}

	@Override
	public void updateGradeToVipBuy(String buyId) {
		session.update("gradeMapper.updateGradeToVipBuy",buyId);
	}

	@Override
	public void updateGradeToVvipBuy(String buyId) {
		session.update("gradeMapper.updateGradeToVvipBuy",buyId);
	}

	@Override
	public void updateGradeToGoldSell(String sellId) {
		session.update("gradeMapper.updateGradeToGoldSell",sellId);
	}

	@Override
	public void updateGradeToFamSell(String sellId) {
		session.update("gradeMapper.updateGradeToFamSell",sellId);
	}

	@Override
	public void updateGradeToVipSell(String sellId) {
		session.update("gradeMapper.updateGradeToVipSell",sellId);
	}

	@Override
	public void updateGradeToVvipSell(String sellId) {
		session.update("gradeMapper.updateGradeToVvipSell",sellId);
	}

	@Override
	public void updateDeliveryProcess() {
		session.update("deliveryMapper.updateDeliveryProcess");
		
	}

	@Override
	   public void updateEndProcess() {
	      session.update("deliveryMapper.updateEndProcess");
	      
	   } 
	
	
	
}
