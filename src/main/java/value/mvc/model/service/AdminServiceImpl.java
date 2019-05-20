package value.mvc.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import value.mvc.model.dao.AdminDAO;
import value.mvc.model.dto.AccountDTO;
import value.mvc.model.dto.CustomerDTO;
import value.mvc.model.dto.DeliveryDTO;
import value.mvc.model.dto.NoticeDTO;
import value.mvc.model.dto.PaymentDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.QuestionDTO;
import value.mvc.model.dto.SellingListDTO;
import value.mvc.model.dto.TransactionalInformationDTO;

@Service
public class AdminServiceImpl implements AdminService { 
	@Autowired
	private AdminDAO adminDao;
	
	@Override
	public List<QuestionDTO> selectQuestionByState(String questionProcess) {
		// TODO Auto-generated method stub
		return adminDao.selectQuestionByState(questionProcess);
	}

	@Override
	public int insertNotice(NoticeDTO noticeDTO) {
		// TODO Auto-generated method stub
		return adminDao.insertNotice(noticeDTO);
	}

	@Override
	public int deleteNotice(String noticeNo) {
		// TODO Auto-generated method stub
		return adminDao.deleteNotice(noticeNo);
	}

	@Override
	public List<CustomerDTO> selectAllUser() {
		// TODO Auto-generated method stub
		return adminDao.selectAllUser();
	}

	@Override
	public int deleteByName(String id) {
		// TODO Auto-generated method stub
		return adminDao.deleteByName(id);
	}

	@Override
	public List<ProductDTO> productList() {
		// TODO Auto-generated method stub
		return adminDao.productList();
	}

	@Override
	public int deleteByProductName(String productNo) {
		// TODO Auto-generated method stub
		return adminDao.deleteByProductName(productNo);
	}

	@Override
	public List<ProductDTO> productListByState(String state) {
		// TODO Auto-generated method stub
		return adminDao.productListByState(state);
	}
	
	@Override
	@Transactional
	public int permitProduct(String productNo,SellingListDTO sellingListDTO) {
		adminDao.insertSellingList(sellingListDTO);
		adminDao.permitProduct(productNo);
		return 1;
	}
	@Override
	public List<QuestionDTO> selectQuestion() {
		// TODO Auto-generated method stub
		return adminDao.selectQuestion();
	}

	@Override
	public List<NoticeDTO> selectNotice() {
		// TODO Auto-generated method stub
		return adminDao.selectNotice();
	}

	@Override
	public List<QuestionDTO> selectQuestionByTitle(String questionNo) {
		// TODO Auto-generated method stub
		return adminDao.selectQuestionByTitle(questionNo);
	}

	@Override
	public List<NoticeDTO> selectNoticeByTitle(String noticeNo) {
		// TODO Auto-generated method stub
		return adminDao.selectNoticeByTitle(noticeNo);
	}

	@Override
	public int updateNotice(NoticeDTO noticeDTO) {
		// TODO Auto-generated method stub
		return adminDao.updateNotice(noticeDTO);
	}

	@Override
	public int insertAnswer(QuestionDTO questionDTO) {
		// TODO Auto-generated method stub
		return adminDao.insertAnswer(questionDTO);
	}

	@Override
	public int updateAnswer(QuestionDTO questionDTO) {
		// TODO Auto-generated method stub
		return adminDao.updateAnswer(questionDTO);
	}

	@Override
	public int deleteAnswer(String questionNo) {
		// TODO Auto-generated method stub
		return adminDao.deleteAnswer(questionNo);
	}

	@Override
	public int deleteProcessByNo(String productNo) {
		// TODO Auto-generated method stub
		return adminDao.deleteProcessByNo(productNo);
	}

