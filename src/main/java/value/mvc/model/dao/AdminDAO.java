package value.mvc.model.dao;

import java.util.List;

import value.mvc.model.dto.AccountDTO;
import value.mvc.model.dto.CustomerDTO;
import value.mvc.model.dto.DeliveryDTO;
import value.mvc.model.dto.NoticeDTO;
import value.mvc.model.dto.PaymentDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.QuestionDTO;
import value.mvc.model.dto.SellingListDTO;
import value.mvc.model.dto.TransactionalInformationDTO;

public interface AdminDAO {
	/**
	 * buyCount �ҷ��ͼ� �� �� ��� �ø�
	 */
	void updateGradeToGoldBuy(String buyId);
	/**
	 * buyCount �ҷ��ͼ� �� �� ��� �ø�
	 */
	void updateGradeToFamBuy(String buyId);
	/**
	 * buyCount �ҷ��ͼ� �� �� ��� �ø�
	 */
	void updateGradeToVipBuy(String buyId);
	/**
	 * buyCount �ҷ��ͼ� �� �� ��� �ø�
	 */
	void updateGradeToVvipBuy(String buyId);
	/**
	 * sellCount �ҷ��ͼ� �� �� ��� �ø�
	 */
	void updateGradeToGoldSell(String sellId);
	/**
	 * sellCount �ҷ��ͼ� �� �� ��� �ø�
	 */
	void updateGradeToFamSell(String sellId);
	/**
	 * sellCount �ҷ��ͼ� �� �� ��� �ø�
	 */
	void updateGradeToVipSell(String sellId);
	/**
	 * sellCount �ҷ��ͼ� �� �� ��� �ø�
	 */
	void updateGradeToVvipSell(String sellId);
	
	/**
	 * ���� �� sellCount �ҷ�����
	 */
	int selectSellCountById(String sellId);
	/**
	 * ���� �� buyCount �ҷ�����
	 */
	int selectBuyCountById(String buyId);
	/**
	 * ���� �� buyCount +1 
	 */
	void updateBuyCount(String buyId);
	/**
	 * ���� �� sellCount +1 
	 */
	void updateSellCount(String sellId);
	/**
	 * ����� �ּ� �ҷ�����
	 */
	String selectAddressById(String id);
	/** 
	 * ��� ���� ���μ��� ��ȭ
	 */
	void updateProcessBydel(String productNo);
	/**
	 * ��ǰ �̸� ��������
	 */
	String selectProductByNo(String productNo);
	/**
	 * ����� ���� ���� �޾ƿ���
	 */
	String selectEmailById(String id);
	/**
	 * ����� �������� Ȯ��
	 */
	List<AccountDTO> selectAccountById(String id);
	/**
	 * ����� ���� �� ��ǰ Ȯ��
	 */
	List<ProductDTO> selectSeenById(String userId);
	/**
	 * ����� ���ɻ�ǰ ����
	 */
	List<ProductDTO> selectInterestById(String userId);
	/**
	 * ����� ���ǳ���
	 */
	List<QuestionDTO> selectQuestionById(String userId);
	/**
	 * ����� ���ų���
	 */
	List<TransactionalInformationDTO> selectBuyById(String id);
	/**
	 * ����� �Ǹų���
	 */
	List<TransactionalInformationDTO> selectSellById(String id);
	/**
	 * �ԱݿϷ� ���� ��ȭ
	 */
	int updateProcessByPay(String productNo);
	/**
	 * ���� ���� ����
	 */
	int insertPayment(PaymentDTO paymentDTO);
	/**
	 * ���� �ý���
	 */
	List<CustomerDTO> paymentSystem(CustomerDTO customerDTO);
	/**
	 * �Ǹų��� ������Ʈ
	 */
	int insertSellingList(SellingListDTO sellingListDTO);
	/**
	 * ���� ������Ʈ
	 */
	int updateDeadline(ProductDTO productDTO);
	/**
	 * ��� ��ȸ
	 */
    List<DeliveryDTO> selectDeliveryByNo(String productNo);
	/**
	 * ��� ���� �Է�
	 */
	int insertDelivery(DeliveryDTO deliveryDTO);
	/**
	 * ������ ��ǰ �˻�
	 */
	List<ProductDTO> selectPermitByKeyword(String keyword);
	/**
	 * ���� �˻�
	 */
	List<QuestionDTO> selectQuestionByKeyword(String keyword);
	/**
	 * ���� �˻�
	 */
	List<NoticeDTO> selectNoticeByKeyword(String keyword);
	/**
	 * ����� �˻�
	 */
	List<CustomerDTO> selectUserByKeyword(String keyword);
	/**
	 * ��ǰ �˻�
	 */
	List<ProductDTO> selectProductByKeyword(String keyword);
	/**
	 * ��ǰ ����
	 */
	int deleteProcessByNo(String productNo);
	/**
	 * ��� ����
	 */
	int deleteAnswer(String questionNo);
	/**
	 * ��� ����
	 */
	int updateAnswer(QuestionDTO questionDTO);
	/**
	 * ��� �ޱ�
	 */
	int insertAnswer(QuestionDTO questionDTO);
	/**
	 * ���� �����ϱ�
	 */
	int updateNotice(NoticeDTO noticeDTO);
	/**
	 * ���� �� ����
	 */
    List<NoticeDTO> selectNoticeByTitle(String noticeNo);
	/**
	 * �������� ����
	 */
	int deleteNotice(String noticeNo);
	/**
	 * ������ ����Ʈ
	 */
	List<NoticeDTO> selectNotice();
	/**
	 * ���Ǳ� ����Ʈ
	 */
	List<QuestionDTO> selectQuestion();
	/**
	 * ���Ǳ� �󼼺���
	 */
	List<QuestionDTO> selectQuestionByTitle(String questionNo);
	/**
	 * ��ǰ �����ϱ�
	 */
	int permitProduct(String productNo);
	/**
	 * ���º��� �˻�
	 */
	List<ProductDTO> productListByState(String state);
	/**
	 * ����� ��ü ����
	 */
	List<CustomerDTO> selectAllUser();
	/**
	 * ��ǰ �����ϱ�
	 */
	int deleteByProductName(String productNo);
	/**
	 * ��ǰ ��ü ����
	 */
	List<ProductDTO> productList();
	/**
	 * ����� ����(�̸�)
	 */
	int deleteByName(String id);
	/**
	 * �亯 ��/���� ���Ǳ��� �ҷ��´�. (������) 
	 * @param QuestionNo
	 * @param state
	 * @return
	 */
	List<QuestionDTO> selectQuestionByState (String questionProcess);
	/**
	 * �������� ����ϱ�(������)
	 * @param noticeDTO
	 * @return
	 */
	int insertNotice (NoticeDTO noticeDTO);
	/**
	 * ��ۿϷ�
	 */
	void updateDeliveryProcess();
	void updateEndProcess();
}
