package value.mvc.model.service;

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

public interface AdminService {
	/**
	 * ��� Ʈ�����
	 */
	int deliveryTransaction(String productNo, DeliveryDTO deliveryDTO);
	/**
	 * ���� Ʈ�����
	 * @param productNo
	 * @param paymentDTO
	 * @return
	 */
	int paymentSystem(String productNo,PaymentDTO paymentDTO,String sellId,String buyId);
	/**
	 * ����� �ּ� �ҷ�����
	 */
	String selectAddressById(String id);
	/**
	 * ��� ���� ���μ��� ��ȭ
	 */
	//void updateProcessBydel(String productNo);
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
	//int updateProcessByPay(String productNo);
	/**
	 * ���� ���� ����
	 */
	//int insertPayment(PaymentDTO paymentDTO);
	/**
	 * ���� �ý���
	 */
	List<CustomerDTO> paymentSystem(CustomerDTO customerDTO);
	/**
	 * �Ǹų��� ������Ʈ
	 */
	//int insertSellingList(SellingListDTO sellingListDTO);
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
	//int insertDelivery(DeliveryDTO deliveryDTO);
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
	 * ���Ǳ� �󼼺���
	 */
	List<QuestionDTO> selectQuestionByTitle(String questionNo);
	/**
	 * ������ ����Ʈ
	 */
	List<NoticeDTO> selectNotice();
	/**
	 * ���Ǳ� ����Ʈ
	 */
	List<QuestionDTO> selectQuestion();
	/**
	 * ��ǰ �����ϱ�
	 */
	int permitProduct(String productNo,SellingListDTO sellingListDTO);
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
	 * ���Ȯ��
	 */
	void updateDeliveryProcess();
	void updateEndProcess();
}
