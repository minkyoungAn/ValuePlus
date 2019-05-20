package value.mvc.model.service;

import java.util.List;
import java.util.Map;

import value.mvc.model.dto.AccountDTO;
import value.mvc.model.dto.CustomerDTO;
import value.mvc.model.dto.NoticeDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.QuestionDTO;
import value.mvc.model.dto.TransactionalInformationDTO;


public interface CustomerService {
	/**
	 * ���� ������ ��й�ȣ ����
	 */
	void updatePwByUser(CustomerDTO customerDTO);
	/**
	 * ��й�ȣ �����ϱ�
	 */
	void updatePw(CustomerDTO customerDTO);
	/**
	 * ��й�ȣ ã��
	 */
	String findPw(String id);
	/**
	 * ���̵� ã��
	 */
	String findId(String name);
	/**
	 * �����ϱ�
	 * @param customerDTO
	 * @return
	 */
	void joinCustomer (CustomerDTO customerDTO);
	/**
	 * ���̵� �ߺ� üũ
	 */
	String idCheck(String id);
	 int test();
	/**
	 * ���������� ������ ����
	 * @param id
	 * @return
	 */
	CustomerDTO selectCustomerById (String id);
	
	/**
	 * Ż���ϱ�(Ż��/����Ż��)
	 * @param id
	 * @return
	 */
	int deleteCustomer (String id);
	
	/**
	 * ȸ�����������ϱ�
	 * @param customerDTO
	 * @return
	 */
	int updateCustomer (CustomerDTO customerDTO);
	
	/**
	 * �α���
	 * @param id
	 * @param password
	 * @return
	 */
	String loginCustomer (CustomerDTO customerDTO);
	
	/**
	 * �α׾ƿ�
	 * @param id
	 * @return
	 */
	int logoutCustomer (String id);
	
	/**
	 * �����º���
	 * @param accountDTO
	 * @return
	 */
	AccountDTO selectAccount (String id);
	
	/**
	 * �����µ��
	 * @param accountDTO
	 * @return
	 */
	int insertAccount (AccountDTO accountDTO);
	
	/**
	 * �����¼���
	 * @param accountDTO
	 * @return
	 */
	int updateAccount (AccountDTO accountDTO);
	
	/**
	 * �����»���
	 * @param accountDTO
	 * @return
	 */
	int deleteAccount (String id);
	
	
	/**
	 * ���ɸ�� �˻�
	 * @param id
	 * @return
	 */
	List<ProductDTO> selectInterest (String id);
	
	/**
	 * ���ɸ�� �߰�
	 * @param productNo, id
	 * @return
	 */
	int insertInterest (String productNo, String id);
	
	/**
	 * ���ɸ�� ����
	 * @param id
	 * @return
	 */
	int deleteInterest (String productNo, String id);
	
	/**
	 * �Ǹų�������
	 * @param id
	 * @return
	 */
	List<TransactionalInformationDTO> selectSelling (String id);
	
	/**
	 * ���ų������� (���� ������ ����)
	 * @param id
	 * @return
	 */
	List<TransactionalInformationDTO> selectBuying (String id);

	/**
	 * �������� �˻�
	 * @return
	 */
	List<NoticeDTO> selectAllNotice ();
	
	/**
	 * �������� �󼼺���
	 * @param id
	 * @return
	 */
	NoticeDTO selectOneNotice (String noticeNo);
	
	
	/**
	 * ��ü���ǳ���
	 * @param id
	 * @return
	 */
	List<QuestionDTO> selectQuestion ();
	
	/**
	 * ���� ���ǳ���
	 * @param id
	 * @return
	 */
	List<QuestionDTO> selectQuestionById (String id);
	
	/**
	 * ���ǻ󼼺���
	 * @param QuestionNo
	 * @return
	 */
	QuestionDTO selectOneQuestion (String QuestionNo);
	
	/**
	 * ���ǵ��
	 * @param questionDTO
	 * @return
	 */
	int insertQuestion (QuestionDTO questionDTO);
	
	/**
	 * ���Ǽ���
	 * @param questionDTO
	 * @return
	 */
	int updateQuestion (QuestionDTO questionDTO);
	
	/**
	 * ���ǻ���
	 * @param questionNo
	 * @return
	 */
	int deleteQuestion (String questionNo);
	/**
	 * ����������
	 * @param accountDTO
	 * @return
	 */
	int updateProfile (CustomerDTO customerDTO);
	 /**
	 * ���� �� ��ǰ ��� �˻�
	 * @param id
	 * @return
	 */
	List<ProductDTO> selectToday (String id);
	/**
	 * �ΰ��߰� 12/15 ���ú���ǰ ����
	 */
	void deleteTodaySeeProduct();
	/**
	 * �ΰ��߰� 12/16 ������ ���Ϻ��� ������������
	 */
	Map<String, String> selectMailingBuyerInfo(String id, String productNo);
	/**
	 * �ΰ��߰� 12/16 �Ǹ��� ���Ϻ��� ������������
	 * @param productNo
	 * @return
	 */
	Map<String, String> selectMailingSellerInfo(String productNo);
	/////////
	List<TransactionalInformationDTO> selectWaitSelling(String id);
}