	@Override
	public List<ProductDTO> selectProductByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return adminDao.selectProductByKeyword(keyword);
	}

	@Override
	public List<ProductDTO> selectPermitByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return adminDao.selectPermitByKeyword(keyword);
	}

	@Override
	public List<QuestionDTO> selectQuestionByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return adminDao.selectQuestionByKeyword(keyword);
	}

	@Override
	public List<NoticeDTO> selectNoticeByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return adminDao.selectNoticeByKeyword(keyword);
	}

	@Override
	public List<CustomerDTO> selectUserByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return adminDao.selectUserByKeyword(keyword);
	}

	@Transactional
	public int deliveryTransaction(String productNo, DeliveryDTO deliveryDTO) {
		adminDao.insertDelivery(deliveryDTO);
		adminDao.updateProcessBydel(productNo);	
		return 1;
	}
	@Override
	public List<DeliveryDTO> selectDeliveryByNo(String productNo) {
		// TODO Auto-generated method stub
		return adminDao.selectDeliveryByNo(productNo);
	}

	@Override
	public int updateDeadline(ProductDTO productDTO) {
		// TODO Auto-generated method stub
		return adminDao.updateDeadline(productDTO);
	}
	

	@Override
	public List<CustomerDTO> paymentSystem(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return adminDao.paymentSystem(customerDTO);
	}
	
	@Transactional
	public int paymentSystem(String productNo,PaymentDTO paymentDTO,String buyId,String sellId) {
		adminDao.updateProcessByPay(productNo);
		adminDao.insertPayment(paymentDTO);
		
		int buyCount = adminDao.selectBuyCountById(buyId);
		int sellCount = adminDao.selectSellCountById(sellId);
		if(buyCount < 10) {
			adminDao.updateBuyCount(buyId);
		}else if(buyCount >= 10) {
			adminDao.updateBuyCount(buyId);
			adminDao.updateGradeToGoldBuy(buyId);
		}else if(buyCount >= 15) {
			adminDao.updateBuyCount(buyId);
			adminDao.updateGradeToFamBuy(buyId);
		}else if(buyCount >= 20) {
			adminDao.updateBuyCount(buyId);
			adminDao.updateGradeToVipBuy(buyId);
		}else if(buyCount >= 25) {
			adminDao.updateBuyCount(buyId);
			adminDao.updateGradeToVvipBuy(buyId);
		}
		
		if(sellCount < 10) {
			adminDao.updateSellCount(sellId);
		}else if(sellCount >= 10) {
			adminDao.updateSellCount(sellId);
			adminDao.updateGradeToGoldSell(sellId);
		}else if(sellCount >= 15) {
			adminDao.updateSellCount(sellId);
			adminDao.updateGradeToFamSell(sellId);
		}else if(sellCount >= 20) {
			adminDao.updateSellCount(sellId);
			adminDao.updateGradeToVipSell(sellId);
		}else if(sellCount >= 25) {
			adminDao.updateSellCount(sellId);
			adminDao.updateGradeToVvipSell(sellId);
		}
		return 1;
	}
	
	@Override
	public List<TransactionalInformationDTO> selectSellById(String id) {
		// TODO Auto-generated method stub
		return adminDao.selectSellById(id);
	}
	@Override
	public List<TransactionalInformationDTO> selectBuyById(String id) {
		// TODO Auto-generated method stub
		return adminDao.selectBuyById(id);
	}
	
	@Override
	public List<QuestionDTO> selectQuestionById(String userId) {
		// TODO Auto-generated method stub
		return adminDao.selectQuestionById(userId);
	}
	
	@Override
	public List<ProductDTO> selectInterestById(String userId) {
		// TODO Auto-generated method stub
		return adminDao.selectInterestById(userId);
	}
	@Override
	public List<ProductDTO> selectSeenById(String userId) {
		return adminDao.selectSeenById(userId);
	}
	@Override
	public List<AccountDTO> selectAccountById(String id) {
		return adminDao.selectAccountById(id);
	}

	@Override
	public String selectEmailById(String id) {
		return adminDao.selectEmailById(id);
	}

	@Override
	public String selectProductByNo(String productNo) {
		return adminDao.selectProductByNo(productNo);
	} 
	@Override
	public String selectAddressById(String id) {
		return adminDao.selectAddressById(id);
	}
	//배송확정
	@Override
	public void updateDeliveryProcess() {
		adminDao.updateDeliveryProcess();
	}

	@Override
	public void updateEndProcess() {
		// TODO Auto-generated method stub
		adminDao.updateEndProcess();
	}
}
